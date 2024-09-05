import 'package:massenger/core/error/failure.dart';

String? failureToText(Failure? f) {
  if (f == null) {
    return null;
  }
  if (f is BadEmailFormate) {
    return "Bad Email formate";
  }
  if (f is TooShortPassWord) {
    return " Too Short PassWord";
  }
  return "there is some error";
}
