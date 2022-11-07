class RentHours {
  String price;
  String rm;
  int hour;
  RentHours(this.price, this.rm, this.hour);
}

class Mpv {
  int hour;
  List<RentHours> detail1;
  String label;
  String imageUrl;
  String about;
  Mpv(this.label, this.imageUrl, this.about, this.hour, this.detail1);

  static List<Mpv> samples = [
    Mpv(
      'Toyota Wish',
      'assets/ToyotaWish.png',
      'Treat your cats to a luxurious stay at Malaysia’s first cat hotel for their next boarding. '
          'Enjoy a worry-free holiday here!'
          '\n\nServices: Cat hotel, Spa and grooming, Day care.'
          '\n\nOpening hours: Every day 10 am to 7 pm',
      1,
      [
        RentHours('\nTotal price for hour(s):', 'RM', 12),
      ],
    ),
    Mpv(
      'Kia Carnival',
      'assets/KiaCarnival.png',
      'This cat boarding house offers options of indoor and outdoor boarding,'
          'as well as individual playtime so your cats can feel at home when staying with them.'
          '\n\nServices: Boarding '
          '\n\nOpening hours: By appointment only',
      1,
      [
        RentHours('Total price for hour(s):', 'RM', 15),
      ],
    ),
  ];
}
