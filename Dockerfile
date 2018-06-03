FROM tu6ge/nginx-php

ADD ./ImageMagick-7.0.7-37.tar.gz /root
RUN apk --no-cache add build-base \
#	&& wget https://www.imagemagick.org/download/ImageMagick-7.0.7-37.tar.gz \
#	&& tar -zvxf ImageMagick-7.0.7-37.tar.gz \
	&& cd /root/ImageMagick-7.0.7-37 \
	&& ./configure --prefix=/usr/local/imagemagick \
	&& make \
	&& make install \
	&& apk add autoconf

#RUN pecl install imagick
# 这个过程需要用交互模式 输入 /usr/local/imagemagick

#RUN docker-php-ext-enable imagick
