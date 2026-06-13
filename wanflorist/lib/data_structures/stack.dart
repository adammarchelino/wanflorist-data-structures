import 'node.dart';

// Stack
class StackLog {
  Node<String>? top;

  bool isEmpty() {
    return top == null;
  }

  void push(String aktivitas) {
    Node<String> nodeBaru = Node(aktivitas);
    nodeBaru.next = top;
    top = nodeBaru;
  }

  String? pop() {
    if (isEmpty()) {
      print('stack kosong');
      return null;
    }
    String data = top!.nodeValue;
    top = top!.next;
    return data;
  }

  void printStack() {
    if (!isEmpty()) {
      Node<String>? sekarang = top;
      while (sekarang != null) {
        print(sekarang.nodeValue);
        sekarang = sekarang.next;
      }
    } else {
      print('Stack dalam kondisi kosong');
    }
  }
}
