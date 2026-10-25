---
name: seguranca-atlas-proposta
description: Revisao defensiva de autenticacao, isolamento entre organizacoes, segredos e mudancas sensiveis no Atlas. Proposta nao instalada.
---

# Seguranca Atlas — proposta

Antes de alterar: identificar escopo, ambientes, usuarios e impacto.
- **Identidade:** organizacao obtida da sessao autenticada, nunca de parametros enviados pelo cliente.
- **RLS:** validar acesso autorizado e negado usando duas organizacoes distintas; bloquear liberacao real sem teste.
- **Banco:** nao modificar schemas `plataforma`, `tce` ou `tce_prod` sem aprovacao.
- **Segredos:** nunca registrar tokens, chaves, strings de conexao ou `.env` em commits, respostas ou logs.
- **Dados:** demonstracoes apenas com dados ficticios; revisar exposicao de arquivos R2 e URLs temporarias.
- **Mudancas:** requerer aprovacao para deploy, migracao, permissao, operacao destrutiva e merge em main.
- **Dependencias:** auditar scripts, plugins, comandos de rede e origens antes de executar.

## Saida curta (maximo 4 linhas)
`Risco: ...`
`Verificado: ...`
`Pendente: ...`
`Acao recomendada: ...`

Se houver vulnerabilidade critica, explicar impacto e medida imediata mesmo que ultrapasse o limite.
