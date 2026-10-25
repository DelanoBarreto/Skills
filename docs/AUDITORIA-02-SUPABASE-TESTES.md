# Auditoria 02 — Supabase e testes
Data: 2026-10-25 | Escopo: leitura de 5 skills no GitHub. Nenhum teste executado e nenhum banco alterado.

## Achados
- Claude e Codex possuem skills `supabase` e `testes` com funcoes sobrepostas; ambas sao descricoes curtas, nao procedimentos completos.
- `codex/supabase` e `codex/testes` citam skills externas de apoio sem comprovar instalacao.
- `codex/migracoes` fala de rollback, mas nao define preflight, backup, aprovacao e validacao de RLS.
- Faltam casos obrigatorios de teste de acesso entre organizacoes e separacao de ambiente de desenvolvimento/producao.

## Padrao proposto para Atlas
1. Antes de qualquer SQL: identificar projeto Supabase, schema, ambiente, impacto, dependencias, backup e plano de reversao.
2. Nunca alterar `plataforma`, `tce` ou `tce_prod` sem autorizacao explicita; alteracoes em `atlas` tambem exigem revisao/aprovacao.
3. Identidade e organizacao sempre derivadas de sessao autenticada; testar RLS com usuarios de duas organizacoes.
4. Testes minimos por mudanca: unitarios pertinentes, integracao API/Postgres, RLS positivo/negativo, frontend e E2E quando houver fluxo de usuario.
5. Registrar testes executados e nao executados; nenhum resultado historico e prova de execucao atual.
6. Migracoes em staging antes de producao, com backup e rollback revisados; sem comandos automaticos de escrita.

## Saida economica — maximo 6 linhas
`Escopo: ...`
`Feito: ...`
`Banco/arquivos: ...`
`Testes: ...`
`Risco: ...`
`Proximo: ...`

## Proxima etapa
Revisar skills `infra`, `deploy`, `hosting`, `publicar-vps`, e desenhar instalador Linux com dry-run. Nada instalado.
