# 🚀 Claude Code UI - Setup Completo Windows 11

## ✅ Status da Instalação

**INSTALAÇÃO CONCLUÍDA COM SUCESSO!** 🎉

### 📋 Componentes Instalados:
- ✅ Windows 11 Pro (Build 26100)
- ✅ Node.js v22.19.0 + npm v10.9.3
- ✅ Git v2.51.0
- ✅ Claude Code CLI v1.0.127
- ✅ Visual Studio Build Tools 2022
- ✅ Claude Code UI clonado e configurado
- ✅ Dependências compiladas (SQLite3, Better-SQLite3)

## 🌐 URLs de Acesso

### 💻 Acesso Local:
```
http://localhost:3001
```

### 📱 Acesso Mobile/Rede:
```
http://192.168.0.48:3001
```

## 🚀 Como Iniciar

### Método 1 - Script Automático (Recomendado):
```bash
# Navegar para a pasta e executar o script
cd "C:\Users\Micro\Documents\claudecodeui"
start-claude-ui.bat
```

### Método 2 - Manual:
```bash
cd "C:\Users\Micro\Documents\claudecodeui"
npm start
```

## 🔥 Configuração do Firewall

**IMPORTANTE**: Para acesso mobile, execute como Administrador:
```bash
setup-firewall.bat
```

Ou manual via PowerShell (como Admin):
```powershell
netsh advfirewall firewall add rule name="Claude Code UI - Port 3001" dir=in action=allow protocol=TCP localport=3001
netsh advfirewall firewall add rule name="Claude Code UI - Port 5173" dir=in action=allow protocol=TCP localport=5173
```

## 📱 Acesso Mobile

1. Execute `setup-firewall.bat` como Administrador
2. Inicie o servidor com `start-claude-ui.bat`
3. No celular, acesse: `http://192.168.0.48:3001`
4. Para PWA: Adicione à tela inicial do celular

## 🛠️ Arquivos Criados

```
C:\Users\Micro\Documents\claudecodeui\
├── .env                    # Configurações do ambiente
├── start-claude-ui.bat     # Script de inicialização
├── setup-firewall.bat     # Configuração do firewall
└── README-SETUP.md         # Esta documentação
```

## ⚙️ Configurações (.env)

```bash
PORT=3001                   # Porta do servidor
VITE_PORT=5173             # Porta do frontend
HOST=0.0.0.0               # Permite acesso externo
CLAUDE_CLI_PATH=claude     # Caminho do CLI
```

## 🔧 Comandos Úteis

### Verificar se o servidor está rodando:
```bash
netstat -an | findstr "3001"
```

### Parar servidor (se travado):
```bash
taskkill /f /im node.exe
```

### Recompilar dependências (se necessário):
```bash
npm rebuild better-sqlite3
npm rebuild sqlite3
```

### Reinstalar dependências:
```bash
npm install --ignore-scripts
npm rebuild better-sqlite3
npm rebuild sqlite3
```

## 🐛 Troubleshooting

### ❌ Erro: "Port 3001 is already in use"
```bash
# Encontrar processo usando a porta
netstat -ano | findstr "3001"
# Matar processo (substitua PID)
taskkill /f /pid [PID_NUMBER]
```

### ❌ Erro: "Could not locate bindings file"
```bash
# Recompilar módulos nativos
npm rebuild better-sqlite3
npm rebuild sqlite3
```

### ❌ Erro: "Raw mode is not supported"
- Use PowerShell ou CMD normal (não o terminal integrado do VSCode)
- Execute `start-claude-ui.bat` diretamente

### ❌ Não consegue acessar pelo celular
1. Execute `setup-firewall.bat` como Administrador
2. Verifique se está na mesma rede Wi-Fi
3. Teste no navegador do PC: `http://192.168.0.48:3001`

## 🎯 Próximos Passos

1. **Execute o firewall**: `setup-firewall.bat` (como Admin)
2. **Inicie o servidor**: `start-claude-ui.bat`
3. **Teste localmente**: http://localhost:3001
4. **Teste no mobile**: http://192.168.0.48:3001
5. **Adicione como PWA** no celular para facilitar o acesso

---

**🎉 Setup realizado com sucesso!**

*Gerado automaticamente pelo Claude Code - $(date)*