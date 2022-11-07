/* 
#8.1
Page 3
By: Ariffin & Haneef
*/
import 'package:flutter/material.dart';
import 'sedan.dart';
import 'homepage.dart';

class SedanDetail extends StatefulWidget {
  final Sedan sedan;
  const SedanDetail({Key? key, required this.sedan}) : super(key: key);

  @override
  State<SedanDetail> createState() => _SedanDetailState();
  // State<Nav> createState() => _NavState();
}

class _SedanDetailState extends State<SedanDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sedan.model),
      ),
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Create sizebox to display image
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.sedan.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),

            // Display the car model
            Text(
              widget.sedan.model,
              style: const TextStyle(fontSize: 20),
            ),

            // Display the car detail
            Center(
              child: Text(
                widget.sedan.about,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            // Track & display the price changes total
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(30.0),
                itemCount: widget.sedan.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final detail1 = widget.sedan.subtotal[index];
                  return Text(
                      textAlign: TextAlign.center,
                      '${detail1.price} '
                      '${detail1.rm} '
                      '${detail1.day * _sliderVal}',
                      style: const TextStyle(fontSize: 16));
                },
              ),
            ),

            // TextFormField(
            //     decoration: const InputDecoration(
            //       icon:  Icon(Icons.price_check_outlined),
            //       hintText: '',
            //       border: UnderlineInputBorder(),
            //       labelText: 'Enter discount code'),
            //         onSaved: (val) {
            //         print('saved');
            //       },
            //       validator: (val) {
            //       print('validating');
            //     },
            //   ),

            // Create slider
            Slider(
              min: 1,
              max: 30,
              divisions: 30,
              label: '${_sliderVal * widget.sedan.day} days',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.purple[300],
              inactiveColor: Colors.black,
            ),

            // Create container for submit button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Thank you for booking !'),
                      duration: Duration(seconds: 1, milliseconds: 500),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
