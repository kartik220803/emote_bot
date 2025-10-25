# Emote Bot - Auto-Restart Setup

## Quick Start (Google Cloud VM)

### 1. Upload files to your VM
```bash
# Make sure all files are in ~/emote_bot/
cd ~/emote_bot
```

### 2. Make the script executable
```bash
chmod +x start_bot.sh
```

### 3. Run the bot with auto-restart
```bash
./start_bot.sh
```

The script will:
- ✅ Create a virtual environment (first run only)
- ✅ Install all required dependencies
- ✅ Start the bot
- ✅ Automatically restart if it crashes
- ✅ Log exit codes and timestamps

### Stop the bot
Press `Ctrl+C` (you may need to press it twice)

---

## Running in Background (Detached Mode)

If you want to close your SSH session and keep the bot running:

### Option 1: Using `screen`
```bash
# Install screen if not available
sudo apt-get install screen

# Start a new screen session
screen -S emote_bot

# Run the bot
./start_bot.sh

# Detach: Press Ctrl+A then D
# Reattach later: screen -r emote_bot
# Kill session: screen -X -S emote_bot quit
```

### Option 2: Using `tmux`
```bash
# Install tmux if not available
sudo apt-get install tmux

# Start a new tmux session
tmux new -s emote_bot

# Run the bot
./start_bot.sh

# Detach: Press Ctrl+B then D
# Reattach later: tmux attach -t emote_bot
# Kill session: tmux kill-session -t emote_bot
```

### Option 3: Using `nohup` (simplest)
```bash
nohup ./start_bot.sh > bot.log 2>&1 &

# View logs
tail -f bot.log

# Stop the bot
pkill -f start_bot.sh
pkill -f TcP-FrEinD.py
```

---

## Troubleshooting

### Permission denied error
```bash
chmod +x start_bot.sh
```

### Python not found
```bash
sudo apt update
sudo apt install -y python3 python3-venv python3-pip
```

### Dependency installation fails
If you see the METADATA error again, run this first:
```bash
rm -rf ~/.local/lib/python3.8/site-packages/requests*
python3 -m pip cache purge
```

Then run the bot script again.

---

## Configuration

Edit `TcP-FrEinD.py` and change these values:
```python
Uid , Pw = '4243163791' , 'F52110E0A1196642977AFB74DAD8D0472203C4A39383C1D04CE4D8964D9E6765'
```

---

## Developer Info

By: Kartik
