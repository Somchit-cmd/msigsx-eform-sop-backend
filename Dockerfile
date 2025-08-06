FROM alpine:latest

# Install required tools
RUN apk add --no-cache wget unzip

# Create app directory
WORKDIR /app

# Download PocketBase v0.29.1
RUN wget -O pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.29.1/pocketbase_0.29.1_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Create persistent data directory
RUN mkdir -p pb_data

# Copy start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Don't hardcode port
EXPOSE ${PORT:-8090}

# Run start script
CMD ["/app/start.sh"]
