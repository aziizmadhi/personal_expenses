import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,
      this.deleteTx); //~ this prepares the data to be recived

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: MediaQuery.of(context).size.height * 0.65,
      //& Lecture number 120 ^^
      //TODO make hight dynamic based on the screen size
      child: transactions.isEmpty //^ if
          ? Column(
              //^ true
              children: <Widget>[
                Text(
                  'No transactions yet',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  height: 400,
                  alignment: Alignment.bottomCenter,
                  child: Image.network(
                    'https://pngimg.com/uploads/futurama/futurama_PNG76.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              //^ false
              itemBuilder: (ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), //! play with it
                  ),
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  elevation: 0,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => deleteTx(transactions[index].id)),
                    //~ "() =>" alows me to pass an argument (transactions[index].id) in this case
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
