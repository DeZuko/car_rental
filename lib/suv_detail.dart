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
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.suv.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.suv.label,
              style: const TextStyle(fontSize: 18),
            ),
            Center(
              child: Text(
                widget.suv.about,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(30.0),
                itemCount: widget.suv.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final detail1 = widget.suv.subtotal[index];
                  return Text(
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

            Slider(
              min: 1,
              max: 48,
              divisions: 48,
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