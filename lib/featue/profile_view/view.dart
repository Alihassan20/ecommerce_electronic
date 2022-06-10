import 'dart:io';

import 'package:ecommerce_electronic/constant/new_route.dart';
import 'package:ecommerce_electronic/featue/profile_view/pages/acoount_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


import '../../constant/color.dart';
import '../../constant/size.dart';
import '../../constant/style.dart';


class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController scollBarController = ScrollController();

  File? _image;

  final picker = ImagePicker();

  Future getImagePhoto(ImageSource src) async {
    final  pickedImage = await picker.pickImage(source: src);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("nonn");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbACKground,
        body:Scrollbar(
          controller: scollBarController,
          thickness: 5,
          trackVisibility:true,
          showTrackOnHover:true,
          interactive:true,
          radius: const Radius.circular(15),
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller:scollBarController ,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(

                children: [
                  const SizedBox(height: 20),

                  Stack(
                    children: [

                      Center(
                        child: Hero(
                          tag: 'logo',
                          child: _image == null ? FaIcon(FontAwesomeIcons.userCircle,size: 120, color: kPrimaryColor.withOpacity(0.6)) :CircleAvatar(
                            backgroundColor: kPrimaryColor.withOpacity(0.7),
                            radius: 85,
                            child: CircleAvatar(
                              backgroundImage:FileImage(_image!),
                              radius: 80,
                              backgroundColor: kwhite,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 2,
                          right: MediaQuery.of(context).size.width/3.5,
                          child: GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return AlertDialog(
                                        title: const Text("Choose picture from"),
                                        content: Container(
                                          height: 150,
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              const Divider(
                                                color: kbACKground,
                                              ),
                                              Container(
                                                width: 300,
                                                color: kbACKground,
                                                child: ListTile(
                                                  leading: const Icon(Icons.image),
                                                  title: const Text("Gallery"),
                                                  onTap: () {
                                                    getImagePhoto(ImageSource.gallery);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 300,
                                                color: kbACKground,
                                                child: ListTile(
                                                  leading: const Icon(Icons.add_a_photo),
                                                  title: const Text("Camera"),
                                                  onTap: () {
                                                    getImagePhoto(ImageSource.camera);
                                                    Navigator.of(ctx).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: FaIcon(FontAwesomeIcons.plusCircle,size: 30,color:kPrimaryColor.withOpacity(0.6),
                              ))),

                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomButton(

                        () {
                         _image==null? Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AccountInformation2(
                             FaIcon(FontAwesomeIcons.userCircle,size: 120, color: kPrimaryColor.withOpacity(0.6)))))
                         :Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AccountInformation(_image!)));
                    },
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Account information",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),

                  CustomButton(
                        () {},
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Orders",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {},
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Help",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {
                    },
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact us",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {},
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Terms & Conditions",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {},
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Adresses",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {},
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About us",
                          style: kbcstyle(context, 20, kwhite),
                          textAlign: TextAlign.start,
                        )),
                    kPrimaryColor.withOpacity(0.6),
                  ),
                  CustomButton(
                        () {},
                    Text(
                      "Log out",
                      style: kbcstyle(context, 20, kwhite),
                      textAlign: TextAlign.start,
                    ),
                    Colors.red.withOpacity(0.9),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class CustomButton extends StatelessWidget {
  void Function() ontap;
  Color color;
  Widget child;
  CustomButton(this.ontap,this.child,this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(onPressed: ontap,child: child
            ,style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              // shadowColor:  MaterialStateProperty.all(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),)),
    );
  }
}

