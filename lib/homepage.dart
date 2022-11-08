/* 
#2
By: Muhammad Aiman Danial 
*/
import 'package:flutter/material.dart';
import 'firstpage.dart';
// import 'package:car_rental/nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("3Bros Car Rental"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            // Button
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 550),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text("Welcome, book now!"),
                  onPressed: () {
                    // Route to first page (Customer Form)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstPage()),
                      // builder: (context) => const Nav()),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
}
