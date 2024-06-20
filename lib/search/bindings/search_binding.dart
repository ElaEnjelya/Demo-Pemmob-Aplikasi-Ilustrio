import 'package:commission_art_app2/detail/controller/detail.controller.dart';
import 'package:commission_art_app2/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchFeatureController());
    
  }
}
