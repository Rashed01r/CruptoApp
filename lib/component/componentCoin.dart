import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ComponentCoin extends StatelessWidget {
  final String valumeCoin;
  final String priceChange;

  final String bidPrice;

  const ComponentCoin(
      {super.key,
      required this.valumeCoin,
      required this.priceChange,
      required this.bidPrice});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double font = MediaQuery.textScaleFactorOf(context);
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: top + 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valumeCoin.substring(0, 6),
              style: TextStyle(
                color: Colors.black,
                fontSize: font + 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              priceChange.substring(0, 9),
              style: TextStyle(
                color:
                    double.parse(priceChange) < 0 ? Colors.red : Colors.green,
                fontSize: font + 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              bidPrice.substring(0, 9),
              style: TextStyle(
                color: double.parse(bidPrice) < 0 ? Colors.red : Colors.green,
                fontSize: font + 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
