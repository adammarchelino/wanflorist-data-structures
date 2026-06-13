import 'dart:io';

class ConsoleUI {
  void tampilkanHeader() {
    print('');
    print('');
    print('         WAN FLORIST          ');
    print('');
  }

  void tampilkanMenuUtama() {
    print('\n MENU UTAMA ');
    print('1. Kelola Katalog Produk');
    print('2. Kelola Pesanan');
    print('3. Lihat Log Aktivitas');
    print('0. Keluar');
    stdout.write('Pilih: ');
  }

  void tampilkanMenuKatalog() {
    print('\n KATALOG PRODUK ');
    print('1. Tambah Produk');
    print('2. Hapus Produk');
    print('3. Lihat Semua Produk');
    print('4. Cari Produk');
    print('5. Urutkan by Harga');
    print('6. Edit Produk');
    print('E. Exit ke Menu Utama');
    print('C. Keluar Program');
    stdout.write('Pilih: ');
  }

  void tampilkanMenuPesanan() {
    print('\n KELOLA PESANAN ');
    print('1. Tambah Pesanan');
    print('2. Proses Pesanan Berikutnya');
    print('3. Lihat Antrian Pesanan');
    print('4. Edit Pesanan');
    print('E. Exit ke Menu Utama');
    print('C. Keluar Program');
    stdout.write('Pilih: ');
  }

  String bacaInput() {
    return stdin.readLineSync()!;
  }

  String bacaInputDenganLabel(String label) {
    stdout.write('$label: ');
    return stdin.readLineSync()!;
  }

  void tampilkanPesan(String pesan) {
    print(pesan);
  }

  void tungguEnter() {
    stdout.write('\nTekan Enter untuk melanjutkan...');
    stdin.readLineSync();
  }

  double bacaDouble(String label, double defaultValue) {
    stdout.write('$label (Enter untuk skip, default: $defaultValue): ');
    String input = stdin.readLineSync()!.trim();
    if (input.isEmpty) {
      return defaultValue;
    }
    try {
      return double.parse(input);
    } catch (e) {
      print('Input tidak valid. Menggunakan default: $defaultValue');
      return defaultValue;
    }
  }

  int bacaInt(String label, int defaultValue) {
    stdout.write('$label (Enter untuk skip, default: $defaultValue): ');
    String input = stdin.readLineSync()!.trim();
    if (input.isEmpty) {
      return defaultValue;
    }
    try {
      return int.parse(input);
    } catch (e) {
      print('Input tidak valid. Menggunakan default: $defaultValue');
      return defaultValue;
    }
  }

  String bacaStringDenganDefault(String label, String defaultValue) {
    stdout.write('$label (Enter untuk skip, default: "$defaultValue"): ');
    String input = stdin.readLineSync()!.trim();
    if (input.isEmpty) {
      return defaultValue;
    }
    return input;
  }

  double bacaDoubleWajib(String label) {
    while (true) {
      stdout.write('$label: ');
      String input = stdin.readLineSync()!.trim();
      if (input.isEmpty) {
        print('Input tidak boleh kosong!');
        continue;
      }
      try {
        return double.parse(input);
      } catch (e) {
        print('Input tidak valid. Coba lagi!');
      }
    }
  }

  int bacaIntWajib(String label) {
    while (true) {
      stdout.write('$label: ');
      String input = stdin.readLineSync()!.trim();
      if (input.isEmpty) {
        print('Input tidak boleh kosong!');
        continue;
      }
      try {
        return int.parse(input);
      } catch (e) {
        print('Input tidak valid. Coba lagi!');
      }
    }
  }
}
