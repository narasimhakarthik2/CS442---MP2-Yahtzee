import 'dart:math';
import 'package:flutter/material.dart';
import '../models/scorecard.dart';
import 'dice_display.dart';
import 'scorecard_display.dart';

class Yahtzee extends StatefulWidget {
  const Yahtzee({Key? key}) : super(key: key);

  @override
  _YahtzeeState createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  List<int?> diceValues = [null, null, null, null, null];
  List<bool> heldList = [false, false, false, false, false];
  int rollCount = 0;
  final int maxRolls = 3;
  final ScoreCard scoreCard = ScoreCard();

  void rollDice() {
    setState(() {
      if (rollCount < maxRolls) {
        rollCount++;
        for (int i = 0; i < diceValues.length; i++) {
          if (!heldList[i]) {
            diceValues[i] = _generateRandomValue();
          }
        }
      }
    });
  }

  int _generateRandomValue() {
    return Random().nextInt(6) + 1;
  }

  void toggleHold(int index) {
    setState(() {
      heldList[index] = !heldList[index];
    });
  }

  void selectCategory(ScoreCategory category) {
    if(diceValues.any((value) => value != null)){
      scoreCard.registerScore(context, category, diceValues.where((value) => value != null).map((value) => value!).toList());
      setState(() {
        rollCount = 0;
        diceValues = [null, null, null, null, null];
        heldList = [false, false, false, false, false];
      });
      checkGameEnd();
    }
  }

  void checkGameEnd() {
    if (scoreCard.allCategoriesFilled()) {
      final totalScore = scoreCard.total;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              width: 500,
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Game Over',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Final Score: $totalScore',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset game state
                        diceValues = [null, null, null, null, null];
                        heldList = [false, false, false, false, false];
                        rollCount = 0;
                        scoreCard.clear();
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text(
                            'Play Again',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yahtzee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiceDisplay(
                diceValues: diceValues,
                onRoll: rollDice,
                heldList: heldList,
                onHoldChanged: (List<bool> newHeldList) {
                  setState(() {
                    heldList = newHeldList;
                  });
                },
                rollCount: rollCount,
                maxRolls: maxRolls,
              ),
              ScoreCardDisplay(
                scoreCard: scoreCard,
                onCategorySelected: selectCategory,
              ),
            ],
          ),
        ),
      ),
    );
  }
}