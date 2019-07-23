#!/bin/bash

docker exec reverse_proxy certbot --nginx -d dev.frb-data.dk -d test.frb-data.dk -nq --agree-tos --redirect --expand --no-eff-email -m gis@frederiksberg.dk
