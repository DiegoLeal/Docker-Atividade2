## Projeto Dockerfile docker-compose cadastro de pessoas em API REST com Spring Boot



##### Neste projeto foi desenvolvido um pequeno sistema para cadastro de pessoas através de uma API REST, criada com o Spring Boot.

Neste projeto foi desenvolvido e abordado os seguintes tópicos abaixo:

- Setup inicial de projeto com o Spring Boot Initializer

- Desenvolvimento de operações de gerenciamento de usuários (Cadastro e leitura de usuarios de um sistema).

- Relação de cada uma das operações acima com o padrão arquitetural REST.

- Implantação de conteinerização docker através do Dockerfile e docker-compose

  

##### Foram utilizados os seguintes pré-requisitos para a execução e desenvolvimento do projeto:

- Java 11.

- Maven 4.0.0.

- Intellj IDEA IDE para desenvolvimento.

- GIT para controle de versão .

- GitHub para o armazenamento projeto na nuvem.

  

### Efetue o clone do repositório para seu workspace 

```bash
git clone https://github.com/DiegoLeal/Docker-Atividade2
```



### Em seguinda efetue o build do projeto conforme comando abaixo.



```bash
docker-compose up --buil
```



### Após  efetuado o build do projeto e o mesmo ter iniciado, abra outro terminal, copie o comando abaixo e cole em seu terminal.

```bash
curl --request POST \
  --url http://localhost:8080/api/usuarios \
  --header 'Content-Type: application/json' \
  --data '{
	"id": null,
	"nome": "Diego",
	"telefone": "45 99999-9999"
}'
```



### Para verificar os usuarios salvos no banco de dados copie  comando abaixo e cole em seu terminal.

```bash
curl --request GET \
  --url http://localhost:8080/api/usuarios
```



### Se preferir visualizar um seu navegador adicione o link abaixo.

```bash
http://localhost:8080/api/usuarios
```