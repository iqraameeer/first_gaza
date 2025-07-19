import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

import '../../widget/text_bullet_widget.dart';

class ChildWeek03DetailScreen extends StatelessWidget {
  // final int selectedWeek;
  final int selectedDay;

  ChildWeek03DetailScreen({
    Key? key,
    // required this.selectedWeek,
    required this.selectedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RadialBackground(),
          SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: ColorsConstant.btnlogin,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 10),
                          child: Text(
                            selectedDay == 1
                                ? "مسئلہ :زخمی یا پھٹی ہو ئی نپل"
                                : selectedDay == 3
                                    ? "ماں کا دودھ پلانے کے لئے   صفائی کی  چند احتیاطی تدابیر"
                                    : selectedDay == 5
                                        ? "بچے کی صفائی کے بارے میں معلومات"
                                        : "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                height: 2,
                                color: ColorsConstant.textColor,
                                fontFamily: 'NotoNastaliqUrdu',
                                fontWeight: FontWeight.w600),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Adding space after the AppBar
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildContentForSelectedDay(selectedDay),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // Function to build content based on selected week and day
  Widget _buildContentForSelectedDay(int day) {
    if (day == 1) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "امید کرتے ہیں آپ کا دن اچھا گزر رہا ہوگا۔ بچے کو دودھ پلانے کے ابتدائی دنوں میں نپل پر زخم آسکتا ہے۔ گھبرائیں نہیں، اس سے احتیاط ممکن ہے۔ کوشش کریں بچے کو بھوک کی ابتدائی علامات میں دودھ پلائیں۔ جب بچے کو بھوک کی شدت زیادہ ہونے پر دودھ پلایا جاتا ہے تو بچہ زیادہ تیزی اور جوش سے نپل چوستا ہے جس کی وجہ سے زخم ہونے کا امکان بڑھتا ہے۔\n\n"
              "آپ کی رہنمائی کے لیے کچھ احتیاطی تدابیر یہ ہیں:",
              style: TextStyle(fontSize: 20, fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            BulletList(items: [
              "ہمیشہ بچے کو دونوں چھاتیوں سے باری باری دودھ پلائے۔",
              "دودھ پلانے کے دوران اپنی چھاتیوں کو ہوا لگنے دے۔",
              "اس دوران ایک ڈھیلا ڈھالا بلاؤز استعمال کرے جس میں سے ہوا کا اچھے طریقے سے گزر ہوتا ہو۔",
              "کاٹن کے کپڑے استعمال کرے کیونکہ یہ نپل کو خشک کرنے میں معاون ثابت ہوتے ہیں۔",
              "چھاتیوں پر لگا ہوا بچے کا تھوک ، پانی کی مدد سے صاف کریں۔",
              "چھاتیوں کو مکمل طور پر خشک ہونے دیں۔",
              "جب نپل خشک ہو جائیں تو اپنی چھاتیوں کا دودھ نپلوں پر لگائیں تاکہ نپل میں  زخم نہ ہوں۔",
              "یہ تدابیر آپ کو زخم سے بچانے میں مددگار ثابت ہو سکتی ہیں۔ اگر زخم بڑھ جائے یا درد زیادہ ہو تو ڈاکٹر سے مشورہ کریں۔",
            ]),
          ],
        ),
      );
    } else if (day == 3) {
      return const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BulletList(items: [
              "دودھ پلانے یا بچے کو ہاتھ لگانے سے پہلے ہاتھ دھوئے۔",
              "روزانہ چھاتی کو صاف پانی سے دھوئے، صابن کا زیادہ استعمال نہ کرے کیونکہ یہ جلد کو خشک کر سکتا ہے۔",
              "کپڑے صاف اور آرام دہ ہوں۔",
              "ناخن صاف اور کٹے ہوئے رکھیں تاکہ گندگی یا جراثیم بچے تک نہ پہنچیں۔",
              "دودھ پلانے سے پہلے اور بعد میں کسی گیلے کپڑے یا صاف پانی سے نپل کو صاف کریں، خاص طور پر اگر بچہ بیمار ہو۔",
              "دودھ پلانے کے دوران اگر ماں کو چھینک یا کھانسی آئے تو منہ کو کسی کپڑے یا کہنی سے ڈھانپیں تاکہ جراثیم بچے تک نہ پہنچیں۔",
              "بچے کے منہ اور چہرے کو صاف اور خشک رکھیں، خاص طور پر دودھ پلانے کے بعد۔"
            ])
          ],
        ),
      );
    } else if (day == 5) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            BulletList(items: [
              "اپنے بچے کے کپڑے اور بستر کو صاف رکھیں ۔",
              "بچے کے نازک جلد کے لیے صاف اور نرم کپڑوں کا استعمال کریں۔",
              "دن میں کم از کم ایک بار نہلائیں۔",
              "سرمہ مت لگائیں۔",
              "روزانہ بچے کی ناف کو صاف اور خشک رکھے۔",
              "بچے کے کان اور ناک کو صاف کریں۔",
              "بچے کے ناخنوں کو چھوٹے رکھیں تاکہ وہ خود کو یا دوسروں کو نہ خراشیں۔",
              "بچے کے کھلونے وقتاً فوقتاً دھوئیں تاکہ ان پر جراثیم نہ بڑھیں۔",
              "بچے کا ڈائپر وقت پر تبدیل کریں۔",
              "بچے کے نازک حصوں کو صابن اور صاف پانی سے دھوئیں۔",
              "خشک کرنے کے بعد صاف ڈائپر پہنائیں۔ اس سے نیپی ریش سے بچاؤ ہوتا ہے۔"
            ])
          ],
        ),
      );
    }
    // Default widget if no matching day or week is found
    else {
      return const Center(
        child: Text(
          'No content available',
          style: TextStyle(fontSize: 18, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
