# Billiger.de Price Checker

A desktop application that looks up product prices from billiger.de using EAN codes from Excel files.

## Features

- 📊 Read EAN codes from Excel files
- 🔍 Automatically search billiger.de for lowest prices
- 💰 Compare prices from billiger.de and eBay
- 📝 Export results back to Excel with formatting
- 🎨 User-friendly GUI with progress tracking
- ⏸️ Resume support (skip already processed rows)
- 💾 Auto-save progress every N rows

## Prerequisites

### macOS

1. **Python 3.14** (already installed on your system)
2. **Google Chrome** - Download from [google.com/chrome](https://www.google.com/chrome/)

## Installation & Setup

### Step 1: Install Dependencies

Open Terminal in the project folder and run:

```bash
pip3 install -r requirements.txt
```

Or if using Python 3.14 specifically:

```bash
python3.14 -m pip install -r requirements.txt
```

### Step 2: Test the Application

Before building, test that everything works:

```bash
python3 billiger_gui.py
```

If it opens the GUI successfully, you're ready to build!

## Building the macOS App

### Build the .app Bundle

Run the build script:

```bash
python3 build.py
```

This will:
1. Use the macOS-specific spec file (`BilligerPriceChecker_mac.spec`)
2. Create a standalone `.app` bundle
3. Place it in the `dist` folder

### Find Your App

After building, you'll find:

```
dist/BilligerPriceChecker.app
```

You can:
- Double-click to run it
- Copy it to `/Applications`
- Share it with others (they need Chrome installed)

## Usage

### GUI Mode

1. Launch `BilligerPriceChecker.app`
2. Click "Browse..." to select your Excel file
3. Configure options:
   - **Start from row**: Which row to begin (default: 1)
   - **Limit**: How many rows to process (0 = all)
   - **Save every N rows**: Auto-save interval
4. Click "Start Processing"
5. Monitor progress in the log window
6. Find output file in same folder as input: `{filename}_output.xlsx`

### Command Line Mode

```bash
python3 billiger_price_checker.py input.xlsx --start 0 --limit 100 --save-interval 10
```

Options:
- `--ean-column NAME` - Column name with EAN codes (auto-detected if not specified)
- `--start N` - Start from row N (0-indexed)
- `--limit N` - Process N rows (0 = all)
- `--save-interval N` - Save every N rows
- `--headless` - Run browser in background

## Excel File Format

Your input Excel file should have:
- A column with **EAN codes** (can be named "EAN", "GTIN", "Barcode", or just use the first column)
- Any other columns you want to keep

The app will add these columns:
- **billiger** - Lowest price from billiger.de
- **eBay** - Lowest price from eBay (via billiger.de)
- **Status** - "Found", "NOT FOUND", or "Invalid EAN"
- **Timestamp** - When the lookup was performed

## Troubleshooting

### "Chrome not found" Error

Install Google Chrome from [google.com/chrome](https://www.google.com/chrome/)

### Build Fails with "command not found: pyinstaller"

Make sure PyInstaller is installed:

```bash
pip3 install pyinstaller
```

### Python Version Issues

If you have multiple Python versions, explicitly use Python 3.14:

```bash
python3.14 -m pip install -r requirements.txt
python3.14 build.py
```

### Permission Issues on macOS

If macOS blocks the app, right-click → "Open" the first time.

### Browser Gets Detected / Cloudflare Challenge

The app uses `undetected-chromedriver` to minimize detection, but:
- Add longer delays if needed (modify `delay_range` in code)
- Don't run too many requests too quickly
- Cloudflare challenges are handled automatically (waits 5-10 seconds)

## Technical Details

- **GUI**: Tkinter
- **Browser Automation**: Selenium + undetected-chromedriver
- **Excel**: pandas + openpyxl
- **Build**: PyInstaller

## Files

- `billiger_gui.py` - GUI application
- `billiger_price_checker.py` - Core price checking logic
- `build.py` - Cross-platform build script
- `requirements.txt` - Python dependencies
- `BilligerPriceChecker_mac.spec` - macOS PyInstaller config
- `BilligerPriceChecker.spec` - Windows PyInstaller config

## Notes

- The app opens Chrome in visible mode by default (helps with debugging)
- Progress is saved periodically, so you can stop and resume
- Rows with existing "Status" are skipped (resume support)
- Prices are formatted in EUR (€) in the output Excel file
- The app waits 1-2 seconds between requests to be polite to the server

## License

This is a utility tool for personal/internal use. Respect billiger.de's terms of service and robots.txt when using it.
