
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expensesList/expense_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpense = [
    Expense(
        title: 'flutter course',
        amount: 69.69,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 22.12,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Title(color:Colors.white, child: const Text('Expense Tracker')),
        TextButton(onPressed: (){}, child:const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          const Text('expense chart'),
          Expanded(
            child: ExpenseList(expenses: _registredExpense),
          )
        ],
      ),
    );
  }
}
