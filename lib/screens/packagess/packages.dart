import 'package:flutter/material.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _SearchpageState();
}

class _SearchpageState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: colorteal,
        title: mytext("ADD NEW PACKAGE",
            fontFamily: sedan, fontSize: 20, color: whitecolor),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: colorteal, borderRadius: BorderRadius.circular(20)),
                height: mediaqueryheight(0.76, context),
                width: mediaquerywidht(0.95, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaqueryheight(0.02, context),
                    ),
                    const TopName(
                      text: "PACKAGE NAME",
                    ),
                    const PackageFields(
                      hinttext: "Package Name",
                      prefixicon: Icon(Icons.abc),
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.01, context),
                    ),
                    const TopName(
                      text: "DESTINATION",
                    ),
                    const PackageFields(
                      hinttext: "Destination",
                      prefixicon: Icon(Icons.place),
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.01, context),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TopName(
                          text: "DAYS",
                        ),
                        TopName(
                          text: "NIGHTS",
                        ),
                        TopName(
                          text: "COUNTRY",
                        ),
                        TopName(
                          text: "CITIES",
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        PackageFieldsdayandnights(
                          prefixicon: Icon(Icons.sunny),
                        ),
                        PackageFieldsdayandnights(
                          prefixicon: Icon(Icons.night_shelter),
                        ),
                        PackageFieldsdayandnights(
                          prefixicon: Icon(Icons.location_city),
                        ),
                        PackageFieldsdayandnights(
                          prefixicon: Icon(Icons.location_city),
                        ),
                      ],
                    ),
                    const TopName(
                      text: "START DATE",
                    ),
                    const PackageFields(
                      hinttext: "Start Date",
                      prefixicon: Icon(Icons.date_range),
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.01, context),
                    ),
                    const TopName(
                      text: "END DATE",
                    ),
                    const PackageFields(
                      hinttext: "End Date",
                      prefixicon: Icon(Icons.date_range_sharp),
                    ),
                    SizedBox(
                      height: mediaqueryheight(0.07, context),
                    ),
                    Center(
                      
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: orangecolor,
                              borderRadius: BorderRadius.circular(10)),
                          height: mediaqueryheight(0.05, context),
                          width: mediaquerywidht(0.5, context),
                          child: Center(
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  fontFamily: sedan,
                                  fontSize: 24,
                                  color: whitecolor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopName extends StatelessWidget {
  final String text;
  const TopName({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        text,
        style: const TextStyle(color: whitecolor),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class PackageFields extends StatelessWidget {
  final String hinttext;
  final prefixicon;
  const PackageFields({
    super.key,
    required this.hinttext,
    required this.prefixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaquerywidht(0.9, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whitecolor,
          boxShadow: [
            BoxShadow(
              color: blackcolor.withOpacity(0.5), // Shadow color
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: TextField(
          cursorColor: whitecolor,
          style: const TextStyle(color: colorteal),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            prefixIconColor: colorteal,
            labelStyle: const TextStyle(color: colorteal),
            hintText: hinttext,
            hintStyle: const TextStyle(
              color: colorteal,
              fontSize: 18.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: whitecolor),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}

class PackageFieldsdayandnights extends StatelessWidget {
  final prefixicon;
  const PackageFieldsdayandnights({
    super.key,
    required this.prefixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaquerywidht(0.20, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whitecolor,
          boxShadow: [
            BoxShadow(
              color: blackcolor.withOpacity(0.5), // Shadow color
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          cursorColor: whitecolor,
          style: const TextStyle(color: colorteal),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            prefixIconColor: colorteal,
            labelStyle: const TextStyle(color: colorteal),
            hintStyle: const TextStyle(
              color: colorteal,
              fontSize: 18.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: whitecolor),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}