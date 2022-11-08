/* 
#7.1
Page 3
By: Ariffin & Haneef
*/
class RentDays {
  String price;
  String rm;
  int day;
  RentDays(this.price, this.rm, this.day);
}

class Sedan {
  int day;
  List<RentDays> subtotal;
  String model;
  String imageUrl;
  String about;
  Sedan(this.model, this.imageUrl, this.about, this.day, this.subtotal);

  static List<Sedan> samples = [
    // 1st index (at 0)
    Sedan(
      // this.model
      'Honda City',
      // this.imageUrl
      'assets/HondaCity.png',
      // this.about
      '\nFuel Consumption (L/100km): '
          '5.4'
          '\nCapacity: '
          '5 seaters'
          '\nMaximum Speed: '
          '195km/h',
      // this.day
      1,
      // this.subtotal
      [
        RentDays('\nTotal price for day(s) : ', 'RM', 95),
      ],
    ),

    // 2nd index (at 1)
    Sedan(
      // this.model
      'Nissan Almera',
      // this.imageUrl
      'assets/NissanAlmera.png',
      // this.about
      '\nFuel Consumption (L/100km): '
          '5.4'
          '\nCapacity: '
          '5 seaters'
          '\nMaximum Speed: '
          '196km/h',
      // this.day
      1,
      // this.subtotal
      [
        RentDays('\nTotal price for day(s): ', 'RM', 110),
      ],
    ),
  ];
}
