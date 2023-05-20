import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rashi_network/payment_test.dart';
import 'package:rashi_network/utils/constants.dart';
import 'package:rashi_network/viewmodel/model/astrologer_model.dart';
import 'package:rashi_network/viewmodel/model/banner_model.dart';
import 'package:rashi_network/viewmodel/model/free_kundali.dart';
import 'package:rashi_network/viewmodel/model/latest_blogs_model.dart';
import 'package:rashi_network/viewmodel/model/live_astrologer.dart';
import 'package:rashi_network/viewmodel/model/pr_release_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../viewmodel/model/PaymnetModel.dart';

typedef OnUploadProgress = void Function(double progressValue);
final apiProvider = Provider<ApiAccess>((ref) => ApiAccess());

class ApiAccess {
  static const storage = FlutterSecureStorage();
  final Dio dio = Dio();
  Future attemptLogIn({
    required String phone,
  }) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      Response res = await dio.post(
        "${Constants.baseURL}login",
        data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json),
      );
      if (res.data["status"]) {
        return res.data;
      }
    } on DioError catch (e) {
      // Tools.showToasts(e.response!.data["message"]);
      if (kDebugMode) {
        print(e.response!.data["message"]);
      }
      return "";
    }
    return "";
  }

  Future<List<BannerModel>> getBanner() async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "https://www.thetaramandal.com/api/banner",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (res.data["status"]) {
        print(res.data);
        var data = res.data['data'] as List;
        return data.map((ddd) => BannerModel.fromJson(ddd)).toList();
      }
      return [];
    } on DioError catch (e) {
      return [];
    }
  }

  Future<bool> verifyInstamojoPayment({
    required String paymentRequestId,
  }) async {
    try {
      Response res = await dio.post(
        "https://www.instamojo.com/api/1.1/payment-requests/$paymentRequestId/",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          "X-Api-Key": "a6e17c1d98db0bfe174ff8e582ca77dd",
          "X-Auth-Token": "e63dd39b4f2a54a2e713a9564e9c0758",
        }),
      );
      if (res.data["payment_request"]['status'] == 'Completed') {
        return true;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future orderGenerate({
    required String paymentRequestId,
  }) async {
    try {
      Response res = await dio.post(
        "https://us-central1-thetaramandal-380cd.cloudfunctions.net/createOrderInstamogo",
        data: {
          "buyerName": "John Doe",
          "buyerEmail": "johndoe@fff.com",
          "buyerPhone": "1234567890",
          "amount": "10",
          "purpose": "Test ffsfsfsforder"
        },
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      // print(res.data);
      if (res.statusCode == 200) {
        return res.data;
      }
      return false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<FreeKundaliModel> orderGenerateFreeKundali({
    required String coordinates,
    required String datetime,
  }) async {
    try {
      final response = await dio.post(
        'https://api.prokerala.com/token',
        data: {
          'grant_type': 'client_credentials',
          'client_id': 'f4d35d24-de04-4b28-8d10-e11894a2ef48',
          'client_secret': 'AMkGNwRhmfwUH7KfyC3CENFsF4F2sFgIf93qGo6v',
        },
      );

      final accessToken = response.data['access_token'];
      final results = await dio.get(
        'https://api.prokerala.com/v2/astrology/kundli',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        queryParameters: {
          'ayanamsa': '1',
          'coordinates': coordinates,
          'datetime': datetime,
        },
        //  'coordinates': '23.1765,75.7885',
        //   'datetime': '2023-05-16T15:32:50+05:30',
      );
      if (results.data['status'] == 'ok') {
        return FreeKundaliModel.fromJson(results.data['data']);
      }
      return FreeKundaliModel();
    } on DioError catch (e) {
      return FreeKundaliModel();
    }
  }

  // PR Release
  Future<List<PrReleaseModel>> prRelease() async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "${Constants.baseURL}pr-release",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (res.data["status"]) {
        var data = res.data['data'] as List;
        if (kDebugMode) {
          print(res.data['data']);
        }
        return data.map((e) => PrReleaseModel.fromJson(e)).toList();
      }
      return [];
    } on DioError catch (e) {
      return [];
    }
  }

  // Latest Blogs
  Future<List<BlogsModel>> latestBlogs() async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "${Constants.baseURL}blog",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (res.data["status"]) {
        var data = res.data['data'] as List;
        return data.map((ddd) => BlogsModel.fromJson(ddd)).toList();
      }
      return [];
    } on DioError catch (e) {
      return [];
    }
  }

  // Chat Astrologer
  Future<List<AstrologerModel>> astrologerList() async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "${Constants.baseURL}chat-with-astrologer",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (res.data["status"]) {
        var data = res.data['data']['astrologer']['data'] as List;
        return data.map((ddd) => AstrologerModel.fromJson(ddd)).toList();
      }
      return [];
    } on DioError catch (e) {
      return [];
    }
  }

  // Wallet Add Money
  Future<String> walletAddMoney(String amount) async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "${Constants.baseURL}wallet/payments/store",
        data: {"amount": amount},
        options: Options(
          responseType: ResponseType.json,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("res data"+res.data.toString());
      if (res.data["status"] == true) {
        print("url>>${res.data["data"]}");
     //   var data = res.data['data']['astrologer']['data'] as List;
      return res.data["data"] as String;
       }
       return res.data;
    } on DioError catch (e) {
      return "error";
    }
  }

  // Live Astrologer
  Future<List<LiveAstrologerModel>> liveAstrologer() async {
    try {
      var token = await storage.read(key: "key");
      Response res = await dio.post(
        "https://www.thetaramandal.com/api/onlineastrologer",
        // data: {"mobile": phone, "nToken": fcmToken},
        options: Options(responseType: ResponseType.json, headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (res.data["status"]) {
        var data = res.data['data'] as List;
        return data.map((ddd) => LiveAstrologerModel.fromJson(ddd)).toList();
      }
      return [];
    } on DioError catch (e) {
      return [];
    }
  }


  // View profile Api
 static  Future<void> RequestUserProfile() async {
    print("userdata}");
    SharedPreferences p = await SharedPreferences.getInstance();
    var token = await storage.read(key: "key");
   // Utility.ProgressloadingDialog(context, true);

    var request = {};

    print("request ${request}");

    try {
      var response = await http.post(Uri.parse("${Constants.baseURL}getprofile"),

          body: convert.jsonEncode(request),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          }
       );
      print("jdfhjfdkfk" + response.body);
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

      print(jsonResponse);
      if (jsonResponse['status'] == true) {
        var data = jsonResponse['data'];
        if (data != null) {
          print("data...${data}");
          var userdata = data['user'];
          print("userdata...${userdata}");

          if (userdata != null) {
            print("loginstatus>>${userdata['loginstatus']}");
            p.setString("loginstatus", userdata['loginstatus'].toString());
          } else {

          }
        }
      } else {
        Fluttertoast.showToast(msg: jsonResponse['message']);
      }
    } on SocketException catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    return;
  }


 /* static  Future<void> Requestaddwallet(BuildContext context,String amount) async {
    print("userdata}");
    SharedPreferences p = await SharedPreferences.getInstance();
    var token = await storage.read(key: "key");
    // Utility.ProgressloadingDialog(context, true);
    print("token>${token}");
    try {

      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 233|QJqxyutr1WOZMhOUAE5JfvfgHrBan74VeqSb7NBf'
      };
      var request = http.Request('POST', Uri.parse('${Constants.baseURL}wallet/payments/store'),);
      request.body = json.encode({
        "amount": "${amount}"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data1 = await response.stream.bytesToString();
        var jsonResponse = json.decode(data1);
        print("object${data1}");
        if (jsonResponse['status'] == true) {
          var data = jsonResponse['data'];
          if (data != null) {
            print("data...${data}");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstamojoPaymentScreen(
                    paymentRequestId: '',
                    paymentRequestUrl: data.toString(),
                  ),
                ));
          }
        } else {
        }
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
    } on SocketException catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    return;
  }*/
}
