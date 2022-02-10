import 'package:jcoffee_app/models/coffee_model.dart';
import 'package:get/get.dart';
import 'package:jcoffee_app/services/coffee_services.dart';
class JCoffeeController extends GetxController {
  List<JCoffeeModel?>? list;
  List<JCoffeeModel?>? get coffee => list;
  final index = 0.obs;
  final front = 0.obs;
  RxBool hide=false.obs;
  @override
  void onInit() async {
    list= await CoffeeService().getCoffees();
    print(list);
    update();
    super.onInit();
  }
  
}