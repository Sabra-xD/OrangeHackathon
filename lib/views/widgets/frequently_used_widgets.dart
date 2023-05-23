import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmp_developers/constants/apiBack.dart';
import 'package:flutter_cmp_developers/controllers/checkConnection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/constants.dart';
import '../../controllers/create_account_controller.dart';

//We've created global controls in order to POST to the backend.

/// This function is used to return the TextField for the Phone number entry.
///  Checking if the i/p field is empty and if the given phone nubmer starts with 01 and is valid.
///
///
Widget phoneNumberInput(
  String hintText,
  BuildContext context,
  TextEditingController phoneNumberInputController,
) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.8,
    height: textFieldheight,
    child: TextFormField(
      maxLength: 11,
      cursorColor: textFieldTextColor,
      keyboardType: TextInputType.phone,
      controller: phoneNumberInputController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter the phone number";
        } else {
          if (hasRequiredNumberOfDigits(phoneNumberInputController.text, 11)) {
            return "Please enter a valid phone number";
          }
        }
        return null;
      },
    ),
  );
}

///In this function we get First, last names on create
///
///

Widget textFormFieldInput(
    String hintText,
    String emptyInputError,
    TextInputType keyBoardType,
    double width,
    BuildContext context,
    TextEditingController genericTextFormInputController) {
  return SizedBox(
    //Also in this function we need to add a controller so that it would send it to the backend?
    width: MediaQuery.of(context).size.width * width,
    height: textFieldheight,
    child: TextFormField(
      cursorColor: textFieldTextColor,
      controller: genericTextFormInputController,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return emptyInputError;
        } else {
          return null; //Here we are supposed to Post the First, last and birthday to each of its destinations.
        }
      },
    ),
  );
}

Widget unformSpacing() {
  return const SizedBox(
    height: 12,
  );
}

Widget alreadyHaveAccount(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have an account?   ",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      TextButton(
        key: const Key("LOGIN_FIRST_SCREEN"),
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            '/SignInScreen',
          );
        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ],
  );
}

SizedBox uniformWidth() {
  return const SizedBox(
    width: 5,
  );
}

TextStyle uniformTextStyle() {
  return const TextStyle(
      fontSize: transactionFontSize,
      color: Colors.black,
      fontWeight: FontWeight.bold);
}

///Bottom Navigation bar:
///
///

TabBar bottomNavigatiohBar(BuildContext context, TabController controller) {
  return TabBar(
    controller: controller,
    unselectedLabelColor: Colors.grey,
    labelColor: Colors.blue,
    onTap: (index) {
      print(controller.index);
      print(controller.index);
      print(controller.index);
      print(controller.index);
      print(controller.index);
      print(controller.index);
    },
    tabs: [
      Tab(
        icon: IconButton(
          icon: Image.asset('assets/images/menuIcon.png'),
          onPressed: () {
            adjustTabBarControllerIndex(controller, 0);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            // Navigator.pushNamed(context, '/HomeScreen');
          },
        ),
      ),
      Tab(
        icon: IconButton(
          icon: Image.asset('assets/images/settingIcon.png'),
          onPressed: () {
            adjustTabBarControllerIndex(controller, 1);

            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            print(controller.index);
            Navigator.pushReplacementNamed(context, '/myServices');
          },
        ),
      ),
      Tab(
        icon: IconButton(
          icon: Image.asset('assets/images/walletIcon.jpg'),
          onPressed: () {
            adjustTabBarControllerIndex(controller, 2);

            Navigator.pushReplacementNamed(context, "/VirtualCard");
          },
        ),
      ),
      Tab(
        icon: IconButton(
          icon: Image.asset('assets/images/homeIcon.png'),
          onPressed: () {
            adjustTabBarControllerIndex(controller, 3);
            Navigator.pushReplacementNamed(context, "/HomeScreen");
          },
        ),
      )
    ],
  );
}

////
///
///
///Home Slider that displays Total Balance, Income & OutCome etc.
Widget coursal_Slider(
    BuildContext context, String Response, String Income, String OutCome) {
  return Container(
    width: MediaQuery.of(context).size.height * 0.5,
    height: MediaQuery.of(context).size.height * 0.2,
    child: CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: AssetImage('assets/images/balance.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Response != ''
                          ? Response
                          : "Loading...", //Get the user's balance here.
                      style: TextStyle(
                        color: myWhite,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'EGP',
                      style: TextStyle(
                        color: myWhite,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: myWhite,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.5,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/balance.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Income"),
                Text(Income != '' ? Income : "Loading.."),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height * 0.5,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/balance.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("OutCome"),
                Text(Income != '' ? Income : "Loading.."),
              ],
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 90.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    ),
  );
}

//This function is used to display Icons within the grid.
Widget gridIconDisplay(BuildContext context, String imageAsset,
    String bottomText, String onPressedRoute) {
  return Material(
    elevation: 5,
    color: myWhite,
    borderRadius: BorderRadius.circular(15),
    child: Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: IconButton(
              icon: SizedBox(
                // height: 100,
                // width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage(imageAsset),
                  backgroundColor: iconColor,
                  radius: 50,
                ),
              ),
              onPressed: () {
                //Add the onPressed Route here.
                Navigator.pushNamed(context, onPressedRoute);
              },
            ),
          ),
          Text(
            bottomText,
            style: uniformTextStyle(),
          )
        ],
      ),
    ),
  );
}

//This function displays the name of user and the Icon in each page.
Widget topName(String Name, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                fontSize: textFontSize,
                color: myWhite,
              ),
            ),
            Text(
              Name,
              style: TextStyle(
                fontSize: textFontSize,
                color: myWhite,
              ),
            )
          ],
        ),
        Container(
          width: 50,
          height: 50,
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/SettingScreen");
              },
              icon: Image.asset('assets/images/malecon.png')),
        ),
      ],
    ),
  );
}

//This function is spacing from the top to avoid using SafeArea.
Widget uniformtopSpacing() {
  return const SizedBox(
    height: 50,
  );
}

Widget amount(
    String hintText,
    String emptyInputError,
    TextInputType keyBoardType,
    double width,
    BuildContext context,
    TextEditingController genericTextFormInputController) {
  final numberRegExp = RegExp(r'^[0-9]+$');
  return SizedBox(
    //Also in this function we need to add a controller so that it would send it to the backend?
    width: MediaQuery.of(context).size.width * width,
    height: textFieldheight,
    child: TextFormField(
      cursorColor: textFieldTextColor,
      controller: genericTextFormInputController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter the amount",
        hintStyle: TextStyle(
          color: textFieldTextColor,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(
          height: 1,
          fontSize: errorFontSize,
        ),
        contentPadding: const EdgeInsets.all(contentPadding),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              textFieldRadius,
            ),
          ),
          borderSide: BorderSide(
            color: textFieldTextColor,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return emptyInputError;
        } else {
          if (!numberRegExp.hasMatch(value)) {
            return "Enter numbers only";
          } else {
            return null;
          }
          //Here we are supposed to Post the First, last and birthday to each of its destinations.
        }
      },
    ),
  );
}
