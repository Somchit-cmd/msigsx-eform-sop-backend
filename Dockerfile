FROM alpine:latest

# Install curl and unzip
RUN apk add --no-cache curl unzip

# Download PocketBase v0.29.1
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.29.1/pocketbase_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Create data directory
RUN mkdir /pb_data

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set working dir
WORKDIR /

# Expose PocketBase port
EXPOSE 8090

# Start command
CMD ["/start.sh"]
