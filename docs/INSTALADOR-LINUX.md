# Instalador Linux — proposta segura

Script: `scripts/install-skills-linux.sh`. **Nao foi executado na VPS.**

## Teste sem instalar
```bash
bash scripts/install-skills-linux.sh --dry-run
```

## Aplicacao futura (somente apos auditoria da VPS e aprovacao)
```bash
SKILLS_INSTALL_APPROVED=YES bash scripts/install-skills-linux.sh --apply
```

Por padrao, copia uma lista curta para `~/.agents/skills` (Claude) e `~/.codex/skills` (Codex), conforme README atual. Caminhos podem ser ajustados por `CLAUDE_SKILLS_DIR` e `CODEX_SKILLS_DIR`; confirmar compatibilidade com versoes instaladas antes de aplicar. Nao executa plugins externos, nao sobrescreve skills existentes, nao altera bancos, Cloudflare ou Coolify. Simulacao nao valida compatibilidade das skills com agentes; essa validacao sera posterior.

**Atencao:** `--apply` copia arquivos no computador em que for executado. Nao executar na VPS sem auditoria, backup e aprovacao.
