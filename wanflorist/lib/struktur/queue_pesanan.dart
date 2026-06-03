import 'node.dart';
import 'package:wanflorist/entitas/pesanan.dart';

class QueuePesanan {
  Node<Pesanan>? head;
  Node<Pesanan>? tail;

  bool isEmpty() {
    return head == null;
  }

  void enqueue(Pesanan pesanan) {
    Node<Pesanan> nodeBaru = Node(pesanan);
    if (isEmpty()) {
      head = nodeBaru;
      tail = nodeBaru;
    } else {
      tail!.next = nodeBaru;
      tail = nodeBaru;
    }
  }

  Pesanan? dequeue() {
    if (isEmpty()) {
      print('Antrian kosong');
      return null;
    }
    Pesanan data = head!.nodeValue;
    head = head!.next;
    if (head == null) tail = null;
    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
      Node<Pesanan>? sekarang = head;
      while (sekarang != null) {
        print('${sekarang.nodeValue}');
        sekarang = sekarang.next;
      }
    } else {
      print('Antrian dalam kondisi kosong');
    }
  }
}
