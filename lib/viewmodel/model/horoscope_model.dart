class HoroscopeModel {
  static List<HoroscopeModelItem> items = [
    HoroscopeModelItem(
      title: 'Aries',
      image: 'assets/img/horoscope/Aries.jpg',
      date: 'March 21 - April 19'
    ),
    HoroscopeModelItem(
      title: 'Taurus',
      image: 'assets/img/horoscope/Taurus.jpg',
      date: 'April 20 - May 20'
    ),
    HoroscopeModelItem(
      title: 'Gemini',
      image: 'assets/img/horoscope/Gemini.jpg',
      date: 'May 21 - June 20'
    ),
    HoroscopeModelItem(
      title: 'Cancer',
      image: 'assets/img/horoscope/Cancer.jpg',
      date: 'June 21 - July 22'
    ),
    HoroscopeModelItem(
      title: 'Leo',
      image: 'assets/img/horoscope/leo.jpg',
      date: 'July 23 - August 22'
    ),
    HoroscopeModelItem(
      title: 'Virgo',
      image: 'assets/img/horoscope/Virgo.jpg',
      date: 'August 23 - September 22'
    ),
    HoroscopeModelItem(
      title: 'Libra',
      image:'assets/img/horoscope/Libra.jpg',
      date: 'September 23 - October 22'
    ),
    HoroscopeModelItem(
      title: 'Scorpio',
      image: 'assets/img/horoscope/Scorpio.jpg',
      date: 'October 23 - November 21'
    ),
    HoroscopeModelItem(
      title: 'Sagittarius',
      image: 'assets/img/horoscope/Sagittarius.jpg',
      date: 'November 22 - December 21'
    ),
    HoroscopeModelItem(
      title: 'Capricorn',
      image: 'assets/img/horoscope/Capricorn.jpg',
      date: 'December 22 - January 19'
    ),
    HoroscopeModelItem(
      title: 'Aquarius',
      image: 'assets/img/horoscope/Aquarius.jpg',
      date: 'January 20 - February 18'
    ),
    HoroscopeModelItem(
      title: 'Pisces',
      image: 'assets/img/horoscope/Pisces.jpg',
      date: 'February 19 - March 20'
    ),
  ];
}

class HoroscopeModelItem {
  final String title;
  final String image;
  final String date;

  HoroscopeModelItem({
    required this.title,
    required this.image,
    required this.date,
  });
}
