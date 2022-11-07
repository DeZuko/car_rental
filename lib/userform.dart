import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nav.dart';
// import 'package:flutter/cupertino.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Text("Form"),

            /* INPUT */
            // Name
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_rounded),
                hintText: 'E.g. Aiman Danial Bin Farisan',
                border: UnderlineInputBorder(),
                labelText: 'Full Name (as Per IC)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length > 5)) {
                  return 'Please enter your fullname';
                }
                return null;
              },
            ),

            // Address
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.location_city),
                hintText: 'E.g. No. 403 Blok B1 Section 1 Wangsa Maju Setapak',
                border: UnderlineInputBorder(),
                labelText: 'Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length > 10)) {
                  return 'Please enter a valid address';
                }
                return null;
              },
            ),

            // Phone Number
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.add_call),
                hintText: 'E.g. 01126603151',
                border: UnderlineInputBorder(),
                labelText: 'Phone Number ',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length >= 9)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),

            //  Input Email
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email_rounded),
                hintText: 'E.g. aquwa@gmail.com',
                border: UnderlineInputBorder(),
                labelText: 'Enter your email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!value.contains('@') || !value.contains('.')) {
                  return 'Please a valid email';
                }
                return null;
              },
            ),

            // Car Details
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.car_rental),
                hintText: 'E.g. Sedan/SUV/MPV',
                border: UnderlineInputBorder(),
                labelText: 'Vehicle Type',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value == 'SUV') &&
                    !(value == 'MPV') &&
                    !(value == 'Sedan')) {
                  return 'Please enter either Sedan, SUV or MPV';
                }
                return null;
              },
            ),

            //  Start Date
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range_rounded),
                hintText: 'DD/MM/YYYY',
                border: UnderlineInputBorder(),
                labelText: 'Start Date',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length == 10)) {
                  return 'Please enter a valid date';
                }
                return null;
              },
            ),

            //  Start Time
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.access_time_filled_rounded),
                hintText: 'E.g. 1445 (24 Hours)',
                border: UnderlineInputBorder(),
                labelText: 'Start Time',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length == 4)) {
                  return 'Please enter a valid time in 24hours format';
                }
                return null;
              },
            ),

            //  End Date
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range_rounded),
                hintText: 'DD/MM/YYYY',
                border: UnderlineInputBorder(),
                labelText: 'End Date',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length == 10)) {
                  return 'Please enter a valid date';
                }
                return null;
              },
            ),

            //  End Time
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.access_time_filled_rounded),
                hintText: 'E.g. 1445 (24 Hours)',
                border: UnderlineInputBorder(),
                labelText: 'End Time',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                } else if (!(value.length == 4)) {
                  return 'Please enter a valid time in 24hours format';
                }
                return null;
              },
            ),

            Container(
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
                child: const Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successful, please wait..'),
                        duration: Duration(seconds: 1, milliseconds: 500),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Nav()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
