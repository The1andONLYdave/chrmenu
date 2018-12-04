FROM bash:4.4
COPY menu.sh /menu.sh
RUN apk add sudo 
CMD bash /menu.sh
