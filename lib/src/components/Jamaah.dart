import 'package:prayer_timetable/src/components/Prayers.dart';

class Jamaah extends Prayers {
  @override
  DateTime dawn = DateTime.now();
  @override
  DateTime sunrise = DateTime.now();
  @override
  DateTime midday = DateTime.now();
  @override
  DateTime afternoon = DateTime.now();
  @override
  DateTime sunset = DateTime.now();
  @override
  DateTime dusk = DateTime.now();

  Jamaah(
    Prayers prayers,
    List<String> jamaahMethods,
    List<List<int>> jamaahOffsets,
  ) {
    /* *********************** */
    /* PRAYER LISTS            */
    /* *********************** */

    List<DateTime> jamaahTimes = [];

    List prayerCount = Iterable<int>.generate(6).toList();
    List<DateTime> prayerList = [
      prayers.dawn,
      prayers.sunrise,
      prayers.midday,
      prayers.afternoon,
      prayers.sunset,
      prayers.dusk
    ];

    prayerCount.forEach((prayerId) {
      // print(prayers);
      // DateTime jamaahTime = DateTime(;
      int offset;
      DateTime jamaahTime;
      // String method =
      //     jamaahMethods[prayerId].isNotEmpty ? jamaahMethods[prayerId] : null;

      if (jamaahOffsets[prayerId].isNotEmpty) {
        offset = jamaahOffsets[prayerId][0] * 60 + jamaahOffsets[prayerId][1];
      } else
        offset = 0;

      // print('method: $method offset: $offset');

      if (jamaahMethods[prayerId] == 'afterthis') {
        // print('it is');
        jamaahTime = prayerList[prayerId].add(Duration(minutes: offset));
      } else if (jamaahMethods[prayerId] == 'fixed') {
        jamaahTime = DateTime(prayerList[prayerId].year,
                prayerList[prayerId].month, prayerList[prayerId].day)
            .add(Duration(minutes: offset));
        //
      } else {
        jamaahTime = prayerList[prayerId];
      }

      jamaahTimes.insert(
        prayerId,
        jamaahTime,
      );
    });

    this.dawn = jamaahTimes[0];
    this.sunrise = jamaahTimes[1];
    this.midday = jamaahTimes[2];
    this.afternoon = jamaahTimes[3];
    this.sunset = jamaahTimes[4];
    this.dusk = jamaahTimes[5];

    //end
  }
}
