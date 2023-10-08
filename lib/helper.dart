void main() {
  String? nama;

  String text = nama ?? "Empty"; 
  print(text);

  List angka = [1,2,3,4,5];
  printList();

  angka.forEach((element) {
    print(element);
  }); 
}

void printList([List? l]){
  print('List l');
}