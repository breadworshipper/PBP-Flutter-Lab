1. Stateless widget adalah widget yang tidak akan pernah berubah misalnya widget Icon, IconButton, Text.
Sedangkan, stateful widget adalah widget yang dapat berubah saat user berinteraksi dengannya.
2. Text : widget text yang berisi string, Stack : Container widget, Positioned : Widget yang mengontrol
posisi anak dari Stack, TextStyle : Mengatur style dari widget Text
3. Saat setState() dipanggil, fungsi akan memberi tahu framework bahwa state internal dari objek sudah berubah
4. const digunakan jika nilai dari suatu variabel sudah diketahui sebelum di-compile, sedangkan final akan mengambil nilainya setelah 
compile
5. Pada tugas kali ini, saya hanya menggunakan const yang digunakan pada Icon