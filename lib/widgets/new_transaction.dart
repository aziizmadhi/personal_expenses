import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmit() {
    final titleText = _titleController.text;
    final dAmount = double.parse(_amountController.text);

    // print("object");

    if (titleText.isEmpty || dAmount <= 0) {
      print("null values");
      return;
    }

    widget.addTx(
      titleText,
      dAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
    //? i think for the popup card to disappere
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
    //'.then' function is like a cool delay/sleep
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        //? His solution for the problem SUCKS
        //TODO find another solution later
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //* "numberWithOptions(decimal: true)" so the IOS shows a decimal button
              onSubmitted: (_) => _onSubmit(),
              //~ "(_)" means i 'the dev' get the data but i don't use it
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : DateFormat.yMd().format(_selectedDate)),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          textStyle: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date')),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                _onSubmit();
                //! According to the tut this should not work it should be "_onSubmit;"
              },
              //~ onPress send titleCon.. and amountCon.. to addNewTransaction function from "user_trans.." class
              //? How did this button get to be on the right of the page ?
            ),
          ],
        ),
      ),
    );
  }
}
