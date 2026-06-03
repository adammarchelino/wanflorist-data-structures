import 'detail_pesanan.dart';

class Pesanan {
  String id;
  String namaPelanggan;
  String alamat;
  String status;
  List<DetailPesanan> details;

  Pesanan({
    required this.id,
    required this.namaPelanggan,
    required this.alamat,
    this.status = 'antri',
    required this.details,
  });

  double total() {
    double jumlah = 0;
    for (var detail in details) {
      jumlah += detail.subtotal();
    }
    return jumlah;
  }

  @override
  String toString() {
    return '$id $namaPelanggan $alamat $status Rp${total()}';
  }
}
