// By: Ariffin
import 'package:car_rental/mpv_detail.dart';
import 'package:flutter/material.dart';
import 'mpv.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: Mpv.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MpvDetail(mpv: Mpv.samples[index]);
                    },
                  ),
                );
              },
              child: buildDetail(Mpv.samples[index]),
            );
          },
        ),
      ),
    );
  }
}

Widget buildDetail(Mpv mpv) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(mpv.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            mpv.label,
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
