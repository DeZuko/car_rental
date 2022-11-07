/* 
#7.3
Page 3
By: Ariffin & Haneef
*/
class RentDays {
  String price;
  String rm;
  int day;
  RentDays(this.price, this.rm, this.day);
}

class Suv {
  int day;
  List<RentDays> subtotal;
  String label;
  String imageUrl;
  String about;
  Suv(this.label, this.imageUrl, this.about, this.day, this.subtotal);

  static List<Suv> samples = [
    Suv(
      'Honda BR-V',
      'assets/HondaBrv.png',
      '\nFuel Consumption (L/100km):'
          '\n6.4'
          '\n\nCapacity:'
          '\n7 seaters'
          '\n\nMaximum Speed:'
          '\n160km/h',
      1,
      [
        RentDays('\nTotal price for day(s):', 'RM', 230),
      ],
    ),
    Suv(
      'Proton X50',
      'assets/ProtonX50.png',
      '\nFuel Consumption (L/100km):'
          '\n6.5'
          '\n\nCapacity:'
          '\n7 seaters'
          '\n\nMaximum Speed:'
          '\n195km/h',
      1,
      [
        RentDays('Total price for day(s):', 'RM', 200),
      ],
    ),
  ];
}
