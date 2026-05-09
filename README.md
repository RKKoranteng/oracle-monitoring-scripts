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
├── scripts/
│   ├── monitor_database.sh
│   ├── monitor_listener.sh
│   └── monitor_oms.sh
│
├── config/
│   └── env_config.rsp
│
├── docs/
│   └── CHANGELOG.md
│
├── .gitignore
├── LICENSE
├── README.md
└── setup.sh
```

## Commit Prefix

* `add`: add something (module, feature, etc)
* `del`: remove something (module, feature, etc)
* `doc`: documentation only
* `fix`: bug fixes
* `upd`: update existing code/config
* `ren`: rename files/modukes




