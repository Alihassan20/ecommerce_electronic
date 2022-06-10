import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/new_route.dart';
import '../../constant/style.dart';
import '../profile_view/view.dart';
import '../splash/iew.dart';
class PayView extends StatelessWidget {
  PayView({Key? key}) : super(key: key);
  ScrollController scollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kblack, size: 35),
        elevation: 0,
        backgroundColor: kwhite,
      ),
      body:  Scrollbar(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                child: Text(
                  "Pay Via Credit Cart",
                  style: kbcstyle(context, 30, kblack),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  'Card Number',
                  style: kbcstyle(context, 23, kblack),
                ),
              ),
              TextFormByField(
                secure: false,
                inputTxt: TextInputType.number,
                hinnt: 'XXX-XXX-XXXX-XXXX',
                color: Colors.black12,
              ),
              Row(
                children: [
                  Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15,top: 10),
                            child: Text(
                              'Expire Date',
                              style: kbcstyle(context, 23, kblack),
                            ),
                          ),
                          TextFormByField(
                            secure: false,
                            inputTxt: TextInputType.datetime,
                            hinnt: 'mm/yy',
                            color: Colors.black12,
                          ),
                        ],
                      )),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:15,top: 10),
                            child: Text(
                              'CVV',
                              style: kbcstyle(context, 23, kblack),
                            ),
                          ),
                          TextFormByField(
                            secure: false,
                            inputTxt: TextInputType.number,
                            hinnt: 'XXX',
                            color: Colors.black12,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
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
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",style: kbcstyle(context, 25, kblack)),
                    Text("USD 355",style: kcstyle(context, 15, kPrimaryColor)),
                  ],
                ),
              ),
              CustomButton(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Splashview()));
              }, Text("Complete Order", style: kbcstyle(context, 20, kwhite)),
                  kPrimaryColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  children: [
                    Text("By placing this order you agree to the Credit Card payment terms & conditions.",style: kcstyle(context, 15, kblack),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              const SizedBox(height: 15,),



            ],
          ),
        ),
      ),
    );
  }
}



class TextFormByField extends StatelessWidget {
  TextInputType? inputTxt;
  final Color? color;
  final String? hint;
  final String? hinnt;
  Icon? icon;
  Widget? row;
  bool secure;
  Key? key;

  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  TextFormByField(
      {this.key,this.color,required this.secure,this.hinnt, this.hint, this.validator, this.onSaved, this.inputTxt,this.icon,this.row});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: TextFormField(
          key: key,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white70,
                )),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                )),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: color,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                )),
            labelText: hint,
            hintText: hinnt,
            prefixIcon: icon,
            suffixIcon: row,

            labelStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: kwhite),
          ),
          keyboardType: inputTxt,
          validator: validator,
          obscureText:secure,
          onSaved: onSaved),
    );
  }
}