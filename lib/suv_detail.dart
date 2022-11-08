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
  final _couponKey = GlobalKey<FormState>();
  double discount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.suv.label),
      ),
      backgroundColor: Colors.brown[100],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: Form(
                    key: _couponKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter discount code',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 27.0),
                          labelStyle: TextStyle(fontSize: 13.0),
                          labelText: 'Enter discount code'),
                      validator: (value) {
                        if (!(value == "MY50")) {
                          discount = 1;
                          return 'Invalid input';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.brown[300],
                        shadowColor: Colors.brown,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(100, 40), //////// HERE
                      ),
                      child: const Text("Apply"),
                      onPressed: () {
                        if (_couponKey.currentState!.validate()) {
                          discount = 0.5;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Coupon applied'),
                              duration: Duration(seconds: 1, milliseconds: 500),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Track and display price changes total
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: widget.suv.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final subtotal = widget.suv.subtotal[index];
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
              padding: const EdgeInsets.symmetric(vertical: 20.0),
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
