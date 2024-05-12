import 'package:flutter/material.dart';

class RollButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int rollCount;
  final int maxRolls;

  const RollButton({
    Key? key,
    required this.onPressed,
    required this.rollCount,
    required this.maxRolls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: rollCount < maxRolls ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade500,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        icon: Image.asset(
          'assets/images/dice_icon.png',
          width: 32,
          height: 32,
        ),
        label: Text(

          'Roll Dice (${maxRolls - rollCount} left)',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}