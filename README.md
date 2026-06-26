# Skills PT-BR — Claude Code + Codex

**20 skills em português para usar no Claude Code e no Codex.**  
Criado por Delano Lesko | Licença MIT

---

## Instalação Rápida (1 comando)

### Claude Code
```powershell
npx skills add https://github.com/DelanoBarreto/Skills.git
```

### Novo computador — instalar tudo de uma vez
```powershell
powershell -ExecutionPolicy Bypass -File setup-skills.ps1
```

---

## Skills Disponíveis (20 no total)

| Skill | Como chamar | O que faz |
|-------|-------------|-----------|
| Ajuda | `/ajuda` | Catálogo completo — começa aqui! |
| Roteador | `/roteador` | Não sabe qual skill usar? Use esta |
| Planejamento | `/planejamento` | Organizar tarefas em fases |
| Debug | `/debug` | Investigar bugs e erros |
| Design | `/design` | Layout, visual e UX |
| Frontend | `/frontend` | React, Next.js, componentes |
| Backend | `/backend` | APIs, serviços e regra de negócio |
| Banco de Dados | `/banco-de-dados` | Schema, SQL, migrations |
| Supabase | `/supabase` | Auth, RLS, policies, storage |
| Testes | `/testes` | Testes unitários, integração, E2E |
| GitHub CI | `/github-ci` | PRs, Actions, CI/CD |
| Revisão | `/revisao` | Revisar código antes de enviar |
| Segurança | `/seguranca` | Vulnerabilidades e OWASP |
| Performance | `/performance` | Otimização e velocidade |
| Arquitetura | `/arquitetura` | Estrutura e módulos do sistema |
| Documentação | `/documentacao` | README, guias, specs |
| QA Automação | `/qa-automacao` | Playwright, Cypress, E2E |
| MCP | `/mcp` | Integrações Model Context Protocol |
| Guia | `/guia` | Guia interativo de uso |
| Teste Exemplo | `/teste-exemplo` | Exemplo de estrutura de skill |

---

## Dois Computadores? Sem Problema

O repositório é a fonte única da verdade. Em cada máquina:

```powershell
# 1. Clonar (só na primeira vez)
git clone https://github.com/DelanoBarreto/Skills.git

# 2. Instalar skills
npx skills add https://github.com/DelanoBarreto/Skills.git
```

Ao atualizar uma skill, faça `git pull` no repo e reinstale.

---

## Estrutura do Repositório

```
Skills/
├── skills-pt/                   ← 20 skills em português
│   ├── ajuda/SKILL.md
│   ├── planejamento/SKILL.md
│   ├── frontend/SKILL.md
│   └── ... (17 mais)
├── .claude-plugin/
│   └── plugin.json              ← Configuração para npx install
├── docs/
│   ├── CATALOGO-COMPLETO.md     ← Lista detalhada de todas as skills
│   ├── QUICK-REFERENCE.md       ← Referência rápida de comandos
│   ├── SKILL-WORKFLOW.md        ← Fluxo de uso das skills
│   └── CHECKLIST.md             ← Checklist de boas práticas
├── setup-skills.ps1             ← Script de instalação Windows
├── GUIA-SKILLS.md               ← Guia completo para iniciantes
└── README.md                    ← Este arquivo
```

---

## Criar uma Skill Nova

```
skills-pt/
    minha-skill/
        SKILL.md        ← obrigatório
        references/     ← opcional (arquivos de apoio)
```

**Formato do SKILL.md:**
```markdown
---
name: minha-skill
description: O que esta skill faz em uma linha
---

# Minha Skill

## Quando usar
- Cenário 1
- Cenário 2

## Como usar
1. Passo 1
2. Passo 2
```

**Commit e publicar:**
```bash
git add .
git commit -m "feat(skills): add minha-skill"
git push
```

---

## Claude Code vs Codex

| | Claude Code | Codex |
|--|-------------|-------|
| Pasta de skills | `.claude/skills/` | `.agent/skills/` |
| Instalar via npx | ✅ `npx skills add` | via CLI próprio |
| Plugin | `.claude-plugin/` | sistema diferente |

As skills deste repositório foram criadas para **Claude Code**.  
Para usar no Codex, copie a pasta `skills-pt/` para `.agent/skills/` no seu projeto.

---

## Plugins Externos Recomendados

Instale também estes plugins da comunidade:

```powershell
# Design avançado com 50+ estilos
npx skills add https://github.com/FontAI/ui-ux-pro-max-skill --skill ui-ux-pro-max

# Boas práticas de código (Andrej Karpathy)
npx skills add https://github.com/andrejkarpathy/karpathy-skills --skill karpathy-guidelines
```

---

## Não sabe por onde começar?

Abra o Claude Code no VS Code e digite:

```
/ajuda
```

O catálogo vai te guiar para a skill certa.
