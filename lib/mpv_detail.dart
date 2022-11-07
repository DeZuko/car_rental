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
  double discount = 0.5;

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
              height: 2,
            ),
            // Display car model
            Text(
              widget.mpv.label,
              style: const TextStyle(fontSize: 18),
            ),
            // Display car details
            Center(
              child: Text(
                widget.mpv.about,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            // Input discount code
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.price_check_outlined),
                  hintText: '',
                  border: UnderlineInputBorder(),
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

            // Track the price changes with slider
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(30.0),
                itemCount: widget.mpv.detail1.length,
                itemBuilder: (BuildContext context, int index) {
                  final detail1 = widget.mpv.detail1[index];
                  return Text(
                      textAlign: TextAlign.center,
                      '${detail1.price} '
                      '${detail1.rm} '
                      '${detail1.day * _sliderVal}',
                      // '${detail1.day * _sliderVal * discount}',
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
