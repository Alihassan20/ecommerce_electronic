import 'package:badges/badges.dart';
import 'package:ecommerce_electronic/constant/color.dart';
import 'package:ecommerce_electronic/constant/new_route.dart';
import 'package:ecommerce_electronic/featue/cart_view/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/style.dart';
import '../../core/model/home_model.dart';
import '../home_page/view.dart';

class DetailsView extends StatefulWidget {
  var displayFilm;
  var badge;
  DetailsView(this.displayFilm,this.badge);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kbACKground ,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,
              color: kbACKground,
              child: Stack(
                children: [
                  Center(child: Image.asset(widget.displayFilm.img,fit: BoxFit.contain,)),
                  Positioned(
                    top: 25,
                    left: 25
                    ,child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                      child: const FaIcon(FontAwesomeIcons.chevronLeft,size: 35,color: kPrimaryColor,)),
                  ),
                  Positioned(
                    top: 25,
                    right: 5
                    ,child:  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo((MyHomePage(2)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 20),
                      child: Badge(
                        badgeContent: Text('${widget.badge}',style: kcstyle(context, 15, kwhite),),
                        child: const FaIcon(
                          FontAwesomeIcons.shoppingCart,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  ),

                ],
              ),),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              height: MediaQuery.of(context).size.height/2-MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  Center(child: Text(widget.displayFilm.name,style: kbstyle(context, 30))),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("iPhone 30 With Facetime 64GB Black 5G - International Specs in egypt",style:kbcstyle(context, 15,kPrimaryColor) ,),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${widget.displayFilm.Price}',style: kbcstyle(context, 30,Colors.redAccent),),
                        Text('4.5 ⭐',style:kbcstyle(context, 30,kPrimaryColor) ,)
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: kPrimaryColor,
                          borderRadius:  BorderRadius.circular(20)
                      ),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              GestureDetector(onTap: (){
                              } ,child:const  FaIcon(FontAwesomeIcons.plusCircle,color: Colors.white,size: 35,)),
                              const SizedBox(width: 10),
                              const Text('0',style: TextStyle( color: Colors.white,fontSize: 35),),
                              const SizedBox(width: 10),
                              GestureDetector(onTap: (){
                              },child: const FaIcon(FontAwesomeIcons.minusCircle,color: Colors.white,size: 35,)),
                            ],
                          ),

                          ElevatedButton(

                              onPressed: (){
                                Get.snackbar('Add Cart Success', 'Your cart has been updated!');
                                setState(() {
                                  widget.badge++;
                                });
                              }, child: const Text("Add To Cart"),
                            style:  ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                                primary: const Color.fromRGBO(255, 91, 56, 1),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)
                            ),
                          )
                        ],
                      ),

                    ),
                  )

                ],
              ),
              ),
          ],

        ),
      ),
    );
  }
}
