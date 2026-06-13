import 'node.dart';

class LinkedList<T> {
  Node<T>? head;

  bool isEmpty() {
    return head == null;
  }

  void insertBack(T data) {
    Node<T> nodeBaru = Node(data);
    if (isEmpty()) {
      head = nodeBaru;
    } else {
      Node<T>? sementara = head;
      while (sementara!.next != null) {
        sementara = sementara.next;
      }
      sementara.next = nodeBaru;
    }
  }

  void deleteFront() {
    if (!isEmpty()) {
      head = head!.next;
    }
  }

  void printList() {
    if (!isEmpty()) {
      Node<T>? sekarang = head;
      while (sekarang != null) {
        print('${sekarang.nodeValue}');
        sekarang = sekarang.next;
      }
    } else {
      print("Linked list dalam keadaan kosong");
    }
  }
}
