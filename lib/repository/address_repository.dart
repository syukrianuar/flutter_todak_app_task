import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_app_task/model/address.dart';

class AddressRepository {
  Future<Address?> fetchSingleDefaultAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? addressList = prefs.getStringList('addresses');
    if (addressList == null) {
      return null;
    }
    List<Address> addresses =
        addressList.map((json) => Address.fromJson(json)).toList();
    // return addresses.firstWhere((address) => address.isDefault,);
    try {
      return addresses.firstWhere((address) => address.isDefault);
    } catch (e) {
      return null; // Return null when no default address is found
    }
  }
}
