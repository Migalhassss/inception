FROM debian:oldstable

# Adiciona o repositório Sury para PHP 8.1
RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    wget && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update

# Instala PHP 8.1 e dependências
RUN apt-get install -y \
    php8.1 \
    php8.1-fpm \
    php8.1-mysql \
    curl \
    wget \
    tar && \
    apt-get clean

# Configura o PHP-FPM para escutar em 0.0.0.0:9000
RUN sed -i 's|listen = /run/php/php8.1-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.1/fpm/pool.d/www.conf

# Cria o diretório necessário para o PHP-FPM
RUN mkdir -p /run/php

WORKDIR /var/www/html

# Baixa e extrai o WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    cp -r wordpress/* . && \
    rm -rf wordpress latest.tar.gz

RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Inicia o PHP-FPM
CMD ["php-fpm8.1", "-F"]
