#!/bin/sh

# Start PocketBase on the port assigned by Render
./pocketbase serve --http=0.0.0.0:${PORT:-8090} \
  --dir=/app/pb_data
