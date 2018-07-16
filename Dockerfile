FROM tu6ge/nginx-php

ADD ./ImageMagick-7.0.7-37.tar.gz /root
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.7/main/  > /etc/apk/repositories \
	&& echo http://mirrors.ustc.edu.cn/alpine/v3.7/community/  >> /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk --no-cache add build-base \
#	&& wget https://www.imagemagick.org/download/ImageMagick-7.0.7-37.tar.gz \
#	&& tar -zvxf ImageMagick-7.0.7-37.tar.gz \
	&& cd /root/ImageMagick-7.0.7-37 \
	&& ./configure --prefix=/usr/local/imagemagick \
	&& make \
	&& make install \
	&& apk add autoconf \
	&& pecl download imagick-3.4.3 \
	&& mkdir -p /tmp/imagick \
    && tar -xf imagick-3.4.3.tgz  -C /tmp/imagick --strip-components=1 \
    && rm -f imagick-3.4.3.tgz \
	&& docker-php-ext-configure /tmp/imagick --with-imagick=/usr/local/imagemagick \
	&& docker-php-ext-install /tmp/imagick

EXPOSE 443 80 9000

CMD ["/start.sh"]