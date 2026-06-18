# workflows

Reusable [GitHub Actions workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows) shared across [@nownabe](https://github.com/nownabe)'s repositories.

The main entry point is `pr.yaml` ("Pull Request Checks"), which bundles a set of linting, formatting, and security checks behind a single `workflow_call`. Each check only runs when files it cares about have changed.

## Usage

Add a workflow to the consuming repository that calls `pr.yaml` on pull requests. Pin the reference to a tagged release (or a commit SHA) rather than a moving branch.

```yaml
name: Pull Request Checks

on:
  pull_request:

permissions: {}

jobs:
  common-checks:
    name: Common Checks
    permissions:
      contents: read
      pull-requests: read
    uses: nownabe/workflows/.github/workflows/pr.yaml@v1.0.0 # pin to a commit SHA or release tag, not a moving ref like @v1 or @main

  result:
    name: Pull Request Checks
    if: always()
    needs:
      - common-checks
    runs-on: ubuntu-slim
    timeout-minutes: 5
    permissions: {}
    steps:
      - name: Check job results
        env:
          HAS_FAILURE: ${{ contains(needs.*.result, 'failure') }}
          HAS_CANCELLED: ${{ contains(needs.*.result, 'cancelled') }}
        run: '[[ "$HAS_FAILURE" == "false" && "$HAS_CANCELLED" == "false" ]]'
```

The `result` job aggregates the outcome into a single status that is convenient to use as a required check (since the underlying jobs may be skipped by the path filter).

## Checks

`pr.yaml` first runs a [`dorny/paths-filter`](https://github.com/dorny/paths-filter) step and then conditionally dispatches the following reusable workflows:

| Workflow               | Tools                                                                                                                                                    | Runs when                            |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `github-workflow.yaml` | [actionlint](https://github.com/rhysd/actionlint), [ghalint](https://github.com/suzuki-shunsuke/ghalint), [zizmor](https://github.com/zizmorcore/zizmor) | `.github/workflows/**` changed       |
| `oxfmt.yaml`           | [oxfmt](https://github.com/oxc-project/oxc) (`--check`)                                                                                                  | source / config / docs files changed |
| `oxlint.yaml`          | [oxlint](https://github.com/oxc-project/oxc)                                                                                                             | JS/TS or oxlint config changed       |
| `shellcheck.yaml`      | [ShellCheck](https://github.com/koalaman/shellcheck)                                                                                                     | `**/*.sh` changed                    |
| `secret-scan.yaml`     | [betterleaks](https://github.com/betterleaks/betterleaks), [TruffleHog](https://github.com/trufflesecurity/trufflehog)                                   | always                               |

Each reusable workflow is also callable on its own via `workflow_call` if you only want a subset.

## Tooling

Tool versions are pinned and managed with [mise](https://mise.jdx.dev/) (see `mise.toml` / `mise.lock`). Most tools are installed through [aqua](https://aquaproj.github.io/); `oxlint` and `oxfmt` use the npm backend. `mise` settings enable `locked` installs and a `minimum_release_age` to avoid pulling brand-new releases.

GitHub Actions versions are kept up to date by [Renovate](https://docs.renovatebot.com/) (`renovate.json5`).

## Releases

Releases are managed by [release-please](https://github.com/googleapis/release-please) (`_release.yaml`). On every push to `main` it maintains a release PR from the accumulated [Conventional Commits](https://www.conventionalcommits.org/); merging that PR creates the tag and GitHub Release.

## Dogfooding

This repository runs its own checks against itself: `_pr.yaml` calls `pr.yaml` on its pull requests, the same way a consumer would.
