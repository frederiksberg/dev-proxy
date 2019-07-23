FROM debian:stretch-slim

# Create nginx user <- Taken from official dockerfile
RUN set -x && \
    addgroup --system --gid 101 nginx && \
    adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistant --gecos "nginx user" --shell /bin/False --uid 101 nginx

# Install all dependencies
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    gnupg1 apt-transport-https ca-certificates certbot python-certbot-nginx \
    automake gcc libpcre3-dev zlib1g-dev make wget curl gpg

# Get source
RUN wget -q https://nginx.org/download/nginx-1.17.1.tar.gz{,.asc}

# Get signing key
RUN curl -sS https://nginx.org/keys/mdounin.key | gpg --import

# Verify signature
RUN gpg --trusted-key 0x520A9993A1C052F8 --verify nginx-1.17.1.tar.gz{.asc,}

# Build and install
RUN tar -zxf nginx-1.17.1.tar.gz && \
    cd nginx-1.17.1 && \
    ./configure --user=nginx --group=nginx \
        --without-http_uwsgi_module \
        --without-http_autoindex_module && \
    make && make install

# Run service not as daemon
CMD ["nginx", "-g", "daemon off;"]