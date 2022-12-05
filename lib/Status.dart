import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/addimage.dart';
import 'package:flutter_application_1/viewproducts.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        children: [
          InkWell(
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            }),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Add Product",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => view()));
            }),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Center(
                child: Text(
                  "View Product",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
