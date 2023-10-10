import 'dart:io';

late String? nama;
void main() {
  nama = stdin.readLineSync();
  print("name: $nama");

  var ex = ['a', 1, null, true, 0.02, 2.0];
  print(ex);

  String? pesan;
  String text = pesan ?? "Empty"; 
  print(text);

  List angka = [1,2,3,4,5];
  printList();

  angka.forEach((element) {
    print(element);
  });
}

void printList([List? l]) {
  print('List l');
}