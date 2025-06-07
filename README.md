# MRP (Manufacturing Resource Planning) Web Application

Aplikasi web untuk manajemen proses bisnis manufaktur, termasuk modul Marketing, PPC, Logistic, dan lainnya. Dibangun menggunakan PHP (CodeIgniter), dengan integrasi berbagai plugin dan library pihak ketiga.

## Fitur Utama

- **Marketing**: Manajemen proyek, quotation, customer, dan job order.
- **PPC (Production Planning & Control)**: Penjadwalan produksi, job order, dan monitoring.
- **Logistic**: Manajemen stok, pengiriman, dan opname.
- **User Management**: Pengelolaan user dan hak akses.
- **Reporting**: Ekspor data ke Excel menggunakan PhpSpreadsheet.
- **Integrasi Frontend**: Bootstrap, FontAwesome, Metronic, PNotify, dan plugin lainnya.

## Struktur Direktori

```
application/        # Source code utama (CodeIgniter: controllers, models, views, config, dll)
assets/             # Asset frontend (gambar, CSS, JS, plugin, template, file Excel contoh)
css/                # File CSS utama
fonts/              # Font (termasuk Bootstrap)
images/             # Gambar statis
plugin/             # Plugin tambahan (Bootstrap, FontAwesome, dll)
script/             # Script tambahan (JS)
system/             # Core CodeIgniter
user_guide/         # Dokumentasi CodeIgniter
index.php           # Entry point aplikasi
mrp.sql             # Struktur & data awal database
composer.json       # Dependensi PHP (composer)
.htaccess           # Konfigurasi web server
```

## Instalasi

1. **Clone repository**
   ```sh
   git clone <repo-url>
   cd mrp
   ```

2. **Instalasi Dependensi PHP**
   ```sh
   composer install
   ```

3. **Konfigurasi Database**
   - Import file [mrp.sql](mrp.sql) ke MySQL/MariaDB Anda.
   - Edit konfigurasi database di `application/config/database.php`.

4. **Konfigurasi Web Server**
   - Pastikan `index.php` dan folder `assets/` dapat diakses dari webroot.
   - Gunakan file `.htaccess` untuk konfigurasi URL rewriting jika diperlukan.

5. **Jalankan Aplikasi**
   - Akses melalui browser: `http://localhost/mrp/` (atau sesuai konfigurasi server Anda).

## Penggunaan

- Login ke aplikasi menggunakan akun yang sudah terdaftar.
- Navigasi melalui menu utama untuk mengakses modul Marketing, PPC, Logistic, dll.
- Gunakan fitur ekspor/import Excel pada beberapa modul (menggunakan PhpSpreadsheet).
- Manfaatkan fitur pencarian, filter, dan notifikasi pada setiap modul.

## Dependensi Utama

- [CodeIgniter](https://codeigniter.com/) (struktur MVC)
- [PhpSpreadsheet](https://phpspreadsheet.readthedocs.io/) ([assets/vendors/vendor/phpoffice/phpspreadsheet](assets/vendors/vendor/phpoffice/phpspreadsheet))
- [Bootstrap](https://getbootstrap.com/) ([plugin/bootstrap](plugin/bootstrap))
- [FontAwesome](https://fontawesome.com/) ([plugin/fontawesome](plugin/fontawesome))
- [Metronic](https://keenthemes.com/metronic/) ([assets/metronic](assets/metronic))
- [PNotify](https://sciactive.com/pnotify/) ([assets/pnotify](assets/pnotify))
