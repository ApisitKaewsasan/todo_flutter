import 'package:get/get.dart';
import 'package:todo/controller/todo_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ToDoController());
  }

}