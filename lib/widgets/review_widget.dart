import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flowershop/data/reviews.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  int currentReviewIndex = 0;
  Timer? reviewTimer;

  @override
  void initState() {
    super.initState();

    reviewTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted) {
        setState(() {
          currentReviewIndex = (currentReviewIndex + 1) % reviews.length;
        });
      }
    });
  }

  @override
  void dispose() {
    reviewTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final review = reviews[currentReviewIndex];

    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      child: Card(
        color: AppTheme.darkSlate.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Icon(
                      Icons.favorite,
                      color: AppTheme.driedBlood,
                      size: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                '"${review.content}"',
                style: AppTextStyles.cardbodysmall(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                "- ${review.displayAuthor}",
                style: AppTextStyles.cardbodyboldsmall(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
