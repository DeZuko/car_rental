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
  // Declare & initialize slider value
  int _sliderVal = 1;
  // Create global key for coupon form
  final _couponKey = GlobalKey<FormState>();
  // Declare & initialize discount value
  // (before coupon applied)
  double discount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Avoid overflow size
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.sedan.model),
      ),
      backgroundColor: Colors.brown[100],
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

            // Display car model
            Text(
              widget.sedan.model,
              style: const TextStyle(fontSize: 20),
            ),

            // Display car detail
            Text(
              widget.sedan.about,
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
                  // Coupon text form field
                  child: Form(
                    // Assign couponkey key global variable to key?
                    key: _couponKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter discount code',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 27.0),
                          labelStyle: TextStyle(fontSize: 13.0),
                          labelText: 'Enter discount code'),
                      // The coupon code: MY50
                      validator: (value) {
                        // If coupon invalid
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

                // Apply button for coupon
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
                      // Validation based on couponkey earlier
                      onPressed: () {
                        if (_couponKey.currentState!.validate()) {
                          discount = 0.5;
                          ScaffoldMessenger.of(context).showSnackBar(
                            // return message banner in same page
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

            // Track & display the price changes total
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: widget.sedan.subtotal.length,
                itemBuilder: (BuildContext context, int index) {
                  final subtotal = widget.sedan.subtotal[index];
                  // Display the subtotal value
                  return Text(
                      textAlign: TextAlign.center,
                      '${subtotal.price}'
                      '${subtotal.rm}'
                      // '${subtotal.day * _sliderVal}',

                      // Arithmetic along with discount
                      // No discount means discount = 1
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
              // Set label value
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
                // Route to Homepages
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  // Display message banner in homepage
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
