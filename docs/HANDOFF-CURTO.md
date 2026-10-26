# Handoff curto — continuidade VPS/Coolify/Claude Code/Codex

Formato: `Projeto/branch | Tarefa | Feito | Arquivos/commit | Testes | Próximo`

## 2026-10-25 — Sessão Claude Code (auditoria + setup SSH local + firewall)

**Administracao-VPS/local | Setup SSH local e Remote-SSH | Feito | `~/.ssh/id_ed25519_vps_hostinger`, `~/.ssh/config` (host `vps-delano`), extensão `ms-vscode-remote.remote-ssh` instalada | Testado: `ssh vps-delano` conecta sem senha, 3x confirmado | Pendente: avaliar usuário não-root (adiado por decisão do responsável — mantido root por ora)**

**VPS srv1111909 | Auditoria de leitura (sistema, Docker, Coolify, Supabase, portas, backups) | Feito, somente leitura | Nenhum arquivo alterado | Testado via SSH manual | Resultado: Ubuntu 24.04.4 LTS, 4 vCPU, 15GiB RAM, 193GB disco (20GB usado), Docker 29.6.1, Coolify 4.1.2 ativo, Supabase self-hosted (11 containers, todos saudáveis), 3 apps implantadas (PortalGov-Municipal, TestePortalGov, WebSite ASPdoc); Atlas/TCE360/Controle UPC/PlanejaGov não encontrados nesta VPS**

**VPS srv1111909 | Ativar firewall UFW + fail2ban (autorizado explicitamente pelo responsável) | Feito | Comandos `ufw allow 22/80/443/8000/8080/6001/6002`, `ufw default deny incoming`, `ufw enable`; `apt-get install fail2ban` | Testado: SSH confirmado funcional após cada etapa (3 testes); `fail2ban-client status` mostra jail `sshd` ativo | CORREÇÃO (25/10, mais tarde): a porta 5432 NÃO ficou fechada — o Docker publica portas por fora do UFW. Ela é um proxy do Coolify para o `supabase-db` (Supabase self-hosted, não o ASPdoc) e continua aberta para a internet. Próximo: desligar a publicação pública no Coolify, com aprovação**

**VPS srv1111909 | Domínio | Não era pendência real | — | — | Responsável confirmou: `iflexus.com.br` expirado intencionalmente, domínio atual é `iflexus.cloud`**

**VPS srv1111909 | Teste de recuperação de backup | Não feito | — | — | Pendente: `/data/coolify/backups/databases/` existe mas conteúdo não testado; sem cron de backup visível no crontab do root (pode haver agendamento interno do Coolify não verificado)**

**Skills/planejamento-padrao-agentes-vps-2026-10 | Estrutura `/srv/projetos/*` para os 5 sistemas | Não feito | — | — | Pendente: proposta ainda não apresentada nem aprovada; nada criado na VPS**

**Atlas/main | Piloto na VPS | Feito | Clone em `/srv/projetos/atlas` (deploy key própria), Node 22, Claude Code e Codex logados, `.venv`, correção pywin32 (`caeb3e2`) | Testes: backend 66, Vitest 17, E2E 11, build OK | Próximo: deploy de teste no Coolify**

**Atlas/deploy/teste | Dockerfiles + proxy `/api` no nginx | Feito, branch enviada ao GitHub | `backend/Dockerfile`, `frontend/Dockerfile`, `frontend/nginx.conf.template`, `.dockerignore` (commits `55c5a20`, `c1c65b0`) | docker build e `nginx -t` OK; backend real ainda não testado | Próximo: criar os 2 apps no Coolify (BACKEND_URL na mesma rede), valores do Supabase digitados só no Coolify, banco `atlas_staging` com dados fictícios**

**VPS | Acesso pelo celular | Feito | Remote Control ativo (tmux `atlas-remote`, sessão `atlas-vps`) | Visto no app pelo responsável | Próximo: serviço systemd para sobreviver a reinício; usuário não-root**

**VPS | Domínios | RISCO ABERTO | PortalGov, TestePortalGov, ASPdoc, admin, aracati, fortaleza usam `*.iflexus.com.br` (expirado; NS em dns-parking). Em 25/10 ainda respondiam (aracati/admin com falhas intermitentes) | Próximo: decidir migração para `iflexus.cloud`**

**VPS/Coolify | Acesso do agente ao Coolify via API | PARADO NO ÚLTIMO PASSO (26/10) | API Access ligado no Coolify com Allowed IPs `72.61.46.4,172.16.0.0/12,10.0.0.0/8` (API responde 401 sem token). `/root/.coolify-token` ainda NÃO existe | Próximo: o responsável cria o token (read, write, deploy; 30 dias) e o guarda na VPS sem passar pelo chat; depois migrar `testeportalgov.iflexus.cloud` (DNS já criado e resolvendo) no app TestePortalGov e ajustar `LEGACY_HOST`**

**DNS | iflexus.cloud | Feito | Registro A `testeportalgov` → 72.61.46.4 criado e resolvendo | Próximo: mover DNS para a Cloudflare; R2 para arquivos**

Plano completo e checklist: `PLANO-E-CHECKLIST-VPS.md` e `ONDE-PARAMOS.md` (repositório local Administracao-VPS).

---
*Gerado por sessão Claude Code (Sonnet 5), autorizado por Delano Barreto. Nenhuma credencial, senha ou chave privada incluída neste documento.*
