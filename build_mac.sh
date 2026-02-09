#!/bin/bash
# Simple build script for macOS

echo "======================================"
echo "Billiger Price Checker - macOS Build"
echo "======================================"
echo ""

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 not found"
    echo "Please install Python 3.14 first"
    exit 1
fi

echo "✓ Python found: $(python3 --version)"
echo ""

# Check if dependencies are installed
echo "Checking dependencies..."
if ! python3 -c "import pandas, openpyxl, selenium, undetected_chromedriver, PyInstaller" 2>/dev/null; then
    echo "⚠️  Some dependencies are missing"
    echo "Installing dependencies..."
    python3 -m pip install -r requirements.txt
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install dependencies"
        exit 1
    fi
else
    echo "✓ All dependencies are installed"
fi
echo ""

# Clean previous build
echo "Cleaning previous build..."
rm -rf build dist
echo "✓ Cleaned"
echo ""

# Build the app
echo "Building BilligerPriceChecker.app..."
python3 -m PyInstaller --clean --noconfirm BilligerPriceChecker_mac.spec

if [ $? -eq 0 ]; then
    echo ""
    echo "======================================"
    echo "✅ Build successful!"
    echo "======================================"
    echo ""
    echo "Your app is ready at:"
    echo "  → dist/BilligerPriceChecker.app"
    echo ""
    echo "To install:"
    echo "  cp -r dist/BilligerPriceChecker.app /Applications/"
    echo ""
    echo "To run:"
    echo "  open dist/BilligerPriceChecker.app"
    echo ""
else
    echo ""
    echo "======================================"
    echo "❌ Build failed!"
    echo "======================================"
    echo ""
    echo "Check the error messages above."
    exit 1
fi
