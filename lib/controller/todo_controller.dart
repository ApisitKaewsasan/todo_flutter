import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/models/todo_model.dart';

class ToDoController extends GetxController{

  TextEditingController inputToDo = TextEditingController();

  Rx<ToDoModel> todoList = ToDoModel(item: []).obs;


   Box todoBox = Hive.box("todo");


  insertList({required String message}){
     todoList.value.item.add(ToDoItem(title: message,status: false));
     todoBox.put('todo', todoList.toJson());
     todoList.refresh();
     Get.back();
   }

   updateList({required bool status,required int index}){
     todoList.value.item[index].status = status;
      todoBox.put('todo', todoList.toJson());
      todoList.refresh();

   }

   int get percent{
     if(todoList.value.item.where((p0) => p0.status == true).toList().isNotEmpty){
       return ((100/todoList.value.item.length)*(todoList.value.item.where((p0) => p0.status == true).toList().length)).toInt();
     }else{
       return 0;
     }
   }


   initTodo()async{
    if(todoBox.get('todo')!=null){
      ToDoModel data =  ToDoModel.fromJson(todoBox.get('todo'));
      todoList.value = data;
    }
   }
  @override
  void onInit() {
    super.onInit();

    initTodo();
  }
}