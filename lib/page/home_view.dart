import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:todo/models/todo_model.dart';

import '../routes/app_pages.dart';

class HomeView extends GetView<ToDoController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("TODO"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ObxValue<Rx<ToDoModel>>((item){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    primary: Colors.blueAccent, // <-- Splash color
                    elevation: 1),
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello, John",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  const SizedBox(height: 10),
                  const Text("Look like feel good.",
                      style: TextStyle(fontSize: 11, color: Colors.white)),
                   Text("You have ${item.value.item.length} to do to today",
                      style: TextStyle(fontSize: 11, color: Colors.white)),
                  const SizedBox(height: 20),
                  Text("TODAY : ${Jiffy().yMMMMd}",
                      style:
                      const TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  width: Get.width,
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 15, top: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16, left: 5),
                          child: Hero(
                            tag: "work",
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.taskList);
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
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${item.value.item.length} Tasks",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black.withOpacity(0.5))),
                              const SizedBox(height: 5),
                              const Text("Work",
                                  style:
                                  TextStyle(fontSize: 30, color: Colors.grey)),
                              const SizedBox(height: 15),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.grey,
                                    inactiveTrackColor: const Color(0xFFE6EAEE),
                                    thumbColor: Colors.black,
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                                    overlayShape: SliderComponentShape.noThumb
                                ),

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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        );
      },controller.todoList) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
