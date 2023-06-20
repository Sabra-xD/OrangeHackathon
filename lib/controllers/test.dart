import 'package:get/get.dart';

class test extends GetxController {
  double Balance = 5000;
  void decrease(int amount) {
    Balance = Balance - amount;
    print(Balance);
    update();
  }
}
