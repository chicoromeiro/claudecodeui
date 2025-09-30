import fs from 'fs';
import path from 'path';

// Read the server index file
const serverPath = './server/index.js';
let content = fs.readFileSync(serverPath, 'utf8');

// Replace node-pty import with mock
content = content.replace(
    /import pty from 'node-pty';/,
    `// import pty from 'node-pty'; // Disabled due to compilation issues
const pty = null; // Mock pty object to disable terminal functionality`
);

// Add error handling for pty usage
content = content.replace(
    /shellProcess = pty\.spawn\(/,
    `if (!pty) {
                        ws.send(JSON.stringify({
                            type: 'error',
                            data: 'Terminal functionality is disabled due to compilation issues. Please use external terminal.'
                        }));
                        return;
                    }
                    shellProcess = pty.spawn(`
);

// Write the modified content back
fs.writeFileSync(serverPath, content);
console.log('✅ Terminal functionality disabled. Server should now start without node-pty.');
console.log('⚠️  Terminal integration will not work, but chat and other features will function normally.');