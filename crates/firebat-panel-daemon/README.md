# firebat-panel-daemon

Daemon for controlling LCD displays and RGB LED strips on Firebat S1 / AceMagic S1. Provides a D-Bus interface and optional web UI.

## Installation

```bash
sudo make install
sudo systemctl enable --now firebat-paneld
```

## Usage

```bash
firebat-paneld                           # uses /etc/firebat-panel/config.toml
firebat-paneld --config /path/to/config  # custom config path
```

See the [main project README](../../README.md) for full documentation.
