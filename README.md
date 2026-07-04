# RSKD_Ryan_Akmal
Tugas UAS

## RSKD - Aplikasi Perjanjian dan Manajemen Jadwal Rumah Sakit

## Deskripsi Proyek
RSKD merupakan aplikasi Android yang dikembangkan sebagai sistem manajemen perjanjian (appointment) antara pasien dan dokter. Aplikasi ini memungkinkan pasien melakukan pendaftaran akun, melihat daftar dokter, membuat perjanjian, melihat riwayat konsultasi, serta mengelola profil. Di sisi lain, dokter dapat mengatur jadwal praktik, melihat daftar pasien yang melakukan kontrol, memperbarui status pertemuan, serta mengelola profil mereka.

Proyek ini terdiri dari dua bagian utama:
1. **RSKD** → Frontend Android yang dibangun menggunakan **Java** dan **XML** pada Android Studio.
2. **rsdharmais** → Backend REST API sederhana yang dibangun menggunakan **PHP** dan menggunakan database MySQL sebagai media penyimpanan data.
Android berkomunikasi dengan backend menggunakan HTTP Request dan menerima respon dalam format JSON.


# Arsitektur Sistem
```
Android Application (Java + XML)
            │
       HTTP Request
            │
            ▼
     PHP REST API Server
            │
      koneksi.php
            │
            ▼
      MySQL Database
```


# Fitur Utama

## Sebagai Pasien
- Login
- Registrasi akun
- Melihat daftar dokter
- Melihat dashboard tampilan jadwal pertemuan
- Filter dokter berdasarkan spesialis
- Melihat jadwal dokter
- CRUD perjanjian
- Melihat riwayat konsultasi
- Melihat detail pertemuan
- Edit & Delete akun

## Sebagai Dokter

- Login
- Melihat dashboard tampilan jadwal pertemuan
- CRUD jadwal praktik
- Melihat daftar pasien kontrol
- Mengubah status dan memberi notes pertemuan
- Melihat riwayat konsultasi
- Mengubah profil

# Struktur Project

```
RSKD/
│
├── app/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/example/rskd/
│   │   │   ├── res/layout/
│   │   │   ├── res/drawable/
│   │   │   ├── res/menu/
│   │   │   └── AndroidManifest.xml
│   │   ├── androidTest/
│   │   └── test/
│   └── build.gradle.kts
│
└── gradle files
```

```
rsdharmais/
│
├── login.php
├── register.php
├── koneksi.php
├── buat_perjanjian.php
├── batalkan_perjanjian.php
├── tambah_jadwal.php
├── edit_jadwal.php
├── hapus_jadwal.php
├── tambah_kontrol.php
├── update_status_pertemuan.php
├── get_home_pasien.php
├── get_home_dokter.php
├── get_list_dokter.php
├── get_semua_dokter.php
├── get_dokter_by_spesialis.php
├── get_jadwal_dokter.php
├── get_jadwal_tersedia.php
├── get_history_pasien.php
├── get_history_dokter.php
├── get_kontrol_by_dokter.php
├── get_profil_pasien.php
├── get_profil_dokter.php
├── update_profil_pasien.php
├── update_profil_dokter.php
└── hapus_akun.php
```


# Penjelasan Frontend Android

## Activity
| File | Fungsi |
|-------|---------|
| MainActivity | Halaman awal aplikasi |
| PilihRoleActivity | Memilih role sebagai dokter atau pasien |
| LoginActivity | Login pengguna |
| SignUpActivity | Registrasi pengguna baru |
| PasienHomeActivity | Dashboard pasien |
| DokterHomeActivity | Dashboard dokter |
| ListDokterActivity | Menampilkan seluruh dokter |
| BuatPerjanjianActivity | Membuat janji konsultasi |
| ListKontrolActivity | Daftar pasien kontrol |
| TambahJadwalActivity | Menambahkan jadwal praktik |
| DokterHistoryActivity | Riwayat konsultasi dokter |
| PasienHistoryActivity | Riwayat konsultasi pasien |
| DetailHistoryActivity | Detail riwayat dokter |
| DetailHistoryPasienActivity | Detail riwayat pasien |
| DetailPertemuanActivity | Detail pertemuan |
| DokterProfilActivity | Profil dokter |
| PasienProfilActivity | Profil pasien |


## Model
### Pertemuan.java
Menyimpan representasi data pertemuan seperti:
- ID
- Nama pasien
- Nama dokter
- Jadwal
- Status
- dan informasi lainnya.

## Adapter
### PertemuanAdapter.java
Digunakan untuk menghubungkan data pertemuan dengan RecyclerView sehingga daftar pertemuan dapat ditampilkan secara dinamis.

## Utility
### Constants.java
Berisi konfigurasi aplikasi seperti:
- Base URL API
- Konstanta request yang berhubunagn dengan backend php
- Endpoint yang digunakan aplikasi

### SessionManager.java
Mengelola session login menggunakan SharedPreferences, seperti:
- Status login
- ID user
- Role pengguna
- Informasi akun

# Penjelasan Layout XML
Folder

res/layout/
berisi seluruh tampilan antarmuka aplikasi.

Contohnya:
| File | Fungsi |
|-------|---------|
| activity_login.xml | Halaman login |
| activity_sign_up.xml | Halaman registrasi |
| activity_pasien_home.xml | Dashboard pasien |
| activity_dokter_home.xml | Dashboard dokter |
| activity_list_dokter.xml | Daftar dokter |
| activity_buat_perjanjian.xml | Form membuat janji |
| activity_tambah_jadwal.xml | Form tambah jadwal |
| activity_detail_pertemuan.xml | Detail konsultasi |
| item_dokter.xml | Item RecyclerView dokter |
| item_jadwal.xml | Item jadwal praktik |
| item_pertemuan.xml | Item daftar pertemuan |
| dialog_action.xml | Dialog aksi |
| layout_header.xml | Header tampilan |


# Penjelasan Backend PHP
Backend menyediakan API yang dipanggil oleh aplikasi Android.

## Autentikasi
### login.php
Melakukan autentikasi pengguna berdasarkan email/username dan password.

### register.php
Menambahkan akun pengguna baru ke database.

## Koneksi Database
### koneksi.php
Membuat koneksi menuju database MySQL menggunakan konfigurasi host, username, password, dan nama database.

## Manajemen Dokter
- get_list_dokter.php
- get_semua_dokter.php
- get_dokter_by_spesialis.php
Digunakan untuk mengambil data dokter dari database.

## Jadwal Dokter
- tambah_jadwal.php
- edit_jadwal.php
- hapus_jadwal.php
- get_jadwal_dokter.php
- get_jadwal_tersedia.php
Mengelola jadwal praktik dokter.

## Perjanjian
- buat_perjanjian.php
- batalkan_perjanjian.php
Digunakan pasien untuk membuat maupun membatalkan janji konsultasi.

## Riwayat
- get_history_pasien.php
- get_history_dokter.php
Mengambil riwayat konsultasi.

## Dashboard
- get_home_pasien.php
- get_home_dokter.php
Mengambil data yang diperlukan pada halaman dashboard masing-masing role.

## Profil
- get_profil_pasien.php
- get_profil_dokter.php
- update_profil_pasien.php
- update_profil_dokter.php
Mengambil dan memperbarui data profil pengguna.

## Kontrol
- tambah_kontrol.php
- get_kontrol_by_dokter.php
Mengelola data kontrol pasien.

## Status Pertemuan
### update_status_pertemuan.php
Memperbarui status konsultasi seperti selesai, berlangsung, atau dibatalkan.

## Hapus Akun
### hapus_akun.php
Menghapus akun pengguna dari sistem.

# Teknologi yang Digunakan
## Frontend
- Java
- Android SDK
- Android Studio
- XML Layout
- RecyclerView
- SharedPreferences
- HTTP Networking
- JSON Parsing

## Backend
- PHP
- MySQL
- REST API
- JSON Response

# Cara Instalasi
## 1. Clone Repository
```bash
git clone https://github.com/ryan0556/RSKD_Ryan_Akmal.git```

## 2. Import Android Project

1. Buka Android Studio.
2. Pilih **Open Existing Project**.
3. Pilih folder **RSKD**.
4. Tunggu proses Gradle Sync selesai.

## 3. Setup Backend
1. Install XAMPP.
2. Salin folder **rsdharmais** ke dalam htdocs.

## 4. Import Database
1. Jalankan Apache dan MySQL.
2. Buka phpMyAdmin.
3. Import file SQL database.
4. Sesuaikan konfigurasi pada file: koneksi.php
5. 
Contoh:
```php
$host = "localhost";
$user = "root";
$password = "";
$database = "nama_database";
```


## 5. Konfigurasi Base URL

Buka 
```
Constants.java
```

ubah Base URL menjadi alamat server.

Contoh:
```java
public static final String BASE_URL = "http://192.168.1.5/rsdharmais/";
```

## 6. Jalankan Backend
Pastikan Apache dan MySQL berjalan sebelum menjalankan aplikasi Android.

## 7. Build dan Run
- Hubungkan emulator atau perangkat Android.
- Tekan tombol **Run** pada Android Studio.
- Aplikasi siap digunakan.

# Cara Menggunakan Aplikasi

## Sebagai Pasien
1. Buka aplikasi.
2. Pilih role **Pasien**.
3. Login atau registrasi.
4. Lihat daftar dokter.
5. Pilih dokter sesuai kebutuhan.
6. Pilih jadwal yang tersedia.
7. Buat perjanjian.
8. Lihat riwayat konsultasi.
9. Kelola profil apabila diperlukan.

## Sebagai Dokter
1. Login sebagai dokter.
2. Masuk ke dashboard dokter.
3. Tambahkan jadwal praktik.
4. Lihat daftar pasien yang melakukan kontrol.
5. Perbarui status pertemuan.
6. Kelola profil dan riwayat konsultasi.

# Alur Sistem
```
Pasien
    │
    ▼
Login / Registrasi
    │
    ▼
Melihat Dokter
    │
    ▼
Memilih Jadwal
    │
    ▼
Membuat Perjanjian
    │
    ▼
Dokter menerima jadwal
    │
    ▼
Pertemuan berlangsung
    │
    ▼
Status diperbarui
    │
    ▼
Riwayat tersimpan
```
