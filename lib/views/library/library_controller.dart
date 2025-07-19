import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController {
  RxBool startAnimation = false.obs;
  void triggerAnimation() {
    startAnimation.value = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation.value = true;
      update();
    });
  }

  final List<Map<String, String>> additionalVideos = [
    {
      "title": "What is kangaroo mother care?",
      "url": "https://www.facebook.com/reel/2502025016803351"
    },
    {
      "title": "Effects of stress on breastfeeding",
      "url": "https://www.facebook.com/reel/1288059372238494"
    },
    {
      "title": "Are the nutritional requirements of boys and girls the same?",
      "url": "https://www.facebook.com/reel/1911809566221393"
    },
    {
      "title": "Healthy options for children",
      "url": "https://www.facebook.com/reel/1911809566221393"
    },
    {
      "title": "Sugar is harmful for infant",
      "url": "https://www.facebook.com/reel/1123274955941357"
    },
    {
      "title": "How to get nutritional food at low cost?",
      "url": "https://www.facebook.com/reel/95479484391210"
    },
    {
      "title": "Processed food is not good for children",
      "url": "https://www.facebook.com/reel/1301322321089882"
    },
    {
      "title": "Role of diet during infection",
      "url": "https://www.facebook.com/reel/323411447397137"
    },
  ];

  List<Map<String, dynamic>> contentList = [
    {
      "title": "متوازن غذا کا تعارف",
      "roman": " Mutawazan ghiza ka taaruf",
      "week": 'PregWeek35',
      "day": 1
    },
    {
      "title": "توازن غذا کی اہمیت",
      "roman": "Mutawazan ghiza ki ahmiyat",
      "week": 'PregWeek35',
      "day": 3
    },
    {
      "title": "حمل کے دوران اچھی متوازن غذا کیا ہے؟",
      "roman": "Hamal ke doran achi mutawazan ghiza kya hai?",
      "week": 'PregWeek35',
      "day": 5
    },
    // 36 week
    {
      "title": "خواتین میں  نارمل لیبر کے آغاز کی علامات",
      "roman": "Khawateen mein normal labor ke aghaz ki alamat",
      "week": 'PregWeek36',
      "day": 1
    },
    {
      "title": "لیبر کے دوران خطرے کی علامات",
      "roman": " Labor ke doran khatre ki alamat",
      "week": 'PregWeek36',
      "day": 3
    },
    {
      "title": "لیبر کے دوران کیا توقع کریں",
      "roman": " Labor ke doran kya tawaqqu karein",
      "week": 'PregWeek36',
      "day": 5
    },
    //37
    {
      "title": "بچے کو ماں کا دودھ  پلائیں ",
      "roman": "Bachay ko maa ka doodh pilayein",
      "week": 'PregWeek37',
      "day": 1
    },
    {
      "title": "ابتدائی دودھ پلانے کا آغاز:    پہلا دودھ (کولسٹرم)  کیا ہے؟",
      "roman":
          "Ibtidai doodh pilanay ka aghaz: pehla doodh (colostrum) kya hai?",
      "week": 'PregWeek37',
      "day": 3
    },
    {
      "title":
          'دودھ پلانے کے دوران بچے کاصحیح طریقے سے جڑنے یا اچھے اٹیچمنٹ (attachment) کا کیا مطلب ہے؟',
      "roman":
          " Doodh pilane ke doran bache ka sahih tareeke se jurnay ya achay attachment ka kya matlab hai?",
      "week": 'PregWeek37',
      "day": 5
    },
//Delivery phase
    {
      "title": "بچے کو ماں کا پہلا دودھ پلانا",
      "roman": "Bachay ko maa ka pehla doodh pilana",
      "week": 'ChildWeek01',
      "day": 1
    },
    {
      "title": "بچے کو گھٹی دینے کے نقصانات",
      "roman": "Bachay ko ghutti denay ke nuqsanat",
      "week": 'ChildWeek01',
      "day": 3
    },
    {
      "title": "نبچے کو حفاظتی ٹیکے لگوائیں",
      "roman": "Bachay ko hifazati tikay lagwayein",
      "week": 'ChildWeek01',
      "day": 5
    },
    //1st month of child
    {
      "title": "ماؤں کے لیے صحت مند طرز زندگی برقرار رکھنے کے مشورے",
      "roman":
          "Maaon ke liye sehatmand tarz-e-zindagi barqarar rakhne ke mashware",
      "week": 'ChildWeek02',
      "day": 1
    },
    {
      "title": "بچے کی ناف کی دیکھ بھال",
      "roman": "Bachay ki naaf ki dekh bhaal",
      "week": 'ChildWeek02',
      "day": 3
    },
    {
      "title": "آن ڈیمانڈ دودھ پلانا اور بچے کی بھوک کی علامات",
      "roman":
          " On-demand doodh pilana aur bache ki bhook ki alamat (feeding cues)",
      "week": 'ChildWeek02',
      "day": 5
    },
    {
      "title": "مسئلہ :زخمی یا پھٹی ہو ئی نپل",
      "roman": " Masla: zakhmi ya phati hui nipple",
      "week": 'ChildWeek03',
      "day": 1
    },
    {
      "title": "ماں کا دودھ پلانے کے لئے   صفائی کی  چند احتیاطی تدابیر",
      "roman": "Maa ka doodh pilane ke liye safai ki chand ehtiyati tadabeer",
      "week": 'ChildWeek03',
      "day": 3
    },
    {
      "title": "بچے کی صفائی کے بارے میں معلومات",
      "roman": "Bachay ki safai ke baare mein maloomat",
      "week": 'ChildWeek03',
      "day": 5
    },
    {
      "title":
          "بچے کی صفائی کے بارے میں معلومات بیمار بچے کو دودھ پلانے سے متعلق چند ہدایات",
      "roman": "Beemar bachay ko doodh pilane se mutaliq chand hidayat",
      "week": 'ChildWeek04',
      "day": 1
    },
    {
      "title": "سماعت اور بصارت کی نشونما",
      "roman": " Samaat aur basarat ki nashonuma",
      "week": 'ChildWeek04',
      "day": 3
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": "Bachay ki jismani nashonuma",
      "week": 'ChildWeek04',
      "day": 5
    },
    //2nd month

    {
      "title": "فارمولہ دودھ ماں کے دودھ کا متبادل نہیں ہو تا",
      "roman": "Formula doodh maa ke doodh ka mutabadil nahi hota",
      "week": 'ChildWeek05',
      "day": 1
    },
    {
      "title": "ماں کے لیے اپنا دودھ پلانے کے فوائد",
      "roman": "Maa ke liye apna doodh pilane ke faiday",
      "week": 'ChildWeek05',
      "day": 3
    },
    {
      "title":
          "بچوں کی چوسنی  یعنی پیسفائیر اور   بوتل  سے دودھ پلانے کے نقصانات",
      "roman":
          "Bachon ki choosni yani pacifier aur bottle se doodh pilane ke nuqsanat",
      "week": 'ChildWeek05',
      "day": 5
    },
    {
      "title": "چھٹے ہفتے  کی ویکسینیشن کے بارے میں یاد دہانی!",
      "roman": "Chhatay haftay ki vaccination ke baare mein yaad dehani!",
      "week": 'ChildWeek06',
      "day": 1
    },
    {
      "title": "دودھ کی پیداوار میں بہتر اٹیچمنٹ کی اہمیت",
      "roman": " Doodh ki pedaawar mein behtareen attachment ki ahmiyat",
      "week": 'ChildWeek06',
      "day": 3
    },
    {
      "title": "مسئلہ :چھاتیوں کا دودھ سے بھرنا",
      "roman": "Masla: chaatiyon ka doodh se bharna",
      "week": 'ChildWeek06',
      "day": 5
    },
    {
      "title": "بچہ کی مناسب مقدار میں دودھ حاصل نہیں کرنے کی کیا علامات ہے؟",
      "roman":
          " Bacha ki munasib miqdaar mein doodh hasil nahi karne ki kya alamat hain?",
      "week": 'ChildWeek07',
      "day": 1
    },
    {
      "title": "بیمار ماں کے لئے   دودھ پلانے سے متعلق چند ہدایات",
      "roman": "  Beemar maa ke liye doodh pilane se mutaliq chand hidayat",
      "week": 'ChildWeek007',
      "day": 3
    },
    {
      "title": "والدین گھریلو کاموں کی ذمہ داری  بانٹیں",
      "roman": "Walidain gharelo kaamon ki zimmedari bantain",
      "week": 'ChildWeek07',
      "day": 5
    },

    {
      "title": "بچے کے سر کی حفاظت",
      "roman": "Bachay ke sar ki hifazat",
      "week": 'ChildWeek08',
      "day": 1
    },
    {
      "title": "بچے کی سمجھنے کی صلاحیت",
      "roman": "  Bachay ki samajhne ki salahiyat",
      "week": 'ChildWeek08',
      "day": 3
    },
    {
      "title": "بچے کی جسمانی اور   زبان سیکھنے کی نشونما  ",
      "roman": "Bachay ki jismani aur zaban seekhne ki nashonuma",
      "week": 'ChildWeek08',
      "day": 5
    },
//3rd mont
    {
      "title": "صرف ماں کا دودھ  پلائیں",
      "roman": "Sirf maa ka doodh pilayein",
      "week": 'ChildWeek09',
      "day": 1
    },
    {
      "title": "ماں کی ذہنی صحت",
      "roman": "Maa ki zehni sehat",
      "week": 'ChildWeek09',
      "day": 3
    },
    {
      "title": "اپنے بچے سے باتیں کریں",
      "roman": "Apne bachay se batein karein",
      "week": 'ChildWeek09',
      "day": 5
    },
    {
      "title": "دسویں ہفتے کی ویکسینیشن کے بارے میں یاد دہانی",
      "roman": " Daswin hafte ki vaccination ke baare mein yaad dehani",
      "week": 'ChildWeek10',
      "day": 1
    },
    {
      "title": "بچوں میں مناسب وقفہ کے متعلق چند تجاویز",
      "roman": "Bachon mein munasib waqfa ke mutaliq chand tajawiz",
      "week": 'ChildWeek10',
      "day": 3
    },
    {
      "title": "بچے کی صفائی کے بارے میں یاد دہانی",
      "roman": "Bachay ki safai ke baare mein yaad dehani",
      "week": 'ChildWeek10',
      "day": 5
    },
    {
      "title": "بچے کے ساتھ معیاری وقت گزارنا !",
      "roman": " Bachay ke saath mayari waqt guzarna!",
      "week": 'ChildWeek11',
      "day": 1
    },
    {
      "title": "والد  بچے کے ساتھ وقت گزاریں",
      "roman": "Walid bachay ke saath waqt guzarein",
      "week": 'ChildWeek11',
      "day": 3
    },
    {
      "title": "محبت اور پیار کے ساتھ بچے کی پرورش !",
      "roman": "Mohabbat aur pyar ke saath bachay ki parwarish!",
      "week": 'ChildWeek11',
      "day": 5
    },
    {
      "title": "بچے کی سمجھنے کی صلاحیت",
      "roman": "Bachay ki samajhne ki salahiyat",
      "week": 'ChildWeek12',
      "day": 1
    },
    {
      "title": "بچے کی جسمانی نشونما  ",
      "roman": "Bachay ki jismani nashonuma",
      "week": 'ChildWeek12',
      "day": 3
    },
    {
      "title": "سمجھنے اور زبان سیکھنے کی صلاحیت",
      "roman": "Samajhne aur zaban seekhne ki salahiyat",
      "week": 'ChildWeek12',
      "day": 5
    },
    //4th month
    {
      "title": "دانت نکلنے کے بارے میں معلومات",
      "roman": "Daant nikalne ke baare mein maloomat",
      "week": 'ChildWeek13',
      "day": 1
    },
    {
      "title":
          "کام کرنے والی ماؤں  کے لیے     breastfeeding  جاری رکھنے کے بارے میں  چند تجاویز    ",
      "roman":
          " Kaam karne wali maaon ke liye breastfeeding jari rakhne ke mutaliq chand tajawiz",
      "week": 'ChildWeek13',
      "day": 3
    },
    {
      "title": "ہاتھ  یا پمپ کی مدد سے چھاتی سے  ماں کا اپنا دودھ نکالنا",
      "roman": " Haath ya pump ki madad se chaati se maa ka apna doodh nikalna",
      "week": 'ChildWeek13',
      "day": 5
    },

    {
      "title": "چودہ ہفتے کی ویکسینیشن کے بارے میں یاد دہانی ! ",
      "roman": "Chaudah hafte ki vaccination ke baare mein yaad dehani!",
      "week": 'ChildWeek14',
      "day": 1
    },
    {
      "title": "ہاتھ سے دودھ نکالنے کا طریقہ",
      "roman": " Haath se doodh nikalne ka tareeqa",
      "week": 'ChildWeek14',
      "day": 3
    },
    {
      "title": "کپ  کے ذریعے ماں کا  دودھ پلانے  کا طریقہ",
      "roman": " Cup ke zariye maa ka doodh pilane ka tareeqa",
      "week": 'ChildWeek14',
      "day": 5
    },
    {
      "title": "ماں کے  دودھ  کو   اسٹور کرنے کا طریقہ",
      "roman": " Maa ke doodh ko store karne ka tareeqa",
      "week": 'ChildWeek15',
      "day": 1
    },
    {
      "title": "ماں کے  اسٹورڈ دودھ کو پگھلانے (defrost)کا طریقہ",
      "roman": "  Maa ke stored doodh ko pighlane (defrost) ka tareeqa",
      "week": 'ChildWeek15',
      "day": 3
    },
    {
      "title": "ماں کے دودھ کو  پگھلانے کے بعد  پلانے کی تیاری",
      "roman": "Maa ke doodh ko pighlane ke baad pilane ki tayari",
      "week": 'ChildWeek15',
      "day": 5
    },

    {
      "title": "بچے کی جسمانی نشونما  ",
      "roman": " Bachay ki jismani nashonuma",
      "week": 'ChildWeek16',
      "day": 1
    },
    {
      "title": "بچے کی سمجھنے کی صلاحیت!",
      "roman": "  Bachay ki samajhne ki salahiyat! ",
      "week": 'ChildWeek16',
      "day": 3
    },
    {
      "title": "بچے کی زبان سیکھنے کی نشونما  ",
      "roman": " Bachay ki zaban seekhne ki nashonuma",
      "week": 'ChildWeek16',
      "day": 5
    },

    //5th month

    {
      "title": "بچے کو وقت پر ویکسین لگائیں",
      "roman": " Bachay ko waqt par vaccine lagwayein",
      "week": 'ChildWeek17',
      "day": 1
    },
    {
      "title": "بچے کی صفائی کے بارے میں معلومات",
      "roman": " Bachay ki safai ke baare mein maloomat",
      "week": 'ChildWeek17',
      "day": 3
    },
    {
      "title": "بچے کی ناک صاف رکھنے کے بارے میں مشورہ !",
      "roman": " Bachay ki naak saaf rakhne ke baare mein mashwara!",
      "week": 'ChildWeek17',
      "day": 5
    },
    {
      "title": "والدین ایک دوسرے کی مدد کریں",
      "roman": "Walidain aik dosray ki madad karein",
      "week": 'ChildWeek18',
      "day": 1
    },
    {
      "title": "گھریلو کاموں میں مدد کریں",
      "roman": "Gharelo kaamon mein madad karein ",
      "week": 'ChildWeek18',
      "day": 3
    },
    {
      "title": "اہلیہ کا خیال رکھیں !",
      "roman": "  Ahliya ka khayal rakhein!",
      "week": 'ChildWeek18',
      "day": 5
    },

    {
      "title": "باقاعدگی سے بچے کے وزن اور قد کی پیمائش کروائیں",
      "roman": " Baqaidgi se bachay ke wazan aur qad ki paimaish karwaein",
      "week": 'ChildWeek19',
      "day": 1
    },
    {
      "title": "بچے کے تجسس کو ابھاریں!",
      "roman": "Bachay ke tajassus ko ubharen!",
      "week": 'ChildWeek19',
      "day": 3
    },
    {
      "title": "بچے  کے روٹین  کو  قائم کریں",
      "roman": "Bachay ke routine ko qaim karein",
      "week": 'ChildWeek19',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": "Bachay ki jismani nashonuma",
      "week": 'ChildWeek20',
      "day": 1
    },
    {
      "title": "بچے کی سمجھنے کی صلاحیت",
      "roman": "  Bachay ki samajhne ki salahiyat",
      "week": 'ChildWeek20',
      "day": 3
    },
    {
      "title": "بچے کی زبان سیکھنے کی نشونما  ",
      "roman": "  Bachay ki zaban seekhne ki nashonuma",
      "week": 'ChildWeek20',
      "day": 5
    },

    //6th month

    {
      "title": "بچے کو ابھی بھی صرف ماں کا دودھ پلائیں",
      "roman": " Bachay ko abhi bhi sirf maa ka doodh pilayein",
      "week": 'ChildWeek21',
      "day": 1
    },
    {
      "title": "ماں ہاتھ  یا پمپ سے بھی دودھ نکال کر بچے کو پلائیں",
      "roman": "  Maa haath ya pump se bhi doodh nikal kar bachay ko pilayein",
      "week": 'ChildWeek21',
      "day": 3
    },
    {
      "title": "بچے کو پانی یا نیم ٹھوس غذا شروع نہیں کریں",
      "roman": " Bachay ko pani ya neem thos ghiza shuru nahi karein",
      "week": 'ChildWeek21',
      "day": 5
    },
    {
      "title": "بچوں کے دانت کب نکلتے ہیں؟",
      "roman": "Bachon ke daant kab nikalte hain?",
      "week": 'ChildWeek22',
      "day": 1
    },
    {
      "title": "بچوں کے دانت نکلنے کی علامات",
      "roman": "Bachon ke daant nikalne ki alamat",
      "week": 'ChildWeek22',
      "day": 3
    },
    {
      "title": "بچوں کے دانت نکلنے کے مرحلے کے بارے  میں ہدایات",
      "roman": "Bachon ke daant nikalne ke marhale ke baare mein hidayat  ",
      "week": 'ChildWeek22',
      "day": 5
    },
    {
      "title": "بچے کو چوسنی (پيسيفائر ) ہرگز نہ دیں",
      "roman": " Bachay ko choosni (pacifier) hargiz na dein",
      "week": 'ChildWeek23',
      "day": 1
    },
    {
      "title": "بچے کی صفائی کا خاص خیال رکھیں",
      "roman": " Bachay ki safai ka khaas khayal rakhein",
      "week": 'ChildWeek23',
      "day": 3
    },
    {
      "title": "اپنے گھر کے ماحول کو صاف رکھیں",
      "roman": "Apne ghar ke mahol ko saaf rakhein",
      "week": 'ChildWeek23',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": " Bachay ki jismani nashonuma",
      "week": 'ChildWeek24',
      "day": 1
    },
    {
      "title": "بچے کی سمجھنے  اور زبان سیکھنے کی نشونما ",
      "roman": "Bachay ki samajhne aur zaban seekhne ki nashonuma ",
      "week": 'ChildWeek24',
      "day": 3
    },
    {
      "title": " بچے کی جذباتی اور سماجی نشونما",
      "roman": "Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek24',
      "day": 5
    },
    //7th mont

    {
      "title": "بچے  کی  اضافی غذا کا آغاز: کرنے والے کام (Do’s)",
      "roman": " Bachay ki izafi ghiza ka aghaz: Do’s",
      "week": 'ChildWeek25',
      "day": 1
    },
    {
      "title": "بچے  کی  اضافی غذا: نہیں کرنے والے کام(Don'ts)",
      "roman": " Bachay ki izafi ghiza: Don’ts ",
      "week": 'ChildWeek25',
      "day": 3
    },
    {
      "title": "  چھٹے ماہ کی ویکسینیشن کے بارے میں یاد دہانی !",
      "roman": "  Chhatay mahine ki vaccination ke baare mein yaad dehani!",
      "week": 'ChildWeek25',
      "day": 5
    },
    {
      "title": "بچے کو نئی غذا  شروع  کرنے کے بارے میں ہدایات",
      "roman": "Bachay ko nai ghiza shuru karne ke baare mein hidayat",
      "week": 'ChildWeek26',
      "day": 1
    },
    {
      "title": "بچے کی متوازن خوراک کا کیا مطلب ہے؟",
      "roman": "  Bachay ki mutawazan ghiza ka kya matlab hai? ",
      "week": 'ChildWeek26',
      "day": 3
    },
    {
      "title": "بچے کی متوازن خوراک کن چیزوں سے بنتی ہے؟",
      "roman": " Bachay ki mutawazan ghiza kin cheezon se banti hai?",
      "week": 'ChildWeek26',
      "day": 5
    },
    {
      "title": "کیا بچہ کا موٹا ہونا صحت کی نشانی ہے؟",
      "roman": "Kya bacha ka mota hona sehat ki nishani hai?",
      "week": 'ChildWeek27',
      "day": 1
    },
    {
      "title": "بچے کی اضافی غذا میں آئرن (iron)کیوں ضروری ہے؟",
      "roman": "  Bachay ki izafi ghiza mein iron (iron) kyun zaruri hai?",
      "week": 'ChildWeek27',
      "day": 3
    },
    {
      "title":
          "دست (diarrhea) کے دوران بچے کی اضافی  خوراک  کے  بارے  میں کچھ اصول",
      "roman":
          " Dast (diarrhea) ke doran bachay ki izafi ghiza ke baare mein kuch usool",
      "week": 'ChildWeek27',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": " Bachay ki jismani nashonuma",
      "week": 'ChildWeek28',
      "day": 1
    },
    {
      "title": "بچے کی  زبان سیکھنے کی صلاحیت",
      "roman": " Bachay ki zaban seekhne ki salahiyat",
      "week": 'ChildWeek28',
      "day": 3
    },
    {
      "title": "بچے کی ذہنی ، جذباتی اور  سماجی نشونما",
      "roman": "Bachay ki zehni, jazbati aur samaji nashonuma",
      "week": 'ChildWeek28',
      "day": 5
    },
    //8th month
    {
      "title": "بچے کو اضافی غذا کے ساتھ ماں کا دودھ  پلائیں",
      "roman": " Bachay ko izafi ghiza ke saath maa ka doodh pilayein",
      "week": 'ChildWeek29',
      "day": 1
    },
    {
      "title": "بچے کو کھانے میں فنگر فوڈز متعارف کرائیں",
      "roman": "  Bachay ko khanay mein finger foods mutarif karayein",
      "week": 'ChildWeek29',
      "day": 3
    },
    {
      "title": "کون سے فنگر فوڈز بچے کو دیے جا سکتے ہیں؟",
      "roman": "Kaun se finger foods bachay ko diye ja sakte hain?",
      "week": 'ChildWeek29',
      "day": 5
    },
    {
      "title":
          "میرا بچہ کھانے سے کھیلتا زیادہ ہے اور کھاتا کم ہے ۔ کیا یہ پریشان ہونے کی بات ہے؟",
      "roman":
          " Mera bacha khanay se khelta zyada hai aur khata kam hai. Kya yeh pareshani ki baat hai?",
      "week": 'ChildWeek30',
      "day": 1
    },
    {
      "title": "بچے کی نشونما میں کھانے سے کھیلنے کی کیا اہمیت ہے؟",
      "roman": " Bachay ki nashonuma mein khanay se khelne ki kya ahmiyat hai?",
      "week": 'ChildWeek30',
      "day": 3
    },
    {
      "title": "بچے کو فنگر فوڈز کھلانے کے کیا فائدے ہیں؟",
      "roman": "Bachay ko finger foods khilane ke kya faiday hain?",
      "week": 'ChildWeek30',
      "day": 5
    },
    {
      "title": "بچے کی صفائی کا خاص خیال رکھیں",
      "roman": " Bachay ki safai ka khaas khayal rakhein",
      "week": 'ChildWeek31',
      "day": 1
    },
    {
      "title": "ماں  کی صحت بہت ضروری ہے",
      "roman": "  Maa ki sehat bohat zaruri hai",
      "week": 'ChildWeek31',
      "day": 3
    },
    {
      "title": "اپنے بچے  کے ساتھ وقت گزاریں",
      "roman": "  Apne bachay ke saath waqt guzarein",
      "week": 'ChildWeek31',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": " Bachay ki jismani nashonuma",
      "week": 'ChildWeek32',
      "day": 1
    },
    {
      "title": "بچے کی  زبان سیکھنے اور سمجھنے کی صلاحیت",
      "roman": "   Bachay ki zuban seekhne aur samajhne ki salahiyat",
      "week": 'ChildWeek32',
      "day": 3
    },
    {
      "title": "بچے کی جذباتی اور  سماجی نشونما",
      "roman": " Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek32',
      "day": 5
    },
    //9th month

    {
      "title": "ماں کا دودھ اب بھی بچے کے لئے ضروری ہے",
      "roman": " Maa ka doodh ab bhi bachay ke liye zaruri hai",
      "week": 'ChildWeek33',
      "day": 1
    },
    {
      "title": "بچے کے دانت نکلنے کے دوران کی ہدایات",
      "roman": "  Bachay ke daant nikalne ke doran ki hidayat",
      "week": 'ChildWeek33',
      "day": 3
    },
    {
      "title": "اپنے بچے کو  چوسنی یا  بوتل   ہرگز نہ دیں",
      "roman": "Apne bachay ko choosni ya bottle hargiz na dein",
      "week": 'ChildWeek33',
      "day": 5
    },
    {
      "title": "بچے کی ناک صاف رکھے!",
      "roman": " Bachay ki naak saaf rakhein!",
      "week": 'ChildWeek34',
      "day": 1
    },
    {
      "title": "بچے کو سگریٹ کے دھوئیں سے محفوظ رکھے !",
      "roman": "   Bachay ko cigarette ke dhuein se mehfooz rakhein!",
      "week": 'ChildWeek34',
      "day": 3
    },
    {
      "title": "بچے کو ملیریا سے محفوظ رکھے !",
      "roman": "Bachay ko malaria se mehfooz rakhein!",
      "week": 'ChildWeek34',
      "day": 5
    },
    {
      "title": "بچے کو کھانا کھلانے کے بارے میں رہنمائی",
      "roman": "  Bachay ko khana khilane ke baare mein rehnumai",
      "week": 'ChildWeek35',
      "day": 1
    },
    {
      "title": "والدین بچوں کی پیدائش میں  مناسب  وقفہ کے بارے میں بات کریں!",
      "roman":
          " Walidain bachon ki paidaish mein munasib waqfa ke baare mein baat karein!",
      "week": 'ChildWeek35',
      "day": 3
    },
    {
      "title": "بچے کی پرورش اور والدین کی ذمہ داری!",
      "roman": "  Bachay ki parwarish aur walidain ki zimmedari!",
      "week": 'ChildWeek35',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": "Bachay ki jismani nashonuma",
      "week": 'ChildWeek36',
      "day": 1
    },
    {
      "title": "بچے کی  زبان سیکھنے اور سمجھنے کی صلاحیت",
      "roman": "Bachay ki zuban seekhne aur samajhne ki salahiyat",
      "week": 'ChildWeek36',
      "day": 3
    },
    {
      "title": "بچے کی جذباتی اور  سماجی نشونما",
      "roman": " Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek36',
      "day": 5
    },
    //10month

    {
      "title": "بچے کی دیکھ بھال سے متعلق رہنمائی: کرنے والے کام (Do’s)",
      "roman":
          "Bachay ki dekh bhaal se mutaliq rehnumai: karne wale kaam (Do’s)",
      "week": 'ChildWeek37',
      "day": 1
    },
    {
      "title":
          "بچے کی دیکھ بھال سے متعلق رہنمائی: وہ کام جو  ہرگز نہ کریں(Don’ts)",
      "roman":
          "  Bachay ki dekh bhaal se mutaliq rehnumai: woh kaam jo hargiz na karein (Don’ts)",
      "week": 'ChildWeek37',
      "day": 3
    },
    {
      "title": "نویں مہینےکی ویکسینیشن کے بارے میں یاد دہانی !",
      "roman": "  Nauwen mahine ki vaccination ke baare mein yaad dehani!",
      "week": 'ChildWeek37',
      "day": 5
    },
    {
      "title": "بچے کی غذا سے متعلق رہنمائی",
      "roman": "Bachay ki ghiza se mutaliq rehnumai",
      "week": 'ChildWeek38',
      "day": 1
    },
    {
      "title": "کیا بچے کو ڈبے کا جوس  دینا چاہیے؟",
      "roman": " Kya bachay ko dabbe ka juice dena chahiye?",
      "week": 'ChildWeek38',
      "day": 3
    },
    {
      "title": "بچے کو میٹھے کھانے یا اشیاء دینے کے کیا نقصانات ہیں؟",
      "roman": " Bachay ko meethay khanay ya ashya dene ke kya nuqsanat hain?",
      "week": 'ChildWeek38',
      "day": 5
    },
    {
      "title": "بچے کی لمبائی اور وزن کی نگرانی  کیوں ضروری ہے؟",
      "roman": " Bachay ki lambai aur wazan ki nigrani kyun zaruri hai?",
      "week": 'ChildWeek39',
      "day": 1
    },
    {
      "title": "غذائی کمی   بچے کے لئے کس طرح نقصان دہ ہیں؟",
      "roman": " Ghizai kami bachay ke liye kis tarah nuqsan deh hai?",
      "week": 'ChildWeek39',
      "day": 3
    },
    {
      "title": "بچے کی لمبائی اور وزن کب چیک کریں؟",
      "roman": " Bachay ki lambai aur wazan kab check karein?",
      "week": 'ChildWeek39',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما",
      "roman": " Bachay ki jismani nashonuma",
      "week": 'ChildWeek40',
      "day": 1
    },
    {
      "title": "بچے کی  زبان سیکھنے اور سمجھنے کی صلاحیت",
      "roman": " Bachay ki zuban seekhne aur samajhne ki salahiyat ",
      "week": 'ChildWeek40',
      "day": 3
    },
    {
      "title": "بچے کی جذباتی اور  سماجی نشونما",
      "roman": "  Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek40',
      "day": 5
    },
    //11month
    {
      "title": "بچے کی غذا کے بارے میں  رہنمائی کرنے والے کام (Do’s)",
      "roman": "Bachay ki ghiza ke baare mein rehnumai karne wale kaam (Do’s)",
      "week": 'ChildWeek41',
      "day": 1
    },
    {
      "title": "بچے کو کھانے کے وقت خاندان کے ساتھ شامل کریں",
      "roman": "Bachay ko khanay ke waqt khandan ke saath shaamil karein",
      "week": 'ChildWeek41',
      "day": 3
    },
    {
      "title": "بچے کی خود کھانے کی حوصلہ افزائی کریں",
      "roman": "Bachay ki khud khanay ki hosla afzai karein",
      "week": 'ChildWeek41',
      "day": 5
    },
    {
      "title": "کھانے میں وٹامن سی والی سبزیوں اور پھل کا استعمال کریں",
      "roman": " Khanay mein Vitamin C wali sabzion aur phal ka istemal karein",
      "week": 'ChildWeek42',
      "day": 1
    },
    {
      "title": "بچوں کے دانتوں کو صاف رکھیں",
      "roman": "Bachon ke daanton ko saaf rakhein",
      "week": 'ChildWeek42',
      "day": 3
    },
    {
      "title": "بچے کے آس پاس چھوٹی چھوٹی اشیاء نہ رکھیں",
      "roman": "Bachay ke aas paas chhoti chhoti ashya na rakhein",
      "week": 'ChildWeek42',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما : موٹے پٹھوں کی صلاحیت (Gross Motor)",
      "roman":
          " Bachay ki jismani nashonuma: motay pathon ki salahiyat (Gross Motor)",
      "week": 'ChildWeek43',
      "day": 1
    },
    {
      "title": "بچے کی جسمانی نشونما : باریک پٹھوں کی صلاحیت (Fine Motor)",
      "roman":
          "Bachay ki jismani nashonuma: bareek pathon ki salahiyat (Fine Motor)",
      "week": 'ChildWeek43',
      "day": 3
    },
    {
      "title": "اپنے گھر کو بچے کے لئے محفوظ  بنائیں : کرنے والے کام (Do’s)",
      "roman":
          " Apne ghar ko bachay ke liye mehfooz banayein: karne wale kaam (Do’s)",
      "week": 'ChildWeek43',
      "day": 5
    },
    {
      "title": "بچے کی  زبان سیکھنے صلاحیت",
      "roman": "   Bachay ki zuban seekhne ki salahiyat",
      "week": 'ChildWeek44',
      "day": 1
    },
    {
      "title": "بچے کی  سمجھنے کی صلاحیت",
      "roman": "Bachay ki samajhne ki salahiyat",
      "week": 'ChildWeek44',
      "day": 3
    },
    {
      "title": "بچے کی جذباتی اور  سماجی نشونما",
      "roman": "Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek44',
      "day": 5
    },
    //12 month
    {
      "title": "بچے کی  غذا کے متعلق رہنمائی: کرنے والے کام  (Do’s)",
      "roman": "Bachay ki ghiza ke mutaliq rehnumai: karne wale kaam (Do’s)",
      "week": 'ChildWeek45',
      "day": 1
    },
    {
      "title": 'بچے کی غذائیت کے لیے "Eat the Rainbow" کا اصول اپنائیں',
      "roman":
          'Bachay ki ghizaiyat ke liye "Eat the Rainbow" ka usool apnayein',
      "week": 'ChildWeek45',
      "day": 3
    },
    {
      "title": "بچے کو  خود سے کھانا سکھائیں",
      "roman": " Bachay ko khud se khana sikhayein",
      "week": 'ChildWeek45',
      "day": 5
    },
    {
      "title": "والدین بچے کے ساتھ کھیلیں",
      "roman": " Walidain bachay ke saath khelein",
      "week": 'ChildWeek46',
      "day": 1
    },
    {
      "title": 'بچے کو تعلیمی کھلونے اور  رنگین کتابیں دیں',
      "roman": 'Bachay ko taleemi khilone aur rangeen kitaabein dein',
      "week": 'ChildWeek46',
      "day": 3
    },
    {
      "title": "بارھویں مہینےکی ویکسینیشن کے بارے میں یاد دہانی !",
      "roman": " Barhwein mahine ki vaccination ke baare mein yaad dehani!",
      "week": 'ChildWeek46',
      "day": 5
    },
    {
      "title": "بہن بھائیوں کو بچے کے ساتھ کھیلنے  کی حوصلہ افزائی کریں",
      "roman": "Behan bhaiyon ko bachay ke saath khelne ki hosla afzai karein",
      "week": 'ChildWeek47',
      "day": 1
    },
    {
      "title": 'بچے کی  زبان سیکھنے کی صلاحیت',
      "roman": '  Bachay ki zuban seekhne ki salahiyat',
      "week": 'ChildWeek47',
      "day": 3
    },
    {
      "title": "بچے کی جسمانی نشونما :موٹے پٹھوں کی صلاحیت (Gross Motor)",
      "roman":
          " Bachay ki jismani nashonuma: motay pathon ki salahiyat (Gross Motor)",
      "week": 'ChildWeek47',
      "day": 5
    },
    {
      "title": "بچے کی جسمانی نشونما: باریک پٹھوں کی صلاحیت (Fine Motor)",
      "roman":
          " Bachay ki jismani nashonuma: bareek pathon ki salahiyat (Fine Motor)",
      "week": 'ChildWeek48',
      "day": 1
    },
    {
      "title": 'بچے کی سمجھنے کی صلاحیت',
      "roman": ' Bachay ki samajhne ki salahiyat',
      "week": 'ChildWeek48',
      "day": 3
    },
    {
      "title": "بچے کی جذباتی اور  سماجی نشونما",
      "roman": "Bachay ki jazbati aur samaji nashonuma",
      "week": 'ChildWeek48',
      "day": 5
    },
  ];

  @override
  void onInit() {
    super.onInit();
    triggerAnimation();
  }

  @override
  void onClose() {
    startAnimation.value = false;
    super.onClose();
  }
}
