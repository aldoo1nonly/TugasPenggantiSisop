# Tugas Pengganti Mata Kuliah Sistem Operasi – IT-06-01

## Identitas

- **Nama**: Muhammad Febriano Aldo Syahputra
- **NIM**: 1202230021
- **Kelas**: IT-06-01

---

## Deskripsi Umum

Repositori ini berisi tugas pengganti mata kuliah Sistem Operasi yang dikembangkan menggunakan Bash Script. Program ini menyediakan menu interaktif untuk menampilkan berbagai informasi sistem dan pengguna. Tampilan terminal dibuat lebih menarik dengan penggunaan warna, ASCII art, dan loading bar.

---

## Menu yang Diimplementasikan

Seluruh 7 menu utama berhasil diimplementasikan:

### 1. Waktu Saat Ini + Greetings

Menampilkan waktu real-time berdasarkan zona sistem (WIB/WITA/WIT) lengkap dengan hari, tanggal, jam, serta sapaan otomatis seperti “Selamat pagi”, “Selamat malam”, dll.

### 2. Isi Direktori

Menampilkan daftar isi direktori aktif dalam bentuk tabel (`ls -lah`) dengan pewarnaan terminal yang memudahkan identifikasi file.

### 3. Informasi Jaringan

Menyediakan informasi seperti:

- IP lokal
- Gateway dan subnet mask
- DNS server
- Status internet (`ping`)
- Koneksi aktif (via `nmcli`, opsional)
- Lokasi IP publik (via API `ipinfo.io`)

### 4. Detail Sistem Operasi

Informasi sistem lengkap:

- Distro Linux (`lsb_release`)
- Kernel & arsitektur (`uname`)
- CPU usage (`top`)
- RAM usage (`free`)
- Disk usage (`df`)

### 5. Estimasi Waktu Install OS

Menampilkan waktu filesystem root dibuat dengan `tune2fs` (butuh `sudo`), sebagai estimasi waktu instalasi OS pertama kali.

### 6. Informasi Pengguna

Detail pengguna saat ini:

- Username
- UID & GID
- Nama lengkap
- Shell default
- Home directory

### 7. Keluar Program

Menampilkan animasi penutup dan pesan pamit sebelum program keluar dengan aman.

---

## Cara Menjalankan

```bash
chmod +x tugasSisop.sh
./tugasSisop.sh
```

**Catatan:**

- Sebagian menu seperti waktu install OS memerlukan `sudo`.
- Pastikan `jq` dan `curl` tersedia untuk informasi IP publik.

---

## Dokumentasi Menu 
Daftar Isi – Daftar Menu & Keterangan Menu
![image](https://github.com/user-attachments/assets/2b30938c-cf7e-4b14-a055-e29b9b6c13aa)


Menu Utama – Opsi Pilihan Menu
![image](https://github.com/user-attachments/assets/7280f644-91de-4478-b210-aba813280c9b)

 
Menu 1 – Penunjuk Waktu & Sapaan Otomatis
![image](https://github.com/user-attachments/assets/6dea6d1e-31c1-4c38-99ac-b9c63af1f300)


Menu 2 – Direktori Aktif
![image](https://github.com/user-attachments/assets/3f903384-04c5-44a0-9df9-dcff1510c22d)


Menu 3 – Data Jaringan & Koneksi
![image](https://github.com/user-attachments/assets/83d82561-1ef3-411e-a8c6-042b48660318)


Menu 4 – Sistem Operasi & Perangkat
![image](https://github.com/user-attachments/assets/2f6dc91b-0895-41ac-8f11-853496110984)


Menu 5 – Estimasi Tanggal Instalasi OS
![image](https://github.com/user-attachments/assets/2bef3ed8-389d-4b5d-aeaf-cbf0ebe6debc)


Menu 6 – Informasi Akun Pengguna
![image](https://github.com/user-attachments/assets/b24c041e-e3d3-4e09-9e80-4289ba64a024)


---

## Deadline

Sabtu, 21 Juni 2025 pukul 23:59 WIB

---

## Terima Kasih

Program ini dibuat sebagai bentuk tanggung jawab akademik dan latihan penggunaan Bash di dunia nyata. Semoga bermanfaat dan inspiratif bagi pengembangan tugas lainnya.

