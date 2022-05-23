import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:todo/models/todo_model.dart';

import '../routes/app_pages.dart';

class TaskListView extends GetView<ToDoController> {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, left: 15),
              child: Hero(
                tag: "work",
                child: ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(Routes.workList);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      primary: Colors.blueAccent, // <-- Splash color
                      elevation: 1),
                  child: const Icon(Icons.work, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ObxValue<Rx<ToDoModel>>((item) {
              return Container(
                margin: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${item.value.item.length} Tasks",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black.withOpacity(0.5))),
                    const SizedBox(height: 5),
                    const Text("Works",
                        style: TextStyle(fontSize: 30, color: Colors.grey)),
                    const SizedBox(height: 15),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.grey.withOpacity(0.7),
                          inactiveTrackColor: const Color(0xFFE6EAEE),
                          thumbColor: Colors.black,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0),
                          overlayShape: SliderComponentShape.noThumb),
                      child: Slider(
                        value: controller.percent.toDouble(),
                        min: 0,
                        max: 100,
                        onChanged: (double value) {},
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text("${controller.percent}% to complete",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black.withOpacity(0.5))),
                    item.value.item.isNotEmpty
                        ? Column(
                            children: item.value.item
                                .asMap()
                                .map((key, value) => MapEntry(
                                    key,
                                    Column(
                                      children: [
                                        CheckboxListTile(
                                            value: value.status,
                                            activeColor: Colors.blueAccent,
                                            title: Text(value.title),
                                            controlAffinity:
                                            ListTileControlAffinity.leading,
                                            onChanged: (x) {
                                                controller.updateList(status: x ?? false,index: key);
                                            },contentPadding: EdgeInsets.zero,),
                                        const Divider()
                                      ],
                                    )))
                                .values
                                .toList(),
                          )
                        : Container(
                      margin: EdgeInsets.only(top: Get.height/4),
                          child: const Center(
                              child: Text("Add your first tasks",style: TextStyle(color: Colors.grey),),
                            ),
                        ),
                  ],
                ),
              );
            }, controller.todoList)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.addTaskList);
        },
      ),
    );
  }
}
