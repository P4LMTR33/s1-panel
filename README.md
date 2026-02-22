# Firebat Panel

Front-panel LCD display and LED control daemon for **Firebat S1 / AceMagic S1** mini PCs.  
Designed for headless servers: **Proxmox VE**, **Debian**, **Ubuntu Server**.

> Forked from [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel) and adapted for production headless use.

## Features

- **Daemon** (`firebat-paneld`): systemd service with HTMX web UI and D-Bus interface
- **CLI** (`firebat-panelctl`): command-line tool for daemon control
- **Web UI**: monitor and control the panel from any browser
- **Configurable**: network interface, disks, temperature sensor, VID/PID — all in `/etc/firebat-panel/config.toml`

## Hardware

| Component | Interface | Details |
|-----------|-----------|---------|
| LCD Display | USB HID | VID:PID 04D9:FD01, 320×170 RGB565 |
| LED Strip | Serial | CH340, 10000 baud |

## Installation

### From Source (Recommended)

```bash
git clone https://github.com/P4LMTR33/firebat-s1-panel
cd firebat-s1-panel
make build
sudo make install
sudo systemctl enable --now firebat-paneld
```

### Manual Binary

```bash
cargo build --release
sudo install -m755 target/release/firebat-paneld /usr/local/bin/
sudo install -m755 target/release/firebat-panelctl /usr/local/bin/
sudo mkdir -p /etc/firebat-panel
sudo cp config/default.toml /etc/firebat-panel/config.toml
sudo cp deploy/firebat-paneld.service /etc/systemd/system/
sudo cp deploy/dbus-org.firebat.Panel.conf /etc/dbus-1/system.d/
sudo cp deploy/99-firebat-panel.rules /etc/udev/rules.d/
sudo systemctl daemon-reload
sudo udevadm control --reload-rules
sudo systemctl enable --now firebat-paneld
```

## Configuration

Edit `/etc/firebat-panel/config.toml`:

```toml
[web]
enable = true
listen = "0.0.0.0:8686"

[dbus]
bus = "system"

[devices]
lcd = "auto"
led = "/dev/ttyUSB0"

[sensors]
network_interface = "vmbr0"   # or "auto"
temp_sensor_path = "auto"
# disks = ["/", "/mnt/data"]
```

## Usage

```bash
# View logs
journalctl -fu firebat-paneld

# CLI control (requires running daemon)
firebat-panelctl lcd orientation landscape
firebat-panelctl led set rainbow --intensity 3 --speed 3
firebat-panelctl lcd face professional
firebat-panelctl theme set nord
firebat-panelctl screenshot
```

## D-Bus

The daemon registers `org.firebat.Panel` on the **system bus** by default.

## Faces & Themes

Multiple display faces (ASCII, Arcs, Clocks, Digits, Professional) with color themes (Ember, Hacker, Nord, Solarized Dark/Light, Tokyo Night).

Complications: Time, Date, IP Address, Network, Disk I/O, CPU Temperature, Hostname.

## Acknowledgement

Based on work from [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel) and [tjaworski/AceMagic-S1-LED-TFT-Linux](https://github.com/tjaworski/AceMagic-S1-LED-TFT-Linux).

## License

Licensed under AGPL. See [LICENSE](LICENSE).
