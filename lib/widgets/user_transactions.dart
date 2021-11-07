import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1212',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'Car repair',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'blob',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'ter',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'erw Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'Weekly rwe',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'sdd Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1213',
      title: 'hdd Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(
            _userTransactions), //~ pass _userTransaction to "new_transactions" class
      ],
    );
  }
}
