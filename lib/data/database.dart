import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List toDoList = [];
  final myBox = Hive.openBox('myBox');
}