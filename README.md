# Skills PT-BR — Claude Code + Codex

Skills em português para usar no **Claude Code** e no **Codex**, sincronizadas entre múltiplos computadores.

Criado por Delano Barreto | Licença MIT

---

## Instalação em um Novo Computador

```powershell
# 1. Clone o repositório
git clone https://github.com/DelanoBarreto/Skills.git

# 2. Rode o script de instalação (instala tudo de uma vez)
cd Skills
.\setup.ps1
```

O script instala:

- Plugins do Claude Code (superpowers, karpathy, supabase, etc.)
- Skills PT-BR no Claude Code (`~\.agents\skills\`)
- Skills PT-BR no Codex (`~\.codex\skills\`)

---

## Plugins do Claude Code

Instalados automaticamente pelo `setup.ps1`. Para instalar manualmente:

```powershell
npx skills add superpowers@claude-plugins-official -g -y
npx skills add github@claude-plugins-official -g -y
npx skills add supabase@claude-plugins-official -g -y
npx skills add claude-md-management@claude-plugins-official -g -y
npx skills add frontend-design@claude-plugins-official -g -y
npx skills add skill-creator@claude-plugins-official -g -y
npx skills add andrej-karpathy-skills@karpathy-skills --marketplace https://github.com/multica-ai/andrej-karpathy-skills.git -g -y
```

> Plugins ficam em `~\.claude\plugins\` e são gerenciados automaticamente. Não edite manualmente.

---

## Skills PT-BR — Claude Code

Disponíveis em qualquer projeto via `/nome-da-skill`.

| Skill | Comando | O que faz |
| -- | -- | -- |
| Ajuda | `/ajuda` | Menu principal — não sabe qual skill usar? Comece aqui |
| Arquitetura | `/arquitetura` | Estrutura, módulos e design do sistema |
| Backend | `/backend` | APIs, serviços e regras de negócio |
| Banco de Dados | `/banco-de-dados` | Schema, SQL, migrations, modelagem |
| Debug | `/debug` | Investigar bugs e erros |
| Design | `/design` | Layout, visual e UX |
| Documentação | `/documentacao` | README, guias, specs técnicas |
| Frontend | `/frontend` | React, Next.js, componentes |
| GitHub CI | `/github-ci` | PRs, Actions, CI/CD |
| Guia | `/guia` | Guia interativo de uso das skills |
| MCP | `/mcp` | Integrações Model Context Protocol |
| Performance | `/performance` | Otimização e velocidade |
| Planejamento | `/planejamento` | Organizar tarefas em fases |
| QA Automação | `/qa-automacao` | Playwright, Cypress, testes E2E |
| Revisão | `/revisao` | Revisar código antes de commitar |
| Roteador | `/roteador` | Roteamento inteligente de skills |
| Segurança | `/seguranca` | Vulnerabilidades e OWASP |
| Supabase | `/supabase` | Auth, RLS, policies, storage |
| Testes | `/testes` | Testes unitários e integração |
| Teste Exemplo | `/teste-exemplo` | Exemplo de estrutura de skill |

---

## Skills PT-BR — Codex

Disponíveis via `\nome-da-skill` no Codex.

| Skill | Comando | O que faz |
|-------|---------|-----------|
| Ajuda | `\ajuda` | Menu principal de skills |
| Backend API | `\backend-api` | Endpoints, contratos de API |
| Banco de Dados | `\banco-de-dados` | Modelagem e persistência |
| Criador de Skills | `\criador-de-skills` | Criar e adaptar skills |
| Curto | `\curto` | Respostas curtas e diretas |
| Deploy | `\deploy` | Preparar entrega em produção |
| Depuração | `\depuracao` | Investigar bugs e causa raiz |
| Design Sistema | `\design-sistema` | Guia visual, paleta, tipografia |
| Documentação | `\documentacao` | README e docs técnicos |
| Economia de Tokens | `\economia-tokens` | Reduzir verbosidade |
| Frontend | `\frontend` | Telas, componentes, Next.js |
| HIG | `\hig` | Padrões de interface Apple |
| Hosting | `\hosting` | Hospedagem e domínio |
| Infra | `\infra` | Servidores e operação |
| Planejamento | `\planejamento` | Plano de execução e etapas |
| Publicar VPS | `\publicar-vps` | Deploy em VPS com Nginx |
| Python Dados | `\python-dados` | Automação, CSV, Excel, PDF |
| Skills | `\skills` | Lista de skills instaladas |
| Skills Router | `\skills-router` | Roteamento de skills |
| Supabase | `\supabase` | Banco, auth, policies |
| Testes | `\testes` | Testes unitários e integração |

---

## Estrutura do Repositório

```text
Skills/
├── claude/          ← Skills para Claude Code (~\.agents\skills\)
│   ├── ajuda/
│   ├── backend/
│   └── ... (20 skills)
├── codex/           ← Skills para Codex (~\.codex\skills\)
│   ├── ajuda/
│   ├── backend-api/
│   └── ... (20 skills)
├── docs/            ← Documentação e análises
├── setup.ps1        ← Script de instalação (roda uma vez por computador)
├── GUIA-SKILLS.md   ← Guia detalhado
└── README.md        ← Este arquivo
```

---

## Trabalhando em 2 Computadores

```powershell
# Atualizar skills depois de git pull
git pull
.\setup.ps1
```

Depois de criar ou editar uma skill:

```powershell
git add .
git commit -m "feat: add/update skill-name"
git push
```

No outro computador:

```powershell
git pull
.\setup.ps1
```

---

## Criar uma Nova Skill

**Para Claude** — crie em `claude/minha-skill/SKILL.md`:

```markdown
---
name: minha-skill
description: Use quando o usuário digitar /minha-skill ou pedir [descreva o caso].
---

# Minha Skill

## Quando usar
- Cenário 1
- Cenário 2

## Como funciona
1. Passo 1
2. Passo 2
```

**Para Codex** — mesma estrutura em `codex/minha-skill/SKILL.md`, mas use `\minha-skill` na descrição.

Depois rode `.\setup.ps1` para instalar localmente e faça `git push` para sincronizar.

---

## Não sabe por onde começar?

No Claude Code:

```text
/ajuda
```

No Codex:

```text
\ajuda
```
