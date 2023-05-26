import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

showCustomSnackbar(BuildContext context){
   return showTopSnackBar(
     Overlay.of(context),
     CustomSnackBar.error(message:"Something Went Wrong , Please Check Your Internet Connection")
   );
}