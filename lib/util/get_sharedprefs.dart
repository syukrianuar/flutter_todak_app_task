import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_app_task/model/address.dart';
import 'package:todak_app_task/screen/addresses.dart';

class SharedPrefsStorage {
  Future refreshStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    if (kDebugMode) {
      print('storage is reloading');
    }
  }

  Future clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
    if (kDebugMode) {
      print('storage is clearing');
    }
  }

  Future getAddressList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<Address> listAddresses;

    void loadAddress() async {
      final prefs = await SharedPreferences.getInstance();
      final addressesJson = prefs.getString('addresses');
      print("this is addressesJson : $addressesJson");
      if (addressesJson != null) {
        final addressesData = json.decode(addressesJson);
        int index = 0;
        listAddresses = addressesData
            .map<Address>((addressData) => Address(
                contactName: addressData['contact_name'],
                address: addressData['address'],
                city: addressData['city'],
                postcode: addressData['postcode'],
                state: addressData['state']))
            .toList();

        listAddresses;
      }
    }

    return listAddresses;

    // final address = prefs.getString('addresses');
    // return address;
  }
}
