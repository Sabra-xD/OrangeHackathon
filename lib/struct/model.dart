class History {
  String? id;
  String? purchaseLocation;
  bool? status; //Reflects if it's approved or disaproved.
  bool? transactionType; //True is deduction false is addition.
  String? timeofTransaction;
  double? amount;

  History(
      {required this.id,
      required this.purchaseLocation,
      required this.status,
      required this.transactionType,
      required this.timeofTransaction,
      required this.amount});

  static List<History> historyList() {
    return [
      History(
          id: '01',
          purchaseLocation: "SuperMarket",
          status: false,
          transactionType: true,
          timeofTransaction: "1",
          amount: 70),
      History(
          id: '02',
          purchaseLocation: "Hyper",
          status: true,
          transactionType: true,
          timeofTransaction: "2",
          amount: 50),
      History(
          id: '03',
          purchaseLocation: "Calvin Klein",
          status: false,
          transactionType: true,
          timeofTransaction: "3",
          amount: 30),
      History(
          id: '04',
          purchaseLocation: "Your Mama's",
          status: true,
          transactionType: true,
          timeofTransaction: "4",
          amount: 20),
    ];
  }
}
