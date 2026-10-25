# Inventario verificado — quatro projetos
Data: 2026-10-25. Consulta GitHub (README e AGENTS na branch padrao). Nenhum codigo alterado.

- **PortalGov:** `DelanoBarreto/PortalGovMunicipal` (main). Next.js 16, TypeScript, Supabase em integracao; `AGENTS.md` ja existe, exige `docs/39-ONDE-PAREI.md` e fluxo staging/producao. **Nao substituir**: adaptar handoff ao fluxo existente.
- **TCE360:** `DelanoBarreto/iflexus-tce360` (branch padrao `producao`). MVP em desenvolvimento; estado em `ESTADO_DO_PROJETO.md`; `AGENTS.md` existe. **Nao criar branch presumindo main**; revisar instrucoes locais antes de editar.
- **Controle UPC:** `DelanoBarreto/ControleUPC` (main). Next.js + FastAPI worker + Supabase; README aponta handoff de 2026-06-21 e documento mestre; `AGENTS.md` nao encontrado na raiz. Recomendado: propor arquivo novo em branch de trabalho apos validar docs recentes.
- **PlanejaGov:** `DelanoBarreto/planejagov` (main). Especificacao/arquitetura; README informa ausencia de app executavel; `AGENTS.md` nao encontrado na raiz. Recomendado: criar proposta de instrucoes voltadas a requisitos, sem pressupor testes/deploy de app.
- **Possivel duplicidade:** `Sistema-ControleUPC` aparece como repositorio documental; confirmar papel antes de consolidar ou excluir.

## Decisao pratica
Nao aplicar template unico por substituicao. Manter arquivo global compartilhado e instrucoes locais por projeto. No PortalGov e TCE360, integrar ao fluxo existente; no Controle UPC e PlanejaGov, preparar propostas de AGENTS em branches isoladas. Handoff ate seis linhas sem duplicar docs historicos.

## Proxima verificacao
Ler documentos de estado e regras de Git dos dois projetos com AGENTS existentes; identificar referencias vigentes nos outros dois. Nao instalar nem publicar nada.
