import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:workmanager/workmanager.dart';

final List notificationMessages = [
  {
    'id': 'P35_D1',
    'urduTitle': 'متوازن غذا کا تعارف',
  },
  {
    'id': 'P35_D3',
    'urduTitle': 'توازن غذا کی اہمیت',
  },
  {
    'id': 'P35_D5',
    'urduTitle': 'حمل کے دوران اچھی متوازن غذا کیا ہے؟',
  },
  {
    'id': 'P36_D1',
    'urduTitle': 'خواتین میں نارمل لیبر کے آغاز کی علامات',
  },
  {
    'id': 'P36_D3',
    'urduTitle': 'لیبر کے دوران خطرے کی علامات',
  },
  {
    'id': 'P36_D5',
    'urduTitle': 'لیبر کے دوران کیا توقع کریں',
  },
  {
    'id': 'P37_D1',
    'urduTitle': 'بچے کو ماں کا دودھ پلائیں',
  },
  {
    'id': 'P37_D3',
    'urduTitle': 'ابتدائی دودھ پلانے کا آغاز: پہلا دودھ (کولسٹرم) کیا ہے؟',
  },
  {
    'id': 'P37_D5',
    'urduTitle':
        'دودھ پلانے کے دوران بچے کا صحیح طریقے سے جڑنے یا اچھے اٹیچمنٹ (attachment) کا کیا مطلب ہے؟',
  },
  {
    'id': 'C1_D1',
    'urduTitle': 'بچے کو ماں کا پہلا دودھ پلانا',
  },
  {
    'id': 'C1_D3',
    'urduTitle': 'بچے کو گھٹی دینے کے نقصانات',
  },
  {
    'id': 'C1_D5',
    'urduTitle': 'نبچے کو حفاظتی ٹیکے لگوائیں',
  },
  {
    'id': 'C2_D1',
    'urduTitle': 'ماؤں کے لیے صحت مند طرز زندگی برقرار رکھنے کے مشورے',
  },
  {
    'id': 'C2_D3',
    'urduTitle': 'بچے کی ناف کی دیکھ بھال',
  },
  {
    'id': 'C2_D5',
    'urduTitle': 'آن ڈیمانڈ دودھ پلانا اور بچے کی بھوک کی علامات',
  },
  {
    'id': 'C3_D1',
    'urduTitle': 'مسئلہ: زخمی یا پھٹی ہوئی نپل',
  },
  {
    'id': 'C3_D3',
    'urduTitle': 'ماں کا دودھ پلانے کے لئے صفائی کی چند احتیاطی تدابیر',
  },
  {
    'id': 'C3_D5',
    'urduTitle': 'بچے کی صفائی کے بارے میں معلومات',
  },
  {
    'id': 'C4_D1',
    'urduTitle':
        'بچے کی صفائی کے بارے میں معلومات بیمار بچے کو دودھ پلانے سے متعلق چند ہدایات',
  },
  {
    'id': 'C4_D3',
    'urduTitle': 'سماعت اور بصارت کی نشونما',
  },
  {
    'id': 'C4_D5',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C5_D1',
    'urduTitle': 'فارمولہ دودھ ماں کے دودھ کا متبادل نہیں ہوتا',
  },
  {
    'id': 'C5_D3',
    'urduTitle': 'ماں کے لیے اپنا دودھ پلانے کے فوائد',
  },
  {
    'id': 'C5_D5',
    'urduTitle':
        'بچوں کی چوسنی یعنی پیسفائیر اور بوتل سے دودھ پلانے کے نقصانات',
  },
  {
    'id': 'C6_D1',
    'urduTitle': 'چھٹے ہفتے کی ویکسینیشن کے بارے میں یاد دہانی!',
  },
  {
    'id': 'C6_D3',
    'urduTitle': 'دودھ کی پیداوار میں بہتر اٹیچمنٹ کی اہمیت',
  },
  {
    'id': 'C6_D5',
    'urduTitle': 'مسئلہ: چھاتیوں کا دودھ سے بھرنا',
  },
  {
    'id': 'C7_D1',
    'urduTitle': 'بچہ کی مناسب مقدار میں دودھ حاصل نہیں کرنے کی کیا علامات ہے؟',
  },
  {
    'id': 'C7_D3',
    'urduTitle': 'بیمار ماں کے لئے دودھ پلانے سے متعلق چند ہدایات',
  },
  {
    'id': 'C7_D5',
    'urduTitle': 'والدین گھریلو کاموں کی ذمہ داری بانٹیں',
  },
  {
    'id': 'C8_D1',
    'urduTitle': 'بچے کے سر کی حفاظت',
  },
  {
    'id': 'C8_D3',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت',
  },
  {
    'id': 'C8_D5',
    'urduTitle': 'بچے کی جسمانی اور زبان سیکھنے کی نشونما',
  },
  {
    'id': 'C9_D1',
    'urduTitle': 'صرف ماں کا دودھ پلائیں',
  },
  {
    'id': 'C9_D3',
    'urduTitle': 'ماں کی ذہنی صحت',
  },
  {
    'id': 'C9_D5',
    'urduTitle': 'اپنے بچے سے باتیں کریں',
  },
  {
    'id': 'C10_D1',
    'urduTitle': 'دسویں ہفتے کی ویکسینیشن کے بارے میں یاد دہانی',
  },
  {
    'id': 'C10_D3',
    'urduTitle': 'بچوں میں مناسب وقفہ کے متعلق چند تجاویز',
  },
  {
    'id': 'C10_D5',
    'urduTitle': 'بچے کی صفائی کے بارے میں یاد دہانی',
  },
  {
    'id': 'C11_D1',
    'urduTitle': 'بچے کے ساتھ معیاری وقت گزارنا!',
  },
  {
    'id': 'C11_D3',
    'urduTitle': 'والد بچے کے ساتھ وقت گزاریں',
  },
  {
    'id': 'C11_D5',
    'urduTitle': 'محبت اور پیار کے ساتھ بچے کی پرورش!',
  },
  {
    'id': 'C12_D1',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت',
  },
  {
    'id': 'C12_D3',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C12_D5',
    'urduTitle': 'سمجھنے اور زبان سیکھنے کی صلاحیت',
  },
  {
    'id': 'C13_D1',
    'urduTitle': 'دانت نکلنے کے بارے میں معلومات',
  },
  {
    'id': 'C13_D3',
    'urduTitle':
        'کام کرنے والی ماؤں کے لیے breastfeeding جاری رکھنے کے بارے میں چند تجاویز',
  },
  {
    'id': 'C13_D5',
    'urduTitle': 'ہاتھ یا پمپ کی مدد سے چھاتی سے ماں کا اپنا دودھ نکالنا',
  },
  {
    'id': 'C14_D1',
    'urduTitle': 'چودہ ہفتے کی ویکسینیشن کے بارے میں یاد دہانی!',
  },
  {
    'id': 'C14_D3',
    'urduTitle': 'ہاتھ سے دودھ نکالنے کا طریقہ',
  },
  {
    'id': 'C14_D5',
    'urduTitle': 'کپ کے ذریعے ماں کا دودھ پلانے کا طریقہ',
  },
  {
    'id': 'C15_D1',
    'urduTitle': 'ماں کے دودھ کو اسٹور کرنے کا طریقہ',
  },
  {
    'id': 'C15_D3',
    'urduTitle': 'ماں کے اسٹورڈ دودھ کو پگھلانے (defrost) کا طریقہ',
  },
  {
    'id': 'C15_D5',
    'urduTitle': 'ماں کے دودھ کو پگھلانے کے بعد پلانے کی تیاری',
  },
  {
    'id': 'C16_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C16_D3',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت!',
  },
  {
    'id': 'C16_D5',
    'urduTitle': 'بچے کی زبان سیکھنے کی نشونما',
  },
  {
    'id': 'C17_D1',
    'urduTitle': 'بچے کو وقت پر ویکسین لگائیں',
  },
  {
    'id': 'C17_D3',
    'urduTitle': 'بچے کی صفائی کے بارے میں معلومات',
  },
  {
    'id': 'C17_D5',
    'urduTitle': 'بچے کی ناک صاف رکھنے کے بارے میں مشورہ!',
  },
  {
    'id': 'C18_D1',
    'urduTitle': 'والدین ایک دوسرے کی مدد کریں',
  },
  {
    'id': 'C18_D3',
    'urduTitle': 'گھریلو کاموں میں مدد کریں',
  },
  {
    'id': 'C18_D5',
    'urduTitle': 'اہلیہ کا خیال رکھیں!',
  },
  {
    'id': 'C19_D1',
    'urduTitle': 'باقاعدگی سے بچے کے وزن اور قد کی پیمائش کروائیں',
  },
  {
    'id': 'C19_D3',
    'urduTitle': 'بچے کے تجسس کو ابھاریں!',
  },
  {
    'id': 'C19_D5',
    'urduTitle': 'بچے کے روٹین کو قائم کریں',
  },
  {
    'id': 'C20_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C20_D3',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت',
  },
  {
    'id': 'C20_D5',
    'urduTitle': 'بچے کی زبان سیکھنے کی نشونما',
  },
  {
    'id': 'C21_D1',
    'urduTitle': 'بچے کو ابھی بھی صرف ماں کا دودھ پلائیں',
  },
  {
    'id': 'C21_D3',
    'urduTitle': 'ماں ہاتھ یا پمپ سے بھی دودھ نکال کر بچے کو پلائیں',
  },
  {
    'id': 'C21_D5',
    'urduTitle': 'بچے کو پانی یا نیم ٹھوس غذا شروع نہیں کریں',
  },
  {
    'id': 'C22_D1',
    'urduTitle': 'بچوں کے دانت کب نکلتے ہیں؟',
  },
  {
    'id': 'C22_D3',
    'urduTitle': 'بچوں کے دانت نکلنے کی علامات',
  },
  {
    'id': 'C22_D5',
    'urduTitle': 'بچوں کے دانت نکلنے کے مرحلے کے بارے میں ہدایات',
  },
  {
    'id': 'C23_D1',
    'urduTitle': 'بچے کو چوسنی (پيسيفائر) ہرگز نہ دیں',
  },
  {
    'id': 'C23_D3',
    'urduTitle': 'بچے کی صفائی کا خاص خیال رکھیں',
  },
  {
    'id': 'C23_D5',
    'urduTitle': 'اپنے گھر کے ماحول کو صاف رکھیں',
  },
  {
    'id': 'C24_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C24_D3',
    'urduTitle': 'بچے کی سمجھنے اور زبان سیکھنے کی نشونما',
  },
  {
    'id': 'C24_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C25_D1',
    'urduTitle': 'بچے کی اضافی غذا کا آغاز: کرنے والے کام (Do’s)',
  },
  {
    'id': 'C25_D3',
    'urduTitle': 'بچے کی اضافی غذا: نہیں کرنے والے کام (Don)',
  },
  {
    'id': 'C25_D5',
    'urduTitle': 'چھٹے ماہ کی ویکسینیشن کے بارے میں یاد دہانی!',
  },
  {
    'id': 'C26_D1',
    'urduTitle': 'بچے کو نئی غذا شروع کرنے کے بارے میں ہدایات',
  },
  {
    'id': 'C26_D3',
    'urduTitle': 'بچے کی متوازن خوراک کا کیا مطلب ہے؟',
  },
  {
    'id': 'C26_D5',
    'urduTitle': 'بچے کی متوازن خوراک کن چیزوں سے بنتی ہے؟',
  },
  {
    'id': 'C27_D1',
    'urduTitle': 'کیا بچہ کا موٹا ہونا صحت کی نشانی ہے؟',
  },
  {
    'id': 'C27_D3',
    'urduTitle': 'بچے کی اضافی غذا میں آئرن (iron) کیوں ضروری ہے؟',
  },
  {
    'id': 'C27_D5',
    'urduTitle':
        'دست (diarrhea) کے دوران بچے کی اضافی خوراک کے بارے میں کچھ اصول',
  },
  {
    'id': 'C28_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C28_D3',
    'urduTitle': 'بچے کی زبان سیکھنے کی صلاحیت',
  },
  {
    'id': 'C28_D5',
    'urduTitle': 'بچے کی ذہنی، جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C29_D1',
    'urduTitle': 'بچے کو اضافی غذا کے ساتھ ماں کا دودھ پلائیں',
  },
  {
    'id': 'C29_D3',
    'urduTitle': 'بچے کو کھانے میں فنگر فوڈز متعارف کرائیں',
  },
  {
    'id': 'C29_D5',
    'urduTitle': 'کون سے فنگر فوڈز بچے کو دیے جا سکتے ہیں؟',
  },
  {
    'id': 'C30_D1',
    'urduTitle':
        'میرا بچہ کھانے سے کھیلتا زیادہ ہے اور کھاتا کم ہے۔ کیا یہ پریشان ہونے کی بات ہے؟',
  },
  {
    'id': 'C30_D3',
    'urduTitle': 'بچے کی نشونما میں کھانے سے کھیلنے کی کیا اہمیت ہے؟',
  },
  {
    'id': 'C30_D5',
    'urduTitle': 'بچے کو فنگر فوڈز کھلانے کے کیا فائدے ہیں؟',
  },
  {
    'id': 'C31_D1',
    'urduTitle': 'بچے کی صفائی کا خاص خیال رکھیں',
  },
  {
    'id': 'C31_D3',
    'urduTitle': 'ماں کی صحت بہت ضروری ہے',
  },
  {
    'id': 'C31_D5',
    'urduTitle': 'اپنے بچے کے ساتھ وقت گزاریں',
  },
  {
    'id': 'C32_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C32_D3',
    'urduTitle': 'بچے کی زبان سیکھنے اور سمجھنے کی صلاحیت',
  },
  {
    'id': 'C32_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C33_D1',
    'urduTitle': 'ماں کا دودھ اب بھی بچے کے لئے ضروری ہے',
  },
  {
    'id': 'C33_D3',
    'urduTitle': 'بچے کے دانت نکلنے کے دوران کی ہدایات',
  },
  {
    'id': 'C33_D5',
    'urduTitle': 'اپنے بچے کو چوسنی یا بوتل ہرگز نہ دیں',
  },
  {
    'id': 'C34_D1',
    'urduTitle': 'بچے کی ناک صاف رکھے!',
  },
  {
    'id': 'C34_D3',
    'urduTitle': 'بچے کو سگریٹ کے دھوئیں سے محفوظ رکھے!',
  },
  {
    'id': 'C34_D5',
    'urduTitle': 'بچے کو ملیریا سے محفوظ رکھے!',
  },
  {
    'id': 'C35_D1',
    'urduTitle': 'بچے کو کھانا کھلانے کے بارے میں رہنمائی',
  },
  {
    'id': 'C35_D3',
    'urduTitle': 'والدین بچوں کی پیدائش میں مناسب وقفہ کے بارے میں بات کریں!',
  },
  {
    'id': 'C35_D5',
    'urduTitle': 'بچے کی پرورش اور والدین کی ذمہ داری!',
  },
  {
    'id': 'C36_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C36_D3',
    'urduTitle': 'بچے کی زبان سیکھنے اور سمجھنے کی صلاحیت',
  },
  {
    'id': 'C36_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C37_D1',
    'urduTitle': 'بچے کی دیکھ بھال سے متعلق رہنمائی: کرنے والے کام (Do’s)',
  },
  {
    'id': 'C37_D3',
    'urduTitle':
        'بچے کی دیکھ بھال سے متعلق رہنمائی: وہ کام جو ہرگز نہ کریں (Don’ts)',
  },
  {
    'id': 'C37_D5',
    'urduTitle': 'نویں مہینے کی ویکسینیشن کے بارے میں یاد دہانی!',
  },
  {
    'id': 'C38_D1',
    'urduTitle': 'بچے کی غذا سے متعلق رہنمائی',
  },
  {
    'id': 'C38_D3',
    'urduTitle': 'کیا بچے کو ڈبے کا جوس دینا چاہیے؟',
  },
  {
    'id': 'C38_D5',
    'urduTitle': 'بچے کو میٹھے کھانے یا اشیاء دینے کے کیا نقصانات ہیں؟',
  },
  {
    'id': 'C39_D1',
    'urduTitle': 'بچے کی لمبائی اور وزن کی نگرانی کیوں ضروری ہے؟',
  },
  {
    'id': 'C39_D3',
    'urduTitle': 'غذائی کمی بچے کے لئے کس طرح نقصان دہ ہیں؟',
  },
  {
    'id': 'C39_D5',
    'urduTitle': 'بچے کی لمبائی اور وزن کب چیک کریں؟',
  },
  {
    'id': 'C40_D1',
    'urduTitle': 'بچے کی جسمانی نشونما',
  },
  {
    'id': 'C40_D3',
    'urduTitle': 'بچے کی زبان سیکھنے اور سمجھنے کی صلاحیت',
  },
  {
    'id': 'C40_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C41_D1',
    'urduTitle': 'بچے کی غذا کے بارے میں رہنمائی کرنے والے کام (Do’s)',
  },
  {
    'id': 'C41_D3',
    'urduTitle': 'بچے کو کھانے کے وقت خاندان کے ساتھ شامل کریں',
  },
  {
    'id': 'C41_D5',
    'urduTitle': 'بچے کی خود کھانے کی حوصلہ افزائی کریں',
  },
  {
    'id': 'C42_D1',
    'urduTitle': 'کھانے میں وٹامن سی والی سبزیوں اور پھل کا استعمال کریں',
  },
  {
    'id': 'C42_D3',
    'urduTitle': 'بچوں کے دانتوں کو صاف رکھیں',
  },
  {
    'id': 'C42_D5',
    'urduTitle': 'بچے کے آس پاس چھوٹی چھوٹی اشیاء نہ رکھیں',
  },
  {
    'id': 'C43_D1',
    'urduTitle': 'بچے کی جسمانی نشونما: موٹے پٹھوں کی صلاحیت (Gross Motor)',
  },
  {
    'id': 'C43_D3',
    'urduTitle': 'بچے کی جسمانی نشونما: باریک پٹھوں کی صلاحیت (Fine Motor)',
  },
  {
    'id': 'C43_D5',
    'urduTitle': 'اپنے گھر کو بچے کے لئے محفوظ بنائیں: کرنے والے کام (Do’s)',
  },
  {
    'id': 'C44_D1',
    'urduTitle': 'بچے کی زبان سیکھنے صلاحیت',
  },
  {
    'id': 'C44_D3',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت',
  },
  {
    'id': 'C44_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
  {
    'id': 'C45_D1',
    'urduTitle': 'بچے کی غذا کے متعلق رہنمائی: کرنے والے کام (Do’s)',
  },
  {
    'id': 'C45_D3',
    'urduTitle': 'بچے کی غذائیت کے لیے "Eat the Rainbow" کا اصول اپنائیں',
  },
  {
    'id': 'C45_D5',
    'urduTitle': 'بچے کو خود سے کھانا سکھائیں',
  },
  {
    'id': 'C46_D1',
    'urduTitle': 'والدین بچے کے ساتھ کھیلیں',
  },
  {
    'id': 'C46_D3',
    'urduTitle': 'بچے کو تعلیمی کھلونے اور رنگین کتابیں دیں',
  },
  {
    'id': 'C46_D5',
    'urduTitle': 'بارھویں مہینے کی ویکسینیشن کے بارے میں یاد دہانی!',
  },
  {
    'id': 'C47_D1',
    'urduTitle': 'بہن بھائیوں کو بچے کے ساتھ کھیلنے کی حوصلہ افزائی کریں',
  },
  {
    'id': 'C47_D3',
    'urduTitle': 'بچے کی زبان سیکھنے کی صلاحیت',
  },
  {
    'id': 'C47_D5',
    'urduTitle': 'بچے کی جسمانی نشونما: موٹے پٹھوں کی صلاحیت (Gross Motor)',
  },
  {
    'id': 'C48_D1',
    'urduTitle': 'بچے کی جسمانی نشونما: باریک پٹھوں کی صلاحیت (Fine Motor)',
  },
  {
    'id': 'C48_D3',
    'urduTitle': 'بچے کی سمجھنے کی صلاحیت',
  },
  {
    'id': 'C48_D5',
    'urduTitle': 'بچے کی جذباتی اور سماجی نشونما',
  },
];

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  NotificationService() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
    initializeNotifications();
  }

  void initializeNotifications() async {
    if (_isInitialized) return;
    _isInitialized = true;

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      final newStatus = await Permission.notification.request();

      if (newStatus.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  Map<String, String> getNotificationMessage(String id) {
    final message = notificationMessages.firstWhere(
      (element) => element['id'] == id,
      orElse: () => {
        'urduTitle': 'کوئی پیغام دستیاب نہیں',
      },
    );
    return {
      'urduTitle': message['urduTitle'] ?? '',
    };
  }

  Future<void> handleWeekTransition(
      bool isDelivered, int totalPregnancyWeek, int totalChildWeek) async {
    // Cancel all previous notifications for the current week
    await cancelWeekNotifications(isDelivered ? 'C' : 'P',
        isDelivered ? totalChildWeek : totalPregnancyWeek);

    if (isDelivered) {
      await scheduleChildNotificationLogic(
          totalChildWeek, DateTime.now().weekday);
    } else {
      await scheduleNotificationLogic(
          totalPregnancyWeek, DateTime.now().weekday);
    }
  }

  Future<void> scheduleNotificationLogic(
      int totalPregnancyWeek, int currentWeekDay) async {
    _scheduleLogic(
      idPrefix: 'P',
      week: totalPregnancyWeek,
      currentWeekDay: currentWeekDay,
      description: 'Reminders for each week of pregnancy',
    );
  }

  Future<void> scheduleChildNotificationLogic(
      int totalChildWeek, int currentWeekDay) async {
    _scheduleLogic(
      idPrefix: 'C',
      week: totalChildWeek,
      currentWeekDay: currentWeekDay,
      description: 'Reminders for each week of the child',
    );
  }

  Future<void> cancelWeekNotifications(String idPrefix, int week) async {
    // Cancel notifications for Monday, Wednesday, and Friday of the given week
    for (int day in [1, 3, 5]) {
      int uniqueNotificationId =
          int.parse('${idPrefix == 'P' ? 1 : 2}$week$day');
      await flutterLocalNotificationsPlugin.cancel(uniqueNotificationId);
    }
  }

  Future<void> _scheduleLogic({
    required String idPrefix,
    required int week,
    required int currentWeekDay,
    required String description,
  }) async {
    DateTime now = DateTime.now();
    List<int> daysToNotify = [1, 3, 5]; // Monday, Wednesday, Friday

    for (int day in daysToNotify) {
      // Only schedule notifications for the current day or future days in the week
      if (day < currentWeekDay) {
        continue; // Skip days that have already passed in the current week
      }

      DateTime scheduledDateTime = DateTime(
        now.year,
        now.month,
        now.day + (day - now.weekday + 7) % 7,
        11, // Schedule at 11 AM
      );

      if (scheduledDateTime.isBefore(now)) {
        scheduledDateTime = scheduledDateTime.add(Duration(days: 7));
      }

      TZDateTime tzScheduledTime =
          tz.TZDateTime.from(scheduledDateTime, tz.local);

      int uniqueNotificationId =
          int.parse('${idPrefix == 'P' ? 1 : 2}$week$day');
      String notificationId = '${idPrefix}${week}_D$day';
      Map<String, String> message = getNotificationMessage(notificationId);

      // Skip scheduling if the message is the default "no message" message
      if (message['urduTitle'] == 'کوئی پیغام دستیاب نہیں') {
        continue;
      }

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          const AndroidNotificationDetails(
        'weekly_reminders',
        'Weekly Reminders',
        channelDescription: 'Weekly based notifications',
        importance: Importance.max,
        priority: Priority.high,
      );

      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      await flutterLocalNotificationsPlugin.zonedSchedule(
        uniqueNotificationId,
        'آج کی معلومات',
        message['urduTitle'],
        tzScheduledTime,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

      print(
          'Notification scheduled for $scheduledDateTime with ID: $notificationId');
    }
  }

  Future<void> schedulePeriodicTask(
      bool isDelivered, int totalPregnancyWeek, int totalChildWeek) async {
    await Workmanager().registerPeriodicTask(
      "weekly_notification_task",
      "pregnancy_or_child_notification_task",
      inputData: {
        'totalPregnancyWeek': isDelivered ? 0 : totalPregnancyWeek,
        'totalChildWeek': isDelivered ? totalChildWeek : 0,
        'currentWeekDay': DateTime.now().weekday,
      },
      frequency: const Duration(days: 7),
      existingWorkPolicy: ExistingWorkPolicy.keep,
    );
  }

  Timer startTimer(Function onTimerTick) {
    return Timer.periodic(const Duration(seconds: 30), (timer) {
      if (isPast11AM()) {
        onTimerTick();
      }
    });
  }

  bool isPast11AM() {
    DateTime now = DateTime.now();
    DateTime elevenAM = DateTime(now.year, now.month, now.day, 11, 0);
    return now.isAfter(elevenAM);
  }
}
