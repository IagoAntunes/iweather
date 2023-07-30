import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWeather extends StatelessWidget {
  const ItemWeather({
    super.key,
    required this.svgImage,
    required this.title,
    required this.value,
  });
  final String svgImage;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SvgPicture.asset(
            svgImage,
            color: const Color(0xff3B3B54),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.nunito(
              color: const Color(0xffBFBFD4),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            value,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
