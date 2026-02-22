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

*Screenshot:*

<!-- Add your theme screenshots here -->
<p align="center">
  <img width="320" height="170" alt="image" src="https://github.com/user-attachments/assets/f3ad4db6-74b9-4240-8202-003fe54547b0" />
  <img width="320" height="170" alt="image" src="https://github.com/user-attachments/assets/dd2962e0-5389-4e95-81e7-e4e75a0d89c5" />
  <img width="320" height="170" alt="image" src="https://github.com/user-attachments/assets/44b80cbc-972c-4348-b13f-5e151633de95" />
</p>

<p align="center">
  <img width="170" height="320" alt="image" src="https://github.com/user-attachments/assets/f9629fd4-eb4b-48ae-8111-8d58dc624a1d" />
  <img width="170" height="320" alt="image" src="https://github.com/user-attachments/assets/2e202f62-382c-4a1e-80a7-116a63ed3e79" />
  <img width="170" height="320" alt="image" src="https://github.com/user-attachments/assets/dd3925b5-f6db-4f78-9b6e-03fe378c378f" />

</p>

### Installation

**1. Using Debian Package (Recommended for Proxmox/Debian/Ubuntu)**

Download the latest `.deb` package from the [Releases](https://github.com/P4LMTR33/firebat-s1-panel/releases) page.

```bash
# Install the package
sudo apt install ./firebat-panel_*.deb
```

The service will be automatically started and enabled.

**2. Using Pre-built Binaries (Manual Installation)**

Download the `.tar.gz` archive from the [Releases](https://github.com/P4LMTR33/firebat-s1-panel/releases) page.

```bash
# Extract the archive
tar -xzf firebat-s1-panel-v*.tar.gz
cd firebat-s1-panel-v*

# Install manually
sudo make install
sudo systemctl enable --now firebat-paneld
```

> **Note:** Manual installation requires `libusb-1.0-0` to be installed on your system.

**3. Build from source (For Developers)**

```bash
git clone https://github.com/P4LMTR33/firebat-s1-panel
cd firebat-s1-panel

# Install Rust and dependencies beforehand
make build
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

**1. Установка через .deb пакет (Рекомендуется для Proxmox/Debian/Ubuntu)**

Скачайте последний `.deb` пакет со страницы [Releases](https://github.com/P4LMTR33/firebat-s1-panel/releases).

```bash
# Установите пакет
sudo apt install ./firebat-panel_*.deb
```

Служба будет автоматически установлена, добавлена в автозапуск и запущена.

**2. Использование готовых бинарных файлов (Ручная установка)**

Скачайте `.tar.gz` архив со страницы [Releases](https://github.com/P4LMTR33/firebat-s1-panel/releases).

```bash
# Распакуйте архив
tar -xzf firebat-s1-panel-v*.tar.gz
cd firebat-s1-panel-v*

# Установите вручную
sudo make install
sudo systemctl enable --now firebat-paneld
```

> **Примечание:** Для работы требуются установленные системные библиотеки (минимум `libusb-1.0-0`).

**3. Сборка из исходников (Для разработчиков)**

```bash
git clone https://github.com/P4LMTR33/firebat-s1-panel
cd firebat-s1-panel

# Предварительно установите Rust и системные зависимости
make build
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
