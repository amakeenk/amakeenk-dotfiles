---
description: Bump project version, update CHANGELOG, create commit and git tag. Auto-detects project type and determines bump type from conventional commits.
---

# /upversion — Release Version Bump

Bump project version, update CHANGELOG.md, create release commit and git tag.

## Usage

```
/upversion [major|minor|patch] [--dry-run]
```

- No argument — auto-detect bump type from conventional commits since last tag
- With argument — force specific bump type
- `--dry-run` — preview changes without executing

## Execution Steps

Follow these steps in order:

### Step 1: Detect Project Type

Check for these files in project root (in order):

| File | Project Type | Version Location |
|------|-------------|------------------|
| `go.mod` | Go | Git tags only (ldflags) |
| `package.json` | Node.js | package.json |
| `pyproject.toml` | Python | pyproject.toml |
| `Cargo.toml` | Rust | Cargo.toml |

Use FIRST match. If none found, error: "Unknown project type"

### Step 2: Get Current Version

```bash
git describe --tags --abbrev=0 2>/dev/null
```

- If tag exists → strip 'v' prefix for version
- If no tags → start from 0.1.0

### Step 3: Analyze Commits Since Last Tag

```bash
git log <last-tag>..HEAD --oneline
```

Determine bump type from commit messages:

| Pattern | Bump Type |
|---------|-----------|
| `BREAKING CHANGE:` in body or `!:` in type | **major** |
| `feat:`, `feature:` | **minor** |
| `fix:`, `perf:`, `refactor:`, `chore:`, `docs:`, `test:`, `style:` | **patch** |
| No conventional commits found | Ask user |

Priority: major > minor > patch

If user specified bump type explicitly, use that instead.

### Step 4: Calculate New Version

```
current: v1.2.3

major → v2.0.0
minor → v1.3.0
patch → v1.2.4
```

If current version is 0.x.x, major bump → 0.(y+1).0 (not 1.0.0)

### Step 5: Update CHANGELOG.md

Find or create CHANGELOG.md.

**If file exists:** Add new version section after `## [Unreleased]` or at the top:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- Description from feat: commits

### Changed
- Description from refactor: commits

### Fixed
- Description from fix: commits

### Security
- Description from security-related commits
```

**If file doesn't exist:** Create it with Keep a Changelog format.

Group commits by type:
- `feat:` → Added
- `fix:` → Fixed
- `refactor:` → Changed
- `perf:` → Changed
- `docs:` → Changed (if significant)
- `chore:`, `test:`, `style:` → Skip (unless user wants them)

### Step 6: Update Version File (Non-Go Only)

**Node.js (package.json):**
```bash
# Use jq if available, or edit manually
jq '.version = "X.Y.Z"' package.json > tmp && mv tmp package.json
```

**Python (pyproject.toml):**
```bash
# Use toml-cli or edit manually
# Find version = "..." and replace
```

**Rust (Cargo.toml):**
```bash
# Find version = "..." and replace
```

**Go:** Skip this step (version from git tags via ldflags)

### Step 7: Preview and Confirm

Show summary:

```
/upversion Summary
==================
Project: <type>
Current: vOLD
New:     vNEW

Changes:
  - CHANGELOG.md: add vX.Y.Z section
  - package.json: X.Y.Z → X.Y.Z

Commits included:
  - feat: add new feature
  - fix: resolve bug

Proceed? [y/n]
```

If `--dry-run`, stop here and show summary only.

### Step 8: Create Commit and Tag

```bash
git add CHANGELOG.md <version-files>
git commit -m "chore: release vX.Y.Z"
git tag vX.Y.Z
```

Show result:
```
✓ Created commit: <hash>
✓ Created tag: vX.Y.Z

Next: git push && git push --tags
```

## Error Handling

- Dirty working directory → Ask to stash or abort
- No commits since last tag → "No changes to release"
- Merge conflicts in CHANGELOG → Show diff, ask user to resolve

## Examples

```
> /upversion
Detected: Go project (go.mod)
Current version: v0.3.0 (from git tag)

Commits since v0.3.0:
  - fix(trash): add chmod hint to error
  - test: add more coverage

Bump type: patch (0.3.0 → 0.3.1)

Changes:
  - CHANGELOG.md: add v0.3.1 section

Proceed? [y/n] y

✓ Created commit: abc1234
✓ Created tag: v0.3.1
```

```
> /upversion minor
Forcing minor bump: v0.3.0 → v0.4.0
...
```

```
> /upversion --dry-run
(dry-run) Would bump v0.3.0 → v0.4.0
(dry-run) Would update CHANGELOG.md
(dry-run) Would create commit and tag
```
