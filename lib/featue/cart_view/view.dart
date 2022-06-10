import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../constant/new_route.dart';
import '../../constant/size.dart';
import '../../constant/style.dart';
import '../../core/model/home_model.dart';
import '../complete_order.dart';
import '../profile_view/view.dart';


class Cartview extends StatefulWidget {

  const Cartview({Key? key}) : super(key: key);

  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  List category_cart = [
    ListOfCategory(
        img: 'assets/image/iphone.png', name: 'iphone', Price: 600),
    ListOfCategory(
        img: 'assets/image/tv.png', name: 'Smart Tv', Price: 200),
    ListOfCategory(
        img: 'assets/image/watch.png',
        name: 'Smart Watch ',
        Price: 20),
  ];

  int num = 1;
  int sum = 0;
  ScrollController scollBarController = ScrollController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbACKground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kblack),
        elevation: 0,
        backgroundColor: kbACKground,
        title: Text(
          "Shopping Cart",
          style: kbcstyle(context, 30, kblack),
          textAlign: TextAlign.right,
        ),
      ),
      body: Scrollbar(
        controller: scollBarController,
        thickness: 5,
        trackVisibility:true,
        showTrackOnHover:true,
        interactive:true,
        radius: const Radius.circular(15),
        isAlwaysShown: true,
        child: category_cart.isNotEmpty ?SingleChildScrollView(
          controller:scollBarController ,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: category_cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                       Dismissible(

                        key: Key('item ${category_cart[index]}'),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            category_cart.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("deleted"),
                              action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    category_cart.insert(
                                        index, category_cart[index]);
                                  });
                                },
                              ),
                            ));
                          });
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          await showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  content: Text(
                                      "Are You Sure You Want To Delete This ${category_cart[index].name}"),
                                  actions: [
                                    ElevatedButton(
                                        style:  ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            primary: kPrimaryColor,
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            textStyle: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
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
                                        onPressed: () {
                                          setState(() {
                                            print(index);
                                            final item = category_cart[index];
                                            category_cart.remove(item);
                                            print(category_cart);
                                            Navigator.of(context).pop();
                                            Get.snackbar(
                                                'Your cart has been updated', 'Do you want to Undo?',
                                              mainButton: TextButton(onPressed: (){
                                                setState(() {
                                                  category_cart.insert(
                                                      index, item);
                                                });
                                              }, child: Text("Undo")) ,
                                            );

                                          });
                                        },
                                        child: const Text("Delete")),
                                  ],
                                );
                              });
                        },
                        background: Container(
                  decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Delete',
                                style: kbcstyle(context, 25, Colors.redAccent),
                              ),
                              const Icon(
                                Icons.delete_forever,
                                color: Colors.redAccent,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    CartCart(
                                        category_cart[index].img,
                                        category_cart[index].name,
                                        'USD ${category_cart[index].Price}'),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              num++;
                                              category_cart[index].Price=category_cart[index].Price+20;
                                            });
                                          },
                                          icon: const FaIcon(
                                            FontAwesomeIcons.plusCircle,
                                            color: kPrimaryColor,
                                          )),
                                      Container(
                                        child: Text(" x${num}"),
                                        color: kPrimaryColor.withOpacity(0.2),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            if (num > 1) {
                                              setState(() {
                                                num--;
                                                print(num);

                                                category_cart[index].Price=category_cart[index].Price-20;

                                              });
                                            }
                                          },
                                          icon: const FaIcon(
                                              FontAwesomeIcons.minusCircle,
                                              color: kPrimaryColor)),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Total", style: kbcstyle(context, 20, kblack)),
                  Text(
                    'USD ${category_cart.map<int>((e) => e.Price.toInt()).reduce((value1, value2) => value1+value2)}',
                    style: kcstyle(context, 20, kPrimaryColor),
                  ),
                ],
              ),
              CustomButton(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CompleteOrder()));
              }, Text("Complete Order", style: kbcstyle(context, 20, kwhite)),
                  kPrimaryColor),
              const SizedBox(height: 50),
            ],
          )
        ):
        Center(
          child: Text("Empty Cart Shopping 😔",style: kbstyle(context, 25),),
        ),
      ),
    );
  }
}


class CartCart extends StatelessWidget {
  String img;
  String name;
  String price;
  CartCart(this.img,this.name,this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
      child: Container(
        width: sizeFromWidth(context, 1.2),
        height: sizeFromHeight(context, 5.3),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          color: Colors.white,
          child:Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                    height: 80,
                    width: 100,
                    child: Image.asset(img,fit: BoxFit.contain,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,style: kbcstyle(context, 20, kblack),),
                    Text(price,style: kcstyle(context, 15, kPrimaryColor),textAlign: TextAlign.left)
                  ],
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}