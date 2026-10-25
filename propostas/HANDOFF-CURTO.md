# Modelo de continuidade — baixo consumo de tokens

Atualizar **somente ao encerrar tarefa ou quando o estado mudar**. Limite normal: 6 linhas e aproximadamente 100 palavras. Nao repetir historico completo, logs ou arquivos inteiros.

```text
Projeto/branch: Atlas | feature/...
Tarefa: objetivo em uma frase.
Feito: resultado confirmado, sem narrativa.
Arquivos/commit: caminhos relevantes e SHA/PR.
Testes: aprovados, falhas e nao executados.
Pendente/proximo: um bloqueio e uma acao objetiva.
```

Regras: ler primeiro o handoff vigente; consultar historico apenas quando necessario; citar caminhos em vez de colar conteudo; nunca registrar credenciais ou dados pessoais. Respostas ao responsavel: ate 3-4 frases por padrao. Detalhar quando solicitado ou quando risco importante exigir.
