import 'package:get/get.dart';
import 'package:todo/binding/home_binding.dart';
import 'package:todo/main.dart';
import 'package:todo/page/home_view.dart';
import 'package:todo/page/tasklist_view.dart';

import '../page/add_task_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const init = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
     binding: HomeBinding(),
        transition: Transition.fade

    ),
    GetPage(
      name: Routes.taskList,
      page: () => const TaskListView(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: Routes.addTaskList,
      page: () => const AddTaskView(),
      transition: Transition.fade

    ),
  ];
}