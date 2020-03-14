FROM ubuntu as build
RUN apt update && apt install -y make automake g++ libpoppler-glib-dev poppler-utils libwxgtk3.0-dev git
RUN git clone https://github.com/yusuf-gunaydin/diff-pdf
WORKDIR /diff-pdf
RUN ./bootstrap
RUN ./configure
RUN make

FROM ubuntu
COPY --from=build /diff-pdf/diff-pdf /usr/bin/diff-pdf
RUN  apt update && apt install -y libpoppler-glib8 libwxgtk3.0 && apt clean