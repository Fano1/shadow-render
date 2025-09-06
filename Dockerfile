# Use Debian slim
FROM debian:bookworm-slim

# Install Shadowsocks
RUN apt-get update && apt-get install -y shadowsocks-libev && rm -rf /var/lib/apt/lists/*

# Expose default port
EXPOSE 8388

# Set environment variables for easy config
ENV PASSWORD=ChangeThisPassword
ENV PORT=8388

# Start server
CMD ss-server -s 0.0.0.0 -p $PORT -k $PASSWORD -m aes-256-gcm -v
