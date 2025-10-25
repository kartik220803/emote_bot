#!/bin/bash

# Auto-restart script for TcP-FrEinD.py (Emote Bot)
# This script will continuously restart the Python application if it crashes

echo "========================================="
echo "Starting Emote Bot Auto-Restart Script"
echo "========================================="

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip and setup tools
echo "Upgrading pip and setuptools..."
# Use the virtualenv's python (if present) or fall back to system python3
if [ -x "venv/bin/python" ]; then
    PYTHON_BIN="venv/bin/python"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_BIN="python"
else
    echo "No suitable Python interpreter found. Install Python 3 and try again:"
    echo "  sudo apt update && sudo apt install -y python3 python3-venv python3-pip"
    exit 1
fi

"$PYTHON_BIN" -m pip install --upgrade pip setuptools wheel

# Install all required Python modules
echo "Installing required Python modules..."
"$PYTHON_BIN" -m pip install requests psutil PyJWT urllib3 pytz aiohttp protobuf-decoder cfonts pycryptodome
# Install protobuf 6.x to match the generated protobuf files
"$PYTHON_BIN" -m pip install "protobuf>=6.30.0"

echo "========================================="
echo "Starting TcP-FrEinD.py with auto-restart..."
echo "========================================="

while true
do
    # Run the Python script
    "$PYTHON_BIN" TcP-FrEinD.py
    
    # Capture exit code
    EXIT_CODE=$?
    
    # Log the crash/exit with timestamp
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Bot exited with code $EXIT_CODE. Restarting in 3 seconds..."
    
    # Add a small delay to prevent rapid restart loops and allow you to see error messages
    sleep 3
done
