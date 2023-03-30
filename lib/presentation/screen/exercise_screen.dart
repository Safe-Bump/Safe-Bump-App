import 'package:flutter/material.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import '../widgets/exercise_card.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _currentTrimester = 1;

  List<Map<String, dynamic>> _firstTrimesterExercises = [
    {
      'title': 'Walking',
      'description':
          'Walking is a great low-impact exercise that can help maintain fitness during the first trimester. Its easy to do and can be done anywhere.',
      'image': AssetsHelper.walking,
    },
    {
      'title': 'Swimming',
      'description':
          'Swimming is a safe and low-impact exercise that can help alleviate pregnancy-related discomforts such as back pain and swollen ankles.',
      'image': AssetsHelper.swimming,
    },
    {
      'title': 'Yoga',
      'description':
          'Yoga is a gentle form of exercise that can help improve flexibility, balance, and strength. Its also a great way to reduce stress and improve sleep.',
      'image': AssetsHelper.yoga,
    },
    {
      'title': 'Strength training',
      'description':
          'Strength training with light weights or resistance bands can help maintain muscle tone and prepare the body for the physical demands of pregnancy.',
      'image': AssetsHelper.strength_training,
    },
    {
      'title': 'Stretching',
      'description':
          'Gentle stretching can help alleviate muscle tension and improve flexibility during the first trimester.',
      'image': AssetsHelper.stretching,
    },
    {
      'title': 'Kegels',
      'description':
          'Kegel exercises can help strengthen the pelvic floor muscles, which can be weakened during pregnancy and childbirth.',
      'image': AssetsHelper.kegels,
    }
  ];

  List<Map<String, dynamic>> _secondTrimesterExercises = [
    {
      'title': 'Prenatal Pilates',
      'description':
          'Pilates is a great way to strengthen your core and improve your posture during pregnancy. Prenatal Pilates classes are designed to be safe and effective for expectant mothers.',
      'image': AssetsHelper.prenatal_pilates,
    },
    {
      'title': 'Low-impact aerobics',
      'description':
          'Low-impact aerobics can help improve cardiovascular fitness and maintain muscle tone. Its important to choose a class specifically designed for pregnant women.',
      'image': AssetsHelper.low_impact_aerobics,
    },
    {
      'title': 'Stationary cycling',
      'description':
          'Stationary cycling is a low-impact exercise that can help improve cardiovascular fitness and strengthen leg muscles.',
      'image': AssetsHelper.stationary_cycling,
    },
    {
      'title': 'Dancing',
      'description':
          'Dancing is a fun and low-impact way to improve cardiovascular fitness and maintain muscle tone during pregnancy.',
      'image': AssetsHelper.dancing,
    },
    {
      'title': 'Squats',
      'description':
          'Squats can help strengthen the legs and prepare the body for the physical demands of labor and delivery.',
      'image': AssetsHelper.squats,
    }
  ];

  List<Map<String, dynamic>> _thirdTrimesterExercises = [
    {
      'title': 'Prenatal yoga',
      'description':
          'Prenatal yoga can help prepare the body for labor and delivery by improving flexibility and strength. Its also a great way to reduce stress and improve sleep.',
      'image': AssetsHelper.prenatal_yoga,
    },
    {
      'title': 'Swimming',
      'description':
          'Swimming is a great exercise during the third trimester because it reduces stress on the joints and can help alleviate discomforts such as back pain and swollen ankles.',
      'image': AssetsHelper.swimming,
    },
    {
      'title': 'Walking',
      'description':
          'Walking is a safe and easy way to maintain fitness during the third trimester. It can also help prepare the body for labor by improving endurance.',
      'image': AssetsHelper.walking,
    },
    {
      'title': 'Pelvic tilts',
      'description':
          'Pelvic tilts can help alleviate back pain and improve posture during the third trimester.',
      'image': AssetsHelper.pelvic_tilts,
    },
    {
      'title': 'Wall push-ups',
      'description':
          'Wall push-ups can help maintain upper body strength and prepare the body for the physical demands of labor and delivery.',
      'image': AssetsHelper.wall_push_ups,
    },
    {
      'title': 'Modified planks',
      'description':
          'Modified planks can help strengthen the core muscles and prepare the body for pushing during labor.',
      'image': AssetsHelper.modified_planks,
    }
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
            onTap: () {},
            child: ExerciseCard(
                title: exercise['title'],
                description: exercise['description'],
                image: exercise['image']),
          ),
        )
        .toList();
  }
}
