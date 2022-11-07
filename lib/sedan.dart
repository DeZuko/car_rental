class RentHours {
  String price;
  String rm;
  int day;
  RentHours(this.price, this.rm, this.day);
}

class Sedan {
  int day;
  List<RentHours> subtotal;
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
          '\n5 peoples'
          '\n\nMaximum Speed:'
          '\n107km/h',
      1,
      [
        RentHours('\nTotal price for day(s):', 'RM', 12),
      ],
    ),
    Sedan(
      'Nissan Almera',
      'assets/NissanAlmera.png',
      '\nFuel Consumption (L/100km):'
          '\n5.4'
          '\n\nCapacity:'
          '\n5 peoples'
          '\n\nMaximum Speed:'
          '\n196km/h',
      1,
      [
        RentHours('Total price for day(s):', 'RM', 15),
      ],
    ),
  ];
}
