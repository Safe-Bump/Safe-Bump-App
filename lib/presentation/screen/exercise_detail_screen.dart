import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';

class ExerciseDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;

  const ExerciseDetailPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        title: widget.title,
      ),
      body: Column(
        children: [
          Image.asset(widget.image),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
