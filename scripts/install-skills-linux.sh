#!/usr/bin/env bash
# Instalador Linux de skills — somente simulacao por padrao.
set -euo pipefail
usage() { echo "Uso: bash scripts/install-skills-linux.sh [--dry-run] [--apply]"; }
mode="dry-run"
for arg in "$@"; do case "$arg" in --dry-run) mode="dry-run";; --apply) mode="apply";; -h|--help) usage; exit 0;; *) usage >&2; exit 2;; esac; done
if [[ "$mode" == "apply" && "${SKILLS_INSTALL_APPROVED:-}" != "YES" ]]; then
  echo "BLOQUEADO: para aplicar, defina SKILLS_INSTALL_APPROVED=YES apos revisar o plano." >&2; exit 3
fi
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
claude_dest="${CLAUDE_SKILLS_DIR:-$HOME/.agents/skills}"
codex_dest="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
# Lista fechada e intencional. Nao instala plugins nem executa codigo de skills.
claude=(planejamento documentacao seguranca supabase testes economia-tokens)
codex=(planejamento documentacao compliance supabase testes migracoes infra deploy hosting publicar-vps economia-tokens)
count=0; missing=0; skipped=0
for agent in claude codex; do
  if [[ "$agent" == "claude" ]]; then dest="$claude_dest"; names=("${claude[@]}"); else dest="$codex_dest"; names=("${codex[@]}"); fi
  for name in "${names[@]}"; do
    src="$root/$agent/$name"
    if [[ ! -f "$src/SKILL.md" || -L "$src" ]]; then echo "FALTA/INVALIDO: $src/SKILL.md"; ((missing+=1)); continue; fi
    if [[ -e "$dest/$name" || -L "$dest/$name" ]]; then echo "PULAR (ja existe): $dest/$name"; ((skipped+=1)); continue; fi
    if [[ "$mode" == "dry-run" ]]; then echo "SIMULAR: $src -> $dest/$name"; else
      mkdir -p -- "$dest"
      cp -R -- "$src" "$dest/$name"
      echo "COPIADO: $dest/$name"
    fi
    ((count+=1))
  done
done
echo "Modo=$mode | selecionadas=$count | existentes=$skipped | ausentes=$missing"
if (( missing > 0 )); then exit 4; fi
