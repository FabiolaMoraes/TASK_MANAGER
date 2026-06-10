# Auth API

## Descrição
API backend desenvolvida em Delphi com arquitetura REST utilizando Horse Framework. O módulo de autenticação foi projetado com foco em segurança, escalabilidade e stateless session, utilizando JWT para controle de acesso e separação clara de responsabilidades entre camadas.

---

## Tecnologias

- Delphi  
Linguagem principal, utilizada pela performance nativa e maturidade em aplicações corporativas.

- Horse Framework (REST API)  
Framework leve e performático para construção de APIs HTTP, com baixa complexidade e alta produtividade.

- JWT (JOSE HS256)  
Autenticação stateless baseada em tokens assinados digitalmente, permitindo escalabilidade horizontal sem dependência de sessão em servidor.

- BCrypt  
Algoritmo de hash seguro para senhas, garantindo proteção contra ataques de força bruta e armazenamento seguro de credenciais.

- FireDAC  
Camada de acesso a dados com suporte avançado a queries, performance e integração com diferentes bancos.

- SQLite  
Banco embarcado leve, utilizado para simplicidade, portabilidade e facilidade de desenvolvimento.

---

## Arquitetura

- Controllers: exposição dos endpoints HTTP  
- Services: regras de autenticação e validação de usuário  
- Providers: camada de acesso a dados e conexão com banco  
- Separação de responsabilidades entre API, regra de negócio e persistência  
- Arquitetura stateless baseada em JWT  

---

## Princípios aplicados

- Clean Code (código legível e com responsabilidades bem definidas)
- DRY (reuso de lógica entre camadas)
- Stateless Authentication
- Separation of Concerns
- Segurança com hashing de senha (BCrypt)
- Tokens assinados com validade controlada

---

## Módulo de Autenticação

### POST /login
Autentica o usuário e retorna tokens de acesso.

### GET /refresh
Gera um novo access token a partir do refresh token enviado no header Authorization.

---

## Fluxo de Autenticação

login → access + refresh  
access → requests protegidas  
401 → refresh → novo access  

---

## Respostas HTTP

- 200 OK → Requisição bem-sucedida
- 400 BadRequest → Dados inválidos ou malformados
- 401 Unauthorized → Credenciais inválidas ou token ausente/inválido

---

## Testes

A API pode ser testada via Postman utilizando a collection localizada na pasta:

../postman_collection/