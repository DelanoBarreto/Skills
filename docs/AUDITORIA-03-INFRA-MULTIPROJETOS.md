# Auditoria 03 — Infraestrutura e modelo multiprojetos
Data: 2026-10-25 | Status: proposta, somente leitura.

## Resultado da revisao
As skills `infra`, `deploy`, `hosting` e `publicar-vps` sao genericas e se referenciam mutuamente. Nao possuem fluxo detalhado de aprovacao, backup, isolamento de servicos ou diagnostico Linux. Recomenda-se um unico roteiro operacional, preservando as skills como entradas tematicas.

## Modelo de cinco projetos
| Projeto | Repositorio | Pasta VPS sugerida | Dados |
|---|---|---|---|
| Atlas (piloto) | repositorio Atlas existente | /srv/projetos/atlas | Supabase Cloud, schema atlas; validar projeto e RLS |
| PortalGov | confirmar repositorio | /srv/projetos/portalgov | banco existente separado; nao migrar sem decisao |
| TCE360 | confirmar repositorio | /srv/projetos/tce360 | banco/schema proprios a confirmar |
| Controle UPC/PCS | confirmar repositorio | /srv/projetos/controle-upc | banco/schema proprios a confirmar |
| PlanejaGov | confirmar repositorio | /srv/projetos/planejagov | banco/schema proprios a confirmar |

## Compartilhado versus isolado
Compartilhado: instalacoes Claude Code e Codex por usuario Linux, biblioteca de skills curada, regras globais, Git e acesso remoto, politica de seguranca, auditoria de VPS.
Isolado: repositorio Git, worktrees, .env e secrets, servicos Coolify, dominios, pipelines, Storage, permissao de banco, backups por sistema e handoff de projeto.

## Fluxo padrao
1. Auditar VPS e repositorios sem alterar nada.
2. Preparar estrutura de diretorios e configuracoes em ambiente de teste.
3. Criar AGENTS.md e handoff curto por projeto, preservando regras particulares.
4. Testar instalador Linux em dry-run e depois em ambiente piloto com aprovacao.
5. Validar Atlas; replicar template aos demais projetos um por vez.
6. Configurar deploy independente com dados ficticios em previas; producao somente apos testes e aprovacao.

## Riscos e ressalvas
- Pastas sao propostas, nao estado atual da VPS.
- Nao presumir que todos os projetos usem o mesmo Supabase ou stack.
- VPS informada com Coolify; recursos, seguranca e backups nao auditados.
- Nao publicar todos os cinco sistemas simultaneamente por padrao.
- Nao executar instalacoes, deploy ou migracoes sem revisao e aprovacao.

## Resumo economico para agentes
`Projeto | Branch | Feito | Testes | Risco | Proximo` (ate 6 linhas, sem logs extensos).
