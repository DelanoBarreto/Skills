# Auditoria da VPS — roteiro somente leitura
Data: 2026-10-25. **Roteiro preparado, nao executado.**

## Objetivo
Confirmar sistema operacional, RAM, disco, Docker/Coolify, Node, Git, Claude Code, Codex, portas em escuta e skills instaladas antes de qualquer mudanca.

## Como usar, somente depois de ter acesso autorizado
```bash
bash scripts/auditar-vps-linux.sh
```

O script usa consultas de leitura e nao instala pacotes, nao altera configuracoes, nao reinicia containers e nao consulta arquivos .env. Alguns comandos podem falhar por falta de permissao, o que deve ser registrado como **nao verificado**, nao como ausente.

## Verificacoes manuais complementares (sem coletar credenciais)
- Confirmar politica de backups e teste de restauracao; registrar somente status, sem expor arquivos.
- Conferir acesso SSH e firewall com administrador; evitar publicar IP, chaves ou tokens.
- Verificar recursos reais e consumo de cada container no painel do Coolify.
- Confirmar local e permissao dos diretorios dos cinco projetos.
- Conferir caminhos de skills suportados pelas versoes reais dos agentes.

## Criterios antes da instalacao
1. Inventario e backups conferidos.
2. Conflitos e riscos documentados.
3. Simulacao do instalador revisada.
4. Aprovacao explicita para aplicar na VPS.

Resumo de ate seis linhas: sistema | recursos | ferramentas | Coolify | riscos | proxima acao.
