# ⚡ Quick Reference: Skills em Claude Code + Codex

## TL;DR (Tl;Dr)

**Encontrou uma skill nova?**

```bash
# 1. Copiar para ClaudeSkills
cp -r /path/to/skill C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome-skill

# 2. Criar junction no Codex
ln -s C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome-skill ~/.codex/skills/nome-skill

# 3. Usar no Codex agora
/nome-skill descreva a tarefa

# 4. Atualizar Claude Code
# Editar: C:\Antigravity\Projetos\ClaudeSkills\.claude-plugin\plugin.json
# Adicionar: "./skills-pt/nome-skill"
git add . && git commit -m "feat: nova skill" && git push
```

---

## 🎯 Quer Fazer O Quê?

### "Quero adicionar uma skill nova"

**OPÇÃO 1 - Criar sua própria (3 min)**
```bash
# Criar estrutura + template automaticamente
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 minha-skill

# Editar o SKILL.md
# Está pronta no Codex agora!
/minha-skill descreva a tarefa
```

**OPÇÃO 2 - Copiar de um repositório GitHub (5 min)**
```bash
# Clonar repo temporariamente
git clone https://github.com/fulano/skill.git ~/temp

# Copiar para ClaudeSkills
cp -r ~/temp/skill C:\Antigravity\Projetos\ClaudeSkills\skills-pt\

# Criar junction no Codex
ln -s C:\Antigravity\Projetos\ClaudeSkills\skills-pt\skill ~/.codex/skills\skill

# Adicionar ao plugin.json
# (editar manualmente)

# Publicar para Claude Code
git add . && git commit -m "feat: skill" && git push
```

### "A skill não aparece no Codex"

```bash
# Verificar se o arquivo existe
ls -la C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome\SKILL.md

# Verificar se junction existe
ls -la ~/.codex/skills/nome

# Se não existir, criar:
ln -s C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome ~/.codex/skills\nome
```

### "A skill não aparece no Claude Code"

```bash
# 1. Confirmar que está no plugin.json
# 2. Fazer push: git push
# 3. No Claude Code: /install
# 4. Reiniciar Claude Code se não aparecer
```

### "Quero editar uma skill existente"

```bash
# Editar em um só lugar
nano C:\Antigravity\Projetos\ClaudeSkills\skills-pt\frontend\SKILL.md

# Codex vê a mudança imediatamente (junction)
# Claude Code vê após: git push + /install
```

### "Quero remover uma skill"

```bash
# 1. Deletar a pasta
rm -rf C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome-skill

# 2. Remover do plugin.json
# 3. Remover junction
rm ~/.codex/skills/nome-skill

# 4. Commit + push
git add . && git commit -m "remove: skill" && git push
```

---

## 🗂️ Estrutura (Copiar quando precisar)

```
ClaudeSkills/skills-pt/nome-skill/
├── SKILL.md                 ← Descrição da skill (OBRIGATÓRIO)
└── references/              ← Documentação adicional (opcional)
    └── exemplo.md
```

### Template SKILL.md Mínimo

```markdown
---
name: nome-skill
description: O que esta skill faz
license: MIT
---

## Quando usar

Descreva aqui.

## Instruções

1. Passo 1
2. Passo 2

## Exemplo

```
/nome-skill exemplo aqui
```
```

---

## 📊 Situações Rápidas

| Situação | Comando | Tempo |
|---|---|---|
| Criar skill nova | `.\add-skill.ps1 nome` | 1 min |
| Copiar skill GitHub | `cp -r repo/ ClaudeSkills/...` | 2 min |
| Testar no Codex | `/nome-skill tarefa` | 10 seg |
| Editar skill | Editar `.../skills-pt/nome/SKILL.md` | 5 min |
| Publicar Claude Code | `git push` | 30 seg |

---

## 🔗 Arquivos Importantes

| Arquivo | Propósito |
|---|---|
| `C:\Antigravity\Projetos\ClaudeSkills\skills-pt\` | Pasta com todas as skills (FONTE) |
| `~/.codex/skills/` | Junctions que apontam para ClaudeSkills |
| `C:\Antigravity\Projetos\ClaudeSkills\.claude-plugin\plugin.json` | Lista de skills para Claude Code |
| `C:\Antigravity\Projetos\SKILL-WORKFLOW.md` | Documentação completa |

---

## ✨ Cheat Sheet

```bash
# Criar skill nova
.\scripts\add-skill.ps1 nome

# Editar skill
nano C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome\SKILL.md

# Testar no Codex
/nome descrever tarefa

# Publicar para Claude Code
cd C:\Antigravity\Projetos\ClaudeSkills
git add .
git commit -m "feat: skill"
git push

# Listar todas as skills
ls C:\Antigravity\Projetos\ClaudeSkills\skills-pt\
```

---

## 🚀 Fluxo Típico

```
Encontrou uma skill → Copiar para ClaudeSkills
                  → Criar junction no Codex
                  → Testar: /skill
                  → Adicionar ao plugin.json
                  → git push
                  → /install no Claude Code
                  → Usar em ambos!
```

---

## 📌 Lembretes

- ✅ Editar SEMPRE em `ClaudeSkills/skills-pt/`
- ✅ Codex sincroniza automaticamente (junction)
- ✅ Claude Code sincroniza via Git + plugin
- ⚠️ Não edite em `~/.codex/skills/` diretamente
- ⚠️ Mantenha `plugin.json` atualizado

---

**Mais dúvidas?** Leia `SKILL-WORKFLOW.md` para documentação completa.

Bora adicionar skills! 🎯
