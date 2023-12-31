import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_frontend/constants/colors.dart';



class CustomSetting extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onPressed;

  const CustomSetting({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  icon,
                  color: greens,
                ),
              ),
              Expanded(
                flex: 7,
                child: GestureDetector(
                  child: Text(
                    text,
                    style: GoogleFonts.commissioner(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    color: Colors.black87,
                    onPressed: onPressed),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0, 30, 0),
          child: Divider(
            thickness: 1,
            color: Color.fromRGBO(199, 199, 199, 1),
          ),
        ),
      ],
    );
  }
}
