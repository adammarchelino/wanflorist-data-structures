import 'produk.dart';

class DetailPesanan {
  Produk produk;
  int jumlah;

  DetailPesanan({required this.produk, required this.jumlah});

  double subtotal() {
    return produk.harga * jumlah;
  }

  @override
  String toString() {
    return '${produk.nama} x$jumlah = Rp${subtotal()}';
  }
}
