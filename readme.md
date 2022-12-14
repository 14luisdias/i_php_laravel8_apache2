DOCKER APLICAÇÃO DO PCIGMA

primeiramente ná maquina a buildar tem de ter instalada a ferramenta Docker

 1. para criar a imagem execute:
    => docker build -t i-ap-php8-apache .
  obs: 
     - i-ap-php8-apache -> é o nome da imagem
     
 2. para criar o conteiner ir na pasta onde está localizado o código fonte:
    NO LINUX EXECUTE
    => docker run -d --name c-curso_alura-ap -v $PWD:/code -p 7000:80 i-ap-php8-apache

    NO WINDOWS IR NA IMAGEM E CLICLAR EM RUN PREENCHA OS CAMPOS
   obs:
      - Optional Settings
      - Container Name -> c-curso_alura-ap
      - Ports:Local Host -> 7000 code
      - Volumes:Host Path -> selecionar a pasta onde está localizada o codigo fonte do curso
      - Container Path -> /code
      - i-ap-php-apache - > nome da imagem
      - RUN
vscode