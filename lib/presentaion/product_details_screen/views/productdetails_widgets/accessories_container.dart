import 'package:flutter/material.dart';

class AccessoriesContainer extends StatelessWidget {
  const AccessoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
                "Accessory No. 1002 Part No: 800521 Roller support frame to support longer pipes, height adjustable."),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
