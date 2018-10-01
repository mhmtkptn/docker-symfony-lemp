### Hakkında

Symfony tabanlı uygulamaların Docker containerları üzerinden çalıştırlmasını sağlar.

### Yapı

- Webserver
-- Nginx, Php-fpm 5.6
- Database
-- Mysql 5.7
- Phpmyadmin

### Kullanım

.env dosyası içerisinde bulunan bilgiler doldurulmalıdır.

- Kullanılan Domainler
phpmyadmin.local -> phpmyadmine erişim için kullanılır
symfony.local -> app_dev.php üzerinden symfony appinize erişim için kullanılır. (web debug toolbar ile kullanım)
symfony.prod -> app.php üzerinden symfony appinize erişim için kullanılır.
