# Padrao multiprojetos — instrucoes curtas para agentes

Status: proposta; nao instalado nos projetos. 2026-10-25.

## Compartilhado (Claude Code e Codex)
- Trabalhar na branch/worktree da tarefa; conferir estado do Git antes de editar.
- Ler somente arquivos relevantes; evitar repetir historico e logs.
- Nunca expor credenciais; exigir revisao para deploy, migracao, RLS e operacoes destrutivas.
- Registrar handoff em ate 6 linhas: Projeto/branch | Tarefa | Feito | Arquivos/commit | Testes | Proximo.
- Responder em ate 4 frases curtas, exceto quando detalhes forem indispensaveis.

## Regras adicionais por projeto
- **Atlas:** preservar schemas de outros sistemas; validar Supabase Auth/RLS com duas organizacoes; retirar instrucoes antigas de Windows/GDIP apenas apos revisao.
- **PortalGov:** confirmar repositorio e stack; preservar banco separado e regras de publicacao/transparencia.
- **TCE360:** manter isolamento de processos, movimentos, anexos e automacoes; validar limites e fontes das APIs.
- **Controle UPC/PCS:** proteger documentos e dados de prestacao de contas; controlar acesso por municipio/UG e exercicio.
- **PlanejaGov:** separar exercicios, unidades, versoes de PPA/LOA e trilhas de alteracao.

## Implantacao sem VPS
1. Revisar AGENTS.md/CLAUDE.md existentes em cada repositorio antes de criar arquivos.
2. Criar proposta por repositorio em branch separada, nunca sobrescrever instrucoes automaticamente.
3. Validar com o responsavel antes de merge.
4. So apos auditoria da VPS configurar ambientes e instalacoes.

Observacao: itens especificos dos quatro projetos nao sao inventario confirmado de codigo ou banco; exigem verificacao em cada repositorio.
