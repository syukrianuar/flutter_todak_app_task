import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/screen/addresses.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Align(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              // backgroundImage: CachedNetworkImageProvider(
              //   FlutterLogo,
              // )
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Name Bin Nama',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: Adaptive.h(1), horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ProfileViewDetail(
                //   pLabel: 'Identity Number',
                //   pDesc: 'abc',
                // ),
                // // SizedBox(
                // //   height: 1.h,
                // // ),
                // ProfileViewDetail(
                //   pLabel: 'Email',
                //   pDesc: 'def',
                // ),

                // ProfileViewDetail(pLabel: 'Mobile Number', pDesc: 'ghi'),

                ProfileViewDetail(pLabel: 'Address', pDesc: 'jkl'),

                // ProfileViewDetail(pLabel: "City", pDesc: 'mno'),
                // ProfileViewDetail(pLabel: 'Postcode', pDesc: 'pqr'),
                // ProfileViewDetail(pLabel: 'State', pDesc: 'stu'),
                // // ProfileEditForm(),

                SizedBox(
                  height: 20.h,
                ),
                Align(
                  child: SizedBox(
                    width: Adaptive.w(50),
                    height: 6.h,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 223, 95, 49),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {},
                      icon: Icon(Icons.logout),
                      label: Text(
                        'Log Out',
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
          )
        ]));
  }
}

class ProfileViewDetail extends StatelessWidget {
  final String pLabel;
  final String pDesc;
  const ProfileViewDetail({
    super.key,
    required this.pLabel,
    required this.pDesc,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => AddressesScreen()));
      },
      title: Text(
        pLabel,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 6, 41, 70),
        ),
      ),
      trailing: Icon(Icons.navigate_next),
    );

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pLabel,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 6, 41, 70),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          // width: Adaptive.w(85),
          // height: 5.5.h,

          child: Text(pDesc),
        ),
        Divider(),
      ],
    );
  }
}

class ProfileEditForm extends StatelessWidget {
  const ProfileEditForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Mobile Number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 6, 41, 70),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: Adaptive.w(85),
          height: 5.5.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 6, 41, 70),
              width: Adaptive.w(0.5),
            ),
          ),
          child: TextFormField(
              // controller: phoneTextController,
              // decoration: const InputDecoration(
              //   //contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // ),
              ),
        ),
      ],
    );
  }
}
