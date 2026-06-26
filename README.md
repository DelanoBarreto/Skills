# 🎯 CodexSkills - Skills Unificadas para Claude Code + Codex

**Uma base única de skills agnóstica para ambos Claude Code e Codex.**

---

## 📚 O Que Tem Aqui?

**18 Skills PT-BR** prontas para usar em qualquer plataforma:

| Skill | Descrição |
|---|---|
| `/frontend` | React, Next.js, componentes, UI/UX |
| `/backend` | APIs, servidores, integração |
| `/banco-de-dados` | Schema, SQL, migrations, índices |
| `/supabase` | Auth, RLS, policies, storage |
| `/debug` | Troubleshooting, investigação de erros |
| `/revisao` | Code review crítico |
| `/seguranca` | Auth, autorização, attack surface |
| `/testes` | Unit, integration, E2E, TDD |
| `/performance` | Bottlenecks, otimização |
| `/documentacao` | README, guias, specs |
| `/arquitetura` | Design patterns, estrutura |
| `/design` | UI design, acessibilidade |
| `/github-ci` | Workflows, CI/CD |
| `/mcp` | Model Context Protocol |
| `/qa-automacao` | Testes automatizados |
| `/planejamento` | Roadmaps, sprints |
| `/roteador` | Routing, navigation |
| `/ajuda` | Ajuda geral |

---

## 🚀 Instalação

### Em Claude Code

1. Instale o plugin:
   ```
   /install codex-skills
   ```

2. Use uma skill:
   ```
   /frontend criar um componente de filtro
   ```

### Em Codex CLI

1. Clone este repositório:
   ```bash
   git clone https://github.com/DelanoBarreto/CodexSkills.git ~/.codex/skills-repo
   ```

2. Crie junctions (Windows):
   ```powershell
   $skillsPath = "$env:USERPROFILE\.codex\skills-repo\skills-pt"
   
   # Para cada skill
   foreach ($skill in (ls $skillsPath | % Name)) {
     New-Item -ItemType Junction -Path "$env:USERPROFILE\.codex\skills\$skill" `
       -Target "$skillsPath\$skill" -Force
   }
   ```

3. Ou em Linux/Mac:
   ```bash
   ln -s ~/.codex/skills-repo/skills-pt/* ~/.codex/skills/
   ```

4. Use uma skill:
   ```
   /frontend descreva a tarefa
   ```

---

## 🛠️ Adicionar uma Nova Skill

1. Crie a pasta:
   ```
   skills-pt/nova-skill/
   ```

2. Crie o arquivo `SKILL.md`:
   ```markdown
   ---
   name: nova-skill
   description: O que faz
   license: MIT
   ---

   ## Quando usar
   Descrição aqui.

   ## Instruções
   1. Passo 1
   2. Passo 2
   ```

3. Faça commit e push:
   ```bash
   git add .
   git commit -m "feat: nova skill"
   git push
   ```

---

## 📁 Estrutura

```
CodexSkills/
├── skills-pt/                 ← 18 skills
│   ├── frontend/SKILL.md
│   ├── backend/SKILL.md
│   ├── supabase/SKILL.md
│   └── ... (15 mais)
├── .claude-plugin/plugin.json ← Para Claude Code
├── README.md                  ← Este arquivo
└── .git/
```

---

## 💡 Como Usar

### Tarefa Simples
```
/frontend crie um modal
```

### Tarefa Complexa
Combine com agentes:
```
@backend-specialist /supabase configure autenticação
```

---

## 📤 Sincronizar Entre Máquinas

### Machine 1 → Machine 2

**No Windows:**
```powershell
# Clonar no segundo computador
cd $env:USERPROFILE
git clone https://github.com/DelanoBarreto/CodexSkills.git codex-skills

# Criar junctions em ~/.codex/skills
$skillsPath = "$env:USERPROFILE\codex-skills\skills-pt"
foreach ($skill in (ls $skillsPath | % Name)) {
  New-Item -ItemType Junction -Path "$env:USERPROFILE\.codex\skills\$skill" `
    -Target "$skillsPath\$skill" -Force
}
```

**No Linux/Mac:**
```bash
git clone https://github.com/DelanoBarreto/CodexSkills.git ~/.codex/skills-repo
ln -s ~/.codex/skills-repo/skills-pt/* ~/.codex/skills/
```

---

## 🎓 Boas Práticas

- ✅ Edite **sempre** aqui no repositório
- ✅ Faça commits com mensagens claras
- ✅ Use formato Conventional Commits
- ✅ Teste a skill antes de pushar
- ⚠️ Não edite em `~/.codex/skills/` direto (são junctions/links)

---

## 📞 Dúvidas?

Consulte os SKILL.md de cada skill para instruções específicas.

---

**Agnóstico. Simples. Compartilhado. 🚀**
