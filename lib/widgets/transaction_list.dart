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
    return Column(
      children: [
        Text('Transactions'),
        Container(
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height * 0.75,
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
                  //^ id above statment is false
                  itemBuilder: (ctx, index) {
                    
                    // return Card(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.circular(10.0), //! play with it
                    //     ),
                    //     margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    //     elevation: 0,
                    //     child: 
                        return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) , color:Colors.amber),
                              //* set color based on type
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: FittedBox(
                                  child: FittedBox(
                                      child: Icon(
                                    Icons.directions_car,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                            title: Text(transactions[index].title),
                            subtitle: Text(
                              DateFormat.yMMMd().format(transactions[index].date),
                            ),
                            trailing: Text(
                              '\$${transactions[index].amount}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600 , color: Colors.green),
                              //TODO if Transaction is additive color = green and a '+' is added at the start
                              //TODO if transaction is subtracted color = red and a '-' is added at the start  
                            ));
                  },
                  itemCount: transactions.length,
                ),
        ),
      ],
    );
  }
}
