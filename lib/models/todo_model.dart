
class ToDoModel {
  late List<ToDoItem> item;

  ToDoModel({required this.item});

  ToDoModel.fromJson(Map<dynamic, dynamic> json) {

    if (json['item'] != null) {
      item = <ToDoItem>[];
      json['item'].forEach((v) {
        item.add(ToDoItem.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['item'] = item.map((v) => v.toJson()).toList();
    return data;
  }
}

class ToDoItem {
  late String title;
  late bool status;

  ToDoItem({required this.title, required this.status});

  ToDoItem.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    status = json['status'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
