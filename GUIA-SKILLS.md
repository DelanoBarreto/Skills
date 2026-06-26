# Guia Completo de Skills — Iniciante
**Autor:** Delano Lesko  
**Atualizado:** 2026-06-26

---

## O QUE VOCE PRECISA SABER PRIMEIRO

### Dois AIs, dois sistemas SEPARADOS

```
CLAUDE CODE  →  usa a pasta  .claude/
CODEX        →  usa a pasta  .agent/
```

**Eles NAO compartilham skills.** Uma skill instalada para o Claude Code
nao funciona no Codex, e vice-versa.

---

## COMO AS SKILLS FUNCIONAM (ONDE FICAM)

Existem 3 lugares onde uma skill pode estar:

```
NIVEL 1 — GLOBAL (funciona em TODOS os projetos desta maquina)
  C:\Users\SeuNome\.claude\plugins\
  Instalado com: npx skills add [url]

NIVEL 2 — USUARIO (funciona em TODOS os projetos desta maquina)  
  C:\Users\SeuNome\.claude\skills\
  Copiado manualmente para la

NIVEL 3 — PROJETO (funciona SO nesta pasta de projeto)
  C:\Antigravity\Projetos\.claude\skills\
  So aparece quando abre o Claude Code desta pasta
```

**Regra simples:** Se quer usar a skill em QUALQUER projeto → NIVEL 1 (npx install).

---

## INSTALACAO RAPIDA (NOVA MAQUINA)

### Passo 1 — Instalar Node.js (se nao tiver)
Acesse: https://nodejs.org/en/download
Baixe a versao LTS e instale.

### Passo 2 — Rodar o script de instalacao
Abra o PowerShell e execute:
```powershell
cd C:\Antigravity\Projetos
powershell -ExecutionPolicy Bypass -File setup-skills.ps1
```

Pronto! Todas as skills sao instaladas automaticamente.

### Passo 3 — Verificar no VS Code
Abra o VS Code com a extensao Claude Code.
Digite `/ajuda` para ver todas as skills disponiveis.

---

## INSTALACAO MANUAL (UMA SKILL SO)

Se encontrou uma nova skill na internet:

```powershell
# Formato do comando:
npx skills add [URL-DO-GITHUB] --skill [nome-da-skill]

# Exemplos reais:
npx skills add https://github.com/DelanoBarreto/Skills.git
npx skills add https://github.com/FontAI/ui-ux-pro-max-skill --skill ui-ux-pro-max
npx skills add https://github.com/andrejkarpathy/karpathy-skills --skill karpathy-guidelines
```

**Onde a skill vai parar:**
`C:\Users\SeuNome\.claude\plugins\cache\[nome-do-plugin]\`

**Ela fica disponivel automaticamente** em todos os projetos. Nao precisa copiar nada.

---

## SKILLS INSTALADAS AGORA

### Via npx (globais, todas as maquinas precisam instalar):

| Skill | Como usar | O que faz |
|-------|-----------|-----------|
| `ui-ux-pro-max` | `/ui-ux-pro-max` | Design com 50+ estilos, paletas, fontes |
| `karpathy-guidelines` | `/karpathy-guidelines` | Boas praticas de codigo (Andrej Karpathy) |
| Suas skills PT-BR | `/ajuda` para ver todas | 18 skills em portugues |

### Via projeto (so no Projetos/):

| Skill | Como usar | O que faz |
|-------|-----------|-----------|
| `ajuda` | `/ajuda` | Catalogo completo de skills |
| `planejamento` | `/planejamento` | Planejar projeto em fases |
| `debug` | `/debug` | Investigar bugs |
| `design` | `/design` | Layout e UX |
| `frontend` | `/frontend` | React, Next.js |
| `backend` | `/backend` | APIs e servicos |
| `banco-de-dados` | `/banco-de-dados` | SQL e schema |
| `supabase` | `/supabase` | Auth e RLS |
| `testes` | `/testes` | Testes automatizados |
| `github-ci` | `/github-ci` | PR e CI/CD |
| `revisao` | `/revisao` | Revisar codigo |
| `seguranca` | `/seguranca` | Vulnerabilidades |
| `performance` | `/performance` | Otimizacao |
| `arquitetura` | `/arquitetura` | Estrutura do sistema |
| `documentacao` | `/documentacao` | README e guias |
| `qa-automacao` | `/qa-automacao` | Testes E2E |
| `mcp` | `/mcp` | Integracoes MCP |
| `roteador` | `/roteador` | Escolher a skill certa |

---

## DOIS COMPUTADORES — COMO SINCRONIZAR

### O problema
- Skills instaladas via `npx skills add` ficam SOMENTE na maquina onde foram instaladas
- Ao usar o segundo computador, precisa instalar de novo

### A solucao

**Computador 1 (ja configurado):**
- Nada a fazer. Ja esta funcionando.

**Computador 2 (novo ou limpo):**
```powershell
# 1. Clonar o repositorio de projetos
git clone https://github.com/DelanoBarreto/Skills.git

# 2. Rodar o script de instalacao
cd C:\Antigravity\Projetos
powershell -ExecutionPolicy Bypass -File setup-skills.ps1
```

**O que o script faz automaticamente:**
- Instala ui-ux-pro-max
- Instala karpathy-guidelines  
- Instala suas 18 skills PT-BR do GitHub

---

## COMO ADICIONAR UMA NOVA SKILL AO SEU REPOSITORIO

Quando criar uma skill nova e quiser que ela apareca no GitHub para todos os computadores:

### Passo 1 — Criar a skill localmente
```
C:\Antigravity\Projetos\.claude\skills\
    minha-skill-nova\
        SKILL.md    ← arquivo da skill
```

### Passo 2 — Copiar para o repositorio de skills
```powershell
# Clone o repo (se ainda nao clonou)
git clone https://github.com/DelanoBarreto/Skills.git C:\Skills

# Copiar skill para o repo
cp -r "C:\Antigravity\Projetos\.claude\skills\minha-skill-nova" "C:\Skills\skills-pt\"

# Fazer commit e push
cd C:\Skills
git add .
git commit -m "feat(skills): add minha-skill-nova"
git push
```

### Passo 3 — Reinstalar no computador atual
```powershell
npx skills add https://github.com/DelanoBarreto/Skills.git
```

---

## DIFERENCA ENTRE CLAUDE CODE E CODEX

### Claude Code (este guia)
- Pasta: `.claude/`
- Skills: `.claude/skills/` ou via `npx skills add`
- Agentes: `.claude/agents/`
- Regras: `.claude/rules/`
- Usado no: VS Code (extensao), terminal, desktop app

### Codex (separado)
- Pasta: `.agent/`
- Skills: `.agent/skills/`
- Agentes: `.agent/agents/`
- Usado no: VS Code (extensao separada), terminal

**Para ter as mesmas skills no Codex:**
Voce precisa copiar as skills para `.agent/skills/` tambem.
Ou criar skills compatíveis com os dois sistemas.

---

## ESTRUTURA DE UMA SKILL (para criar suas proprias)

Cada skill e uma pasta com um arquivo `SKILL.md`:

```
minha-skill/
    SKILL.md
    referencias/     (opcional - arquivos de apoio)
        guia.md
        exemplos.md
```

### Formato do SKILL.md:

```markdown
---
name: minha-skill
description: O que esta skill faz em uma linha
---

# Minha Skill

## Quando usar
- Descreva os cenarios onde essa skill se aplica

## Como usar
1. Passo um
2. Passo dois
3. Passo tres

## Exemplos
/minha-skill fazer algo específico
```

---

## DICAS PARA INICIANTES

### Nao sei qual skill usar
Use `/ajuda` — ela te orienta para a skill certa.

### Skill nao esta aparecendo
1. Verifique se a pasta existe: `.claude\skills\[nome-da-skill]\`
2. Verifique se tem `SKILL.md` dentro
3. Reinicie o VS Code / Claude Code

### Quero ver todas as skills instaladas
```powershell
Get-ChildItem "$env:USERPROFILE\.claude\plugins\installed_plugins.json" | Get-Content
```

### Quero desinstalar uma skill
```powershell
npx skills remove [nome-da-skill]
```

---

## REFERENCIA RAPIDA DE COMANDOS

```powershell
# Instalar skill do GitHub
npx skills add https://github.com/[usuario]/[repo]

# Instalar skill especifica
npx skills add [url] --skill [nome]

# Listar plugins instalados
npx skills list

# Ver versao instalada
npx skills info [nome]

# Atualizar skill
npx skills update [nome]

# Desinstalar skill
npx skills remove [nome]
```

---

## PROXIMOS PASSOS

1. [x] Script de instalacao criado (`setup-skills.ps1`)
2. [ ] Adicionar `guia` e `teste-exemplo` ao GitHub repo
3. [ ] Atualizar `ajuda` no GitHub (versao mais completa)
4. [ ] Criar skills para o Codex (pasta `.agent/`)
5. [ ] Testar instalacao no segundo computador
