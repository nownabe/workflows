# Changelog

## [2.0.0](https://github.com/nownabe/workflows/compare/v1.0.4...v2.0.0) (2026-08-08)


### ⚠ BREAKING CHANGES

* install pinned tools via mise x, rename secret-scan.yaml to leak-scan.yaml ([#65](https://github.com/nownabe/workflows/issues/65))

### Features

* run trufflehog via the official trufflehog action ([#68](https://github.com/nownabe/workflows/issues/68)) ([d8819ef](https://github.com/nownabe/workflows/commit/d8819ef16ea8ca737cbbf506a6811ae7894afda3))
* run zizmor via the official zizmor-action ([#67](https://github.com/nownabe/workflows/issues/67)) ([9430d40](https://github.com/nownabe/workflows/commit/9430d4002ff761cc7ce5ebc96da5f380bcdc8546))


### Bug Fixes

* install pinned tools via mise x, rename secret-scan.yaml to leak-scan.yaml ([#65](https://github.com/nownabe/workflows/issues/65)) ([09e7d2e](https://github.com/nownabe/workflows/commit/09e7d2e1ee8607990cc643434a3ddee9e6e689bb))


### Dependencies

* update dependency renovate to v43.274.0 ([#57](https://github.com/nownabe/workflows/issues/57)) ([fd88f9f](https://github.com/nownabe/workflows/commit/fd88f9f2f2cbdbd534763fd64591326a0c607432))
* update dependency renovate to v43.275.0 ([#59](https://github.com/nownabe/workflows/issues/59)) ([505ea94](https://github.com/nownabe/workflows/commit/505ea94ddd63a09d41fbe2221328e1c44a05bc2b))
* update workflow pinned tools ([#61](https://github.com/nownabe/workflows/issues/61)) ([504ec63](https://github.com/nownabe/workflows/commit/504ec63cfc4ebed9b05d02c75d0992ae95cf6412))

## [1.0.4](https://github.com/nownabe/workflows/compare/v1.0.3...v1.0.4) (2026-07-21)


### Bug Fixes

* **pr:** trigger github-workflow check on linter config changes ([#51](https://github.com/nownabe/workflows/issues/51)) ([8fc073f](https://github.com/nownabe/workflows/commit/8fc073f374f467dbaadac29a59dbc663f5a5eb57))
* remove internal Result job that could mask filter failures ([#48](https://github.com/nownabe/workflows/issues/48)) ([a69e3a7](https://github.com/nownabe/workflows/commit/a69e3a7f12ee4c2a125a00248e7161ef5c01df23))

## [1.0.3](https://github.com/nownabe/workflows/compare/v1.0.2...v1.0.3) (2026-07-21)


### Miscellaneous Chores

* release 1.0.3 ([#43](https://github.com/nownabe/workflows/issues/43)) ([9cad6e5](https://github.com/nownabe/workflows/commit/9cad6e5718f2aaf72d869609e1bf754d615c3271))

## [1.0.2](https://github.com/nownabe/workflows/compare/v1.0.1...v1.0.2) (2026-07-05)


### Bug Fixes

* ignore caller's locked mise settings when installing tools ([#26](https://github.com/nownabe/workflows/issues/26)) ([c30aa72](https://github.com/nownabe/workflows/commit/c30aa7275b787198c9abebb174cf6641be0cd3df))

## [1.0.1](https://github.com/nownabe/workflows/compare/v1.0.0...v1.0.1) (2026-07-05)


### Bug Fixes

* run tools via mise x so callers need no mise config ([#24](https://github.com/nownabe/workflows/issues/24)) ([c48a386](https://github.com/nownabe/workflows/commit/c48a3865883ad2cbe8a2e90ec72c9cea7bbea6a0))

## 1.0.0 (2026-06-17)


### Features

* initial release ([#14](https://github.com/nownabe/workflows/issues/14)) ([f4b342b](https://github.com/nownabe/workflows/commit/f4b342b981e3916437b4fe2c70b571b0b01cd0b9))
