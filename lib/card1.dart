/* 
#6.1
Page 3
By: Ariffin 
*/
import 'package:car_rental/sedan_detail.dart';
import 'package:flutter/material.dart';
import 'sedan.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: Sedan.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SedanDetail(sedan: Sedan.samples[index]);
                    },
                  ),
                );
              },
              child: buildDetail(Sedan.samples[index]),
            );
          },
        ),
      ),
    );
  }
}

Widget buildDetail(Sedan sedan) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(sedan.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            sedan.model,
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
