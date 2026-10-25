# Solicitação de acesso — auditoria somente leitura da VPS

Data: 2026-10-25 | Status: **pendente de disponibilização de acesso autorizado**.

## Finalidade
Executar `scripts/auditar-vps-linux.sh` para confirmar o ambiente Linux da VPS Hostinger/Coolify antes de instalar Claude Code, Codex ou skills.

## Acesso mínimo necessário
- Sessão SSH autorizada de usuário sem privilégios administrativos, preferencialmente temporária, com permissão de consultar informações básicas de sistema.
- Acesso de leitura aos metadados de Docker/Coolify **somente se já permitido**; não adicionar o usuário ao grupo `docker` apenas para auditoria (equivale a acesso privilegiado em muitas instalações).
- Sem compartilhamento de senha, chave privada, token, arquivo `.env` ou dados de produção por chat.
- Acesso administrativo **não solicitado**. Se uma checagem depender de privilégios, marcar como não verificada e solicitar avaliação separada.

## Verificações autorizadas
Sistema/versão, memória, disco, uptime, Git/Node/Docker/Claude/Codex, nomes/status dos contêineres visíveis, portas em escuta, diretórios de skills. Conferência de backup e segurança será complementada pelo responsável sem expor segredos.

## Fora do escopo
Instalar, atualizar, reiniciar, publicar, editar arquivos, mudar firewall/SSH, acessar bancos, ler credenciais ou modificar Coolify.

## Execução
1. Responsável confirma o método seguro de acesso à VPS e a conta autorizada.
2. Rodar apenas o script de leitura, revisando a saída antes de compartilhá-la.
3. Registrar resultado em até seis linhas: sistema | recursos | ferramentas | Coolify | riscos | próximo.
4. Solicitar aprovação específica para qualquer etapa que altere o servidor.

Nenhuma credencial deve ser adicionada a este repositório.
