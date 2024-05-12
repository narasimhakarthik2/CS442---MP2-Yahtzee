import 'package:flutter/material.dart';
import '../models/scorecard.dart';

class ScoreCardDisplay extends StatelessWidget {
  final ScoreCard scoreCard;
  final Function(ScoreCategory) onCategorySelected;

  const ScoreCardDisplay({
    Key? key,
    required this.scoreCard,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Score Card',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              _buildCategoryCard(ScoreCategory.ones),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.twos),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.threes),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCategoryCard(ScoreCategory.fours),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.fives),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.sixes),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCategoryCard(ScoreCategory.threeOfAKind),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.fourOfAKind),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.fullHouse),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCategoryCard(ScoreCategory.smallStraight),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.largeStraight),
              SizedBox(width: 10),
              _buildCategoryCard(ScoreCategory.yahtzee),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCategoryCard(ScoreCategory.chance),
            ],
          ),
          SizedBox(height: 20),
          _buildTotalScoreCard(),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(ScoreCategory category) {
    final score = scoreCard[category];
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onCategorySelected(category);
        },
        child: Card(
          child: Container(
            width: 80, // Adjust the width as needed
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${category.name}: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 16),
                Text(
                  score != null ? score.toString() : '-',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalScoreCard() {
    int totalScore = scoreCard.total;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Score: ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 8),
            Text(
              totalScore.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}