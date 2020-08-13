FROM debian:buster

LABEL maintainer="gkhodizo@student.42.us.org"

RUN apt-get update && apt-get upgrade && apt-get install -y \
	nginx

COPY srcs ./root/

WORKDIR /root/

#ENTRYPOINT ["bash", "run_container.sh"]

#CMD /bin/bash

