# Revisao de compatibilidade — PortalGov e TCE360
Data: 2026-10-25. Leitura de AGENTS e documentos de estado no GitHub; sem alteracao nos repositorios dos produtos.

## PortalGovMunicipal
- AGENTS ja coordena Claude Code e Codex e exige leitura de `docs/39-ONDE-PAREI.md`.
- Nao criar handoff geral alternativo; usar bloco curto no topo de `docs/39`.
- Fluxo vigente: `staging` para homologacao, `main` para producao, com autorizacoes distintas para push e promocao.
- Preservar design system Admin separado do portal publico e schema Supabase `portalgov`.
- Observacao: `docs/39` mistura entradas de 14/10 com bloco de sincronizacao de 20/10; estado local e validacao visual nao podem ser inferidos apenas do arquivo.
- Proposta: apenas adendo de economia de contexto no AGENTS existente, sem substituir regras nem alterar Git.

## iflexus-tce360
- AGENTS ja exige retomada via `ESTADO_DO_PROJETO.md`, preservacao de trabalho e autorizacao para operacoes externas.
- Nome comercial iFlexus TCE360; `ControleProcessoTCE` e referencia historica do checkout.
- Branch padrao remota `producao`; estado documenta trabalho local em `feat/fase-3-classificacao` em 12/10. Conferir refs atuais antes de editar.
- Preservar limites de API TCE, privacidade, isolamento por tenant e controles de RLS; nao confundir schemas `plataforma`, `tce` e `tce_prod`.
- Proposta: complementar handoff de seis linhas e reduzir leitura repetida, sem mudar fluxo de deploy ou politicas.

## Resultado
Compatibilidade conceitual confirmada; nenhum conflito que justifique substituir AGENTS existentes. Antes de qualquer mudanca nesses dois repositorios, revisar estado Git e docs vigentes. Nao houve testes, deploy, merge ou alteracao de banco.
