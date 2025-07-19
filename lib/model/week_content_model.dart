import 'package:pehli_gaza_app/model/day_content_model.dart';

class WeekContentModel {
  final String weekName;
  final List<DayContentModel> days;
  final String phase;
  final String uniqueID;

  WeekContentModel({
    required this.weekName,
    required this.days,
    required this.phase,
    required this.uniqueID,
  });
}
