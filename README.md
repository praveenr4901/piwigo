# piwigo


docker build -t piwigo_images .

docker run --name piwigo -dp 8090:80 piwigo_images

PHP VERSION-7.2

MYSQL VERSION-5.7
