FROM alpine:latest

# Install required tools
RUN apk add --no-cache wget unzip

# Download PocketBase binary (v0.29.1)
RUN wget -O pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.29.1/pocketbase_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Create a persistent data directory
RUN mkdir /pb_data

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /
EXPOSE 8090

CMD ["/start.sh"]
