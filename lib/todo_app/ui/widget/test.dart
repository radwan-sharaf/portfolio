import 'package:flutter/material.dart';
import 'package:todo_t_app/todo_app/ui/widget/title_text.dart';

class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    Key? key,
    required this.label,
    this.hint = '',
    this.suIcon,
    this.ctrl,
    this.type,
    this.onTap,
  }) : super(key: key);
  final String label;
  String hint;
  Widget? suIcon;
  TextEditingController? ctrl;
  TextInputType? type;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          text: label,
          size: 18,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1.5,
                color: Colors.grey,
              )),
          child: TextFormField(
            onTap: onTap,
            controller: ctrl,
            keyboardType: type,
            autofocus: false,
            autocorrect: false,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ),
              ),
              border: InputBorder.none,
              suffixIcon: suIcon,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
              suffixIconColor: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
