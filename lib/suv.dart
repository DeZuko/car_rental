class RentHours {
  String price;
  String rm;
  int day;
  RentHours(this.price, this.rm, this.day);
}

class Suv {
  int day;
  List<RentHours> subtotal;
  String label;
  String imageUrl;
  String about;
  Suv(this.label, this.imageUrl, this.about, this.day, this.subtotal);

  static List<Suv> samples = [
    Suv(
      'Honda BR-V',
      'assets/HondaBrv.png',
      '\nFuel Consumption (L/100km):'
          '\n5.4'
          '\n\nCapacity:'
          '\n5 peoples'
          '\n\nMaximum Speed:'
          '\n107km/h',
      1,
      [
        RentHours('\nTotal price for hour(s):', 'RM', 12),
      ],
    ),
    Suv(
      'Proton X50',
      'assets/ProtonX50.png',
      '\nFuel Consumption (L/100km):'
          '\n5.4'
          '\n\nCapacity:'
          '\n5 peoples'
          '\n\nMaximum Speed:'
          '\n107km/h',
      1,
      [
        RentHours('Total price for hour(s):', 'RM', 15),
      ],
    ),
  ];
}
