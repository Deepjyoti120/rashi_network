import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rashi_network/payment_test.dart';
import 'package:rashi_network/services/api/api_access.dart';
import 'package:rashi_network/ui/custom/custom_text_form.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/wallet/wallet_payment_confirmation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_astrologer/document/astrologer_details.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});
  
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool load = false;
  String loginstatus = "0";
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewProfile();
  }

  // view Profile getdata
  viewProfile()async{
    setState(() {
      load = true;
    });
    await ApiAccess.RequestUserProfile();
    sharedprefences();
    setState(() {
      load = false;
    });
  }
  
  
  // get loginstatus..
  sharedprefences() async{
    SharedPreferences p = await SharedPreferences.getInstance();
    loginstatus = p.getString("loginstatus").toString();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    final paymentText = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'My Wallet',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 600,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const DesignText(
              //   'Available Balance',
              //   fontSize: 16,
              //   fontWeight: 500,
              // ),
              // const DesignText(
              //   'Rs.0.00',
              //   fontSize: 16,
              //   fontWeight: 400,
              // ),
              // const SizedBox(height: 20),
              // const DesignText(
              //   'Please select coupon to recharge',
              //   fontSize: 16,
              //   fontWeight: 500,
              // ),
              const SizedBox(height: 10),
              DesignFormField(
                controller: paymentText,
                hintText: 'Enter Amount',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: DesignButtons(
                  onPressed: () async {
                    if(loginstatus != "null" || loginstatus != ""){
                      if(loginstatus == "1"){
                        //   ApiAccess.Requestaddwallet(context,paymentText.text.trim());
                        if(paymentText.text.trim().isNotEmpty){

                          if(int.parse(paymentText.text.trim()) < 10){
                            Fluttertoast.showToast(msg: "Please enter at least 10 rs");
                          }else{
                            ApiAccess().walletAddMoney(paymentText.text.trim())
                                .then((value) {
                                  print("value${value}");
                                  if(value.toString() != "error"){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InstamojoPaymentScreen(
                                            paymentRequestId: '',
                                            paymentRequestUrl: value,
                                          ),
                                        )).then((value) {
                                      if (value) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const WalletPaymentConfirmation(),
                                          ),
                                        );
                                      }
                                    });
                                  }else{
                                    Fluttertoast.showToast(msg: "Error");
                                  }

                            });
                          }

                        }
                      }else{
                        showAlertDialog(context);
                      }
                    }else{}

                  },
                  textLabel: 'Add Money',
                  isTappedNotifier: ValueNotifier(false),
                  colorText: Colors.white,
                  fontSize: 14,
                  fontWeight: 600,
                  color: DesignColor.darkTeal,
                ),
              ),
              const SizedBox(height: 20),
              // const DesignText(
              //   'Applicable Coupon',
              //   fontSize: 16,
              //   fontWeight: 500,
              // ),
              // const SizedBox(height: 10),
              // ListView.builder(
              //   itemCount: 10,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     String text = 'Use code ASTRO10 for a 10% discount ';
              //     String boldText = 'ASTRO10'; // the substring to be made bold
              //     RegExp regExp = RegExp(boldText);
              //     Match match = regExp.firstMatch(text) as Match;
              //     int startIndex = match.start;
              //     int endIndex = match.end;
              //     return Padding(
              //       padding: const EdgeInsets.only(bottom: 12),
              //       child: Container(
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           gradient: const LinearGradient(
              //             colors: [DesignColor.pink, DesignColor.lightBlue],
              //             begin: Alignment.centerLeft,
              //             end: Alignment.centerRight,
              //           ),
              //           borderRadius: BorderRadius.circular(12),
              //           border: Border.all(
              //             color: DesignColor.lightGrey,
              //             width: 1.0,
              //           ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(20),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               RichText(
              //                 textAlign: TextAlign.center,
              //                 text: TextSpan(
              //                   style: const TextStyle(
              //                     fontSize: 16.0,
              //                     color: Colors.black,
              //                   ),
              //                   children: <TextSpan>[
              //                     TextSpan(
              //                       text: text.substring(0, startIndex),
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                     TextSpan(
              //                       text: boldText,
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.w700,
              //                         color: DesignColor.darkTeal,
              //                       ),
              //                     ),
              //                     TextSpan(
              //                       text: text.substring(endIndex),
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 12),
              //               Container(
              //                 alignment: Alignment.bottomRight,
              //                 child: DesignButtons(
              //                   onPressed: () async {},
              //                   textLabel: 'Apply',
              //                   isTappedNotifier: ValueNotifier(false),
              //                   sideWidth: 1,
              //                   colorText: DesignColor.darkTeal1,
              //                   borderSide: true,
              //                   colorBorderSide: DesignColor.darkTeal1,
              //                   fontSize: 12,
              //                   pdleft: 18,
              //                   pdright: 18,
              //                   color: Colors.transparent,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

     showAlertDialog(BuildContext context) {

      // set up the buttons
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed:  () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AstrologerDetailsForm(),
              ));

        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Please complete your profile."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

}
