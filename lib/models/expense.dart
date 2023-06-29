import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

final uuid = const Uuid().v4();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icon(Icons.lunch_dining),
  Category.travel: Icon(Icons.flight_takeoff),
  Category.leisure: Icon(Icons.movie),
  Category.work: Icon(Icons.work)
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid;
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateFormatter {
    return formatter.format(date);
  }
}
