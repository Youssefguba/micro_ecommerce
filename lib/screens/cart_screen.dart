import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 60fps
    return Container(
      color: Colors.orange,
      height: MediaQuery.sizeOf(context).height * 0.33,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Text(runtimeType.toString()),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Text(runtimeType.toString()),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              child: Text(runtimeType.toString()),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _testWidget() {
  // }
}
