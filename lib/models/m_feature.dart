class fiturModels {
  String? name;
  String? logo;

  fiturModels({this.name, this.logo});

  List<fiturModels> getFitur() {
    return [
      fiturModels(name: "Request", 
                  logo: 'assets/images/feature/request.png'),
      fiturModels(name: "Send", 
                  logo: 'assets/images/feature/send.png'),
      fiturModels(name: "Bills", 
                  logo: 'assets/images/feature/bills.png'),
      fiturModels(name: "Top Up", 
                  logo: 'assets/images/feature/topup.png'),
      fiturModels(name: "Withdraw", 
                  logo: 'assets/images/feature/withdraw.png'),
      fiturModels(name: "Games", 
                  logo: 'assets/images/feature/games.png'),
      fiturModels(name: "Split", 
                  logo: 'assets/images/feature/split.png'),
      fiturModels(name: "Mobile", 
                  logo: 'assets/images/feature/mobile.png')
    ];
  }
}