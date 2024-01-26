import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


abstract class AwesomeDialogs{

static AwesomeDialog buildAwesomeDialogSucess(
  {required BuildContext context,
  void Function()? onpressed,
  required String title,
  required String desc
  }) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        title: title,
        desc: desc,
        btnOk: Center(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed:onpressed,
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }

  
 static AwesomeDialog buildAwesomeDialogFailure(
      {required BuildContext context,  state, required String title}) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        title: title,
        desc: state.errorMessgae,
        btnOk: Center(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }

  static AwesomeDialog buildAwesomeDialogForHistorySucess(BuildContext context) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        title: 'You have recieved your order!',
        desc: 'Great News , Check your History',
        btnOk: Center(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }
  
   static AwesomeDialog buildAwesomeDialogForHistoryFailure(
      BuildContext context,mess) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        title: 'Sorry The process is failed',
        desc: mess,
        btnOk: Center(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }

  static AwesomeDialog buildAwesomeDialogDecreaseFailure(
      {required BuildContext context ,required String title}) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        title: title,
        
        btnOk: Center(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }

}