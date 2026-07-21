# AGENTS.md

Guidance for AI agents (Claude Code, etc.) working in this repository.

## What this repository provides

This repository's **product** is the set of reusable GitHub Actions workflows
under `.github/workflows/`. Consumers pin to a tagged release and call them via
`workflow_call`. Releases are cut by [release-please](https://github.com/googleapis/release-please)
from the accumulated [Conventional Commits](https://www.conventionalcommits.org/),
so the commit type directly controls the released version.

The reusable workflows (the product) are the files **without** a `_` prefix:

- `pr.yaml` (main entry point)
- `github-workflow.yaml`
- `oxfmt.yaml`
- `oxlint.yaml`
- `shellcheck.yaml`
- `secret-scan.yaml`
- `renovate-config.yaml`

Files **with** a `_` prefix (`_pr.yaml`, `_release.yaml`, `_codeql.yaml`, …) are
internal to this repo (dogfooding, releasing, CI) and are **not** part of the
product.

## Commit & PR prefixes

Use [Conventional Commits](https://www.conventionalcommits.org/) for **both commit
messages and PR titles** (PRs are squash-merged, so the PR title becomes the
commit that release-please reads).

**Changes to the reusable workflows above are user-facing changes — use `feat:`
or `fix:`, never `chore:`.** `chore:` does not trigger a release, so a real
change to the product would silently never ship to consumers.

- `feat:` — new capability or behavior in a reusable workflow (new check, new
  input, expanded coverage). Bumps the minor version.
- `fix:` — bug fix or corrected behavior in a reusable workflow. Bumps the patch
  version.
- `feat!:` / `fix!:` (or a `BREAKING CHANGE:` footer) — a change that breaks
  existing consumers (removed/renamed input, changed required permissions,
  removed check). Bumps the major version.

Reserve non-releasing types for changes that do **not** affect what consumers get:

- `chore:` — internal-only changes (`_`-prefixed workflows, tooling config,
  dependency bumps, release plumbing).
- `ci:` — changes to this repo's own CI setup that don't change the product.
- `docs:` — documentation only.
- `refactor:` / `test:` / `style:` — as usual, when consumer behavior is unchanged.

When in doubt about whether a change is user-facing, ask: _"would a consumer
pinning to a new tag see any difference?"_ If yes, it's `feat:`/`fix:`.
