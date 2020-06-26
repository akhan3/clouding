# Curated

sudo apt install tasksel
sudo tasksel -t
ls -lF /usr/lib/tasksel/info/ubuntu-mate-desktop.preinst
less /usr/lib/tasksel/info/desktop.preinst

sudo /usr/lib/tasksel/info/desktop.preinst
sudo apt install xserver-xorg
sudo tasksel -t


# Lubuntu Desktop
# sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install lubuntu-desktop^
apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install lubuntu-desktop^
# After this operation, 2585 MB of additional disk space will be used.



# Xubuntu minimal
# sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install xubuntu-core^
apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install xubuntu-core^
# After this operation, 918 MB of additional disk space will be used.

sudo apt install --no-install-recommends xrdp
sudo apt install xrdp
systemctl status xrdp

history | tee xubuntu_min_hist
# RAM: 278, 522, 498, 303
# Browser did not work



# Variants
sudo apt install xserver-xorg

sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-desktop-minimal-default-languages^ #  892
sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-desktop-minimal^                   # 1445
sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-desktop-default-languages^         # 1873
sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-desktop^                           # 2109

sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-mate-core^     # 2229
sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install ubuntu-mate-desktop^  # 2727

sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install xubuntu-core^         #  918
sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install xubuntu-desktop^      # 2373

sudo apt-get -o APT::Install-Recommends=true -o APT::Get::AutomaticRemove=true -o APT::Acquire::Retries=3 install lubuntu-desktop^      # 2585



for pkg in  ubuntu-desktop-minimal-default-languages^ \
            ubuntu-desktop-minimal^ \
            ubuntu-desktop-default-languages^ \
            ubuntu-desktop^ \
            ubuntu-mate-core^ \
            ubuntu-mate-desktop^ \
            xubuntu-core^ \
            xubuntu-desktop^ \
            lubuntu-desktop^ \
; do
    echo "sudo apt-get install --install-recommends $pkg | tail -2"
done | grep MB

# Without recommended packages
After this operation, 604 MB of additional disk space will be used.
After this operation, 1318 MB of additional disk space will be used.
After this operation, 1568 MB of additional disk space will be used.
After this operation, 1982 MB of additional disk space will be used.
After this operation, 2229 MB of additional disk space will be used.
After this operation, 2725 MB of additional disk space will be used.
After this operation, 791 MB of additional disk space will be used.
After this operation, 2246 MB of additional disk space will be used.
After this operation, 2442 MB of additional disk space will be used.

# With recommended packages
After this operation, 892 MB of additional disk space will be used.
After this operation, 1445 MB of additional disk space will be used.
After this operation, 1873 MB of additional disk space will be used.
After this operation, 2109 MB of additional disk space will be used.
After this operation, 2229 MB of additional disk space will be used.
After this operation, 2727 MB of additional disk space will be used.
After this operation, 918 MB of additional disk space will be used.
After this operation, 2373 MB of additional disk space will be used.
After this operation, 2585 MB of additional disk space will be used.




# ┌───────────────────────────────────┤ Software selection ├──────────────────────-─┐
# │ You can choose to install one or more of the following predefined collections   │
# │ of software.                                                                    │
# │                                                                                 │
# │ Choose software to install:                                                     │
# │                                                                                 │
# │    [ ] Kubuntu live CD                                                          │
# │    [ ] Lubuntu live CD                                                          │
# │    [ ] Ubuntu Budgie live CD                                                    │
# │    [ ] Ubuntu live CD                                                           │
# │    [ ] Ubuntu MATE Live CD                                                      │
# │    [ ] Ubuntu Studio live DVD                                                   │
# │    [ ] Xubuntu live CD                                                          │
# │    [*] Ubuntu Cloud Image (instance)                                            │
# │    [ ] DNS server                                                               │
# │    [ ] Kubuntu desktop                                                          │
# │    [ ] LAMP server                                                              │
# │    [ ] Lubuntu Desktop                                                          │
# │    [ ] Mail server                                                              │
# │    [ ] PostgreSQL database                                                      │
# │    [ ] Print server                                                             │
# │    [ ] Samba file server                                                        │
# │    [ ] Ubuntu Budgie desktop                                                    │
# │    [ ] Ubuntu desktop                                                           │
# │    [ ] Ubuntu desktop default languages                                         │
# │    [ ] Ubuntu minimal desktop                                                   │
# │    [ ] Ubuntu minimal desktop default languages                                 │
# │    [ ] Ubuntu MATE minimal                                                      │
# │    [ ] Ubuntu MATE desktop                                                      │
# │    [ ] Audio recording and editing suite                                        │
# │    [ ] Ubuntu Studio desktop                                                    │
# │    [ ] Ubuntu Studio minimal DE installation                                    │
# │    [ ] Large selection of font packages                                         │
# │    [ ] 2D/3D creation and editing suite                                         │
# │    [ ] Photograph touchup and editing suite                                     │
# │    [ ] Publishing applications                                                  │
# │    [ ] Video creation and editing suite                                         │
# │    [ ] Xubuntu minimal installation                                             │
# │    [ ] Xubuntu desktop                                                          │
# │    [*] OpenSSH server                                                           │
# │    [*] Basic Ubuntu server                                                      │
# │                                                                                 │
# │                                                                                 │
# │                                           <Ok>                                  │
# │                                                                                 │
# └──────────────────────────────────────────────────────────────────────── ────────┘
