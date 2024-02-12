import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Dashboard.dart';
import 'package:go_hadiah/Settings/Utils/AlertDialog.dart';
import 'package:go_hadiah/SharedPreferences/model_share_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

ModelSharedPreferences modelSharePreferences = ModelSharedPreferences();
AlertDialogVoid alertDialogVoid = AlertDialogVoid();
class API {

  String statusResponse = "";
  String messageResponse = "";
  String tokens = "";


  signIn(context, String username, String pass, String linkz) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map data = {'username': username, 'password': pass, 'flag': constants.flag_gohadiah};
    String uri = linkz + constants.login_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
        tokens = jsonResponse['token'];
      }

       if (statusResponse == "success") {

          sharedPreferences.setString("KEY_MASUK", jsonResponse['status'] ?? "null");
          sharedPreferences.setString("token", jsonResponse['token'] ?? "null");


          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const DashboardPages()),
                  (Route<dynamic> route) => false);
        }
      }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }
      else{
        alertDialogVoid.showError(context, messageResponse);


      }
    }

  }


  registrasi(context,String username,String password,String cpassword, String phone, String linkz) async
  {

    Map data = {'username': username, 'password': password,'cpassword': cpassword,'phone':phone,'flag': constants.flag_gohadiah};
    String uri = linkz + constants.register_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
        tokens = jsonResponse['token'];
      }

      if (statusResponse == "success") {




        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
                (Route<dynamic> route) => false);
      }
    }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }
      else{
        alertDialogVoid.showError(context, messageResponse);


      }
    }


  }

  
  check_user(context, String phone,String linkz) async {


    Map data = {
      'phone': phone,
      'flag': constants.flag_gohadiah,
    };
    String uri = linkz + constants.checkValidUser_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "success") {


        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
                (Route<dynamic> route) => false);


      }
    }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }

      else {
        alertDialogVoid.showError(context, messageResponse);

      }
    }


  }


  Check_OTP (context,String otp, String phone, String linkz) async {


    Map data = {
      'otp' : otp,
      'phone': phone,
      'flag': constants.flag_gohadiah,
    };
    String uri = linkz + constants.validateOTP_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "success") {



        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
                (Route<dynamic> route) => false);

      }
    }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }
      else {
        alertDialogVoid.showError(context, messageResponse);

      }
    }

  }


  Generate_OTP (context, String phone, String linkz) async {

    Map data = {
      'phone': phone,
      'flag': constants.flag_gohadiah,
    };
    String uri = linkz + constants.generateOTP_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "success") {


        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
                (Route<dynamic> route) => false);


      }
      else if(statusResponse== "failed"){

        alertDialogVoid.showError(context, messageResponse);
      }
    }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }
      else if(statusResponse == 0){
        alertDialogVoid.showError(context, messageResponse);


      }
    }

  }

  Changepassword(context,String username,String oldpassword,String password,String cpassword,String linkz) async {

    Map data = {
      'username': username,
      'oldpassword':oldpassword,
      'password':password,
      'cpassword':cpassword,
      'flag': constants.flag_gohadiah,
    };
    String uri = linkz + constants.generateOTP_api;


    Uri uriValue = Uri.parse(uri);

    var response = await http.post(uriValue, body: data);

    if (response.statusCode == 200)
    {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {

        statusResponse = jsonResponse['status'];

        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "success") {


        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => const DashboardPages()),
                (Route<dynamic> route) => false);


      }
      else if(statusResponse== "failed"){

        alertDialogVoid.showError(context, messageResponse);
      }
    }



    else if (response.statusCode == 202) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        statusResponse = jsonResponse['status'];
        messageResponse = jsonResponse['message'];
      }

      if (statusResponse == "failed") {

        alertDialogVoid.showError(context, messageResponse);

      }
      else if(statusResponse == 0){
        alertDialogVoid.showError(context, messageResponse);


      }
    }

  }

}
