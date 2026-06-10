# Task Manager API

## Descrição
API backend desenvolvida em Delphi com arquitetura REST utilizando Horse Framework. O sistema contempla módulos de tarefas e usuários, com autenticação JWT, separação em camadas e foco em escalabilidade, manutenção e baixa duplicação de código.

---

## Tecnologias

- Delphi  
Linguagem principal, utilizada pela performance nativa e maturidade em sistemas corporativos.

- Horse Framework (REST API)  
Framework leve para construção de APIs HTTP, com baixa complexidade e alta performance.

- JWT (JOSE HS256)  
Autenticação stateless baseada em tokens assinados, garantindo escalabilidade horizontal.

- BCrypt  
Hash seguro de senhas com proteção contra ataques de força bruta.

- FireDAC  
Camada de acesso a dados com controle avançado de queries e performance.

- DataSet.Serialize  
Conversão automática entre DataSet e JSON, reduzindo boilerplate e acoplamento entre API e banco.

- SQLite  
Banco embarcado leve, ideal para desenvolvimento e portabilidade.

---

## Arquitetura

- Controllers: exposição dos endpoints HTTP  
- Services: regras de negócio e isolamento de domínio  
- Providers: camada base de persistência com reuso de CRUD  
- Herança em Providers: redução de duplicação e padronização de operações  
- Queries dinâmicas: filtros opcionais via parâmetros  
- Separação clara entre API, regra de negócio e acesso a dados  

---

## Princípios aplicados

- Clean Code (código coeso e legível)
- DRY (reuso via herança)
- SOLID (principalmente Single Responsibility)
- Stateless API (JWT)
- Uso de Enums para evitar strings e números mágicos
- Padronização entre módulos (Users e Tasks)
- Paginacao via limit e offset
- Baixo acoplamento entre camadas

---

## Módulo: Tarefas

### GET /tarefas
Lista tarefas com filtros e paginação.

Filtros:
- id
- status
- título

---

### GET /tarefas/:id
Consulta tarefa por ID.

---

### GET /tarefas/estatisticas
Retorna métricas agregadas:
- total de tarefas
- média de prioridade das tarefas pendentes
- tarefas concluídas nos últimos 7 dias

---

### POST /tarefas
Criação de tarefa com validação de domínio.

---

### PUT /tarefas/:id
Atualização com merge automático de JSON e controle de regras de conclusão.

---

### DELETE /tarefas/:id
Remoção de tarefa por ID.

---

## Módulo: Usuários

### GET /usuarios
Lista usuários com filtros dinâmicos e paginação.

### GET /usuarios/:id
Consulta usuário por ID.

### POST /usuarios
Criação de usuário com hash de senha via BCrypt.

### PUT /usuarios/:id
Atualização de usuário com merge automático de JSON.

### DELETE /usuarios/:id
Remoção de usuário.

---

## Respostas HTTP

A API segue padronização REST para todos os módulos (Tarefas e Usuários):

- 200 OK → Requisições bem-sucedidas (GET)
- 201 Created → Recurso criado com sucesso (POST)
- 204 NoContent → Atualização ou remoção realizada com sucesso (PUT / DELETE)
- 400 BadRequest → Dados inválidos ou requisição malformada
- 401 Unauthorized → Token inválido ou ausente
- 404 NotFound → Recurso não encontrado

---

## Decisões técnicas importantes

### DataSet.Serialize
Remove necessidade de mapeamento manual entre JSON e banco, acelerando desenvolvimento e reduzindo acoplamento.

### FireDAC
Permite queries dinâmicas, controle de performance e flexibilidade de acesso a dados.

### Enums
Evita strings mágicas e garante integridade do domínio (status, regras e fluxos).

### BCrypt
Garante segurança real de senhas armazenadas, evitando vulnerabilidades comuns.

### Herança em Providers
Centraliza CRUD, reduz duplicação e padroniza comportamento entre módulos.

### Queries dinâmicas
Permitem filtros opcionais sem necessidade de múltiplas implementações de SQL.

---

## Paginacao

Implementada via:
- limit
- offset

Garantindo escalabilidade em grandes volumes de dados.

---

## Fluxo da API

login → access + refresh  
access → requests protegidas  
401 → refresh → novo access  

---

## Testes

A API pode ser testada via Postman utilizando a collection localizada em:

../postman_collection/