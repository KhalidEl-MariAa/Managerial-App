import 'package:flutter/material.dart';


class HistoryItemView extends StatelessWidget {
  const HistoryItemView({
    super.key,
    required this.title,
    required this.ontap,
  });
  final String title;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        elevation: 22,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          
          width: MediaQuery.sizeOf(context).width * 0.6,
          height: MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(100, 135, 206, 250)),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )),
        ),
      ),
    );
  }
}
