/* 
#8.2
Page 3
By: Ariffin & Haneef
*/
import 'package:flutter/material.dart';
import 'suv.dart';
import 'homepage.dart';

class SuvDetail extends StatefulWidget {
  final Suv suv;
  const SuvDetail({Key? key, required this.suv}) : super(key: key);

  @override
  State<SuvDetail> createState() => _SuvDetailState();
  // State<Nav> createState() => _NavState();
}

class _SuvDetailState extends State<SuvDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.suv.label),
      ),
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Create sizebox to display image
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.suv.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),

            // Display car model
            Text(
              widget.suv.label,
              style: const TextStyle(fontSize: 20),
            ),

            // Display car details
            Text(
              widget.suv.about,
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
                onSaved: (val) {
                  if (val == 'coupon') {
                    return null;
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

            // Track and display price changes total
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15.0),
                itemCount: widget.suv.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final subtotal = widget.suv.subtotal[index];
                  return Text(
                      textAlign: TextAlign.center,
                      '${subtotal.price} '
                      '${subtotal.rm} '
                      '${subtotal.day * _sliderVal}',
                      style: const TextStyle(fontSize: 16));
                },
              ),
            ),

            // Create slider
            Slider(
              min: 1,
              max: 30,
              divisions: 30,
              label: '${_sliderVal * widget.suv.day} days',
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
