# DOCUMENTO MESTRE — Continuidade da VPS Hostinger, Coolify, Claude Code e Codex
**Data:** 25/10/2026 | **Responsável:** proprietário dos projetos iFlexus | **Estado:** plano e inventário parcial, sem implementação da infraestrutura de desenvolvimento na VPS.

> **INSTRUÇÃO À IA QUE RECEBER ESTE DOCUMENTO:** leia, confira o estado real antes de agir, explique em português simples e execute tarefas técnicas por mim quando a ferramenta permitir. Não sou programador. Não peça senhas ou chaves privadas no chat. Não presuma que uma proposta já foi aplicada. Não altere produção ou bancos sem autorização explícita.

## 1. Missão
Centralizar o desenvolvimento de cinco sistemas numa **única VPS Hostinger**, acessível do computador do escritório, de casa e do celular, sem manter cópias divergentes dos projetos. Quero trabalhar com **Claude Code e OpenAI Codex**, usando VS Code Remote-SSH, GitHub, instruções/skills compartilhadas, registros curtos de continuidade, testes e prévias no navegador para clientes.

**Projetos:** iFlexus Atlas (piloto), iFlexus TCE360, PortalGov, Controle UPC/PCS e PlanejaGov. Eles devem ser isolados por repositório, diretório, ambientes, serviços, credenciais e permissões. Não confundir Atlas com TCE360 nem com GDIP/SGIM (nomes históricos relacionados ao Atlas).

## 2. Infraestrutura confirmada por imagens reais do painel em 25/10/2026
- Hostinger **KVM 4**: **4 vCPU, 16 GB RAM, 200 GB disco**, Ubuntu **24.04**, servidor localizado em São Paulo; VPS em atividade.
- No momento da captura: **CPU 15%**, **RAM 22%**, **disco 19 GB / 200 GB** (aproximadamente 181 GB livres). Esses números são instantâneos e não substituem medição prolongada.
- **Coolify v4.1.2** instalado, servidor chamado **localhost**, com projetos **PortalGov**, **Site ASPdoc** e **teste**.
- No projeto **PortalGov > production** existem aplicações **PortalGov - Municipal** e **TestePortalGov**, indicadas em verde (estado exibido pelo painel, sem testes de endpoint).
- Existe serviço **supabase** no mesmo ambiente, marcado **Degraded (unhealthy)**. Na área de componentes, **Supabase Kong** e **Supabase Studio** aparecem **Running (healthy)**. **Não reiniciar, reinstalar nem migrar**; diagnóstico futuro deve identificar qual componente está unhealthy.
- A Hostinger mostra backup configurado **semanalmente** e **2** em “Snapshots e Backups”; recuperação não foi testada. Cartão de firewall exibia **0 regras**, mas isso não demonstra ausência de outras proteções.
- Na Hostinger apareceu aviso de expiração do domínio **iflexus.com.br** em 24/10/2026: confirmar a situação antes de usar subdomínios e certificados.
- **Não houve acesso SSH direto de ChatGPT a esta VPS** neste diálogo. As informações acima vieram de capturas fornecidas pelo proprietário.
- Coolify tem item **Terminal**, mas o proprietário não quer depender de copiar comandos ou mandar prints a cada etapa.

## 3. Objetivo operacional principal (como no vídeo)
Vídeo de referência: https://youtu.be/vsBQqysVnY8

Desejo **Claude Code instalado e trabalhando na VPS**, com acesso seguro e retomada a partir do celular, mesmo com os computadores desligados. Quero também **Codex** para tarefas adequadas ao seu modelo, uso complementar/concurrente com isolamento de branches/worktrees. **Não existe expectativa de que esta conversa ChatGPT ganhe SSH automaticamente**: a conexão precisa estar disponível e autorizada no ambiente do agente escolhido.

O **VS Code com Codex já funciona no computador atual** do proprietário. A primeira configuração será **local**, numa pasta administrativa separada, por exemplo `Administracao-VPS`, para verificar **Remote-SSH, cliente SSH, chaves existentes e configuração de SSH**; obter autorização antes de criar chaves, alterar acesso ou executar comandos na VPS. Prefira usuário Linux não-root para desenvolvimento; não dar acesso irrestrito ao Docker só para auditoria. A autenticação deve usar **chave SSH**, sem enviar chave privada ao GitHub/chat. Não desligar acesso atual antes de validar o novo.

Depois de estabelecido SSH, fazer diagnóstico somente de leitura e propor criação da área isolada na VPS (pastas abaixo são **propostas**, não confirmação do disco):
```text
/srv/projetos/atlas
/srv/projetos/tce360
/srv/projetos/portalgov
/srv/projetos/controle-upc
/srv/projetos/planejagov
```
Preservar os diretórios, volumes e aplicações já existentes no Coolify. Verificar RAM, CPU, portas, volumes, rede, backups, permissões, saúde dos serviços, Docker, Node, Git, Claude, Codex, VS Code Remote-SSH, SSH e acesso móvel. Planejar acesso remoto com segurança e sessão persistente (por exemplo tmux, se compatível), sem abrir SSH, consoles ou painéis diretamente à internet sem proteção adequada.

## 4. GitHub: repositórios e trabalho já realizado
Conta: https://github.com/DelanoBarreto

**Biblioteca central:** `DelanoBarreto/Skills`, branch de propostas:
`planejamento/padrao-agentes-vps-2026-10`

**Arquivos já publicados e verificados na branch:**
- `docs/PADRAO-AGENTES-VPS-RASCUNHO.md`
- `docs/AUDITORIA-01-CONTINUIDADE-PLANEJAMENTO-SEGURANCA.md`
- `docs/AUDITORIA-02-SUPABASE-TESTES.md`
- `docs/AUDITORIA-03-INFRA-MULTIPROJETOS.md`
- `docs/PADRAO-CURTO-CINCO-PROJETOS.md`
- `docs/INVENTARIO-REPOSITORIOS-QUATRO-PROJETOS.md`
- `docs/REVISAO-PORTALGOV-TCE360-AGENTES.md`
- `docs/ROTEIRO-AUDITORIA-VPS.md`
- `docs/SOLICITACAO-ACESSO-AUDITORIA-VPS.md`
- `docs/INSTALADOR-LINUX.md`
- `scripts/auditar-vps-linux.sh` (leitura; **ainda não executado na VPS**)
- `scripts/install-skills-linux.sh` (simulação por padrão; **ainda não instalado/executado na VPS**)
- `propostas/AGENTS-ATLAS-REVISADO.md`, `propostas/SEGURANCA-ATLAS-REVISADA.md`, `propostas/HANDOFF-CURTO.md`

**Repositórios de sistemas identificados:**
- Atlas: `DelanoBarreto/iFlexus-Atlas-Inteligencia-Municipal-e-Gerencial` — `main`; já possui `AGENTS.md` e `docs/39-ONDE-PAREI.md`.
- PortalGov: `DelanoBarreto/PortalGovMunicipal` — produção na `main`, homologação na `staging`; preservar o fluxo próprio.
- TCE360: `DelanoBarreto/iflexus-tce360` — branch padrão histórica `producao`; verificar antes de modificar.
- Controle UPC: `DelanoBarreto/ControleUPC`; proposta de `AGENTS.md` em `planejamento/padrao-agentes-2026-10`.
- PlanejaGov: `DelanoBarreto/planejagov`; proposta de `AGENTS.md` em `planejamento/padrao-agentes-2026-10`.
- Há possível repositório documental paralelo `Sistema-ControleUPC`: **não consolidar/excluir** antes de verificar.

Regras: GitHub guarda **código, instruções e histórico**, não bancos SQLite locais, arquivos operacionais, `.env`, credenciais ou documentos confidenciais. Um agente por branch/worktree e PR revisado; não presumir que `main` seja a branch de todos os sistemas. Nunca aplicar automaticamente as propostas de `Skills` à produção.

## 5. Dados e hospedagem
- **Supabase Cloud** é o banco/Auth em uso hoje; **Supabase self-hosted na VPS NÃO é o banco dos sistemas em operação neste projeto**, e seu estado atual é degraded. Não migrar sem decisão expressa.
- Atlas usa projeto Supabase Cloud denominado **Plataforma-Sistemas**: schema compartilhado `plataforma` (usuários, organizações, papéis) e schemas Atlas `atlas`, `atlas_staging`. **Não alterar estrutura de `plataforma`, `tce` ou `tce_prod`**.
- Estado do Atlas registrado em 22/10/2026: Supabase Auth e RLS implementados; 13 tabelas no `atlas` com RLS; catálogo 21 fontes. **Pendente validar login real, acesso/RLS entre duas organizações e migração progressiva SQLite → Postgres**. Não confundir testes simulados com testes reais.
- PortalGov usa ambiente/banco de produção próprio; não misturar sua infraestrutura ou schema com os demais sem estudo.
- **Cloudflare R2** será armazenamento de arquivos (PDF, CSV, XLSX, anexos e exportações), com separação por ambiente/projeto, credenciais privadas e controle de acesso; arquivos de clientes não devem ser públicos por padrão.
- **Cloudflare Pages/Workers** para prévias e frontend quando compatíveis. Backend FastAPI, Playwright, coleta intensiva e jobs podem continuar na VPS; Workers não substituem automaticamente processamento pesado. Avaliar se n8n pode automatizar partes da rotina.
- Prévia de layout para cliente pode ser pública **somente com dados fictícios**; nunca expor banco real/credenciais. Produção requer autenticação e isolamento verificados.
- **n8n** desejado na VPS para automações (inclusive acompanhamento de processos TCE e notificações), mas **não foi confirmado instalado** e não deve ser instalado antes da auditoria e do dimensionamento.
- O objetivo de 200 GB deve ser avaliado considerando Docker, imagens, logs, serviços, backups, volumes e crescimento. Não aprovar todos os serviços simultâneos apenas com base no espaço livre.

## 6. Skills, agentes, economia de tokens e modelos
- Usar regras globais compartilhadas com orientações próprias de cada repositório; preservar `AGENTS.md`, `CLAUDE.md` e documentações locais existentes, após revisão.
- Skills essenciais: continuidade/documentação, planejamento, segurança, frontend/backend, Supabase/RLS, testes/depuração, infraestrutura/publicação e economia de contexto. **Não instalar em massa sem auditoria**; validar caminhos oficiais do Claude Code e Codex no Linux.
- Modelo mais econômico em tarefas de leitura/rotina, intermediário para implementação e mais capaz para arquitetura/decisões difíceis; respeitar orçamento e limites reais da assinatura de cada provedor. Não presumir nomes, valores, cotas ou seleção automática sem verificar suporte.
- Ler só o necessário. Não reler arquivos enormes a cada resposta.
- Handoff **até 6 linhas**: `Projeto/branch | Tarefa | Feito | Arquivos/commit | Testes | Próximo`.
- Respostas ao proprietário em **3–4 frases curtas**, salvo risco importante ou pedido de explicação.

## 7. Segurança e autorização
1. **Primeiro diagnosticar, depois propor e pedir aprovação** para instalação/mudança.
2. Sem reset/restart/redeploy de Coolify, Supabase, PortalGov ou outros serviços sem aprovação.
3. Nunca alterar banco, RLS, permissões, firewall, chaves, SSH, domínios, backups ou infraestrutura de produção sem revisão e consentimento específico.
4. Não publicar segredos, logs sensíveis, credenciais nem dados reais.
5. Isolar aplicações, arquivos, tenants, schemas, branches, variáveis e serviços.
6. Rever como operar como usuário Linux sem privilégios permanentes de administrador.
7. Testar funcionamento após qualquer implantação autorizada; prever rollback e backup.
8. Comunicar resultados reais separadamente de documentos, planos ou suposições.

## 8. Próximas ações, em ordem
**Fase A — conexões:** no VS Code atual, Codex audita SSH/Remote-SSH local (somente leitura), explica o resultado e propõe conexão segura com Hostinger. Obter aprovação antes de instalar extensão, criar chave ou configurar VPS.

**Fase B — VPS:** conexão SSH com usuário autorizado, inspeção em leitura de Docker/Coolify, volumes, uso real de recursos, Supabase degraded, serviços e backup. Usar `scripts/auditar-vps-linux.sh` somente após revisar seu conteúdo e confirmar a origem.

**Fase C — Atlas piloto:** propor pastas, permissões, clonar Atlas em local aprovado, instalar/configurar Claude Code/Codex e skills após simulação e autorização; validar VS Code remoto e Git com branch isolada.

**Fase D — replicação:** PortalGov, TCE360, Controle UPC e PlanejaGov um por vez, sem interromper serviços atuais; prévias via Cloudflare após revisão.

**Fase E — mobilidade:** confirmar forma prática de usar Claude/Codex no celular, sessões persistentes/remote features e aprovações; distinguir controle de sessão de acesso aos arquivos.

## 9. Pedido inicial à nova IA
**Comece agora fazendo SOMENTE uma auditoria do computador local pelo Codex no VS Code**: verificar cliente SSH, extensão Remote-SSH, configuração local, chaves existentes (sem mostrar o conteúdo) e meios seguros de conectar à Hostinger. Diga o que encontrou, o que falta e o que necessita da minha autorização. **Não altere a VPS, serviços, bancos ou projetos nesta etapa.** Se você já tiver uma conexão SSH com a VPS por ferramenta autorizada, comprove e proponha apenas os comandos de leitura.

**Regra final:** não sou programador e quero que os agentes façam o trabalho técnico; minha participação deve se limitar às autorizações necessárias e decisões de produto.