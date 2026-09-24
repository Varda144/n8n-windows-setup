# n8n setup.exe (original n8n, PC installer)

Packages original `n8n` npm package + Node 20 portable into a Windows `setup.exe` using Inno Setup on GitHub Actions.

## Use

1. Push this folder to GitHub:
   ```bash
   cd n8n-setup-exe
   git init
   git add .
   git commit -m "n8n windows setup"
   git branch -M main
   git remote add origin https://github.com/YOU/n8n-setup-exe.git
   git push -u origin main
   ```
2. Open repo -> Actions -> `Build n8n setup.exe` -> `Run workflow`.
3. Download artifact `n8n-Setup-exe` -> run `n8n-Setup-1.0.0.exe` on PC.
4. Start Menu -> `n8n (Start Server)` -> opens on `http://localhost:5678`.

## Notes

- No forked n8n code. `package.json:3` pulls `n8n:latest` from npm at build time.
- No Electron overhead. Installer bundles official Node 20 + original n8n CLI.
- Data stored in `%APPDATA%\n8n`, set in `scripts/start-n8n.bat:4`.
- Update version: bump `installer/n8n.iss:4` and `package.json:2` together.
- ARM PC? This build is x64 only (`installer/n8n.iss:25-26`). Use x64 Windows 10/11.
