# IPE API

**API do sistema IPE**

A API fornece dados no formato JSON para as requisições. Para ter acesso aos dados, é necessário a autenticação de
usuário.

# Pré-Requisitos:

- PostgreSQL v12.13
- Ruby v3.2.0
- Rails v7.0.4.3
- Libvips v8.14

# Passo a passo para executar o projeto

# Fazer o Clone do Projeto

# Entrar na pasta do projeto

`cd empodera-api`

# Instalar as Gems

`bundle install`

# Copiar ".env.example" para ".env"

`cp .env.example .env`

# Configurar as varáveis dentro do arquivo ".env", conforme o ambiente

# Criar banco de dados

`rails db:create`

# Criar tabelas

`rails db:migrate`

# Popular tabelas

`rails db:seed`

> Observar no console qual a senha que foi gerada para o usuário "Admin"

```
>>> RODANDO EM AMBIENTE: Development
- - - - - - - - - -
Admin User >>>
>>> Usuário ADMIN criado
>>> E-mail: admin@admin.com
>>> Password: 12345678
```

# Executar servidor

`rails s`

# Autenticação de Usuário

Ao realizar a autenticação do usuário, a API fornecerá um código **TOKEN** e um código **CLIENT**, que deverão ser
enviados no cabeçalho das requisições, juntamente com o **UID** (e-mail) do usuário.

Url de autenticação:
`{{server}}/auth/sign_in?email={{email}}&password={{password}}`
