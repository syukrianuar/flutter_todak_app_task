import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_app_task/model/address.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key, required this.onAddAddress});

  final void Function(Address address) onAddAddress;

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final _formKey = GlobalKey<FormState>();
  var _enteredContactName = '';
  var _enteredAddress = '';
  var _enteredCity = '';
  var _enteredPostcode = 1;
  var _enteredState = '';

//   void saveAddress() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final addressesJson = json.encode(widget.addresses
//         .map((todo) => {
//               'contact_name': todo.contactName,
//               'address': todo.address,
//               'city': todo.city,
//               'postcode': todo.postcode,
//               'state': todo.state,
           
//             })
//         .toList());
//     await prefs.setString('todos', todosJson);
// }

  void submitAddress() {
    // final enteredPostcode = int.tryParse(_enteredPostcode);
    // final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onAddAddress(Address(
          contactName: _enteredContactName,
          address: _enteredAddress,
          city: _enteredCity,
          postcode: _enteredPostcode,
          state: _enteredState));
          // saveAddress();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Address'),
      ),
      body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text('Contact Name'),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(Icons.person, color: Colors.black),
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: secondaryColor,
                            width: 32.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onSaved: (newValue) {
                    _enteredContactName = newValue!;
                  },
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Enter your name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('Address'),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(Icons.house, color: Colors.black),
                    hintText: "Address",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: secondaryColor,
                            width: 32.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onSaved: (newValue) {
                    _enteredAddress = newValue!;
                  },
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Enter your address';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('City'),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon:
                        const Icon(Icons.location_city, color: Colors.black),
                    hintText: "City",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: secondaryColor,
                            width: 32.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onSaved: (newValue) {
                    _enteredCity = newValue!;
                  },
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Enter your city';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('Postcode'),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  // controller: _nameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(Icons.numbers, color: Colors.black),
                    hintText: "Postcode",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: secondaryColor,
                            width: 32.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onSaved: (newValue) {
                    _enteredPostcode = int.parse(newValue!);
                  },
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Enter your postcode';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('State'),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  // controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: const Icon(Icons.flag, color: Colors.black),
                    hintText: "State",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: secondaryColor,
                            width: 32.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onSaved: (newValue) {
                    _enteredState = newValue!;
                  },
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Enter your state';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  child: SizedBox(
                    width: Adaptive.w(50),
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 223, 95, 49),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: submitAddress,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
