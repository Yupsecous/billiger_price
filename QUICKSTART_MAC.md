# Quick Start Guide for macOS

Follow these steps to build the app on your Mac with Python 3.14.

## Prerequisites

Make sure you have:
- ✅ Python 3.14 (you already have this)
- ✅ Google Chrome installed ([download](https://www.google.com/chrome/))

---

## Option 1: Automated Setup & Build (Recommended)

### Step 1: Run Setup

```bash
chmod +x setup_mac.sh
./setup_mac.sh
```

This will:
- Check Python and Chrome
- Install all required dependencies

### Step 2: Build the App

```bash
chmod +x build_mac.sh
./build_mac.sh
```

Your app will be at: `dist/BilligerPriceChecker.app`

---

## Option 2: Manual Setup & Build

### Step 1: Install Dependencies

```bash
pip3 install -r requirements.txt
```

Or with Python 3.14 specifically:

```bash
python3.14 -m pip install -r requirements.txt
```

### Step 2: Build

```bash
python3 build.py
```

---

## After Building

Your app is ready at:
```
dist/BilligerPriceChecker.app
```

### Test it:
```bash
open dist/BilligerPriceChecker.app
```

### Install it:
```bash
cp -r dist/BilligerPriceChecker.app /Applications/
```

---

## Troubleshooting

### "command not found: pyinstaller"

Install it manually:
```bash
pip3 install pyinstaller
```

### "Chrome not found" when running the app

Install Chrome from [google.com/chrome](https://www.google.com/chrome/)

### macOS blocks the app

Right-click the app → "Open" (first time only)

Or disable Gatekeeper temporarily:
```bash
xattr -cr dist/BilligerPriceChecker.app
```

### Python version issues

Make sure you're using Python 3.14:
```bash
python3.14 --version
python3.14 -m pip install -r requirements.txt
python3.14 build.py
```

---

## What's Installed

The `requirements.txt` installs:
- **pandas** - Excel file handling
- **openpyxl** - Excel formatting
- **selenium** - Browser automation
- **undetected-chromedriver** - Anti-detection Chrome driver
- **pyinstaller** - App bundler

---

## Next Steps

See [README.md](README.md) for:
- How to use the app
- Excel file format
- Command-line options
- Detailed troubleshooting
