# Catalogo de Skills

## Objetivo

Dar uma entrada unica em portugues para entender e acionar o conjunto de skills do Codex.

## Skills globais

| Skill | Quando usar | Equivalencia na `.agent` do PortalGov |
| --- | --- | --- |
| `ajuda` | Descobrir qual skill usar e entender o catalogo | `intelligent-routing` + `orchestrator` |
| `roteador` | Converter intenção em barra e apontar a skill certa | `intelligent-routing` |
| `planejamento` | Decompor trabalho, definir escopo, ordem, riscos e entregaveis | `project-planner` |
| `debug` | Investigar erro, reproduzir bug, achar causa raiz e validar correcao | `debugger` |
| `design` | Definir layout, fluxo, visual e decisoes de UI/UX | `frontend-specialist` + `frontend-design` |
| `ui-ux-pro-max` | Design executavel com estilos, paletas, fontes e componentes prontos | `frontend-specialist` (avancado) |
| `frontend` | Trabalhar em React, Next.js, componentes e tela | `frontend-specialist` |
| `backend` | API, servicos, integracoes e regra de negocio no servidor | `backend-specialist` |
| `banco-de-dados` | Modelagem, SQL, migracoes, indices e relacoes | `database-architect` |
| `supabase` | RLS, Auth, schemas, RPC, storage e fluxo especifico do Supabase | `database-architect` |
| `testes` | Estrategia de testes, unitarios, integracao e E2E | `test-engineer` + `qa-automation-engineer` |
| `github-ci` | PR, checks, GitHub Actions, review e correcoes de CI | `gh-fix-ci` + `gh-address-comments` |
| `documentacao` | README, guias, specs, changelog e docs operacionais | `documentation-writer` |
| `arquitetura` | Organizar limites, modulos, tradeoffs e estrutura geral | `architecture` + `orchestrator` |
| `seguranca` | Revisar risco, permissao, dados sensiveis e falhas defensivas | `security-auditor` |
| `performance` | Melhorar velocidade, bundle, consulta e experiencia de resposta | `performance-optimizer` |
| `revisao` | Revisar codigo, risco, clareza e regressao antes de enviar | `code-review-checklist` |
| `qa-automacao` | Validar fluxos no navegador e automatizar E2E | `qa-automation-engineer` + `webapp-testing` |
| `mcp` | Criar, adaptar ou entender integrações MCP e ferramentas | `mcp-builder` |
| `code-review` | Review especializado com fixes e simplificacoes inline | `code-reviewer` |
| `security-review` | Audit profundo de vulnerabilidades e OWASP | `security-auditor` (avancado) |
| `verify` | Testar que mudancas funcionam de verdade no app | `qa-automation-engineer` |
| `run` | Iniciar, rodar e debugar a aplicacao localmente | `backend-specialist` + `frontend-specialist` |
| `simplify` | Simplificar codigo com reuse e eficiencia | `code-archaeologist` |
| `init` | Inicializar CLAUDE.md e documentacao do projeto | `documentation-writer` |
| `review` | Revisar PR no GitHub (comentarios e checklist) | `code-reviewer` |
| `loop` | Executar tarefa em intervalo recorrente (polling) | Interno |
| `schedule` | Agendar rotinas com cron (agentes em background) | Interno |
| `update-config` | Configurar permissoes, settings.json e variaveis | Interno |
| `keybindings-help` | Customizar atalhos de teclado (~/.claude/keybindings.json) | Interno |
| `fewer-permission-prompts` | Reduzir prompts de permissao com allowlist | Interno |
| `claude-api` | Referencia de modelos, pricing, params e tool-use da Claude API | Referencia |

## Como escolher

- Se o problema for "o que usar?", comece por `ajuda`.
- Se o problema for "quero falar o que estou pensando e receber a barra", use `roteador`.
- Se o problema for "nao sei por onde comecar", use `planejamento`.
- Se houver erro ou comportamento errado, use `debug`.
- Se houver tela, use `design` ou `frontend`.
- Se houver dados, use `banco-de-dados` ou `supabase`.
- Se houver validacao, use `testes`.
- Se houver PR/CI, use `github-ci`.
- Se houver risco, permissao ou dado sensivel, use `seguranca`.
- Se houver lentidao, use `performance`.
- Se houver PR para revisar, use `revisao`.
- Se houver fluxo de navegador, use `qa-automacao`.
- Se houver integracao com ferramentas, use `mcp`.

## Mapa de origem

Fonte de referencia usada para adaptar o catalogo sem alterar a base original:

- `C:\\Antigravity\\Projetos\\PortalGovMunicipal\\.agent`
