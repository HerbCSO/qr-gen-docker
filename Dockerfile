FROM alpine:latest

RUN apk add git npm; npm i -g elm; git clone https://github.com/viktorstrate/qr-gen.git /src

WORKDIR /src

RUN ./build.sh

FROM nginx:latest
COPY --from=0 /src/build /usr/share/nginx/html
LABEL org.opencontainers.image.description="Docker image that wraps https://github.com/viktorstrate/qr-gen"
