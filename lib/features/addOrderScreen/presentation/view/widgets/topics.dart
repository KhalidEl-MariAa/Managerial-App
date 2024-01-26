

import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  const Topic({super.key,required this.topicName,required this.topPadding});
  final String topicName;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:   EdgeInsets.only(left: 15,bottom: 20,top:topPadding),
                        child: Text(topicName,style:
                        const TextStyle(fontSize: 17.5,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)
                         ),
        
                      ),
                    );
  }
}