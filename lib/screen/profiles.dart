import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            height: 1.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: Adaptive.h(1), horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileViewDetail(
                  pLabel: 'Identity Number',
                  pDesc: 'abc',
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                ProfileViewDetail(
                  pLabel: 'Email',
                  pDesc: 'def',
                ),

                ProfileViewDetail(pLabel: 'Mobile Number', pDesc: 'ghi'),

                ProfileViewDetail(pLabel: 'Address', pDesc: 'jkl'),

                ProfileViewDetail(pLabel: "City", pDesc: 'mno'),
                ProfileViewDetail(pLabel: 'Postcode', pDesc: 'pqr'),
                ProfileViewDetail(pLabel: 'State', pDesc: 'stu'),
                // ProfileEditForm(),

                SizedBox(
                  height: 3.h,
                ),
                Align(
                  child: SizedBox(
                    width: Adaptive.w(50),
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 6, 41, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        // await Get.to(() => EditProfile(
                        //           avatarUrl:
                        //               snapshot.data['avatar_url'],
                        //           name: snapshot.data['name'] ?? '',
                        //           email: snapshot.data['email'] ?? '',
                        //           nric: snapshot.data['nric'] ?? '',
                        //           address:
                        //               snapshot.data['address'] ?? '',
                        //           city: snapshot.data['city'] ?? '',
                        //           postal:
                        //               snapshot.data['postcode'] ?? '',
                        //           state: snapshot.data['state'] ?? '',
                        //         ))!
                        //     .then((value) {
                        //   refresh();
                        //   // refresh();
                        // });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'EDIT',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: Adaptive.w(4),
                          ),
                          const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
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
    return Column(
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
