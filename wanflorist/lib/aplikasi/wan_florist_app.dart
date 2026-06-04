import 'package:wanflorist/aplikasi/console_ui.dart';
import 'package:wanflorist/layanan/katalog_produk.dart';
import 'package:wanflorist/layanan/antrian_pesanan.dart';
import 'package:wanflorist/entitas/detail_pesanan.dart';
import 'package:wanflorist/entitas/produk.dart';

class WanFloristApp {
  ConsoleUI ui = ConsoleUI();
  KatalogProduk katalog = KatalogProduk();
  AntrianPesanan antrian = AntrianPesanan();

  void jalankan() {
    bool jalan = true;
    while (jalan) {
      ui.tampilkanHeader();
      ui.tampilkanMenuUtama();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          menuKatalog();
          break;

        case '2':
          menuPesanan();
          break;

        case '3':
          antrian.lihatRiwayat();
          ui.tungguEnter();
          break;

        case '0':
          ui.tampilkanPesan('Terima kasih telah menggunakan WanFlorist!');
          jalan = false;
          break;
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }

  void menuKatalog() {
    bool kembali = false;
    while (!kembali) {
      ui.tampilkanMenuKatalog();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          String nama = ui.bacaInputDenganLabel('Nama produk');
          String kategori = ui.bacaInputDenganLabel('Kategori');
          double harga = double.parse(ui.bacaInputDenganLabel('Harga'));
          int stok = int.parse(ui.bacaInputDenganLabel('Stok'));
          katalog.tambahProduk(nama, kategori, harga, stok);
          ui.tungguEnter();
          break;

        case '2':
          katalog.tampilkanSemuaProduk();
          String id = ui.bacaInputDenganLabel('ID Produk yang dihapus');
          katalog.hapusProduk(id);
          ui.tungguEnter();
          break;

        case '3':
          katalog.tampilkanSemuaProduk();
          ui.tungguEnter();
          break;

        case '4':
          String katakunci = ui.bacaInputDenganLabel('Nama produk');
          Produk? hasil = katalog.cariProduk(katakunci);
          if (hasil != null) {
            ui.tampilkanPesan('Ditemukan: $hasil');
          } else {
            ui.tampilkanPesan('Produk tidak ditemukan.');
          }
          ui.tungguEnter();
          break;

        case '5':
          katalog.urutkanByHarga();
          ui.tungguEnter();
          break;

        case '0':
          kembali = true;
          break;
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }

  void menuPesanan() {
    bool kembali = false;
    while (!kembali) {
      ui.tampilkanMenuPesanan();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          String nama = ui.bacaInputDenganLabel('Nama pelanggan');
          String alamat = ui.bacaInputDenganLabel('Alamat');
          List<DetailPesanan> details = [];
          bool tambahLagi = true;
          while (tambahLagi) {
            katalog.tampilkanSemuaProduk();
            String idProduk = ui.bacaInputDenganLabel('ID Produk');
            Produk? produk = katalog.cariProduk(idProduk);
            if (produk != null) {
              int jumlah = int.parse(ui.bacaInputDenganLabel('Jumlah'));
              details.add(DetailPesanan(produk: produk, jumlah: jumlah));
            } else {
              ui.tampilkanPesan('Produk tidak ditemukan.');
            }
            String lanjut = ui.bacaInputDenganLabel(
              'Tambah produk lagi? (y/n)',
            );
            tambahLagi = lanjut == 'y';
          }
          if (details.isNotEmpty) {
            antrian.tambahPesanan(nama, alamat, details);
          }
          ui.tungguEnter();
          break;

        case '2':
          antrian.prosesPesanan();
          ui.tungguEnter();
          break;

        case '3':
          antrian.lihatAntrian();
          ui.tungguEnter();
          break;

        case '0':
          kembali = true;
          break;
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }
}
