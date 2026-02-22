# firebat-panel-cli

Command-line tool for controlling the Firebat Panel daemon.

## Installation

```bash
sudo make install
```

## Usage

```bash
# LCD control
firebat-panelctl lcd orientation landscape
firebat-panelctl lcd face ascii
firebat-panelctl theme set nord

# LED control
firebat-panelctl led set rainbow --intensity 3 --speed 3
firebat-panelctl led off

# Status
firebat-panelctl daemon status
```

Requires `firebat-paneld` to be running.

See the [main project README](../../README.md) for full documentation.
