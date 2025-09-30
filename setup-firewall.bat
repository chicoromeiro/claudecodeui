@echo off
echo Configurando regras do Windows Firewall para Claude Code UI...
echo.
echo Este script deve ser executado como Administrador!
echo.

REM Adicionar regra para porta 3001 (API/Backend)
netsh advfirewall firewall add rule name="Claude Code UI - API Port 3001" dir=in action=allow protocol=TCP localport=3001
if %errorlevel% == 0 (
    echo ✓ Regra para porta 3001 adicionada com sucesso
) else (
    echo ✗ Erro ao adicionar regra para porta 3001
)

REM Adicionar regra para porta 5173 (Frontend/Vite)
netsh advfirewall firewall add rule name="Claude Code UI - Frontend Port 5173" dir=in action=allow protocol=TCP localport=5173
if %errorlevel% == 0 (
    echo ✓ Regra para porta 5173 adicionada com sucesso
) else (
    echo ✗ Erro ao adicionar regra para porta 5173
)

echo.
echo Verificando regras criadas:
netsh advfirewall firewall show rule name="Claude Code UI - API Port 3001"
netsh advfirewall firewall show rule name="Claude Code UI - Frontend Port 5173"

echo.
echo Configuração do firewall concluída!
echo Agora você pode acessar o Claude Code UI em:
echo - Local: http://localhost:3001
echo - Rede: http://192.168.0.48:3001
echo.
pause