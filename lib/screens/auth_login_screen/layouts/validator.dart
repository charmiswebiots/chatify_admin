import 'package:chatify_admin/config.dart';

class LoginValidator{

  final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final RegExp regexNum = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
  // Check user name Validation
  String? checkNameValidation(value) {
    if (value.isEmpty) {
      return "Please Enter Name";
    } else {
      return null;
    }
  }

  // Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  // Check Number Validation
  String? checkNumberValidation(value) {
    if (value.isEmpty) {
      return "Please Enter Number";
    } if (value.length < 10) {
      return fonts.enterValidNumber;
    }
    if(!regexNum.hasMatch(value)){
      return fonts.enterNumberOnly.tr;
    }
    return null;
  }

}