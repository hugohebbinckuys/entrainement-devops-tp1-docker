FROM alpine:3.19.9
RUN apk update && apk add curl && adduser -D non_root_user
USER non_root_user
ENTRYPOINT [ "curl" ]

#commande pour build : docker build -t retry_tp_curl_image 3-curl.dockerfile . 
#commande pour run : dockr run --rm --name "retry_tp_curl_container" retry_tp_curl_image url