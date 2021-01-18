#!/bin/sh

# set -e



# mkdir /etc/nginx/sites-enabled
# touch /etc/nginx/sites-enabled/proxy.conf

# cat > /etc/nginx/sites-enabled/proxy.conf << EOL

# server{

#   listen ${NGINX_PORT};

# EOL

# for n in 1 2 3 4 5
# do

# if [[ ! -z $(printenv PROXY_PATH_${n}) ]]; then

# cat >> /etc/nginx/sites-enabled/proxy.conf << EOL

#   location $(printenv PROXY_PATH_${n}) {
#     proxy_pass $(printenv PROXY_HOST_${n});
#   }

# EOL

# fi;

# done

# echo "}" >> /etc/nginx/sites-enabled/proxy.conf;

# nginx -t

# # exec "$@"


set -e


cat > /etc/nginx/conf.d/default.conf << EOL

server{

  listen ${NGINX_PORT};

EOL

for n in 1 2 3 4 5
do

if [[ ! -z $(printenv PROXY_PATH_${n}) ]]; then

cat >> /etc/nginx/conf.d/default.conf << EOL

  location $(printenv PROXY_PATH_${n}) {
    proxy_pass $(printenv PROXY_HOST_${n});
  }

EOL

fi;

done

echo "}" >> /etc/nginx/conf.d/default.conf;

nginx -t

exec "$@"