# pgbouncer-rhel6

Script foi criado com o intuito de fazer a instalação do PgBouncer em versões mais antigas das distros RHEL6, devido a atualizações mais recentes não foi possível utilizar a instalação via repositório.

Execução do arquivo
# sh pgbouncer_install.sh

A instalação é realizada no mesmo servidor do banco de dados.

O Arquivo irá realizar as seguintes ações 

1 - Atualizar os ca-certificates;

2 - Atualizar o PostgreSQL 9.6

3 - Instalar os pacotes de requisitos mínimos gcc libevent-devel openssl-devel e wget

4 - Copiar o arquivo de serviço para o diretório /etc/init.d/

5 - Baixar a versão 1.12.0 do PgBouncer

6 - Descompactar o pacote do PgBouncer em /usr/local/src/

7 - Configurar o PgBouncer para compilação

8 - Compilar o PgBouncer

9 - Instalar 

10 - Ajustar os diretórios e arquivos do pgbouncer

11 - Aplicar as permissões necessárias  

12 - Criar e configurar o pgbouncer como serviço no chkconfig

Após a instalação será necessário realizar as configurações do arquivo pgbouncer.ini que estará disponível em /etc/pgbouncer

Abaixo Documentação Oficial do PgBouncer.
https://www.pgbouncer.org/config.html
