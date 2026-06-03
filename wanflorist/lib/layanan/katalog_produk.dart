import 'package:wanflorist/struktur/linked_list.dart';
import 'package:wanflorist/entitas/produk.dart';
import 'package:wanflorist/struktur/node.dart';

class KatalogProduk {
  LinkedList<Produk> daftarProduk = LinkedList();
  int idCounter = 1;

  void tambahProduk(String nama, String kategori, double harga, int stok) {
    String id = 'PROD$idCounter';
    idCounter++;
    Produk produkBaru = Produk(
      id: id,
      nama: nama,
      kategori: kategori,
      harga: harga,
      stok: stok,
    );
    daftarProduk.insertBack(produkBaru);
    print('Produk "$nama" berhasil ditambahkan.');
  }

  void hapusProduk(String id) {
    if (daftarProduk.isEmpty()) {
      print('Katalog kosong.');
      return;
    }
    if (daftarProduk.head!.nodeValue.id == id) {
      daftarProduk.deleteFront();
      print('Produk berhasil dihapus.');
      return;
    }
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang!.next != null) {
      if (sekarang.next!.nodeValue.id == id) {
        sekarang.next = sekarang.next!.next;
        print('Produk berhasil dihapus.');
        return;
      }
      sekarang = sekarang.next;
    }
    print('Produk tidak ditemukan');
  }

  Produk? cariProduk(String katakunci) {
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.nama.toLowerCase().contains(
        katakunci.toLowerCase(),
      )) {
        return sekarang.nodeValue;
      }
      sekarang = sekarang.next;
    }
    return null;
  }

  // sorting harga dengan bubble short
  void urutkanByHarga() {
    List<Produk> listProduk = [];
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      listProduk.add(sekarang.nodeValue);
      sekarang = sekarang.next;
    }
    for (int i = 0; i < listProduk.length - 1; i++) {
      for (int j = 0; j < listProduk.length - i - 1; j++) {
        if (listProduk[j].harga > listProduk[j + 1].harga) {
          Produk sementara = listProduk[j];
          listProduk[j] = listProduk[j + 1];
          listProduk[j + 1] = sementara;
        }
      }
    }
    print('\n Produk diurutkan berdasarkan harga: ');
    for (var produk in listProduk) {
      print(produk);
    }
  }

  void tampilkanSemuaProduk() {
    daftarProduk.printList();
  }
}
