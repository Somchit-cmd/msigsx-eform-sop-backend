FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl unzip

# Set PocketBase version
ENV PB_VERSION=v0.29.1

# Download and install PocketBase
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/${PB_VERSION}/pocketbase_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Create persistent data directory
RUN mkdir /pb_data

# Copy the startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set working directory
WORKDIR /

# Expose PocketBase's default port
EXPOSE 8090

# Start PocketBase
CMD ["/start.sh"]
