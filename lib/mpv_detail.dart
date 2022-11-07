/* 
#8.3
Page 3
By: Ariffin & Haneef
*/
import 'package:flutter/material.dart';
import 'mpv.dart';
import 'homepage.dart';

class MpvDetail extends StatefulWidget {
  final Mpv mpv;
  const MpvDetail({Key? key, required this.mpv}) : super(key: key);

  @override
  State<MpvDetail> createState() => _MpvDetailState();
  // State<Nav> createState() => _NavState();
}

class _MpvDetailState extends State<MpvDetail> {
  int _sliderVal = 1;
  // Temp
  double discount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.mpv.label),
      ),
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Display car image
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.mpv.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),

            // Display car model
            Text(
              widget.mpv.label,
              style: const TextStyle(fontSize: 20),
            ),

            // Display car details
            Text(
              widget.mpv.about,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(
              height: 4,
            ),

            // Input discount code
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter discount code',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 27.0),
                    labelText: 'Enter discount code'),
                onChanged: (val) {
                  if (val == 'coupon') {
                    discount = 0.5;
                  }
                },
                // validator: (val) {
                //   print('validating');
                // },
              ),
            ),

            const SizedBox(
              height: 6,
            ),

            // Track the price changes with slider
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15.0),
                itemCount: widget.mpv.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final subtotal = widget.mpv.subtotal[index];
                  return Text(
                      textAlign: TextAlign.center,
                      '${subtotal.price}'
                      '${subtotal.rm}'
                      // '${subtotal.day * _sliderVal}',
                      '${subtotal.day * _sliderVal * discount}',
                      style: const TextStyle(fontSize: 16));
                },
              ),
            ),

            // Create slider
            Slider(
              min: 1,
              max: 30,
              divisions: 30,
              label: '${_sliderVal * widget.mpv.day} days',
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
