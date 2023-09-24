import 'dart:io';

void main() {
  String? nama;

  String text = nama ?? "Empty"; 
  print(text);

  List angka = [1,2,3,4,5];
  printList(
    1,
    2,
    angka:2
  );  
}

void printList([List? l]){
  print('cek');
}