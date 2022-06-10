import 'package:ecommerce_electronic/featue/pay/view.dart';
import 'package:ecommerce_electronic/featue/profile_view/view.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/style.dart';
import '../constant/new_route.dart';

class CompleteOrder extends StatelessWidget {
  CompleteOrder({Key? key}) : super(key: key);
  final list1 =  {
    'Cash' : false,
    'Credit Card' : false,

  };
  final list2 =  {
    'Work' : false,
    'Home' : false,
    'Cafe' : false,

  };
  ScrollController scollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kblack),
        elevation: 0,
        backgroundColor: kwhite,
        title: Text(
          "CompleteOrder",
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
        child: SingleChildScrollView(
          controller:scollBarController ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                child: Text("Payment Method",style: kbcstyle(context, 25, kblack),),
              ),
              CheckBoxField(List: list1),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address",style: kbcstyle(context, 25, kblack)),
                    Text("Add Address",style: kcstyle(context, 15, Colors.grey)),
                  ],
                ),
              ),
              CheckBoxField(List: list2),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cost :",style: kbcstyle(context, 25, kblack)),
                    Text("USD 255",style: kcstyle(context, 15, kPrimaryColor)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taxes :",style: kbcstyle(context, 25, kblack)),
                    Text("USD 100",style: kcstyle(context, 15, kPrimaryColor)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount :",style: kbcstyle(context, 25, kblack)),
                    Text("USD 0",style: kcstyle(context, 15, Colors.redAccent)),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",style: kbcstyle(context, 25, kblack)),
                    Text("USD 355",style: kcstyle(context, 15, kPrimaryColor)),
                  ],
                ),
              ),
              CustomButton(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PayView()));
              }, Text("Complete Order", style: kbcstyle(context, 20, kwhite)),
                  kPrimaryColor),
              SizedBox(height: 15,)



            ],
          ),
        ),
      ),

    );
  }
}

class CheckBoxField extends StatefulWidget {
  final Map<String, bool> List ;
  CheckBoxField({required this.List});

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();

}

class _CheckBoxFieldState extends State<CheckBoxField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        children: widget.List.keys.map((String key) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: CheckboxListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                title:  Text(key,style: kbcstyle(context, 18, kblack),),
                value: widget.List[key],
                activeColor: kPrimaryColor,
                checkColor: Colors.white,
                onChanged: ( value) {
                  setState(() {
                    widget.List[key] = value!;
                  });
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}