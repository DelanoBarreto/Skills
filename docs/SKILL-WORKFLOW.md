# 🎯 Workflow: Como Adicionar Novas Skills

Você encontrou uma skill nova que quer adicionar? Ou quer criar sua própria skill? Este guia mostra como fazer funcionar nos **DOIS ambientes: Claude Code + Codex**.

---

## 🗺️ Arquitetura Rápida

```
ClaudeSkills/skills-pt/         ← FONTE ÚNICA (Git)
    minha-skill/SKILL.md        ← editar aqui

~/.codex/skills/
    minha-skill/  → Junction →  ClaudeSkills/skills-pt/minha-skill/
    (Codex lê daqui, mas aponta para ClaudeSkills)

Claude Code:
    ~/.claude/plugins/cache/claude-skills-pt/
    (Instalado via GitHub, cópia do ClaudeSkills)
```

**Resultado:** Editar em UM lugar = ambas ferramentas veem a mudança (Codex imediatamente, Claude Code após push).

---

## 📋 Opção A: Adicionar uma Skill Nova Sua

**Quando:** Quer criar uma skill customizada.

```bash
# 1. Usar o script PowerShell (cria estrutura + junction automaticamente)
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 minha-skill-nova

# 2. Editar o SKILL.md gerado
notepad C:\Antigravity\Projetos\ClaudeSkills\skills-pt\minha-skill-nova\SKILL.md

# 3. Adicionar ao plugin.json (para Claude Code)
# Editar: C:\Antigravity\Projetos\ClaudeSkills\.claude-plugin\plugin.json
# Adicionar: "./skills-pt/minha-skill-nova" na lista de skills

# 4. Fazer commit e push (para Claude Code sincronizar)
git add .
git commit -m "feat: nova skill minha-skill-nova"
git push origin main

# 5. Usar a skill
# Codex:       /minha-skill-nova descreva a tarefa
# Claude Code: /minha-skill-nova descreva a tarefa (após /install)
```

**Tempo:** ~5 minutos  
**Disponibilidade:**
- Codex: Imediatamente após passo 1
- Claude Code: Após push + `/install`

---

## 📋 Opção B: Adicionar uma Skill de um GitHub

**Quando:** Encontrou uma skill pronta num repositório GitHub que quer usar.

### Caso B1 — Skill em Formato SKILL.md (arquivos)

Exemplo: Alguém compartilhou em `github.com/fulano/uma-skill.git`

```bash
# 1. Clonar o repositório temporariamente
git clone https://github.com/fulano/uma-skill.git ~/temp-skill

# 2. Copiar a pasta de skill para ClaudeSkills
cp -r ~/temp-skill/skills/uma-skill C:\Antigravity\Projetos\ClaudeSkills\skills-pt\

# 3. Criar junction no Codex (pode rodar o script)
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 uma-skill
# Ou manualmente:
# Remove-Item "$env:USERPROFILE\.codex\skills\uma-skill" -Recurse -Force
# New-Item -ItemType Junction -Path "$env:USERPROFILE\.codex\skills\uma-skill" -Target "C:\Antigravity\Projetos\ClaudeSkills\skills-pt\uma-skill"

# 4. Adicionar ao plugin.json
# Editar: C:\Antigravity\Projetos\ClaudeSkills\.claude-plugin\plugin.json
# Adicionar: "./skills-pt/uma-skill"

# 5. Commit e push
git add .
git commit -m "feat: adicionar skill uma-skill"
git push origin main

# 6. Usar
# /uma-skill descreva a tarefa
```

### Caso B2 — Plugin Claude Code (do Marketplace)

Exemplo: `/install uma-skill-plugin` instala automaticamente do GitHub

```bash
# 1. No Claude Code, instalar normalmente
/install uma-skill-plugin

# 2. Após instalar, copiar os SKILL.md para ClaudeSkills
# Geralmente fica em: ~/.claude/plugins/cache/uma-skill-plugin/uma-skill-plugin/
# Copiar para: C:\Antigravity\Projetos\ClaudeSkills\skills-pt\uma-skill

# 3. Criar junction no Codex
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 uma-skill

# 4. Adicionar ao plugin.json do ClaudeSkills
# Editar: .claude-plugin\plugin.json
# Adicionar: "./skills-pt/uma-skill"

# 5. Commit e push
git add .
git commit -m "feat: adicionar skill uma-skill do marketplace"
git push origin main

# 6. Usar
# Claude Code:  /uma-skill (já funciona, foi instalada)
# Codex:        /uma-skill (funciona via junction)
```

---

## 🧪 Testar a Nova Skill

### Testar no Codex

```bash
# Abra o Codex e digite:
/minha-skill-nova descreva a tarefa

# Deve aparecer e funcionar imediatamente
```

### Testar no Claude Code

```bash
# 1. Se criou uma skill nova (Opção A):
# Fazer push (já feito no passo 4)
# Depois: /install (ou reiniciar Claude Code)

# 2. Se adicionou uma skill de fora (Opção B):
# Fazer push (já feito no passo 5)
# Depois: /install (ou reiniciar Claude Code)

# 3. No Claude Code, digite:
/minha-skill descreva a tarefa

# Deve aparecer e funcionar
```

---

## 📝 Exemplo Prático: Adicionar "testes-avancados"

```bash
# Passo 1: Criar skill
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 testes-avancados

# Passo 2: Editar SKILL.md
# (seu editor abre a pasta)
# Edita o conteúdo com dicas de TDD avançado, etc.

# Passo 3: Adicionar ao plugin.json
# Abre: .claude-plugin\plugin.json
# Adiciona: "./skills-pt/testes-avancados" na lista

# Passo 4: Testar no Codex IMEDIATAMENTE
# Abre Codex, digita: /testes-avancados escreva testes para validação
# Funciona! ✅

# Passo 5: Fazer push
git add .
git commit -m "feat: nova skill testes-avancados"
git push origin main

# Passo 6: Testar no Claude Code (após push + install)
# /install
# /testes-avancados escreva testes para validação
# Funciona! ✅

# Passo 7: Usar em ambos daqui em diante
/testes-avancados [qualquer coisa]  # Funciona em Codex + Claude Code
```

---

## ⚡ Atalhos Rápidos

### Adicionar skill e testar em Codex (3 minutos)

```bash
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 rapida
# Editar SKILL.md
# Abrir Codex
# /rapida teste
# Pronto!
```

### Adicionar skill e publicar para Claude Code (5 minutos)

```bash
cd C:\Antigravity\Projetos\ClaudeSkills
.\scripts\add-skill.ps1 nova-skill
# Editar SKILL.md
# Editar plugin.json (adicionar path)
git add .
git commit -m "feat: nova skill"
git push
# No Claude Code: /install
# /nova-skill funciona!
```

---

## 🎯 Checklist para Nova Skill

- [ ] Pasta criada em `ClaudeSkills/skills-pt/nome/`
- [ ] `SKILL.md` existe e tem conteúdo
- [ ] `SKILL.md` tem frontmatter YAML (`---name: ..., description: ...---`)
- [ ] Junction criado em `~/.codex/skills/nome/` (aponta para ClaudeSkills)
- [ ] Path adicionado em `plugin.json` (para Claude Code)
- [ ] Testado no Codex: `/nome` aparece e funciona
- [ ] Commit feito: `git add . && git commit -m "feat: nova skill"`
- [ ] Push feito: `git push origin main`
- [ ] Instalado em Claude Code: `/install` (ou reiniciado)
- [ ] Testado no Claude Code: `/nome` aparece e funciona

---

## 🚨 Troubleshooting

### "A skill não aparece no Codex"

```bash
# Verificar se junction foi criado
ls "$env:USERPROFILE\.codex\skills\" | grep nome-skill

# Se não existir, criar manualmente:
New-Item -ItemType Junction `
  -Path "$env:USERPROFILE\.codex\skills\nome-skill" `
  -Target "C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome-skill"
```

### "A skill não aparece no Claude Code"

```bash
# 1. Confirmar que está no plugin.json
# 2. Confirmar que foi feito git push
# 3. No Claude Code, rodar: /install
# 4. Se não aparecer, reiniciar Claude Code
```

### "Erros ao criar junction (Permission Denied)"

```bash
# Rodou como Admin? Tente:
Start-Process pwsh -Verb RunAs -ArgumentList "-Command `"cd 'C:\Antigravity\Projetos\ClaudeSkills'; .\scripts\add-skill.ps1 nome-skill`""
```

### "Quero remover uma skill"

```bash
# 1. Deletar: C:\Antigravity\Projetos\ClaudeSkills\skills-pt\nome-skill
# 2. Remover o path do plugin.json
# 3. Remover junction: Remove-Item "$env:USERPROFILE\.codex\skills\nome-skill" -Recurse
# 4. Git commit + push
```

---

## 📚 Exemplo de SKILL.md Bem Feito

```markdown
---
name: testes-avancados
description: Estratégias avançadas de testes, TDD, E2E em Playwright
license: MIT
---

## Quando usar

Quando precisa de testes avançados, estratégia TDD, ou validação E2E.

## Princípios

1. **Test-Driven Development** — escreva o teste primeiro
2. **Isolamento** — mocks, stubs, factories
3. **Coverage** — > 80% de cobertura de código

## Como fazer

1. Escrever teste que falha
2. Escrever código que passa
3. Refatorar mantendo verde

## Exemplos

### Teste unitário com mocks

\`\`\`typescript
describe('UserService', () => {
  it('deve salvar usuário validado', () => {
    // arrange
    // act
    // assert
  })
})
\`\`\`

## Referências

- TDD: https://en.wikipedia.org/wiki/Test-driven_development
- Playwright: https://playwright.dev
```

---

## 🎓 Resumo

| Tarefa | Comando | Tempo | Resultado |
|---|---|---|---|
| Criar nova skill | `.\add-skill.ps1 nome` | 1 min | Pronta em Codex |
| Adicionar ao Claude Code | Editar plugin.json + git push | 2 min | Após `/install` |
| Testar em Codex | `/nome tarefa` | 10 seg | Funciona imediatamente |
| Testar em Claude Code | `/install` + `/nome tarefa` | 30 seg | Funciona após install |

---

**Bora adicionar skills! 🚀**
