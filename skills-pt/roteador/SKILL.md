---
name: roteador
description: Roteamento de intencoes em portugues para as skills do Codex. Use quando o usuario nao souber qual skill chamar, quiser digitar o que pretende fazer e receber o atalho certo em barra como /debug, /planejamento, /supabase, /design, /revisao ou /mcp.
---

# Roteador

Use esta skill quando a pessoa descrever o problema e quiser a skill certa sem decorar nomes.

## Como responder

- Ler a intenção do usuario.
- Responder em portugues.
- Sugerir a barra mais adequada.
- Se houver duas areas, indicar o par principal.

## Mapeamento rapido

- erro, crash, falha, bug, regressao -> `/debug`
- nao sei por onde comecar, escopo, plano, ordem -> `/planejamento`
- tela, layout, visual, UX, componente -> `/design` ou `/frontend`
- API, servico, regra de negocio -> `/backend`
- schema, tabela, SQL, view, indice -> `/banco-de-dados`
- Auth, RLS, policy, storage, RPC -> `/supabase`
- teste, cobertura, E2E, browser, validar fluxo -> `/testes` ou `/qa-automacao`
- PR, review, checks, pipeline -> `/github-ci` ou `/revisao`
- risco, permissao, dado sensivel -> `/seguranca`
- lentidao, gargalo, otimizar -> `/performance`
- integracao MCP, ferramentas, conectores -> `/mcp`

## Regra

Se a intencao for multiarea, apontar a skill primaria e uma secundaria.

