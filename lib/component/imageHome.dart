import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageHome extends StatelessWidget {
  final String image;
  ImageHome({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double left = MediaQuery.of(context).viewInsets.left;

    return Container(
        height: height / 10,
        width: width / 5,
        margin: EdgeInsets.only(left: left + 15),
        child: CircleAvatar(
          backgroundColor: Colors.black54,
          child: Text(
            "$image".substring(0, 3),
            style: TextStyle(color: Colors.amber, fontSize: 15),
          ),
        ));
  }
}
