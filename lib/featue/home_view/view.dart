import 'dart:async';

import 'package:auto_animated/auto_animated.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce_electronic/constant/color.dart';
import 'package:ecommerce_electronic/constant/new_route.dart';
import 'package:ecommerce_electronic/constant/style.dart';
import 'package:ecommerce_electronic/core/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/size.dart';
import '../../widgets/common_animated_widget.dart';
import '../cart_view/view.dart';
import '../details_page/view.dart';
import '../home_page/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin  {
  PageController controller = PageController(initialPage: 0,);
  late TabController tabController;
  int _curr = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_curr < 4) {
        _curr++;
      } else {
        _curr = 0;
      }

      controller.animateToPage(
        _curr,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    });

    tabController =
        TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  List<Widget> listt = <Widget>[
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: kbACKground),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/image/song.jpg"),fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Text("Sony",style: kcategory( 30, kwhite),),
      ),),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: kbACKground),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/image/lg.jpeg"),fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Text("LG",style: kcategory( 30, kblack),),
      ),),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: kbACKground),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/image/sam.jpg"),fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Text("Samsung",style: kcategory( 25, kwhite),),
      ),),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: kbACKground),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/image/toshiba.jpg"),fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Text("Toshiba",style: kcategory( 30, kblack),),
      ),),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: kbACKground),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/image/appple.png"),fit: BoxFit.fill
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Text("Apple",style: kcategory( 30, kwhite),),
      ),),
  ];
  int tapclick = 0;
 static List<ListOfCategory> categoryList =[
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
    ListOfCategory(img: 'assets/image/fridge.png', name:'Fridge' , Price: 190),
    ListOfCategory(img: 'assets/image/watch.png', name:'Smart Watch' , Price: 12.5),
    ListOfCategory(img: 'assets/image/washing.png', name:'Washing Machine' , Price: 165),
    ListOfCategory(img: 'assets/image/air.png', name:'air conditioning' , Price: 12.5),
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
  ];

  static List<ListOfCategory> categoryList1 =[
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
    ListOfCategory(img: 'assets/image/iphone.png', name:'Iphone 13 Max' , Price: 202),
  ];

  static List<ListOfCategory> categoryList2 =[
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
    ListOfCategory(img: 'assets/image/tv.png', name:'Smart Tv' , Price: 13),
  ];
  int badge=0 ;

  static List<ListOfCategory> categoryList3 =[
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
    ListOfCategory(img: 'assets/image/laptop.jpg', name:'LapTop' , Price: 230),
  ];
  List<ListOfCategory> displayFilm = List.from(categoryList);
  List<ListOfCategory> displayFilm1 = List.from(categoryList1);
  List<ListOfCategory> displayFilm2 = List.from(categoryList2);
  List<ListOfCategory> displayFilm3 = List.from(categoryList3);

  void selectedFilm(String val){
    setState(() {
      displayFilm1= categoryList1.where((element) => element.name.toLowerCase().contains(val.toLowerCase())).toList();
      displayFilm2= categoryList2.where((element) => element.name.toLowerCase().contains(val.toLowerCase())).toList();
      displayFilm3= categoryList3.where((element) => element.name.toLowerCase().contains(val.toLowerCase())).toList();

      displayFilm= categoryList.where((element) => element.name.toLowerCase().contains(val.toLowerCase())).toList();
    });
  }
  ScrollController scollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(badge);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kbACKground,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kbACKground,
          title: Text(
            "LATECH",
            style: kstyle(context, 25, kPrimaryColor),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Cartview()));

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 20),
                child: Badge(
                  badgeContent: Text('${badge}',style: kcstyle(context, 15, kwhite),),
                  child: const FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),

        body: Scrollbar(
          controller: scollBarController,
          thickness: 5,
          trackVisibility: true,
          showTrackOnHover: true,
          interactive: true,
          radius: const Radius.circular(15),
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: scollBarController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3.0,
                                      spreadRadius: 0.4)
                                ]),
                            child: TextFormField(
                              onChanged: (v)=>selectedFilm(v),
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.white70,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.white70,
                                    )),
                                hintText: "Search  ",
                                hintStyle: TextStyle(color: kPrimaryColor),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: kPrimaryColor,
                                ),
                                labelStyle: TextStyle(color: kPrimaryColor),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(child: FaIcon(FontAwesomeIcons.filter,color: kwhite,size: 20,))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Top Categories',style: kbcstyle(context, 23,kPrimaryColor),),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                          child: Container(
                            width:sizeFromWidth(context, 1.1) ,
                              height: sizeFromHeight(context, 6),
                              child: PageView(
                                  children:listt,
                                  scrollDirection: Axis.horizontal,
                                  // reverse: true,
                                  physics: const BouncingScrollPhysics(),
                                  controller: controller,
                                  onPageChanged: (num) {
                                    setState(() {
                                      _curr = num;
                                    });
                                  }))),
                      const SizedBox(height: 10),
                      SmoothPageIndicator(
                        controller: controller,
                        count:listt.length ,
                        // effect:  widget.effect,
                        effect: const  WormEffect(
                          dotHeight: 10,
                          spacing: 9.0,
                          activeDotColor:kPrimaryColor ,
                          dotWidth: 10,
                          type: WormType.thin,
                          strokeWidth: 5,
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(height: 10),
                   TabBar(
                     controller: tabController,
                     onTap: (v){
                       setState(() {
                         tapclick = v;
                       });
                       print(tapclick);
                     },
                    labelColor: kwhite,
                    unselectedLabelColor:kPrimaryColor,
                    indicatorColor: Colors.transparent,
                    tabs:[
                      tapclick==0 ?Container(
                          decoration: BoxDecoration(

                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("All",style: TextStyle(fontSize: 13.5),))): Container(
                          decoration: BoxDecoration(

                              border: Border.all(color: kPrimaryColor,width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("All",style: TextStyle(fontSize: 13.5),))),
                      tapclick==1 ?Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("Mobile",style: TextStyle(fontSize: 13.5),))): Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor,width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("Mobile",style: TextStyle(fontSize: 13.5),))),
                      tapclick==2 ?Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("TV",style: TextStyle(fontSize: 13.5),))): Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor,width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("TV",style: TextStyle(fontSize: 13.5),))),
                      tapclick==3 ?Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("Laptop",style: TextStyle(fontSize: 13.5),))): Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor,width: 1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 35,
                          width: double.infinity,
                          child: const Center(child: Text("Laptop",style: TextStyle(fontSize: 13.5),))),


                    ],

                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          buildTabContaner(context,displayFilm),
                          buildTabContaner(context,displayFilm1),
                          buildTabContaner(context,displayFilm2),
                          buildTabContaner(context,displayFilm3),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildTabContaner(BuildContext context, List<ListOfCategory> displayFilmm) {
    return Container(
                    margin: const EdgeInsets.only(top: 10, left: 8),
                    child: LiveGrid(
                      shrinkWrap: true,

                      showItemInterval: const Duration(milliseconds: 300),
                      reAnimateOnVisibility: true,
                      scrollDirection: Axis.vertical,
                      itemCount: displayFilmm.length,
                      itemBuilder: animationItemBuilder(
                            (index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsView(displayFilmm[index],badge)));
                          },
                          child: Container(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                semanticContainer: true,
                                clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: [
                                    Container(
                                      height:  MediaQuery.of(context).size.height/4.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image:  DecorationImage(
                                            image: AssetImage('${displayFilmm[index].img}'),fit: BoxFit.contain
                                        ),
                                      ),),
                                    Padding(
                                      padding:  EdgeInsets.only(top:  MediaQuery.of(context).size.height/4.8,
                                          left:  30
                                      ),
                                      child: Text('${displayFilmm[index].name}',style: kcstyle(context, 20, kblack),
                                        textAlign: TextAlign.center,),
                                    ),
                                    Positioned(
                                      bottom: 1.5,
                                      right: 0,
                                      left: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('\$ ${displayFilmm[index].Price}',style: kbcstyle(context, 16,Colors.redAccent),),
                                          GestureDetector(child: FaIcon(FontAwesomeIcons.shoppingCart,color: kPrimaryColor,),
                                            onTap: (){
                                              Get.snackbar('Add Cart Success', 'Your cart has been updated!');
                                              setState(() {
                                                badge++;
                                              });
                                              print(badge);
                                            },)

                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
                    ),
                  );
  }
}
