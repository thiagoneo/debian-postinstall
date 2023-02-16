# debian-postinstall
Script de pós instalação do Debian 11 XFCE, com configurações personalizadas.

Uso:
1. Instalar o Debian com a ISO netinstall, escolhendo o XFCE como ambiente de desktop.
2. No primeiro boot, pressionar as teclas Ctrl + Alt + F2, e fazer login com usuário e senha.
3. Baixar e executar o script inicial com os comandos:
   ```
   wget https://raw.githubusercontent.com/thiagoneo/debian-postinstall/main/start-script.sh
   chmod +x start-script.sh
   ./start-script.sh
   ```
4. Os arquivos necessários serão baixados, juntamente com o script principal (`script.sh`), que será executado em seguida. Após o término da execução, reiniciar com o comando `/sbin/reboot`, entrar no ambiente gráfico e aproveitar o sistema instalado e configurado para uso.
