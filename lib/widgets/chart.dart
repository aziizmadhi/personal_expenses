import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            //^ if the days match
            recentTransactions[i].date.month == weekDay.month &&
            //^ if the months match
            recentTransactions[i].date.year == weekDay.year) {
          //^ if it's the same year
          totalSum += recentTransactions[i].amount;
          //& if everything is true then add recent transactions to the total
        }
      }
      //print(DateFormat.E().format(weekDay) + ' : ' + totalSum.toString());
      //print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  Widget weekly() {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
              //~ if "totalSpending" = 0 return 0 else do the equation
              //~ to avoid division by 0
            }).toList(),
          ),
        ),
    );
  }

  Widget totalBalance() {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: const Text(
                'Total Balance',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$300,00',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Text(
              '+\$89.99',
              style: TextStyle(fontSize: 20 , color: Colors.green),
            )
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //& print(groupedTransactionValues); //for debugging
    return Container(
      height: 165, //~ Make this val dynamic
      child: ListView(
        // shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        padding: const EdgeInsets.only(top: 5),
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width, child: totalBalance()),
          //^ Replace with other widget Maybe monthly ? or what catogory are spent on the most
          SizedBox(width: MediaQuery.of(context).size.width, child: weekly()),
          //^ Replace weekly with total balance widget
          // SizedBox(width: MediaQuery.of(context).size.width, child: weekly()),
        ],
      ),
    );
  }
}
