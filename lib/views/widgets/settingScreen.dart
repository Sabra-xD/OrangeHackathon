import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cmp_developers/controllers/qr_code.dart';
import 'package:flutter_cmp_developers/views/widgets/frequently_used_widgets.dart';

import '../../constants/constants.dart';

Scaffold settings(BuildContext context, PageController _pageController) {
  return Scaffold(
    body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/Home.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            uniformtopSpacing(),
            topName("D7ko", context, _pageController),
            unformSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "       General",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _buildTile(context, '  Edit Profile', Icon(Icons.person)),
            _buildTile(context, '  Change Password', const Icon(Icons.lock)),
            _buildTile(context, '  QR Scan', const Icon(Icons.qr_code), ID: 0),
            _buildTile(context, '  Support', const Icon(Icons.person)),
            // _buildTile(context, '  Edit Profile', Icon(Icons.person)),
            unformSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("       Management",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            unformSpacing(),

            _buildTile(
                context, '  Manage other account', const Icon(Icons.person)),
            unformSpacing(),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("       Feedback",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
            unformSpacing(),

            _buildTile(context, '  Send feedback', const Icon(Icons.email)),

            uniformtopSpacing(),

            _logoutTile(context, "Log Out")
          ],
        ),
      )
    ]),
  );
}

Widget _buildTile(BuildContext context, String title, Icon IconType,
    {int? ID}) {
  return InkWell(
    onTap: () {
      if (ID == 0) {
        scanQR();
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: myWhite, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconType,
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _logoutTile(
  BuildContext context,
  String title,
) {
  return InkWell(
    onTap: () {
      SystemNavigator.pop();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: myWhite, borderRadius: BorderRadius.circular(15)),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
