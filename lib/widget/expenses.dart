import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expensesList/expense_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
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

  void _onAddExpense(Expense expense) {
    setState(() {
      _registredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpense.indexOf(expense);
    setState(() {
      _registredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddModalOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _onAddExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No content here.try adding some!"),
    );

    if (_registredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('expense tracker'), actions: [
        IconButton(onPressed: _openAddModalOverlay, icon: const Icon(Icons.add))
      ]),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registredExpense),
                Expanded(child: mainContent)
              ],
            )
          : Expanded(
              child: Row(
                children: [
                  Chart(expenses: _registredExpense),
                  Expanded(child: mainContent)
                ],
              ),
            ),
    );
  }
}
