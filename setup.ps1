# setup.ps1 — Instala todas as skills e plugins em um novo computador
# Uso: .\setup.ps1
# Requisitos: Node.js, npx, Claude Code e Codex instalados

param(
    [switch]$SkipPlugins,
    [switch]$SkipClaude,
    [switch]$SkipCodex
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AgentsSkills = "$env:USERPROFILE\.agents\skills"
$ClaudeSkills  = "$env:USERPROFILE\.claude\skills"
$CodexSkills   = "$env:USERPROFILE\.codex\skills"

Write-Host ""
Write-Host "=== Setup de Skills — Antigravity ===" -ForegroundColor Cyan
Write-Host ""

# ─── 1. Plugins do Claude Code ────────────────────────────────────────────────
if (-not $SkipPlugins) {
    Write-Host "[1/3] Instalando plugins do Claude Code..." -ForegroundColor Yellow

    $plugins = @(
        "superpowers@claude-plugins-official",
        "github@claude-plugins-official",
        "supabase@claude-plugins-official",
        "claude-md-management@claude-plugins-official",
        "frontend-design@claude-plugins-official",
        "skill-creator@claude-plugins-official"
    )

    foreach ($plugin in $plugins) {
        Write-Host "  -> $plugin"
        npx skills add $plugin -g -y 2>&1 | Out-Null
    }

    # Karpathy (marketplace externo)
    Write-Host "  -> andrej-karpathy-skills (marketplace externo)"
    npx skills add andrej-karpathy-skills@karpathy-skills --marketplace https://github.com/multica-ai/andrej-karpathy-skills.git -g -y 2>&1 | Out-Null

    Write-Host "  OK: Plugins instalados." -ForegroundColor Green
}

# ─── 2. Skills Claude (PT-BR) → ~/.agents/skills/ ─────────────────────────────
if (-not $SkipClaude) {
    Write-Host ""
    Write-Host "[2/3] Instalando skills Claude PT-BR em $AgentsSkills..." -ForegroundColor Yellow

    New-Item -ItemType Directory -Force $AgentsSkills | Out-Null

    $claudeSkills = Get-ChildItem "$ScriptDir\claude" -Directory
    foreach ($skill in $claudeSkills) {
        $dst = Join-Path $AgentsSkills $skill.Name
        Copy-Item -Recurse -Force $skill.FullName $dst
        Write-Host "  -> $($skill.Name)"
    }

    Write-Host "  OK: $($claudeSkills.Count) skills Claude instaladas." -ForegroundColor Green
}

# ─── 3. Skills Codex (PT-BR) → ~/.codex/skills/ ──────────────────────────────
if (-not $SkipCodex) {
    Write-Host ""
    Write-Host "[3/3] Instalando skills Codex PT-BR em $CodexSkills..." -ForegroundColor Yellow

    New-Item -ItemType Directory -Force $CodexSkills | Out-Null

    $codexSkillsList = Get-ChildItem "$ScriptDir\codex" -Directory
    foreach ($skill in $codexSkillsList) {
        $dst = Join-Path $CodexSkills $skill.Name
        Copy-Item -Recurse -Force $skill.FullName $dst
        Write-Host "  -> $($skill.Name)"
    }

    Write-Host "  OK: $($codexSkillsList.Count) skills Codex instaladas." -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Instalacao concluida! ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Proximos passos:" -ForegroundColor White
Write-Host "  1. Reinicie o Claude Code e o Codex"
Write-Host "  2. Teste com /ajuda no Claude Code"
Write-Host "  3. Teste com \ajuda no Codex"
Write-Host ""
