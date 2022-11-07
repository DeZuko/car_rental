/* 
#4
Page 1
Muhammad Aiman Danial Bin Farisan Azmi
*/
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
  String name = '';
  String address = '';
  String phoneNum = '';
  String email = '';
  String vehicleType = '';
  String startDate = '';
  String endDate = '';
  String startTime = '';
  String endTime = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildName(),
          const SizedBox(height: 15),
          buildAddress(),
          const SizedBox(height: 15),
          buildPhoneNum(),
          const SizedBox(height: 15),
          buildEmail(),
          const SizedBox(height: 15),
          buildVehicleType(),
          const SizedBox(height: 15),
          buildStartDate(),
          const SizedBox(height: 15),
          buildStartTime(),
          const SizedBox(height: 15),
          buildEndDate(),
          const SizedBox(height: 15),
          buildEndTime(),
          const SizedBox(height: 15),
          buildSubmit(),
        ],
      ),
    );
  }

  Widget buildName() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Name',
          hintText: 'E.g. Aiman Danial Bin Farisan',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          } else if (!(value.length > 5)) {
            return 'Please enter your fullname';
          }
          (value) => setState(() => name = value);
          return null;
        },
        // maxLength: 30,
      );

  Widget buildAddress() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Address',
          hintText: 'E.g. No. 403 Blok B1 Section 1 Wangsa Maju Setapak',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill this field';
          } else if (!(value.length > 10)) {
            return 'Please enter a valid address';
          }
          return null;
        },
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildPhoneNum() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: 'E.g. 01126603151',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildEmail() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'E.g. aquwa@gmail.com',
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return 'Please fill this field';
          } else if (!regExp.hasMatch(value)) {
            return 'Please enter a valid email';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        // onSaved: (value) => setState(() => email = value),
      );

  Widget buildVehicleType() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Vehicle Type',
          hintText: 'E.g. Sedan/SUV/MPV',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildStartDate() => TextFormField(
        decoration: const InputDecoration(
          labelText: "Start Date",
          hintText: 'DD/MM/YYYY',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  /* Widget buildStartDate() => Row(
        children: [
          Expanded(
            child: ListTile(
              title: const Text("Start Date"),
              subtitle: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'DD/MM/YYYY',
                  border: OutlineInputBorder(),
                  // errorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // focusedErrorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // errorStyle: TextStyle(color: Colors.purple),
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
                // maxLength: 30,
                // onSaved: (value) => setState(() => name = value),
              ),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            child: ListTile(
              title: const Text("Start Time"),
              subtitle: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'E.g. 1445 (24 Hours)',
                  border: OutlineInputBorder(),
                  // errorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // focusedErrorBorder:
                  //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  // errorStyle: TextStyle(color: Colors.purple),
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
                // maxLength: 30,
                // onSaved: (value) => setState(() => name = value),
              ),
            ),
          ),
        ],
      ); */

  Widget buildStartTime() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Start Time',
          hintText: 'E.g. 1445 (24 Hours)',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildEndDate() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'End Date',
          hintText: 'DD/MM/YYYY',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildEndTime() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'E.g. 1445 (24 Hours)',
          labelText: 'End Time',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
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
        // maxLength: 30,
        // onSaved: (value) => setState(() => name = value),
      );

  Widget buildSubmit() => Container(
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
      );
}
