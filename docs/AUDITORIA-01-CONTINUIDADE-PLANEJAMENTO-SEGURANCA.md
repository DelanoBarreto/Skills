# Auditoria 01 — Continuidade, planejamento e seguranca

Data: 2026-10-25. Analise estatica de arquivos no GitHub, sem executar skills.

## Arquivos inspecionados
- claude/planejamento/SKILL.md
- claude/documentacao/SKILL.md
- claude/seguranca/SKILL.md
- codex/planejamento/SKILL.md
- codex/documentacao/SKILL.md
- codex/compliance/SKILL.md
- Atlas/AGENTS.md e docs/39-ONDE-PAREI.md (outro repositorio)

## Achados e acoes propostas
1. Planejamento Claude e Codex: sobreposicao funcional aceitavel, mas Codex cita skills de apoio plan-writing, architecture e app-builder nao confirmadas no inventario do README. Evitar dependencias implicitas; documentar equivalentes existentes.
2. Documentacao Claude e Codex: funcoes equivalentes. Padronizar formato de handoff, evitando copiar longos logs ou segredos.
3. Seguranca Claude: orientacao geral muito curta; adicionar checklist especifico para Supabase Auth/RLS, isolamento entre organizacoes, segredos, revisao de permissoes e operacoes destrutivas.
4. Compliance Codex nao substitui seguranca tecnica; manter como skill separada para LGPD e governanca. Skills relacionadas sao referencias, nao dependencias verificadas.
5. Atlas/AGENTS.md chama o projeto de GDIP e inclui comandos PowerShell e push para main. Ajustar identidade para Atlas e fluxo via branch/PR, preservando historico de GDIP e as regras de banco existentes.
6. Atlas/docs/39-ONDE-PAREI.md ja fornece status tecnico, mas contem secoes historicas; criar resumo vigente pequeno, com data e links, sem duplicar documento inteiro.

## Contrato minimo de continuidade (proposta)
- Projeto e repositorio; data; branch/worktree; objetivo da tarefa.
- O que foi alterado (arquivos e commit/PR); o que nao foi alterado.
- Testes realizados com resultado e testes pendentes.
- Riscos, bloqueios e proxima acao concreta.
- Nenhuma credencial, dado pessoal ou copia de logs sensiveis.

## Politica de seguranca para Atlas (proposta)
- Organizacao sempre derivada do usuario autenticado; nunca confiar em organizacao informada em request.
- RLS e permissoes devem ser validadas com usuarios de pelo menos duas organizacoes antes de liberar acesso real.
- Nunca alterar schemas plataforma, tce ou tce_prod sem autorizacao explicita.
- Nao colocar secrets, .env, service_role ou credenciais no Git.
- Dados ficticios em demos e previas; aprovar qualquer publicacao, alteracao de banco ou producao.
- Revisar dependencias, comandos e scripts de terceiros antes de executar.

## Proximos passos
1. Revisar e propor ajustes em arquivos novos, preservando originais.
2. Conferir skills de testes, Supabase e deploy e compatibilidade com Linux.
3. Preparar alteracoes em branch separada e revisar antes de merge.
