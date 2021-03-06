import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.lable, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 15,
                //~ to fix the bar hight if the text above is too small
                child: FittedBox(
                    //^ fitted box is amazing
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
              ),
              SizedBox(
                //!research what sizedbox is
                height: 2,
              ),
              //TODO while implementing lecture number 122 the ui crashed
              // IOS ponted to a container here and android pointed to the scaffuld in the main class
              Container(
                height: 60, // make this val dynamic
                width: 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor, //* Bar Color
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(lable)
            ],
          ),
        );
      },
    );
  }
}
