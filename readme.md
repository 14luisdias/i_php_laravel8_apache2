DOCKER APLICAÇÃO DO PCIGMA

primeiramente ná maquina a buildar tem de ter instalada a ferramenta Docker
na pasta Documentos\2.PCIGMA\docker\i-pcigma-ap-php8-apache2-psql\
tem os códigos pronto do arquivo dockerfile para criar a imagem em php 8.1.2 e apache2

 1. para criar a imagem execute:
    => docker build -t i-pcigma-ap-php8-apache .
  obs: 
     - i-pcigma-ap-php8-apache -> é o nome da imagem
     
 2. para criar o conteiner ir na pasta onde está localizado o código fonte:
    NO LINUX EXECUTE
    => docker run -d --name c-pcigma-ap -v $PWD:/code -p 9001:80 i-pcigma-ap-php8-apache

    NO WINDOWS IR NA IMAGEM E CLICLAR EM RUN PREENCHA OS CAMPOS
   obs:
      - Optional Settings
      - Container Name -> c-pcigma-ap
      - Ports:Local Host -> 9001code
      - Volumes:Host Path -> selecionar a pasta onde está localizada o codigo fonte do PCIGMA
      - Container Path -> /code
      - i-pcigma-ap-php-apache - > nome da imagem
      - RUN
vscode