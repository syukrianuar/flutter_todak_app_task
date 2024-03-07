import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/widget/address_item.dart';
import 'package:todak_app_task/widget/address_lists.dart';
import 'package:todak_app_task/widget/new_address.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

List<Address> listAddresses = [];

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    super.initState();
    fetchAddressesWithDefault().then((value) {
      setState(() {
        listAddresses = value;
      });
    });
    // loadAddress();
    // listAddresses;
    // print(listAddresses);
  }

  Future<List<Address>> fetchAddressesWithDefault() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final addressList = prefs.getStringList('addresses');
    if (addressList == null) {
      return [];
    }
    return addressList.map((json) => Address.fromJson(json)).toList();
  }

  void setDefaultAddress(int index) {
    setState(() {
      for (var address in listAddresses) {
        address.isDefault = false;
      }
      listAddresses[index].isDefault = true;
    });
    saveAddress();
  }

  // void loadAddress() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final addressesJson = prefs.getString('addresses');
  //   print("this is addressesJson : $addressesJson");
  //   if (addressesJson != null) {
  //     final addressesData = jsonDecode(addressesJson);
  //     int index = 0;
  //     listAddresses = addressesData
  //         .map<Address>((addressData) => Address(
  //             contactName: addressData['contact_name'],
  //             address: addressData['address'],
  //             city: addressData['city'],
  //             postcode: addressData['postcode'],
  //             state: addressData['state']))
  //         .toList();
  //     setState(() {
  //       listAddresses;
  //     });
  //   }
  // }

  void saveAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final addressesJson = json.encode(listAddresses
    //     .map((address) => {
    //           'contact_name': address.contactName,
    //           'address': address.address,
    //           'city': address.city,
    //           'postcode': address.postcode,
    //           'state': address.state,
    //         })
    //     .toList());
    final List<String> addressesJson =
        listAddresses.map((address) => address.toJson()).toList();
    await prefs.setStringList('addresses', addressesJson);
  }

  void addAddress(Address address) {
    setState(() {
      listAddresses.add(address);
      saveAddress();
    });
  }

  void newAddress() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => NewAddress(
                  onAddAddress: addAddress,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Text('Oops, no data.');

    if (listAddresses.isNotEmpty) {
      mainContent = AddressLists(
        addresses: listAddresses,
        onSetDefaultAddress: setDefaultAddress,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mainContent,
          Align(
            child: ElevatedButton.icon(
                onPressed: newAddress,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                icon: Icon(Icons.add),
                label: Text('Add New Address')),
          )
        ],
      ),
    );
  }
}
