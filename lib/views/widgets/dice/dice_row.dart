import 'package:flutter/material.dart';
import 'dice_image.dart';

class DiceRow extends StatelessWidget {
  final List<int?> values;
  final List<bool> heldList;
  final Function(List<bool>) onHoldChanged;

  const DiceRow({Key? key, required this.values, required this.heldList, required this.onHoldChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        values.length,
            (index) => DiceImage(value: values[index], held: heldList[index], onHoldChanged: (held) {
          heldList[index] = held;
          onHoldChanged(heldList);
        }),
      ),
    );
  }
}
