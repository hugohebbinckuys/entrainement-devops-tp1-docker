FROM alpine
WORKDIR /app
COPY package.json /app/
RUN apk update && apk add npm 
RUN npm install express
COPY . /app/
RUN adduser -D non_root_user
USER non_root_user
EXPOSE 3000
CMD [ "node", "server.js" ]

#exposer les ports pour que ca soit accessible sur ma machine

# => commande pour run : docker run --rm -d -p HOST_port:CONTAINER_port --name "test_express_app" test_express_app