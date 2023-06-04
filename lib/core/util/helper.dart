import 'package:jiffy/jiffy.dart';

Jiffy formatDate(String date) {
  var d = DateTime.tryParse(date) ?? DateTime.now();
  return Jiffy.parseFromMap({
    Unit.year: d.year,
    Unit.month: d.month,
    Unit.day: d.day,
    Unit.hour: d.hour,
    Unit.minute: d.minute
  });
}
