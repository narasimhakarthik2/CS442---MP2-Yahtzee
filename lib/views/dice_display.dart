import 'package:flutter/material.dart';
import 'package:mp2/views/widgets/dice/dice_row.dart';
import 'package:mp2/views/widgets/roll_button.dart';

class DiceDisplay extends StatelessWidget {
  final List<int?> diceValues;
  final Function() onRoll;
  final List<bool> heldList;
  final Function(List<bool>) onHoldChanged;
  final int rollCount;
  final int maxRolls;

  const DiceDisplay({
    Key? key,
    required this.diceValues,
    required this.onRoll,
    required this.heldList,
    required this.onHoldChanged,
    required this.rollCount,
    required this.maxRolls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        DiceRow(values: diceValues, heldList: heldList, onHoldChanged: onHoldChanged),
        SizedBox(height: 20),
        RollButton(onPressed: onRoll, rollCount: rollCount, maxRolls: maxRolls),
      ],
    );
  }
}