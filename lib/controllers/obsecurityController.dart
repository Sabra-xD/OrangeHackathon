import 'package:get/get.dart';

class obsecurityController extends GetxController {
  bool obsecure = true;
  void invertObsecurity() {
    obsecure = !obsecure;
    update();
  }
}
