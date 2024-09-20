import 'package:get/get.dart';

import 'desc_logic.dart';

class DescBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
