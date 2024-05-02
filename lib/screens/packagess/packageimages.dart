import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/screens/packagess/packages.dart';
import 'package:tripx_admin_application/utils/colors.dart';
import 'package:tripx_admin_application/utils/fonts.dart';
import 'package:tripx_admin_application/utils/mediaquery.dart';

final TextEditingController photoController = TextEditingController();
final TextEditingController accomadtionController = TextEditingController();
final TextEditingController mealsController = TextEditingController();
final TextEditingController activitieswController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController bookingController = TextEditingController();
final TextEditingController additionalController = TextEditingController();

class PackageImage extends StatefulWidget {
  const PackageImage({super.key});

  @override
  State<PackageImage> createState() => _PackageImageState();
}

class _PackageImageState extends State<PackageImage> {
//change to bloc
  final _imageFiles = [];
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    setState(() {
      _imageFiles.addAll(pickedImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
          toolbarHeight: mediaqueryheight(0.07, context),
          foregroundColor: whitecolor,
          backgroundColor: colorteal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          centerTitle: true,
          title: mytext("MORE DETAILS",
              fontFamily: sedan, fontSize: 24, color: whitecolor)),
      body: Column(
        children: [
          SizedBox(
            height: mediaqueryheight(0.04, context),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: colorteal,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mediaqueryheight(0.03, context),
                      ),
                      const TopName(text: "PACKAGE PHOTOS"),
                      GestureDetector(
                        onTap: () {
                          _pickImages();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: whitecolor,
                              boxShadow: [
                                BoxShadow(
                                  color: blackcolor
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(2, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          height: mediaqueryheight(0.2, context),
                          width: mediaquerywidht(0.84, context),
                          //change to bloc
                          child: _imageFiles.isEmpty
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.photo_library_sharp,
                                        color: colorteal,
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: mediaquerywidht(0.03, context),
                                      ),
                                      mytext(
                                        "ADD PHOTOS",
                                        fontFamily: sedan,
                                        fontSize: 25,
                                        color: colorteal,
                                      ),
                                    ],
                                  ),
                                )
                              : CarouselSlider.builder(
                                  itemCount: _imageFiles.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return Image.file(
                                      File(_imageFiles[index].path),
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  options: CarouselOptions(
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    reverse: false,
                                    autoPlay: false,
                                    autoPlayInterval:
                                        const Duration(seconds: 4),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: false,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "ACCOMMODATION"),
                      Container(
                        height: mediaqueryheight(0.1, context),
                        width: mediaquerywidht(0.83, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: accomadtionController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText:
                                'Write the details about accommodation options like hotels , resorts......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "MEALS"),
                      Container(
                        height: mediaqueryheight(0.1, context),
                        width: mediaquerywidht(0.83, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: mealsController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText:
                                'Write the details about meals or food ......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "ACTIVITIES"),
                      Container(
                        height: mediaqueryheight(0.1, context),
                        width: mediaquerywidht(0.83, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: activitieswController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText:
                                'Write the details about activities providing......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "PRICE DETAILS"),
                      Container(
                        height: mediaqueryheight(0.1, context),
                        width: mediaquerywidht(0.83, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: priceController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText:
                                'Write the cost of this package including any inclusions and exclusions as well as cancellation polices......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "BOOKING INFORMATION"),
                      Container(
                        height: mediaqueryheight(0.1, context),
                        width: mediaquerywidht(0.83, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: bookingController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText:
                                'Details on how to book the trip package, including contact information, booking platforms, and any required deposits.......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      const TopName(text: "ADDITIONAL INFORMATION"),
                      Container(
                        height: mediaqueryheight(0.15, context),
                        width: mediaquerywidht(0.84, context),
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: blackcolor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: additionalController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Write any additional details ......',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.02, context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          decoration: BoxDecoration(
                              color: orangecolor,
                              boxShadow: [
                                BoxShadow(
                                  color: blackcolor
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(2, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          height: mediaqueryheight(0.05, context),
                          width: mediaquerywidht(0.7, context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.save,
                                color: whitecolor,
                                size: 25,
                              ),
                              SizedBox(
                                width: mediaquerywidht(0.02, context),
                              ),
                              mytext("ADD PACKAGE",
                                  fontFamily: sedan,
                                  fontSize: 20,
                                  color: whitecolor)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaqueryheight(0.05, context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}