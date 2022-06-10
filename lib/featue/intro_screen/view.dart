import 'package:ecommerce_electronic/featue/home_page/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:hw_introduction_screen/hw_introduction_screen.dart';
import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/new_route.dart';
import '../../constant/size.dart';
import '../../constant/style.dart';

class IntroScreen extends StatelessWidget {

  static const routName = "/IntroScreen";

   IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
       children: [
         Stack(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Container(
                   width: sizeFromWidth(context, 1),

                   child: Image.asset('assets/image/Vector.png',fit:BoxFit.cover,
                       height: sizeFromHeight(context,1.4))),
             ),

             HwIntroductionScreen(
                 indicatorActiveColor: kwhite,
                 indicatorUnactiveColor: kwhite.withOpacity(0.5),
                 skipButton: const Center(child: Text("Skip",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                 nextButtonColor:  Colors.white,
                 nextButton: const Center(child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold),)),
                 finishButtonColor: Colors.white,
                 finishButton: const Center(child: Text("GET STARTED",style: TextStyle(fontWeight: FontWeight.bold))),

                 onFinish: () async{
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  MyHomePage(1)));

                 },
                 items: // this param is required
                 [
                   HwIntroductionItem(
                       title: 'LATECH',
                       titleTextStyle: kbcstyle(context, sizeFromHeight(context, 15),kwhite),
                       caption: 'TECH MARKET',
                       captionTextStyle: kbcstyle(context, 15,kwhite),
                       image:Container(
                         height: sizeFromHeight(context, 1.65),
                           child: Image.asset('assets/image/Logo.png'))
                   ), // Widget

                   HwIntroductionItem(
                     title: 'The best tech market',
                     titleTextStyle: kbcstyle(context, 27,kwhite),
                       image: Container(
                           height: sizeFromHeight(context,1.4),
                           child: Image.asset('assets/image/1.png')),
                     // Widget
                   ),
                   HwIntroductionItem(
                       title: 'A lot of exclusives',
                       titleTextStyle: kbcstyle(context, 27,kwhite),
                       image: Flexible(
                         child: Container(
                           height: sizeFromHeight(context, 1),
                             child: Image.asset('assets/image/2.png',fit: BoxFit.fitWidth,)),
                       ) // Widget
                   ),
                   HwIntroductionItem(
                       title: 'Sales all the time',
                       titleTextStyle: kbcstyle(context, 27,kwhite),
                       image: Container(
                           height: sizeFromHeight(context, 1.53),
                           child: Image.asset('assets/image/3.png')) // Widget
                   ),

                 ]
             ),

           ],
         ),
       ],
      ),
    );
  }
}
