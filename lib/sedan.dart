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
    Sedan(
      'Honda City',
      'assets/HondaCity.png',
      '\nFuel Consumption (L/100km):'
          '\n5.4'
          '\n\nCapacity:'
          '\n5 seaters'
          '\n\nMaximum Speed:'
          '\n195km/h',
      1,
      [
        RentDays('\nTotal price for day(s):', 'RM', 95),
      ],
    ),
    Sedan(
      'Nissan Almera',
      'assets/NissanAlmera.png',
      '\nFuel Consumption (L/100km):'
          '\n5.4'
          '\n\nCapacity:'
          '\n5 seaters'
          '\n\nMaximum Speed:'
          '\n196km/h',
      1,
      [
        RentDays('Total price for day(s):', 'RM', 110),
      ],
    ),
  ];
}
