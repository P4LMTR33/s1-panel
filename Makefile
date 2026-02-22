# Firebat Panel — Makefile
# Build and install firebat-paneld / firebat-panelctl for Debian-based headless servers.

PREFIX ?= /usr/local
SYSCONFDIR ?= /etc
SYSTEMDDIR ?= $(SYSCONFDIR)/systemd/system
DBUSCONFDIR ?= $(SYSCONFDIR)/dbus-1/system.d
UDEVDIR ?= $(SYSCONFDIR)/udev/rules.d
SHAREDIR ?= $(PREFIX)/share/firebat-panel
CONFDIR ?= $(SYSCONFDIR)/firebat-panel

.PHONY: build install uninstall clean

build:
	cargo build --release

install: build
	# Binaries
	install -Dm755 target/release/firebat-paneld  $(DESTDIR)$(PREFIX)/bin/firebat-paneld
	install -Dm755 target/release/firebat-panelctl $(DESTDIR)$(PREFIX)/bin/firebat-panelctl
	# Configuration
	install -dm755 $(DESTDIR)$(CONFDIR)
	install -Dm644 config/default.toml $(DESTDIR)$(CONFDIR)/config.toml
	# Systemd unit
	install -Dm644 deploy/firebat-paneld.service $(DESTDIR)$(SYSTEMDDIR)/firebat-paneld.service
	# D-Bus policy
	install -Dm644 deploy/dbus-org.firebat.Panel.conf $(DESTDIR)$(DBUSCONFDIR)/dbus-org.firebat.Panel.conf
	# Udev rules
	install -Dm644 deploy/99-firebat-panel.rules $(DESTDIR)$(UDEVDIR)/99-firebat-panel.rules
	# Reload services
	-systemctl daemon-reload
	-udevadm control --reload-rules
	@echo ""
	@echo "Installation complete."
	@echo "  Enable and start:  systemctl enable --now firebat-paneld"
	@echo "  View logs:         journalctl -fu firebat-paneld"

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/firebat-paneld
	rm -f $(DESTDIR)$(PREFIX)/bin/firebat-panelctl
	rm -f $(DESTDIR)$(SYSTEMDDIR)/firebat-paneld.service
	rm -f $(DESTDIR)$(DBUSCONFDIR)/dbus-org.firebat.Panel.conf
	rm -f $(DESTDIR)$(UDEVDIR)/99-firebat-panel.rules
	-systemctl daemon-reload
	@echo "Uninstalled. Config preserved at $(CONFDIR)/config.toml"

clean:
	cargo clean
