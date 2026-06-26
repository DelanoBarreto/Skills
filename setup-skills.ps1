# ============================================================
# SETUP DE SKILLS - Claude Code + Codex
# Autor: Delano Lesko
# Uso: Rode este script em qualquer maquina nova para instalar
#      todas as skills e plugins necessarios.
#
# Como executar:
#   powershell -ExecutionPolicy Bypass -File setup-skills.ps1
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INSTALADOR DE SKILLS - Delano Lesko" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- 1. VERIFICAR SE NPX ESTA INSTALADO ---
Write-Host "[1/4] Verificando Node.js e npx..." -ForegroundColor Yellow
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Host "ERRO: npx nao encontrado. Instale o Node.js primeiro:" -ForegroundColor Red
    Write-Host "  https://nodejs.org/en/download" -ForegroundColor White
    exit 1
}
Write-Host "  OK - Node.js encontrado" -ForegroundColor Green

# --- 2. INSTALAR PLUGINS EXTERNOS (COMUNIDADE) ---
Write-Host ""
Write-Host "[2/4] Instalando plugins externos (comunidade)..." -ForegroundColor Yellow

Write-Host "  Instalando: ui-ux-pro-max..." -ForegroundColor White
npx skills add https://github.com/FontAI/ui-ux-pro-max-skill --skill ui-ux-pro-max 2>&1
Write-Host "  OK - ui-ux-pro-max instalado" -ForegroundColor Green

Write-Host "  Instalando: karpathy-guidelines..." -ForegroundColor White
npx skills add https://github.com/andrejkarpathy/karpathy-skills --skill karpathy-guidelines 2>&1
Write-Host "  OK - karpathy-guidelines instalado" -ForegroundColor Green

# --- 3. INSTALAR SUAS SKILLS PT-BR DO GITHUB ---
Write-Host ""
Write-Host "[3/4] Instalando suas skills PT-BR do GitHub..." -ForegroundColor Yellow
Write-Host "  Instalando: DelanoBarreto/Skills..." -ForegroundColor White
npx skills add https://github.com/DelanoBarreto/Skills.git 2>&1
Write-Host "  OK - Skills PT-BR instaladas" -ForegroundColor Green

# --- 4. VERIFICAR INSTALACAO ---
Write-Host ""
Write-Host "[4/4] Verificando instalacao..." -ForegroundColor Yellow

$pluginsPath = "$env:USERPROFILE\.claude\plugins\installed_plugins.json"
if (Test-Path $pluginsPath) {
    $plugins = Get-Content $pluginsPath | ConvertFrom-Json
    $count = ($plugins.plugins.PSObject.Properties | Measure-Object).Count
    Write-Host "  OK - $count plugins instalados com sucesso" -ForegroundColor Green
} else {
    Write-Host "  AVISO: Arquivo de plugins nao encontrado" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INSTALACAO CONCLUIDA!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Skills disponiveis no Claude Code:" -ForegroundColor White
Write-Host "  /ajuda          - Catalogo completo" -ForegroundColor Gray
Write-Host "  /planejamento   - Planejar tarefas" -ForegroundColor Gray
Write-Host "  /debug          - Investigar bugs" -ForegroundColor Gray
Write-Host "  /frontend       - React e Next.js" -ForegroundColor Gray
Write-Host "  /backend        - APIs e servicos" -ForegroundColor Gray
Write-Host "  /ui-ux-pro-max  - Design avancado" -ForegroundColor Gray
Write-Host "  ... e mais 20+ skills" -ForegroundColor Gray
Write-Host ""
Write-Host "Para ver todas: /ajuda" -ForegroundColor Cyan
Write-Host ""
