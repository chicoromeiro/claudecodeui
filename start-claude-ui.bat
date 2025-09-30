@echo off
title Claude Code UI
color 0A
echo.
echo ====================================================
echo           🚀 CLAUDE CODE UI - INICIANDO
echo ====================================================
echo.
echo Verificando se o servidor ja esta rodando...

REM Verificar se a porta 3001 está em uso
netstat -an | find "3001" | find "LISTENING" >nul
if %errorlevel% == 0 (
    echo ⚠️  O servidor já está rodando na porta 3001!
    echo   Acesse: http://localhost:3001
    echo.
    echo Pressione qualquer tecla para abrir no navegador...
    pause >nul
    start http://localhost:3001
    goto :end
)

echo ✅ Porta 3001 disponível
echo.
echo 🔄 Iniciando Claude Code UI...
echo 📁 Diretório: %~dp0
echo.

cd /d "%~dp0"

REM Verificar se as dependências estão instaladas
if not exist "node_modules" (
    echo ❌ Dependências não encontradas!
    echo 🔄 Instalando dependências...
    call npm install --ignore-scripts
    if %errorlevel% neq 0 (
        echo ❌ Erro ao instalar dependências
        pause
        exit /b 1
    )
    echo ✅ Dependências instaladas
)

echo 🚀 Iniciando servidor...
echo.
echo ================================================
echo 📱 URLs de Acesso:
echo ================================================
echo 🏠 Local:     http://localhost:3001
echo 🌐 Rede:      http://192.168.0.48:3001
echo ================================================
echo.
echo ℹ️  Para parar o servidor: Ctrl+C
echo ℹ️  Para acesso mobile: Use o IP da rede
echo.

call npm start

:end
echo.
echo ⏹️  Servidor parado.
pause