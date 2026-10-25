#!/usr/bin/env bash
# Auditoria somente leitura para VPS Linux. Nao instalar nem modificar servicos.
set -u
section(){ printf '\n## %s\n' "$1"; }
safe(){ printf '$ %s\n' "$*"; "$@" 2>&1 || true; }
section "Sistema"
safe uname -a
if command -v hostnamectl >/dev/null 2>&1; then safe hostnamectl; fi
if command -v uptime >/dev/null 2>&1; then safe uptime; fi
section "Recursos"
safe free -h
safe df -hT
section "Ferramentas"
for cmd in git docker node npm claude codex coolify; do
  if command -v "$cmd" >/dev/null 2>&1; then printf '%s: %s\n' "$cmd" "$(command -v "$cmd")"; else printf '%s: nao encontrado no PATH\n' "$cmd"; fi
done
section "Docker (metadados)"
if command -v docker >/dev/null 2>&1; then
  safe docker version --format '{{.Server.Version}}'
  safe docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'
fi
section "Servicos e portas (somente escuta)"
if command -v ss >/dev/null 2>&1; then safe ss -lnt; fi
section "Diretorios de skills (nomes somente)"
for dir in "$HOME/.agents/skills" "$HOME/.codex/skills"; do
  if [[ -d "$dir" ]]; then printf '%s: presente\n' "$dir"; find "$dir" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null | sort; else printf '%s: ausente\n' "$dir"; fi
done
section "Observacoes"
printf '%s\n' "Nao verifica segredos, .env, credenciais, conteudo de volumes ou dados de usuarios."
printf '%s\n' "Saida pode conter nomes de containers, caminhos e nomes internos: revisar antes de compartilhar."
