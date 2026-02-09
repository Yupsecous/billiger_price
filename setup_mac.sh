#!/bin/bash
# Setup script for macOS

echo "======================================"
echo "Billiger Price Checker - Setup"
echo "======================================"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 not found"
    echo ""
    echo "Please install Python 3.14:"
    echo "  brew install python@3.14"
    echo ""
    echo "Or download from: https://www.python.org/downloads/"
    exit 1
fi

echo "✓ Python found: $(python3 --version)"
echo ""

# Check Chrome
CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ ! -f "$CHROME_PATH" ]; then
    echo "⚠️  Warning: Google Chrome not found"
    echo ""
    echo "Please install Google Chrome:"
    echo "  https://www.google.com/chrome/"
    echo ""
    echo "The app requires Chrome to work."
    echo ""
else
    echo "✓ Chrome found: $("$CHROME_PATH" --version)"
    echo ""
fi

# Install dependencies
echo "Installing Python dependencies..."
echo ""

python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

if [ $? -eq 0 ]; then
    echo ""
    echo "======================================"
    echo "✅ Setup complete!"
    echo "======================================"
    echo ""
    echo "Next steps:"
    echo ""
    echo "1. Test the app:"
    echo "   python3 billiger_gui.py"
    echo ""
    echo "2. Build the .app:"
    echo "   chmod +x build_mac.sh"
    echo "   ./build_mac.sh"
    echo ""
    echo "   Or simply:"
    echo "   python3 build.py"
    echo ""
else
    echo ""
    echo "❌ Setup failed!"
    echo ""
    echo "Please check the error messages above."
    exit 1
fi
