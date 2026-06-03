import 'package:wanflorist/struktur/queue_pesanan.dart';
import 'package:wanflorist/struktur/stack_log.dart';
import 'package:wanflorist/entitas/pesanan.dart';
import 'package:wanflorist/entitas/detail_pesanan.dart';

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
      pesanan.status = 'selesai';
      log.push('Pesanan ${pesanan.id} selesai diproses');
      print(
        'Pesanan ${pesanan.id} milik ${pesanan.namaPelanggan} selesai diproses.',
      );
    }
  }

  void lihatAntrian() {
    antrian.printQueue();
  }

  void lihatRiwayat() {
    log.printStack();
  }
}
