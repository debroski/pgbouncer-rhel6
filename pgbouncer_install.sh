#!/bin/bash

# Atualizando a cadeia de CAs
yum update ca-certificates -y

# Atualizando banco de dados de postgresql96
yum update postgresql96 -y

# Instalação dos requisitos para o pgbouncer
yum install gcc libevent-devel openssl-devel wget -y

# Copiando arquivo de servico
cp pgbouncer /etc/init.d/pgbouncer

# Acessando diretório para download
cd /usr/local/src/

# Baixando o pacote do pgbouncer
wget https://www.pgbouncer.org/downloads/files/1.12.0/pgbouncer-1.12.0.tar.gz

# Descompactando o pacote
tar zxvf /usr/local/src/pgbouncer-1.12.0.tar.gz -C /usr/local/src/
cd /usr/local/src/pgbouncer-1.12.0/

# Configurando o PgBouncer para compilação
./configure --prefix=/usr/local/pgbouncer

# Compilando
make

# Instalando
make install

# Criando diretório
mkdir /etc/pgbouncer

# Copiando os arquivos de configuração
cp /usr/local/pgbouncer/share/doc/pgbouncer/pgbouncer.ini /etc/pgbouncer/
cp /usr/local/pgbouncer/share/doc/pgbouncer/userlist.txt /etc/pgbouncer/

# Criando diretório de logs
mkdir /var/log/pgbouncer/
# Criando arquivos de logs
touch /var/log/pgbouncer/pgbouncer.log
# Criando o diretório do PID
mkdir /var/run/pgbouncer/

# Ajuste as permissões do diretório para o usuário postgres
chown -R postgres. /var/log/pgbouncer/
chown -R postgres. /var/run/pgbouncer/

# Criando link simbolico para o Binario
ln -s /usr/local/pgbouncer/bin/pgbouncer  /usr/bin/pgbouncer

# Dando permissão do arquivo de serviço
chmod 755 /etc/init.d/pgbouncer

# criando pgbouncer como servico, e adcionando como inicialização automatica no sistema.
cd /etc/init.d/
chkconfig --add pgbouncer
chkconfig --level 3 pgbouncer on

echo "Instalacao PgBouncer Finalizada"
