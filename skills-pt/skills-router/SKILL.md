---
name: skills-router
description: Use when the user types /skills, \skills, asks to list available skills, install/adapt skills for Codex, compare Claude/Gemini/Antigravity skills, or build a reusable Codex skill library.
metadata:
  short-description: Route, inspect, install, and adapt skills for Codex
---

# Skills Router

This skill helps manage a local skill library for Codex without modifying original Claude, Gemini, or Antigravity skill sources.

## Trigger Phrases

Use this skill when the user says any of:
- `/skills`
- `\skills`
- `listar skills`
- `instalar skill`
- `adaptar skill para Codex`
- `skills do Codex`
- `skills do Gemini/Claude/Antigravity`

## Operating Rules

1. Treat original source folders as read-only unless the user explicitly asks to edit them.
2. Prefer installing curated copies into `~/.codex/skills/<skill-name>/`.
3. Before installing third-party skills, inspect `SKILL.md` frontmatter and first workflow section.
4. Mark skills with package installs, network calls, credentials, destructive commands, or platform-specific automation as `review-first`.
5. Avoid bulk-installing hundreds of skills into Codex. Large skill libraries cause trigger overlap and noisy skill selection.
6. When a skill is Claude/Gemini-specific, adapt by:
   - keeping `name` and `description`;
   - removing or rewriting agent-specific assumptions;
   - replacing subagent routing with Codex tool/workflow instructions;
   - moving large reference material into separate files.

## Local Sources

Primary local sources inspected in this workspace:
- `work/skill-sources/openai-skills`
- `work/skill-sources/proflead-codex-skills-library`
- `work/skill-sources/composio-awesome-codex-skills`
- `work/skill-sources/skillcreator-ai-agent-skills`
- `work/skill-sources/seb1n-awesome-ai-agent-skills`
- `work/skill-sources/claude-office-skills`
- `work/skill-sources/onewave-claude-skills`
- `work/skill-sources/jmerta-codex-skills`
- `work/skill-sources/simota-agent-skills`
- `work/kursku-skills`

Original Antigravity sources must remain read-only:
- `C:\Antigravity\ControleProcessoTCE\.agent\skills`
- `C:\Antigravity\DirfReceita\.agent\skills`
- `C:\Antigravity\ModelodeProjeto\.agent\skills`
- `C:\Antigravity\PortalGovMunicipal\.agent\skills`

## Recommended Workflow

When the user asks `/skills` or `\skills`:
1. Summarize installed Codex skills from `~/.codex/skills`.
2. Summarize candidate skills from the inventory if available.
3. Recommend a small set by domain: development, design/frontend, testing, security, documents, legal/compliance.
4. Ask for confirmation before installing many skills.

When installing:
1. Copy the selected skill folder into `~/.codex/skills/<skill-name>`.
2. Do not overwrite an existing skill unless the user explicitly asks.
3. If adapting, create a new name such as `<name>-codex` or place the adapted version in a staging folder first.
4. Tell the user to restart Codex after installation.

## Practical Defaults

Recommended first wave for this user's work:
- `app-builder`, `architecture`, `nextjs-react-expert`, `tailwind-patterns`, `frontend-design`
- `testing-patterns`, `webapp-testing`, `playwright` if available
- `database-design`, `api-patterns`, `nodejs-best-practices`, `python-patterns`
- `contract-review`, `privacy-policy`, `terms-of-service`, `compliance-review` where available
- `pdf`, `docx`, `xlsx`, `report-generator`, `proposal-writer`

Keep specialized red-team/security skills opt-in and review-first.
