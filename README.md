# ZTE F609 - SSH Installer

## Persiapan

1. Download dan extract [repository ini](../../archive/master.zip)
2. Share isinya menggunakan FTP/HTTP server, misal: vsftpd, filezilla, ftpdmin, nginx (cara menshare tidak akan dibahas di sini)
3. Test terlebih dahulu hasil share menggunakan browser

## Instalasi

Pada tahap ini akses internet akan terputus sementara, pastikan langkah persiapan telah sukses.

1. Reset modem F609 untuk mengembalikan akses telnet:

    1. Cabut kabel fiber untuk menghindari auto update
    2. Login ke modem (http://192.168.1.1) dengan username 'user' dan password 'user'
    3. Pilih Administration -> System Management -> Restore Default
    4. Tunggu beberapa saat hingga modem selesai restart

2. Sambungkan komputer ke modem, dan akses modem melalui telnet dengan username 'root' dan password 'Zte521'

    ```sh
    telnet 192.168.1.1
    ```

3. Dari dalam telnet, download file busybox, dropbear, dan setup.sh yang sudah dishare di tahap persiapan. Sesuaikan URL dengah konfigurasi server anda.

    ```sh
    mkdir -p /userconfig/bin
    cd /userconfig/bin
    wget http://192.168.1.2/busybox
    wget http://192.168.1.2/dropbear
    wget http://192.168.1.2/setup.sh
    ```

4. Dari dalam telnet, jalankan setup.sh

    ```sh
    sh setup.sh
    ```

5. Dari dalam telnet, ganti password root dengan perintah passwd

    ```sh
    passwd
    ```

6. Keluar dari telnet, dan coba masuk melalui SSH. Jika berhasil, selamat!

    ```sh
    ssh root@192.168.1.1
    ```

7. Sambungkan kembali kabel fiber, tunggu beberapa saat maka konfigurasi modem akan terupdate otomatis, password admin berubah, dan telnet tidak bisa diakses. Tetapi SSH server kita tetap bisa diakses!

## Instalasi Ulang

Jika modem ter-restart, maka SSH server harus diaktifkan kembali:

1. Reset modem (jangan lupa kabel fiber dicabut)
2. Melalui telnet, jalankan setup.sh

    ```sh
    sh /userconfig/bin/setup.sh
    ```

3. Pasang kembali kabel fiber
