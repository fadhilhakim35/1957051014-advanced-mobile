import 'dart:io';

void main() {
  String? nama;

  String text = nama ?? "Empty"; 
  print(text);

  List angka = [1,2,3,4,5];
  printList();  
}

void printList([List? l]){
  print('List l');
}