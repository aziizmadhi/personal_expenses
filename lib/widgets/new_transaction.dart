import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(
      this.addTx); //~ Accepts the privet function passing from "user_transactions"

  void onSubmit() {
    final titleText = titleController.text;
    final dAmount = double.parse(amountController.text);

    print("object");

    if (titleText.isEmpty || dAmount <= 0) {
      print("null values");
      return;
    }

    addTx(
      titleText,
      dAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //* "numberWithOptions(decimal: true)" so the IOS shows a decimal button
              onSubmitted: (_) => onSubmit(),
              //~ "(_)" means i 'the dev' get the data but i don't use it
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
              onPressed: () {
                onSubmit(); //! According to the tut this should not work it should be "onSubmit;"
              },
              //~ onPress send titleCon.. and amountCon.. to addNewTransaction function from "user_trans.." class
            ),
          ],
        ),
      ),
    );
  }
}
