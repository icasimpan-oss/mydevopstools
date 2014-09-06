Tools summary:

* cyg_ifconfig - ifconfig like tool in Cygwin 
* g2           - simple command-line based bookmark & tinyurl-like solution from cli
* gethost      - a pseudo-dns like tool
* my_cli       - allows you to run commands from remote using your local machine
* pml          - Pseudo-Mailing List Manager for simple tools
* screen_rmx   - deletes dead screen sessions
* ssh_connect  - ssh tool that can connect to a lot of ssh servers with hostnames/ip-address or accessible only from certain machines

Tool Structure:

* bin/  - where the main scripts/binaries reside
* conf/ - configuration per tool reside here, prefixed with the corresponding tool name in 'bin'. Example, 'g2' would have 'g2.conf' and 'g2-users.conf'
* logs/ - logs for all tool, residing in each subdirectory. Example, logs for 'g2' would be 'logs/g2'
* tmp/  - temporary files for each tool here. As this is temporary, each tool must wipe out its temp files to avoid unnecessary filling disk

AUTHOR:
 Ismael Angelo A. Casimpan Jr. <ismael.angelo@casimpan.com>
 http://ismael.casimpan.com/
