#!/bin/bash

# Warna terminal
WHITE='\033[1;37m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Fungsi loading
function loading_bar() {
    echo -ne "${CYAN}Tunggu Bentar:${NC} "
    for i in {1..30}; do
        echo -ne "${WHITE}#"
        sleep 0.005
    done
    echo -e "${NC}\n"
}

# Judul besar + Penguin
function judul_ascii() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
 dP"8 888  dP"8 88P'888'Y88 888'Y88     e   e         e88 88e   888 88e  888'Y88 888 88e      e Y8b      dP"8 888 
C8b Y 888 C8b Y P'  888  'Y 888 ,'Y    d8b d8b       d888 888b  888 888D 888 ,'Y 888 888D    d8b Y8b    C8b Y 888 
 Y8b  888  Y8b      888     888C8     e Y8b Y8b     C8888 8888D 888 88"  888C8   888 88"    d888b Y8b    Y8b  888 
b Y8D 888 b Y8D     888     888 ",d  d8b Y8b Y8b     Y888 888P  888      888 ",d 888 b,    d888888888b  b Y8D 888 
8edP  888 8edP      888     888,d88 d888b Y8b Y8b     "88 88"   888      888,d88 888 88b, d8888888b Y8b 8edP  888 

                                8 8 888 88b,     e Y8b      dP"8 888 888 8 8                                      
                                8 8 888 88P'    d8b Y8b    C8b Y 888 888 8 8                                      
                                    888 8K     d888b Y8b    Y8b  8888888                                          
                                    888 88b,  d888888888b  b Y8D 888 888                                          
                                    888 88P' d8888888b Y8b 8edP  888 888                                          
EOF
    echo
    echo -e "${GREEN}       .--.              SISTEM OPERASI BASH"
    echo "      |o_o |             Febriano Aldo"
    echo "      |:_/ |"
    echo "     //   \\\\ "
    echo "    (|     | )           Host : $(hostname)"
    echo "   /'\\_   _/'\\           User : $USER"
    echo "   \\___)=(___/"
    echo -e "${NC}"
}

# Daftar Isi Menu
function daftar_isi() {
    judul_ascii
    echo -e "${CYAN}📚 Daftar Isi Menu:${NC}"
    echo -e "${WHITE}"
    echo " 0. Bersihkan Layar                  -> Membersihkan tampilan terminal"
    echo " 1. Tampilkan Waktu Saat Ini         -> Menampilkan tanggal, waktu, dan zona waktu saat ini"
    echo " 2. Tampilkan Isi Direktori          -> Menampilkan isi direktori tempat skrip dijalankan"
    echo " 3. Informasi Jaringan               -> Menampilkan informasi IP, koneksi, DNS, dan status internet"
    echo " 4. Detail Sistem Operasi            -> Menampilkan OS, kernel, CPU, memori, dan disk"
    echo " 5. Waktu Install OS Pertama Kali    -> Menampilkan estimasi waktu pertama kali OS di-install"
    echo " 6. Informasi Pengguna               -> Menampilkan info akun user saat ini"
    echo " 7. Keluar                           -> Keluar dari program"
    echo -e "${NC}"
    read -p "Tekan Enter untuk melanjutkan ke menu..."
}

# Menu Fungsi
function menu_clear() {
    judul_ascii
    echo -e "${GREEN}Layar dibersihkan.${NC}"
    echo "$(date): Menu 0 - Bersihkan Layar" >> log.txt
    sleep 1
}

function menu_waktu_saat_ini() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Waktu Saat Ini" >> log.txt
    echo -e "${CYAN}📅 Waktu Saat Ini:${NC}"
    date "+Hari     : %A"
    date "+Tanggal  : %d %B %Y"
    date "+Waktu    : %H:%M:%S"
    offset=$(date +%z)
    case $offset in
        +0700) zona="WIB (Waktu Indonesia Barat)" ;;
        +0800) zona="WITA (Waktu Indonesia Tengah)" ;;
        +0900) zona="WIT (Waktu Indonesia Timur)" ;;
        *) zona="Zona waktu tidak diketahui ($offset)" ;;
    esac
    echo "Zona Waktu: $zona"
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_direktori() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Isi Direktori" >> log.txt
    echo -e "${CYAN}📁 Direktori Saat Ini:${PWD}${NC}"
    ls -lah --color=always
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_jaringan() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Informasi Jaringan" >> log.txt
    echo -e "${CYAN}🌐 Informasi Jaringan:${NC}"
    echo "IP Lokal    : $(hostname -I | awk '{print $1}')"
    echo "Gateway     : $(ip r | grep default | awk '{print $3}')"
    echo "Netmask     : $(ip a | grep -w inet | grep -v 127 | awk '{print $2}' | head -n 1)"
    echo "DNS Server  : $(systemd-resolve --status | grep 'DNS Servers' | awk '{print $3}' | head -n 1)"
    echo -e "\n${CYAN}📡 Status Koneksi:${NC}"
    ping -q -c1 8.8.8.8 &>/dev/null && echo -e "${GREEN}Tersambung ke Internet${NC}" || echo -e "${RED}Tidak ada koneksi internet${NC}"
    echo -e "\n${CYAN}📶 Koneksi LAN/WIFI:${NC}"
    nmcli -t -f DEVICE,TYPE,STATE,CONNECTION device | column -t -s ':'
    echo -e "\n${CYAN}📍 Lokasi IP (API ipinfo.io):${NC}"
    curl -s "https://ipinfo.io?token=3cb090c9250373" | jq '.ip, .city, .region, .country, .org'
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_os() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Detail OS" >> log.txt
    echo -e "${CYAN}🖥️ Detail Sistem Operasi:${NC}"
    lsb_release -a 2>/dev/null
    echo -e "${CYAN}🔧 Kernel & CPU:${NC}"
    uname -r
    top -bn1 | grep "Cpu(s)"
    echo -e "${CYAN}💾 Memori:${NC}"
    free -h
    echo -e "${CYAN}🗂️ Disk:${NC}"
    df -h | grep -E '^Filesystem|^/dev/'
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_install_time() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Waktu Install" >> log.txt
    echo -e "${CYAN}📅 Waktu Perkiraan OS Pertama Kali Diinstall:${NC}"
    sudo tune2fs -l $(df / | tail -1 | awk '{print $1}') | grep 'Filesystem created'
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_user_info() {
    judul_ascii
    loading_bar
    echo "$(date): Menu - Info Pengguna" >> log.txt
    echo -e "${CYAN}👤 Informasi Pengguna:${NC}"
    echo "Username       : $USER"
    echo "User ID        : $(id -u)"
    echo "Group ID       : $(id -g)"
    echo "Nama Lengkap   : $(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f1)"
    echo "Shell          : $SHELL"
    echo "Home Directory : $HOME"
    echo
    read -p "Tekan Enter untuk kembali ke menu..."
}

function menu_keluar() {
    judul_ascii
    echo "$(date): Menu - Keluar" >> log.txt
    echo -e "${YELLOW}"
    echo "╔══════════════════════════════════════════╗"
    echo "║   Terima kasih! Sampai jumpa kembali 👋   ║"
    echo "╚══════════════════════════════════════════╝"
    echo -e "${NC}"
    exit 0
}

# Array menu acak
menu_funcs=(menu_waktu_saat_ini menu_direktori menu_jaringan menu_os menu_install_time menu_user_info)
menu_titles=("Tampilkan Waktu Saat Ini" "Tampilkan Isi Direktori" "Informasi Jaringan" "Detail Sistem Operasi" "Waktu Install OS Pertama Kali" "Informasi Pengguna")

# Awal program
daftar_isi

# MAIN MENU
while true; do
    mapfile -t shuffled < <(printf "%s\n" {0..5} | shuf)
    judul_ascii
    echo -e "${CYAN}Pilih Menu:${NC}"
    echo -e "${YELLOW}+----+---------------------------------------------+${NC}"
    printf "${YELLOW}| %-2s | %-43s |\n" "No" "Menu"
    echo -e "+----+---------------------------------------------+${NC}"
    printf "| %-2s | %-43s |\n" "0" "Bersihkan Layar"
    for idx in "${!shuffled[@]}"; do
        num=$((idx + 1))
        i="${shuffled[$idx]}"
        printf "| %-2s | %-43s |\n" "$num" "${menu_titles[$i]}"
        menu_map[$num]=${menu_funcs[$i]}
    done
    printf "| %-2s | %-43s |\n" "7" "Keluar"
    echo -e "+----+---------------------------------------------+${NC}"
    echo
    read -p "Masukkan pilihan Anda [0-7]: " opsi
    case $opsi in
        0) menu_clear ;;
        1|2|3|4|5|6) func=${menu_map[$opsi]}; $func ;;
        7) menu_keluar ;;
        *) echo -e "${RED}Pilihan tidak valid.${NC}"; sleep 1 ;;
    esac
done