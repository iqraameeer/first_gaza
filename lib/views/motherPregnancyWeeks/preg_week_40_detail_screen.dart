import 'package:flutter/material.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/widget/radial_background.dart';

class PregWeek40DetailScreen extends StatelessWidget {
  //final int selectedWeek;
  final int selectedDay;

  PregWeek40DetailScreen({
    Key? key,
    //required this.selectedWeek,
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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                                ? "ماں کے اندر دودھ بنے اور اس کے اخراج کا عمل"
                                : selectedDay == 3
                                    ? "دودھ  پیدا ہونے اور نکلنے کے عمل کے اسباب"
                                    : selectedDay == 5
                                        ? "کم (ناکافی) دودھ کے اسباب"
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
    String text_day_1 =
        "ماں میں دودھ بنانے اور اس کے اخراج کے احساس کی لہریں نپل سے اٹھتی ہیں اور دماغ تک پہنچتی ہیں جہاں پرولیکٹین(prolactin)  پیدا ہو تا ہے یہ ایک ایسا ہارمون ہے جو خون میں شامل ہو کر چھاتی تک پہنچتا ہے اور اس کی مدد سے دودھ پیدا ہو تا ہے۔ بچہ جتنا زیادہ نپل  چوسے گا اتنا ہی دودھ پیدا ہو گا۔ جب ماں دودھ پلانے کیلئے بچے کو دیکھتی ہے اور اس کی آواز سنتی ہے اس طرح ماں کے  خون کے اندر آکسی ٹوسین (oxytocin)  ہارمون کا اخراج ہوتا ہے اور پھر دودھ خارج ہوتا ہے۔";

    String text_day_5 =
        "دودھ پلانے کا سب سے بڑا سبب یہ ہے کہ ماں یہ سمجھتی کہ اس کا دودھ بچے کیلئے کافی نہیں ہے۔ لیکن حقیقت میں تمام مائیں اپنے بچوں کیلئے مکمل دودھ پیدا کر سکتی ہیں۔ ایک وقت میں دو بچو ں کیلئے بھی کافی ہوتا ہے ۔حالانکہ ماں یہ سوچتی ہے کہ اس کا دودھ ناکافی ہے لیکن حقیقت میں اس کا بچہ اپنی ضرورت کے مطابق مناسب دودھ حاصل کر رہا ہوتا ہے۔ عام طور پر ایسی ماؤں کو درست طریقے سے دودھ پلانے کی معلومات نہیں ہوتی۔";

    if (day == 1) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_1,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/mechanism_of_milk_prod_1.png',
                ),
                Image.asset(
                  'assets/images/mechanism_of_milk_prod_2.png',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "یاد رکھیں:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
            const Text(
              "فکر اور پریشانی سے دودھ کا بننا اور اخراج کم ہو جاتا ہے.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      );
    } else if (day == 3) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          // Add a border to the table
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.green[100]),
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green[400],
                  child: const Text(
                    'مدد دینے والے اسباب',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JameelNoori'),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.orange[700],
                  child: const Text(
                    'رکاوٹ کا اسباب',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JameelNoori'),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(color: Colors.amber[100]),
              children: [
                Container(
                  color: Colors.green[50],
                  child: _buildList([
                    'بچے کے بارے میں پیار سے سوچنا',
                    'بچے کی آواز',
                    'بچے کو دیکھنا',
                    'بچے کو چومنا',
                    'اعتماد',
                    'مسلسل دودھ پلانا',
                  ]),
                ),
                _buildList([
                  'پریشانی',
                  'ذہنی دباؤ',
                  'درد',
                  'دودھ پیدا ہونے کے عمل کیلئے ماں کے ذہن میں شک',
                ]),
              ],
            ),
          ],
        ),
      );
    } else if (day == 5) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text_day_5,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'JameelNoori'),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text(
          'No content available',
          style: TextStyle(fontSize: 18, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  Widget _buildList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          const TextSpan(
                              text: '\u25CF ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: item,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'JameelNoori')),
                        ]),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    )

                    /*  Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'JameelNoori'),
                          textDirection: TextDirection.rtl,
                        )),
                    const SizedBox(width: 8),
                    const Icon(Icons.brightness_1, size: 8),*/
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
