FROM python:3.11-slim

# Cài ffmpeg và các dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements và cài đặt
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY bot.py .

# Chạy bot
CMD ["python", "bot.py"]
