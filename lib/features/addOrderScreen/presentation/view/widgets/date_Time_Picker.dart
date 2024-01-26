/*import 'package:flutter/material.dart';
import 'package:kuhl_store/features/addOrderScreen/presentation/view/widgets/custom_TextField.dart';

// ignore: must_be_immutable
class DateTimePickerView extends StatefulWidget {
   DateTimePickerView({super.key,this.hinttextdate});
   final String? hinttextdate;
  
  @override
  State<DateTimePickerView> createState() => _DateTimePickerViewState();
}
DateTime? savedate;
class _DateTimePickerViewState extends State<DateTimePickerView> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
                    readonly: true,
                    onchanged: (p0){}, 
                    hinttext: widget.hinttextdate,
                    ontap: () async{
                     savedate = await showDatePicker(context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2023),
                       lastDate: DateTime(2090),
                       );
                       setState(() {
                         
                       });
                       print(savedate);
                    },);
  }
}*/