FROM arm64v8/python:3-alpine
#COPY qemu-arm-static /usr/bin/
LABEL maintainer="x.yangtze.river@gmail.com"

ENV CRON_SIGNIN='30 9 * * *'
ENV MULTI=FALSE
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
	&& apk add --no-cache tzdata

WORKDIR /tmp
ADD requirements.txt ./
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt 

WORKDIR /var/app
COPY . /var/app

CMD ["python3", "./docker.py" ]
