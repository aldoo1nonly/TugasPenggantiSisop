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
- Tampilan Keseluruhan Menu
  
  <img width="305" alt="Image" src="https://github.com/user-attachments/assets/347e6d37-ba12-4e93-a6aa-6d8c70cad421" />


- Menu 1 Greeting User
  
  ![image](https://github.com/user-attachments/assets/46562e4d-6016-4926-9d3f-7de686ef47e5)

---

## Deadline

Sabtu, 21 Juni 2025 pukul 23:59 WIB

---

## Terima Kasih

Program ini dibuat sebagai bentuk tanggung jawab akademik dan latihan penggunaan Bash di dunia nyata. Semoga bermanfaat dan inspiratif bagi pengembangan tugas lainnya.

