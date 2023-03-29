import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import '../widgets/exercise_card.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _currentTrimester = 1;

  List<Map<String, dynamic>> _firstTrimesterExercises = [
    {
      'title': 'Pelvic tilts',
      'description':
          'Pelvic tilts strengthen the muscles in your abdomen and help alleviate lower back pain.',
      'image': 'assets/img.png',
    },
    {
      'title': 'Kegel exercises',
      'description':
          'Kegel exercises strengthen your pelvic floor muscles, which support your uterus, bladder, and bowel.',
      'image': 'assets/img.png',
    },
  ];

  List<Map<String, dynamic>> _secondTrimesterExercises = [
    {
      'title': 'Squats',
      'description':
          'Squats can help prepare your body for childbirth by strengthening your pelvic floor muscles and legs.',
      'image': 'assets/img.png',
    },
    {
      'title': 'Lunges',
      'description':
          'Lunges can help improve your balance and strengthen your legs and core muscles.',
      'image': 'assets/img.png',
    },
  ];

  List<Map<String, dynamic>> _thirdTrimesterExercises = [
    {
      'title': 'Cat-cow stretch',
      'description':
          'The cat-cow stretch helps relieve lower back pain and stretches the muscles in your back and abdomen.',
      'image': 'assets/img.png',
    },
    {
      'title': 'Seated forward bend',
      'description':
          'The seated forward bend can help relieve tension in your back and stretch your hamstrings.',
      'image': 'assets/img.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        title: "Exercise",
        trailingWidget: null,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "1st Trimester",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentTrimester = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor:
                            _currentTrimester == 1 ? Colors.white : Colors.grey,
                        backgroundColor:
                            _currentTrimester == 1 ? Colors.pink : Colors.white,
                        fixedSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "2nd Trimester",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentTrimester = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor:
                            _currentTrimester == 2 ? Colors.white : Colors.grey,
                        backgroundColor:
                            _currentTrimester == 2 ? Colors.pink : Colors.white,
                        fixedSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "3rd Trimester",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentTrimester = 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor:
                            _currentTrimester == 3 ? Colors.white : Colors.grey,
                        backgroundColor:
                            _currentTrimester == 3 ? Colors.pink : Colors.white,
                        fixedSize: Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ..._getExercisesList(_currentTrimester),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getExercisesList(int trimester) {
    List<Map<String, dynamic>> exercises;
    switch (trimester) {
      case 1:
        exercises = _firstTrimesterExercises;
        break;
      case 2:
        exercises = _secondTrimesterExercises;
        break;
      case 3:
        exercises = _thirdTrimesterExercises;
        break;
      default:
        exercises = [];
    }
    return exercises
        .map(
          (exercise) => GestureDetector(
            onTap: (){},
            child: ExerciseCard(
                title: exercise['title'],
                description: exercise['description'],
                image: exercise['image']),
          ),
        )
        .toList();
  }
}
