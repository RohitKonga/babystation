import 'package:babystation/features/ui/home%20page%20module/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Daanish Sodhi",
      "imageUrl": "assets/images/boy.png",
      "rating": 3.0,
      "date": "20 Sep, 2023",
      "comment":
          "These bodysuits feel incredibly soft and breathable. The fabric doesn’t irritate my baby’s skin, humid weather.",
    },
    {
      "name": "Kim Sabharwal",
      "imageUrl": "assets/images/girl.png",
      "rating": 5.0,
      "date": "23 Sep, 2023",
      "comment":
          "These bodysuits feel incredibly soft and breathable. The fabric doesn’t irritate my baby’s skin, humid weather.",
    },
  ];
  int _selectedStarFilter = 5;
  List num = [5, 4, 3, 2, 1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF9C278F),
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: num.map((star) {
                    bool isSelected = _selectedStarFilter == star;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStarFilter = star;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF9C278F)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.orange),
                            const SizedBox(width: 8),
                            Text(
                              star.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return buildReviewCard(
                  review['name'],
                  review['imageUrl'],
                  review['rating'],
                  review['date'],
                  review['comment'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
