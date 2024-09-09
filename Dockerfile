# ベースイメージとしてPHP with Apacheを使用
FROM php:7.4-apache

# 必要なPHP拡張機能をインストール
RUN docker-php-ext-install mysqli pdo pdo_mysql

# WordPressをダウンロードして展開
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm latest.tar.gz

# WordPress設定ファイルを作成
RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php \
    && sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php \
    && sed -i "s/username_here/${DB_USER}/" /var/www/html/wp-config.php \
    && sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/wp-config.php \
    && sed -i "s/localhost/${WORDPRESS_DB_HOST}/" /var/www/html/wp-config.php

# Apacheの設定
RUN a2enmod rewrite

# ファイルの所有者を変更
RUN chown -R www-data:www-data /var/www/html

# PHPの設定を調整
RUN { \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'memory_limit = 256M'; \
    echo 'max_execution_time = 300'; \
    echo 'max_input_time = 300'; \
} > /usr/local/etc/php/conf.d/wordpress.ini

EXPOSE 80

CMD ["apache2-foreground"]