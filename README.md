# ZTE F609 - SSH Installer

1. Download file busybox, dropbear, dan setup.sh di repository ini ke komputer, dan share menggunakan FTP/HTTP server pilihan anda (misal: vsftpd, FileZilla server, ftpdmin, nginx)
2. Reset modem F609 untuk mengembalikan akses telnet
   a. Cabut kabel fiber untuk menghindari auto update
   b. Login ke modem (default: http://192.168.1.1) dengan username 'user' dan password 'user'
   c. Pilih Administration -> System Management -> Restore Default
   d. Tunggu beberapa saat hingga modem selesai restart
3. Sambungkan komputer anda ke modem, dan akses modem melalui telnet dengan username 'root' dan password 'Zte521'
    ```sh
    telnet 192.168.1.1
    ```
4. Dari dalam telnet, download file busybox, dropbear, dan setup.sh yang sudah dishare dilangkah 1. Sesuaikan URL dengah konfigurasi server anda.
    ```sh
    mkdir -p /userconfig/bin
    cd /userconfig/bin
    wget ftp://user:pass@192.168.1.2/busybox
    wget ftp://user:pass@192.168.1.2/dropbear
    wget ftp://user:pass@192.168.1.2/setup.sh
    ```
5. Dari dalam telnet, jalankan setup.sh
    ```sh
    sh setup.sh
    ```
6. Dari dalam telnet, ganti password root dengan perintah passwd
    ```sh
    passwd
    ```
7. Keluar dari telnet, dan coba masuk melalui SSH. Jika berhasil, selamat!
    ```sh
    ssh root@192.168.1.1
    ```
8. Sambungkan kembali kabel fiber, tunggu beberapa saat maka konfigurasi modem akan terupdate otomatis, password admin berubah, dan telnet tidak bisa diakses. Tetapi SSH server kita tetap bisa diakses!
