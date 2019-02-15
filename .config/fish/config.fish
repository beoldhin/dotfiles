# Remove greeting message:

set fish_greeting

# Powerline:

set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-daemon -q
powerline-setup

# Aliases:

# Angband definitions
alias myangbackup="rm -rf ~/Shared/Documents/angbackup && cp -r ~/.angband ~/Documents/angbackup"
alias myangrestore="rm -rf ~/.angband/ && cp -r ~/Documents/angbackup/.angband ~/"

# Backup definitions
alias mybackupdiff="diff -rq /run/media/quetzal/Backup /run/media/quetzal/Mirror"
alias mybackupdupes="rdfind -deleteduplicates false -dryrun true /run/media/quetzal/Backup"
alias mybackupupdate="updatedb -v -l 0 -o ~/Documents/Backups/backup.db -U /run/media/quetzal/Backup"
alias mybackupfind="locate -i -d ~/Documents/Backups/backup.db "
alias mybackupusage="ncdu /run/media/quetzal/Backup/"

# Bluetooth definitions
alias mybtreset="sudo rfkill unblock bluetooth && sudo hciconfig hci0 reset"

# Common definitions - overrides
alias less="less -R -i"
alias locate="locate -i"
alias grep="grep -i --color=always"
alias pdfgrep="pdfgrep -i"
# Common definitions - others
alias myapminstall="apm install atom-alignment atom-beautify change-case file-icons highlight-selected open-recent minimap git-plus angularjs atom-polymer atom-ternjs atom-typescript language-awk language-latex language-tmux language-markdown language-pascal language-puppet hiera-eyaml pigments react todo-show atom-bootstrap3 angular2-snippets polymer-snippets javascript-snippets emmet latexer intentions busy-signal linter linter-ui-default linter-chktex linter-erb linter-php linter-csslint linter-puppet-lint linter-ruby linter-sass-lint linter-gcc autocomplete-bash-builtins autocomplete-java autocomplete-json autocomplete-js-import autocomplete-python autocomplete-xml atom-material-ui atom-material-syntax atom-material-syntax-dark"
alias myatomclean="sudo apt purge atom && rm -rf ~/.atom && rm -rf ~/.config/Atom"
alias mytimers="systemctl --user list-timers --all && systemctl list-timers --all"
alias mytubedlrev='youtube-dl --playlist-reverse --download-archive youtubedl-archive.txt -cio "%(autonumber)s-%(title)s.%(ext)s"'
alias mytubedl='youtube-dl --download-archive youtubedl-archive.txt -cio "%(autonumber)s-%(title)s.%(ext)s"'
alias mysmbrename="rename -v 's/[\/\\?%*:|\"<>]+//g' *"
alias myfindssh="nmap -p 22 --open -sV 192.168.10.0/24"
alias mypythonsrv="python3 -m http.server"
alias myfindports="sudo nmap -sT -O localhost"
alias mypwgenwifi="pwgen --secure --symbols --remove-chars=\&\<\> 63 1"
alias mypwgensym="pwgen --secure --symbols 63 1"
alias mypwgen="pwgen --secure 63 1"
alias mygitfind="find . -name '*.git'"
alias mycheckbat="watch --interval=5 acpi -V"
alias myweek="date +'It is week %V of %Y'"
alias mydf="df -hT && echo "" && df -HTi"
alias mykillvlc="sudo pkill -9 'vlc'"
alias myipshow="ip addr show"
alias myhexdump="hexdump -C"
alias myoctave="octave-cli"
alias myiotop="sudo iotop"
alias myxdb="xrdb -query"
alias myps="ps axjf"

# Common iftop for eth0 definition
alias myiftop="sudo iftop -PBi eth0"

# Shutdown and reboot
# Problems with npm updating: disabling for now

function myshutdown
    trizen -Syu
    vim +PlugUpgrade +PlugClean! +PlugUpdate +qall
    apm upgrade -c false
    killgroup chrome
    sudo systemctl poweroff
end

function myreboot
    killgroup chrome
    sync
    sudo systemctl reboot
end

# Gnome definitions
alias myrmthumbs="rm -rf ~/.cache/thumbnails"

# GPG definitions
alias mygpgexport="gpg -ao public.key --export EEC93A4F && gpg -ao private.key --export-secret-keys EEC93A4F && gpg --output revoke.key --gen-revoke EEC93A4F"
alias mygpgimport="gpg --import private.key && gpg --import public.key"
alias mygpgimportlost="gpg --import revoke.key"
alias mygpgdelete="gpg --delete-secret-and-public-key EEC93A4F"
alias mygpglist="gpg -k && gpg -K"

# LaTeX definitions
alias mylatexmk="latexmk -pdf -outdir=../build"
alias mylatexmkc="latexmk -C -outdir=../build"
alias mytexconf1="cat ~/.vim/UltiSnips/tex.snippets"
alias mytexconf2="cat ~/.vim/UltiSnips/bib.snippets"

# Math definitions
alias myqtconsole="ipython qtconsole --ConsoleWidget.font_size=12"
alias mysagestart="sage -c 'notebook(automatic_login=True)'"

# Postfix definitions
alias mypostfixdb="sudo postmap /etc/postfix/sasl/sasl_passwd && sudo postmap /etc/postfix/generic"
alias mypostfixstop="sudo systemctl stop postfix"
alias mypostfixstart="sudo systemctl start postfix"

# Puppet definitions (common for server and clients)
alias mypuppettest="sudo puppet agent --no-daemonize --onetime --verbose --noop"
alias mypuppetsync="sudo puppet agent --no-daemonize --onetime --verbose"

# Puppet definitions for clients (not including server machine)
alias mypuppetclean="sudo bash -c 'rm -rf /etc/puppetlabs/puppet/ssl/*'"

# Puppet definitions for server only (SSD cleans /var/log)
alias mypuppetstart="sudo mkdir -p /var/log/puppetlabs/puppetserver && sudo chmod 0755 /var/log/puppetlabs && sudo chown root:root /var/log/puppetlabs && sudo chmod 0700 /var/log/puppetlabs/puppetserver && sudo chown puppet:puppet /var/log/puppetlabs/puppetserver && sudo archlinux-java set java-8-openjdk/jre && archlinux-java status && sudo systemctl start puppetserver && sudo archlinux-java set java-10-openjdk && archlinux-java status"
alias mypuppetstop="sudo systemctl stop puppetserver"
alias mypuppetcleanall="sudo systemctl stop puppetserver && sudo puppet cert reinventory && sudo puppet cert clean --all && sudo systemctl start puppetserver"
alias mypuppetcertlist="sudo puppet cert list --all"
alias mypuppetcertclean="sudo puppet cert clean "
alias mypuppetcertsign="sudo puppet cert sign "
alias mypuppeteyamledit="sudo eyaml edit --pkcs7-private-key=/etc/puppetlabs/puppet/eyaml/private_key.pkcs7.pem --pkcs7-public-key=/etc/puppetlabs/puppet/eyaml/public_key.pkcs7.pem"
alias mypuppetupdate="sudo puppet module upgrade puppetlabs-vcsrepo; sudo puppet module upgrade puppetlabs-stdlib"

# SSD definitions
alias myssdhealth="sudo smartctl -a /dev/sda | grep SSD_Life_Left"

# Temperature monitoring for AMD A10 (desktop)
alias mytempload="sudo modprobe it87"
alias mytemp="watch sensors"

# Tmux definitions
alias mychide="tmux resize-pane -U -t latex:0.1 23"
alias mycshow="tmux resize-pane -D -t latex:0.1 23"
alias myconsize="tput cols; tput lines"
alias myscreen="tmux new-session -s"
alias myscreens="tmux list-sessions"
alias mysessattach="tmux attach-session -t"
alias mysesskill="tmux kill-session"

# Translation definitions
alias myfise="trans fi:sv"
alias mysefi="trans sv:fi"
alias myfiru="trans fi:ru"
alias myrufi="trans ru:fi"

# Definitions for updating
alias myupdatemirrors="sudo systemctl start reflector.service"  # only for testing: systemctl runs this as reflector.timer
alias myupdatedb="sudo systemctl start updatedb.service"
alias myupgradegem="sudo gem update"
alias myupgradecheck="sudo apt list --upgradeable && npm outdated -g --depth=0"

function myupgrade
    trizen -Syu
    sync
end

function myupgradeapm
    apm upgrade -c false
    sync
end

function myupgradevim
    vim +PlugUpgrade +PlugClean! +PlugUpdate +qall
    sync
end

function myupgradeall
    trizen -Syu
    vim +PlugUpgrade +PlugClean! +PlugUpdate +qall
    apm upgrade -c false
    sync
end

# Wed development definitions

function mymongostart
    sudo mkdir -p /var/log/mongodb
    sudo chown mongodb:mongodb /var/log/mongodb
    sudo systemctl start mongod
    systemctl status mongod
end

function mymongostop
    sudo systemctl stop mongod
    systemctl status mongod
end

alias myngcomponent="ng generate component "
alias myngdirective="ng generate directive "
alias myngpipe="ng generate pipe "
alias myngservice="ng generate service "
alias myngclass="ng generate class "
alias mynginterface="ng generate interface "
alias myngenum="ng generate enum "

# Weather-util definitions
alias myweather="weather-report -m"

# Java definitions for chaging defaults
# myjavaold="sudo archlinux-java set java-8-openjdk/jre && archlinux-java status"
# myjavanew="sudo archlinux-java set java-10-openjdk && archlinux-java status"

