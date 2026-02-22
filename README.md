# Firebat S1 Panel

[English](#english) | [Русский](#русский)

---

<a name="english"></a>

## 🇬🇧 English

Front-panel LCD display and LED control daemon for **Firebat S1 / AceMagic S1** mini PCs.  
Designed for headless servers: **Proxmox VE**, **Debian**, **Ubuntu Server**.

> Forked from [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel) and adapted for production headless use.

### Features

- **Daemon** (`firebat-paneld`): systemd service with a Web UI and D-Bus interface.
- **CLI** (`firebat-panelctl`): control the daemon from the command line.
- **Web UI**: monitor and control the display from any browser.
- **Customizable**: multiple faces and themes for the display.

### Themes & Faces

Multiple display faces are available (ASCII, Arcs, Clocks, Digits, Professional) along with various color themes (Ember, Hacker, Nord, Solarized Dark/Light, Tokyo Night).

*Screenshot placeholders:*

<!-- Add your theme screenshots here -->
<p align="center">
  <img src="https://placehold.co/320x170?text=Theme+1" width="320"/>
  <img src="https://placehold.co/320x170?text=Theme+2" width="320"/>
</p>

### Installation

**1. Build from source (Recommended)**

```bash
git clone https://github.com/P4LMTR33/firebat-s1-panel
cd firebat-s1-panel
make build
```

**2. Install and enable**

```bash
sudo make install
sudo systemctl enable --now firebat-paneld
```

### Configuration

Edit `/etc/firebat-panel/config.toml` to customize the network interface, disks, or temperature sensor settings.

```toml
[web]
enable = true
listen = "0.0.0.0:8686"

[sensors]
network_interface = "vmbr0" # Example for Proxmox
```

### Usage

```bash
# View daemon logs
journalctl -fu firebat-paneld

# Set screen orientation and theme
firebat-panelctl lcd orientation landscape
firebat-panelctl theme set nord
```

### Acknowledgements

Based on work from [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel) and [tjaworski/AceMagic-S1-LED-TFT-Linux](https://github.com/tjaworski/AceMagic-S1-LED-TFT-Linux).

---

<a name="russian"></a>

## 🇷🇺 Русский

Служба управления фронтальным LCD-экраном и RGB-подсветкой для мини-ПК **Firebat S1 / AceMagic S1**.  
Разработано специально для домашних серверов без монитора (headless): **Proxmox VE**, **Debian**, **Ubuntu Server**.

> Форк проекта [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel), адаптированный для стабильной работы на серверах.

### Возможности

- **Служба** (`firebat-paneld`): фоновый процесс (systemd) с веб-интерфейсом и D-Bus API.
- **Инструмент CLI** (`firebat-panelctl`): управление в командной строке.
- **Веб-интерфейс**: мониторинг и настройки прямо из браузера.
- **Кастомизация**: поддержка разных стилей циферблатов и цветовых тем.

### Темы и стили (Faces)

Доступно несколько стилей отображения (ASCII, Дуги, Часы, Цифры, Профессиональный) и цветовых тем (Ember, Hacker, Nord, Solarized Dark/Light, Tokyo Night).

*Место для скриншотов:*

<!-- Добавьте скриншоты ваших тем сюда -->
<p align="center">
  <img src="https://placehold.co/320x170?text=Тема+1" width="320"/>
  <img src="https://placehold.co/320x170?text=Тема+2" width="320"/>
</p>

### Установка

**1. Сборка из исходников (Рекомендуется)**

```bash
git clone https://github.com/P4LMTR33/firebat-s1-panel
cd firebat-s1-panel
make build
```

**2. Установка и запуск**

```bash
sudo make install
sudo systemctl enable --now firebat-paneld
```

### Настройка

Отредактируйте файл `/etc/firebat-panel/config.toml`, если вам нужно изменить сетевой интерфейс, пути к дискам или датчикам температуры.

```toml
[web]
enable = true
listen = "0.0.0.0:8686"

[sensors]
network_interface = "vmbr0" # Пример для Proxmox
```

### Использование

```bash
# Просмотр логов службы
journalctl -fu firebat-paneld

# Смена ориентации экрана и темы через CLI
firebat-panelctl lcd orientation landscape
firebat-panelctl theme set nord
```

### Благодарности

Основано на наработках [ananthb/ht32-panel](https://github.com/ananthb/ht32-panel) и [tjaworski/AceMagic-S1-LED-TFT-Linux](https://github.com/tjaworski/AceMagic-S1-LED-TFT-Linux).
