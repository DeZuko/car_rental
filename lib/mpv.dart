/* 
#7.2
Page 3
By: Ariffin & Haneef
*/
class RentDays {
  String price;
  String rm;
  int day;
  RentDays(this.price, this.rm, this.day);
}

class Mpv {
  int day;
  List<RentDays> detail1;
  String label;
  String imageUrl;
  String about;
  Mpv(this.label, this.imageUrl, this.about, this.day, this.detail1);

  static List<Mpv> samples = [
    Mpv(
      'Toyota Wish',
      'assets/ToyotaWish.png',
      '\nFuel Consumption (L/100km): '
          '6.7'
          '\nCapacity: '
          '6-7 seaters'
          '\nMaximum Speed: '
          '195km/h',
      1,
      [
        RentDays('\nTotal price for day(s):', 'RM', 300),
      ],
    ),
    Mpv(
      'Kia Carnival',
      'assets/KiaCarnival.png',
      '\nFuel Consumption (L/100km): '
          '7.9'
          '\nCapacity: '
          '8 seaters'
          '\nMaximum Speed: '
          '190km/h',
      1,
      [
        RentDays('Total price for day(s):', 'RM', 350),
      ],
    ),
  ];
}
