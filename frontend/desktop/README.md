# Desktop (Delphi - REST Client)

## Descrição
Camada frontend desktop desenvolvida em Delphi, consumindo uma API REST (auth e task_manager). A arquitetura foi projetada com foco em escalabilidade, manutenção e baixo acoplamento, permitindo evolução futura do client sem impacto direto nas regras de comunicação HTTP.

A arquitetura foi construída com base em princípios de Clean Code e arquitetura em camadas, combinada com experiência prática no consumo de APIs REST utilizando Horse e no desenvolvimento de aplicações desktop VCL em Delphi, aplicadas em cenários reais com foco em escalabilidade e manutenção.

---

## Objetivo da Arquitetura

O frontend foi estruturado para:

- Centralizar comunicação HTTP em uma camada isolada
- Reduzir duplicação de código entre módulos
- Facilitar manutenção e troca futura do cliente HTTP (ex: substituir RESTRequest4Delphi)
- Permitir evolução independente das telas (Views)
- Garantir reutilização de regras de negócio no client

---

## Estrutura do Projeto

- Views → Interface gráfica (VCL)
- Services → Regras de consumo da API e manipulação de dados locais
- Models → Estruturas de dados e mapeamento de domínio
- Providers → Camada de infraestrutura (Request, Session, abstrações HTTP)

---

## Decisões Arquiteturais

### Providers.Request (Abstração HTTP)
Toda comunicação com a API é centralizada nesta camada.

Motivação:
- Evitar acoplamento direto com RESTRequest4Delphi
- Facilitar substituição futura da biblioteca HTTP
- Centralizar headers, base URL, tokens e interceptações

Isso permite trocar a engine HTTP sem impacto em Services ou Views.

---

### Providers.Session (Singleton)
Implementa padrão Singleton para gerenciamento de estado global da aplicação.

Responsável por:
- Token de acesso (JWT)
- Refresh token
- Estado de autenticação

Benefício:
- Evita duplicação de estado entre Services
- Garante consistência de autenticação em toda a aplicação

---

### Services (Camada de aplicação)
Responsáveis por:

- Orquestrar chamadas HTTP
- Tratar respostas da API
- Popular datasets locais (TFDMemTable)
- Encapsular regras de fluxo de dados

Cada domínio possui seu Service:
- Auth
- Usuários
- Tarefas
- Estatísticas

---

### Views (UI desacoplada)
Camada responsável exclusivamente pela interface.

Características:
- Não acessa HTTP diretamente
- Não contém regra de negócio
- Depende apenas dos Services

---

## Views.Base.Cadastro (Camada Base de UI com Herança)

A unit `Views.Base.Cadastro` é um dos pilares arquiteturais do frontend.

Ela implementa uma **base visual reutilizável para CRUD completo**, servindo como template padrão para todas as telas de cadastro (Usuários, Tarefas, etc).

### Responsabilidades principais:

- Centralizar comportamento de telas CRUD
- Gerenciar estados de visualização (lista x edição)
- Padronizar paginação visual
- Encapsular interação com Service base (`TServiceBaseCadastro`)
- Reduzir duplicação de lógica entre telas

### Conceito aplicado

Essa camada implementa fortemente:

- **Herança de UI (View Base)**
- **Template Method Pattern**
- **Separação entre UI e regra de negócio**
- **Reuso estrutural de comportamento de tela**

---

### Paginação integrada na UI

A própria base já controla:

- Página atual (`Page`)
- Total de páginas (`Pages`)
- Limite de registros (`limit`)
- Offset automático

Isso garante consistência visual entre todos os módulos.

---

### Fluxo padronizado de tela

A base define o fluxo padrão:

- Listagem → `ListarRegistros`
- Inclusão → `Incluir`
- Edição → `Alterar`
- Salvamento → `Salvar`
- Exclusão → `Excluir`

Tudo delegando para `TServiceBaseCadastro`, mantendo a UI limpa.

---

### Navegação e UX

A base já implementa:

- Navegação por teclado (F2, F3, F4, F5, Insert, Delete)
- Troca automática entre cards (Visualizar / Cadastro)
- Controle de estado do dataset
- Atualização automática após ações CRUD

---

### Benefício arquitetural

Essa abordagem reduz drasticamente duplicação:

- Nenhuma tela implementa CRUD do zero
- Nenhuma tela implementa paginação manual
- Nenhuma tela precisa lidar com HTTP diretamente

Resultado:
➡ consistência total de UX
➡ menor custo de manutenção
➡ escalabilidade de telas

---

### Services (Camada de aplicação)
Responsáveis por:

- Orquestrar chamadas HTTP
- Tratar respostas da API
- Popular datasets locais (TFDMemTable)
- Encapsular regras de fluxo de dados

Cada domínio possui seu Service:
- Auth
- Usuários
- Tarefas
- Estatísticas

---

### Views (UI desacoplada)
Camada responsável exclusivamente pela interface.

Características:
- Não acessa HTTP diretamente
- Não contém regra de negócio
- Depende apenas dos Services

---

### Models
Representam entidades de domínio no client.

Uso:
- Estruturar dados vindos da API
- Evitar manipulação direta de JSON na UI
- Melhorar legibilidade e manutenção

---

## Padrões e Conceitos Aplicados

- Clean Code (código legível e organizado)
- DRY (reuso via Services e Base Classes)
- Singleton (Session global)
- Template Method (Views.Base.Cadastro)
- Separation of Concerns (Views / Services / Providers)
- Adapter Pattern (Providers.Request como abstração HTTP)
- Baixo acoplamento entre UI e API
- Arquitetura preparada para substituição de engine HTTP

---

## Uso de Enums

Enums são utilizados para:

- Evitar strings mágicas
- Evitar números fixos no domínio
- Garantir consistência entre UI e API

Exemplo:
- Status de Usuário
- Status de Tarefa
- Prioridade de Tarefa

---

## Herança (Base Services)

Foi implementada uma camada base (`TServiceBaseCadastro`) para:

- Centralizar lógica de CRUD
- Padronizar paginação
- Evitar duplicação de chamadas HTTP
- Garantir comportamento consistente entre módulos

---

## Paginação

Implementada de forma padrão em toda aplicação:

- limit → quantidade de registros
- offset → controle de página

Isso permite escalabilidade no consumo da API sem impacto na UI.

---

## Módulos

### Auth (Login)

Responsável pela autenticação do usuário.

Fluxo:
- Envio de username e password
- Retorno de access token + refresh token
- Armazenamento em Session (Singleton)

---

### Usuários

Operações:
- Listagem com paginação
- CRUD completo
- Status tratado via Enum

---

### Tarefas

Operações:
- CRUD completo
- Estatísticas agregadas
- Controle de status e prioridade via Enum

---

## Base HTTP (Providers.Request)

Camada crítica do sistema.

Responsável por:
- Definir BaseURL
- Definir Resource
- Adicionar headers automaticamente
- Encapsular execução HTTP

Preparado para substituição futura de engine HTTP sem impacto no restante do sistema.

---

## Login Flow

login → session (access + refresh)  
access → requests protegidas  
401 → refresh → novo access  

---

## Segurança

- JWT para autenticação stateless
- Refresh token para renovação de sessão
- Sessão centralizada via Singleton
- Separação entre autenticação e consumo de API

---

## Tecnologias

- Delphi (VCL Desktop)
- REST API Consumption
- DataSet / TFDMemTable
- JSON Serialization
- Padrões de projeto (Singleton, Base Class, Adapter, Template Method)
- Arquitetura em camadas

---

## Observação de Arquitetura

Este frontend foi projetado com foco em:

- Evolução contínua
- Substituição de dependências externas sem impacto estrutural
- Baixo acoplamento entre UI e comunicação HTTP
- Escalabilidade de módulos

---

## Screenshots

O projeto possui capturas de tela das principais funcionalidades da aplicação, incluindo:

- Home
- Usuários
- Tarefas
- Estatísticas

As imagens estão disponíveis na pasta:
../images/