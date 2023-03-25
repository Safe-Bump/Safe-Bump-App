import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:safe_bump/utils/asset_helper.dart';
import 'package:sizer/sizer.dart';

class TimelineView extends StatelessWidget {
  List<List<String>> weeks = [
    [
      'Week 1',
      'This week is counted as part of your 40-week pregnancy, even though your baby hasn’t been conceived yet. This week is actually the first week of your menstrual period, which is used to calculate your expected birth date (EDD or EDB). Your body is preparing for ovulation, which will occur around two weeks from now.'
    ],
    [
      'Week 2',
      'Your body is preparing for ovulation. This is the week when you will likely conceive if you have intercourse during your fertile window.'
    ],
    [
      'Week 3',
      'You may have conceived at the end of last week or at the beginning of this week. Your baby is now a cluster of cells, and will soon implant into the lining of your uterus.'
    ],
    [
      'Week 4',
      'Your baby is now the size of a poppy seed. Your baby\'s heart begins to beat.'
    ],
    [
      'Week 5',
      'Your baby is now the size of a sesame seed. Your baby\'s brain and spinal cord begin to form.'
    ],
    [
      'Week 6',
      'Your baby is now the size of a lentil. Your baby\'s eyes and ears begin to form. Your baby\'s organs start to develop.'
    ],
    [
      'Week 7',
      'Your baby is now the size of a blueberry. Your baby\'s arms and legs begin to form.'
    ],
    [
      'Week 8',
      'Your baby is now the size of a raspberry. Your baby\'s heart is fully formed.'
    ],
    [
      'Week 9',
      'Your baby is now the size of a cherry. Your baby\'s vital organs are now fully formed.'
    ],
    [
      'Week 10',
      'Your baby is now the size of a kumquat. Your baby can now swallow and will start producing urine.'
    ],
    [
      'Week 11',
      'Your baby is now the size of a lime. Your baby can now make facial expressions.'
    ],
    [
      'Week 12',
      'Your baby is now the size of a plum. Your baby\'s digestive system is starting to work.'
    ],
    [
      'Week 13',
      'Your baby is now the size of a peach. Your baby\'s fingerprints are now formed.'
    ],
    [
      'Week 14',
      'Your baby is now the size of a lemon. Your baby\'s hair and eyebrows are starting to grow.'
    ],
    [
      'Week 15',
      'Your baby is now the size of an apple. Your baby can now sense light.'
    ],
    [
      'Week 16',
      'Your baby is now the size of an avocado. Your baby can now hear sounds from outside the womb.'
    ],
    [
      'Week 17',
      'Your baby is now the size of a turnip. Your baby\'s skeleton is starting to harden.'
    ],
    [
      'Week 18',
      'Your baby is now the size of a sweet potato. Your baby\'s movements are becoming more coordinated.'
    ],
    [
      'Week 19',
      'Your baby is now the size of a mango. Your baby\'s skin is becoming more opaque.'
    ],
    [
      'Week 20',
      'Your baby is now the size of a banana. You are now halfway through your pregnancy.'
    ],
    [
      'Week 21',
      'Your baby is now the size of a carrot. Your baby can now taste what you eat.'
    ],
    [
      'Week 22',
      'The fetus is around 21 cm in length. The ears are fully functioning and can hear muffled sounds from the outside world. The fingertips have prints. The genitals can now be distinguished with an ultrasound scan.'
    ],
    [
      'Week 23',
      'The fetus is around 21 cm in length. The ears are fully functioning and can hear muffled sounds from the outside world. The fingertips have prints. The genitals can now be distinguished with an ultrasound scan.'
    ],
    [
      'Week 24',
      'The fetus is around 33 cm in length. The fused eyelids now separate into upper and lower lids, enabling the baby to open and shut its eyes. The skin is covered in fine hair (lanugo) and protected by a layer of waxy secretion (vernix). The baby makes breathing movements with its lungs.'
    ],
    [
      'Week 25',
      'The fetus is around 33 cm in length. The fused eyelids now separate into upper and lower lids, enabling the baby to open and shut its eyes. The skin is covered in fine hair (lanugo) and protected by a layer of waxy secretion (vernix). The baby makes breathing movements with its lungs.'
    ],
    [
      'Week 26',
      'The fetus is around 33 cm in length. The fused eyelids now separate into upper and lower lids, enabling the baby to open and shut its eyes. The skin is covered in fine hair (lanugo) and protected by a layer of waxy secretion (vernix). The baby makes breathing movements with its lungs.'
    ],
    [
      'Week 27',
      'The fetus is around 33 cm in length. The fused eyelids now separate into upper and lower lids, enabling the baby to open and shut its eyes. The skin is covered in fine hair (lanugo) and protected by a layer of waxy secretion (vernix). The baby makes breathing movements with its lungs.'
    ],
    [
      'Week 28',
      'Your baby now weighs about 1 kg (1,000 g) or 2 lb 2oz (2 pounds, 2 ounces) and measures about 25 cm (10 inches) from crown to rump. The crown-to-toe length is around 37 cm. The growing body has caught up with the large head and the baby now seems more in proportion.'
    ],
    [
      'Week 29',
      'Your baby now weighs about 1 kg (1,000 g) or 2 lb 2oz (2 pounds, 2 ounces) and measures about 25 cm (10 inches) from crown to rump. The crown-to-toe length is around 37 cm. The growing body has caught up with the large head and the baby now seems more in proportion.'
    ],
    [
      'Week 30',
      'Your baby now weighs about 1 kg (1,000 g) or 2 lb 2oz (2 pounds, 2 ounces) and measures about 25 cm (10 inches) from crown to rump. The crown-to-toe length is around 37 cm. The growing body has caught up with the large head and the baby now seems more in proportion.'
    ],
    [
      'Week 31',
      'Your baby now weighs about 1 kg (1,000 g) or 2 lb 2oz (2 pounds, 2 ounces) and measures about 25 cm (10 inches) from crown to rump. The crown-to-toe length is around 37 cm. The growing body has caught up with the large head and the baby now seems more in proportion.'
    ],
    [
      'Week 32',
      'The baby spends most of its time asleep. Its movements are strong and coordinated. It has probably assumed the ‘head down’ position by now, in preparation for birth.'
    ],
    [
      'Week 33',
      'The baby spends most of its time asleep. Its movements are strong and coordinated. It has probably assumed the ‘head down’ position by now, in preparation for birth.'
    ],
    [
      'Week 34',
      'The baby spends most of its time asleep. Its movements are strong and coordinated. It has probably assumed the ‘head down’ position by now, in preparation for birth.'
    ],
    [
      'Week 35',
      'The baby spends most of its time asleep. Its movements are strong and coordinated. It has probably assumed the ‘head down’ position by now, in preparation for birth.'
    ],
    [
      'Week 36',
      'The baby is around 46 cm in length. It has probably nestled its head into its mother’s pelvis, ready for birth. If it is born now, its chances for survival are excellent. Development of the lungs is rapid over the next few weeks.'
    ],
    [
      'Week 37',
      'The baby is around 46 cm in length. It has probably nestled its head into its mother’s pelvis, ready for birth. If it is born now, its chances for survival are excellent. Development of the lungs is rapid over the next few weeks.'
    ],
    [
      'Week 38',
      'The baby is around 46 cm in length. It has probably nestled its head into its mother’s pelvis, ready for birth. If it is born now, its chances for survival are excellent. Development of the lungs is rapid over the next few weeks.'
    ],
    [
      'Week 39',
      'The baby is around 46 c] in length. It has probably nestled its head into its mother’s pelvis, ready for birth. If it is born now, its chances for survival are excellent. Development of the lungs is rapid over the next few weeks.'
    ],
    [
      'Week 40',
      'The baby is around 46 cm in length. It has probably nestled its head into its mother’s pelvis, ready for birth. If it is born now, its chances for survival are excellent. Development of the lungs is rapid over the next few weeks.'
    ],
  ];
  int ongoingWeek = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeBumpAppBar(
        title: "Timeline",
        trailingWidget: Icon(Icons.more_vert),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: weeks.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 5.w,
                    child: SvgPicture.asset(
                      AssetsHelper.timelineIndicator,
                      color: i == ongoingWeek ? Colors.pink : Color(0xFFFFCDD2),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weeks[i][0],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 83.w,
                        child: Text(
                          weeks[i][1],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
