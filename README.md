1. Stateless widget adalah widget yang tidak akan pernah berubah misalnya widget Icon, IconButton, Text.
Sedangkan, stateful widget adalah widget yang dapat berubah saat user berinteraksi dengannya.
2. Text : widget text yang berisi string, Stack : Container widget, Positioned : Widget yang mengontrol
posisi anak dari Stack, TextStyle : Mengatur style dari widget Text
3. Saat setState() dipanggil, fungsi akan memberi tahu framework bahwa state internal dari objek sudah berubah
4. const digunakan jika nilai dari suatu variabel sudah diketahui sebelum di-compile, sedangkan final akan mengambil nilainya setelah 
compile
5. Pada tugas kali ini, saya hanya menggunakan const yang digunakan pada Icon

## TUGAS 8
1. Navigator.Push akan menambahkan suatu route ke dalam suatu route stack yang diatur oleh Navigator dan untuk
mendapatkan route yang sudah dimasukkan ke dalam stack tersebut dapat digunakan method pop(). Sedangkan, pushreplacement akan
mem-push route dan me-replace route yang ada di paling atas stack.
2. 
- TextButton : Button dengan text (dalam case tugas ini untuk submit form)
- Padding : Untuk spacing 
- Container : Container widget-widget
- DropDownMenuItem : Item-item yang ada di dalam dropdown yang diambil dari list
- DropdownButtonFormField : Input drop down
- TextFormField : Input form text
- Card : Container card untuk data
3. onPressed, onTap
4. Navigator pada Flutter menggunakan stack dalam navigasi halaman yang kita tempuh. Bila kita ke page baru, Navigator akan mem-push page yang sebelumnya ke dalam stack dan jika kita ingin kembali ke dalam page tersebut Navigator akan melakukan operasi pop.
5. Untuk implementasi checklist, form kurang lebih mengikuti lab kemarin namun tidak membuat pop up saat data berhasil di-submit. Lalu saya membuat class Budget untuk menyimpan data yang telah di-submit dan bisa diakses pada datapage. Pada datapage digunakan Listview.builder untuk membuat card data yang sudah di-submit sebelumnya

## Tugas 9
1. Pengambilan data JSON tanpa membuat model terlebih dahulu dapat dilakukan. Namun, pengambilan data 
JSON tanpa membuat model tidak terlalu disarankan karena tidak lebih efektif dibandingkan membuat model 
terlebih dahulu

2. 
- FutureBuilder : Widget yang membangun beberapa Future
- Future : Hasil komputasi asynchronous (dalam tugas ini data JSON)
- InkWell : Area yang merespon saat disentuh
- ListTile (ketinggalan dari tugas 8) : Area yang bisa berisi text, icon, atau widget lain

3. Pertama, di-fetch JSON terlebih dahulu dari Tugas 3. Kemudian, dengan MyWatchListModel.fromJson() 
akan di-convert JSON ke dalam bentuk object MyWatchListModel. Object yang sudah di-convert tadi dapat 
digunakan untuk membangun suatu list (dalam tugas ini watchlist).