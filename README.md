# Skills PT-BR for Claude Code and Codex

Repositorio para sincronizar skills entre computadores.

## O que este repositorio instala

- Plugins do Claude Code via `setup.ps1`
- Skills do Claude Code em `~/.agents/skills`
- Skills do Codex em `~/.codex/skills`

## Instalar em um computador novo

```powershell
git clone https://github.com/DelanoBarreto/Skills.git
cd Skills
.\setup.ps1
```

## Fonte de verdade

O script `setup.ps1` copia estas pastas:

- `claude/` -> `~/.agents/skills`
- `codex/` -> `~/.codex/skills`

Se uma skill precisa existir no outro computador, ela deve estar em uma dessas duas pastas.

## Estado atual

- `claude/`: 37 skills
- `codex/`: 35 skills

### Skills em `claude/`

```text
ajuda
arquitetura
backend
banco-de-dados
caveman
caveman-compress
curto
debug
design
documentacao
economia-tokens
executing-plans
find-skills
finishing-a-development-branch
frontend
github-ci
guia
juridico
mcp
ocr
performance
planejamento
playwright-interactive
qa-automacao
receiving-code-review
requesting-code-review
revisao
roteador
seguranca
subagent-driven-development
supabase
systematic-debugging
teste-exemplo
testes
verification-before-completion
writing-plans
writing-skills
```

### Skills em `codex/`

```text
apple-hig
backend-api
banco-de-dados
brand-guidelines
caveman
caveman-compress
color-expert
criador-de-skills
curto
deploy
depuracao
design-consultation
design-review
design-sistema
documentacao
economia-tokens
frontend
frontend-design
hig
hosting
impeccable-design-polish
infra
juridico
ocr
planejamento
playwright
playwright-interactive
publicar-vps
python-dados
shadcn-ui
skills
skills-router
supabase
testes
web-design-guidelines
```

## Estrutura

```text
Skills/
|-- claude/
|-- codex/
|-- docs/
|-- setup.ps1
|-- setup-skills.ps1
|-- GUIA-RAPIDO.md
|-- GUIA-SKILLS.md
`-- README.md
```

## Atualizar no segundo computador

```powershell
git pull
.\setup.ps1
```

## Fluxo de manutencao

1. Atualize as skills em `claude/` e `codex/`
2. Rode `.\setup.ps1` localmente se quiser validar
3. Faça `git add`, `git commit` e `git push`
4. No outro computador, rode `git pull` e `.\setup.ps1`
