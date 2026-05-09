# Oracle Monitoring Scripts

This repo contains scripts for monitoring Oracle database. See [CHANGELOG.md](CHANGELOG.md) for all notable changes in this project.

## Monitored Components

| Function | Component | What it monitors |
|---|---|---|
| **Database** | [Instance](monitor_database.sh) | Database instance status |
| | [Listener](monitor_listener.sh) | Listener status |
| **OEM** | [OMS](monitor_oms.sh) | Enterprise Manager → Oracle Management Services |

## Repository Structure

```text
oracle-monitoring-scripts/
│
├── monitor_*.sh
├── env_config.rsp│
├── CHANGELOG.md
├── .gitignore
├── LICENSE
├── README.md
└── setup.sh
```

## Commit Prefix

* `add`: adding new feature
* `del`: remove existing feature
* `doc`: documentation only
* `ref`: code restructuring without changing behavior
* `fix`: bug fixes
* `upd`: update existing code/config
* `ren`: rename files/modukes

## Versioning
This project uses [Semantic Versioning (SemVer)](https://semver.org/spec/v2.0.0.html).

Format: `MAJOR.MINOR.PATCH`

| Version Part | When it Changed | Example |
|---|---|---|
| **MAJOR** | Breaking changes that require users to modify configs or usage | `2.0.0` |
| **MINOR** | New features added in a backward-compatible way | `1.1.0` |
| **PATCH** | Bug fixes, documentation updates, small improvements | `1.1.1` |
