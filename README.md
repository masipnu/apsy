# apsy
# Aplikasi Pembayaran Syahriyah santri (All in One)
# Ini adalah project pembuatan aplikasi pembayaran syahriyah santri dengan sistem virtual akun.

==============================================================

Masing-masing santri dibuatkan virtual akun (VA Santri) dengan identifiernya adalah id_vas
Masing-masing bendahara dari semua instansi dibuatkan virtual akun juga (VA Instansi) dengan identifiernya adalah id_vai

==============================================================

# Alur proses pembayaran
1. Memasukkan daftar santri pada tabel va_santri 
2. Memasukkan daftar bendahara instansi pada va_instansi
3. Memasukkan Tahun Pelajaran
4. Membuat daftar paket tagihan per jenjang dan ketentuan lain
5. Menentukan tagihan pada tabel bil_vas beserta paket tagihannya
6. Memasukkan daftar pembayaran santri pada tabel log_bayar_vas

==============================================================

# Note :
Setelah memasukkan daftar pembayaran, maka daftar tagihan yang telah dibuat sebelumnya pada tabel bill_vas akan berubah status menjadi "1" dan nominal pembayaran akan berpindah ke dalam tabel saldo_vai milik yayasan.

Jika uang yang dibayarkan tidak sesuai/ kurang maka akan dimasukkan dulu ke saldo virtual akun santri pada tabel saldo_vai dan tidak bisa ditransfer ke instansi lain sebelum nominal uangnya mencukupi/ sesuai dengan nominal paket tagihan yang telah ditentukan sebelumnya.

==============================================================

7. Untuk memindah saldo dari virtual akun santri kepada lembaga terkait maka bisa menginput data transaksi pada tabel log_tf_vai dengan memasukkan id_vai_from sesuai id virtual akun yayasan dan id_vai_to sesuai instansi yang diberi/ ditransfer uang pembayaran

===============================================================
Catatan
Untuk bukti pembayaran berisi link gambar/scan/foto kwitansi yang dibuat secara manual.
Bukti pembayaran bersifat opsiaonal dan bisa dikosongi, namun akan lebih valid jika setiap transaksi ada kwitansinya.
Untuk pengembangan lebih lanjut insyaallah bukti pembayaran akan dibuat/ dicetak oleh sistem (aplikasi).

===============================================================
Semoga project ini diridloi Allah SWT. dan dapat bermanfaat untuk banyak orang, Amiin.
