import 'package:car_rental/suv_detail.dart';
import 'package:flutter/material.dart';
import 'suv.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: Suv.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SuvDetail(suv: Suv.samples[index]);
                    },
                  ),
                );
              },
              child: buildDetail(Suv.samples[index]),
            );
          },
        ),
      ),
    );
  }
}

Widget buildDetail(Suv suv) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(suv.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            suv.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          )
        ],
      ),
    ),
  );
}
