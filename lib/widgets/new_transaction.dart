import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx); //~ Accepts the privet function passing from "user_transactions"

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              //~ onPress send titleCon.. and amountCon.. to addNewTransaction function from "user_trans.." class
              
            ),
          ],
        ),
      ),
    );
  }
}
