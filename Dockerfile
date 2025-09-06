# Use lightweight Alpine base
FROM alpine:3.17

# Install Shadowsocks-libev
RUN apk add --no-cache shadowsocks-libev

# Expose default Shadowsocks port (can be overridden by Render)
EXPOSE 8388

# Use environment variable for password (set in Render dashboard)
ENV PASSWORD=ChangeThisPassword
ENV PORT=8388

# Start Shadowsocks server in foreground
CMD ss-server -s 0.0.0.0 -p $PORT -k $PASSWORD -m aes-256-gcm -v
