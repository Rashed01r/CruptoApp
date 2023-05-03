import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class NameCoins extends StatelessWidget {
  final String symbol;
  const NameCoins({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double left = MediaQuery.of(context).viewInsets.left;
    double font = MediaQuery.textScaleFactorOf(context);

    return Container(
      width: width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height / 40,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: left + 15,
            ),
            child: Text(
              symbol,
              style: TextStyle(
                color: Colors.white,
                fontSize: font + 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
