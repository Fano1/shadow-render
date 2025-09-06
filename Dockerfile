# Use Debian slim as base
FROM debian:bookworm-slim

# Install Shadowsocks-libev
RUN apt-get update && \
    apt-get install -y shadowsocks-libev && \
    rm -rf /var/lib/apt/lists/*

# Expose Shadowsocks port
EXPOSE 8388

# Set environment variables (change in Render dashboard, not here)
ENV PASSWORD=ChangeThisPassword
ENV PORT=8388

# Create non-root user and run Shadowsocks as them
RUN useradd -m ssuser
USER ssuser

# Start Shadowsocks server
CMD ss-server -s 0.0.0.0 -p $PORT -k $PASSWORD -m aes-256-gcm -v
