import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, this.text, this.sender});

  final text;
  final sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sender,
          style: GoogleFonts.montserrat(),
        )
            .text
            .color(sender == "Vous"
                ? const Color.fromARGB(255, 122, 8, 0)
                : Colors.white)
            .titleSmall(context)
            .make()
            .box
            .color(sender == "Vous"
                ? Colors.white
                : const Color.fromARGB(255, 122, 8, 0))
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ).px12(),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: text,
            ).px12()
          ],
        ))
      ],
    ).py12();
  }
}
