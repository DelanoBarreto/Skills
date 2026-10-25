# AGENTS.md — proposta Atlas (NAO substituir sem revisao)

Projeto: **iFlexus Atlas**. GDIP e SGIM sao nomes historicos, nao a identidade atual.

## Antes de trabalhar
1. Ler `docs/39-ONDE-PAREI.md` (somente a atualizacao vigente) e `docs/40-autenticacao-rls-supabase-atlas.md` se tocar em autenticacao, organizacoes ou banco.
2. Conferir `git status`, branch e alteracoes existentes. Trabalhar em branch/worktree isolada.
3. Definir escopo e testes; ler apenas arquivos necessarios.

## Regras inegociaveis
- Organizacao vem da identidade autenticada, nunca de body/query.
- Nao alterar `plataforma`, `tce` ou `tce_prod` sem autorizacao explicita.
- Nao publicar segredos, `.env`, chaves de servico ou dados reais em demos.
- Migracoes, RLS, deploy, operacoes destrutivas e merge na main exigem revisao e aprovacao.
- Preservar mudancas de outros agentes; nao executar instaladores de terceiros sem auditoria.

## Ao concluir
- Executar testes pertinentes; informar os nao executados.
- Registrar handoff em **ate 6 linhas**, sem logs extensos:
  `Tarefa | Feito | Arquivos/commit | Testes | Pendente | Proximo`.
- Fazer commit pequeno na branch de tarefa; propor PR. Nao enviar direto para main.
- Responder ao usuario com **ate 4 frases curtas**, salvo pedido de detalhes ou alerta relevante.

## Ambiente
- Ambiente alvo: VPS Linux, com acesso VS Code Remote-SSH apos auditoria.
- GitHub: codigo versionado; Supabase Cloud: dados/Auth; Cloudflare: arquivos/previas quando autorizados.
- Comandos e caminhos devem ser validados no sistema operacional real; nao presumir Windows.
