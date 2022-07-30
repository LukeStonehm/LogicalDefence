# super simple dockerfile that wraps the build output of `futter build web --release`

FROM nginx:1.23-alpine

COPY build/web /usr/share/nginx/html