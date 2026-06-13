import 'package:wanflorist/data_structures/queue.dart';
import 'package:wanflorist/data_structures/node.dart';
import 'package:wanflorist/data_structures/stack.dart';
import 'package:wanflorist/models/pesanan.dart';
import 'package:wanflorist/models/detail_pesanan.dart';
import 'package:wanflorist/models/status_pesanan.dart';

class AntrianPesanan {
  QueuePesanan antrian = QueuePesanan();
  StackLog log = StackLog();
  int idCounter = 1;

  void tambahPesanan(
    String namaPelanggan,
    String alamat,
    List<DetailPesanan> details,
  ) {
    String id = 'PESANAN$idCounter';
    idCounter++;
    Pesanan pesananBaru = Pesanan(
      id: id,
      namaPelanggan: namaPelanggan,
      alamat: alamat,
      details: details,
    );
    antrian.enqueue(pesananBaru);
    log.push('Pesanan $id dari $namaPelanggan telah masuk ke antrian');
    print('Pesanan $id berhasil ditambahkan ke antrian.');
  }

  void prosesPesanan() {
    Pesanan? pesanan = antrian.dequeue();
    if (pesanan != null) {
      pesanan.status = StatusPesanan.selesai;
      log.push('Pesanan ${pesanan.id} selesai diproses');
      print(
        'Pesanan ${pesanan.id} milik ${pesanan.namaPelanggan} selesai diproses.',
      );
    }
  }

  void editPesanan(String id, String namaPelanggan, String alamat) {
    Node<Pesanan>? sekarang = antrian.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.id.toLowerCase() == id.toLowerCase() &&
          sekarang.nodeValue.status == StatusPesanan.antri) {
        sekarang.nodeValue.namaPelanggan = namaPelanggan;
        sekarang.nodeValue.alamat = alamat;
        log.push('Pesanan $id telah diedit');
        print('Pesanan $id berhasil diupdate.');
        return;
      }
      sekarang = sekarang.next;
    }
    print('Pesanan tidak ditemukan atau sudah selesai diproses.');
  }

  // Cari pesanan berdasarkan ID (case-insensitive)
  Pesanan? cariPesananById(String id) {
    Node<Pesanan>? sekarang = antrian.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.id.toLowerCase() == id.toLowerCase() &&
          sekarang.nodeValue.status == StatusPesanan.antri) {
        return sekarang.nodeValue;
      }
      sekarang = sekarang.next;
    }
    return null;
  }

  void lihatAntrian() {
    antrian.printQueue();
  }

  void lihatRiwayat() {
    log.printStack();
  }
}
