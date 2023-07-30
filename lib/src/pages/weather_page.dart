import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iweather/core/styles/colos.dart';

import '../widgets/item_weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.35,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/back_rain.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Porto Alegre, RS",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Segunda-feira, 15 de maio de 2023",
                      style: GoogleFonts.nunito(
                        color: const Color(0xffFAFAFA),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "28ºC",
                                  style: GoogleFonts.nunito(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "26ºc/32ºc",
                                  style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Poucas nuvens",
                                  style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/images/moon.svg")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundLight,
                  ),
                  child: const Column(
                    children: [
                      ItemWeather(
                        svgImage: "assets/images/icon_termic.svg",
                        title: "Sensação térmica",
                        value: "26ºc",
                      ),
                      Divider(color: Color(0xff3B3B54)),
                      ItemWeather(
                        svgImage: "assets/images/icon_prob_rain.svg",
                        title: "Probabilidade de chuva",
                        value: "0%",
                      ),
                      Divider(color: Color(0xff3B3B54)),
                      ItemWeather(
                        svgImage: "assets/images/icon_wind.svg",
                        title: "Velocidade do vento",
                        value: "8 km/h",
                      ),
                      Divider(color: Color(0xff3B3B54)),
                      ItemWeather(
                        svgImage: "assets/images/icon_humidity.svg",
                        title: "Umidade do ar",
                        value: "40%",
                      ),
                      Divider(color: Color(0xff3B3B54)),
                      ItemWeather(
                        svgImage: "assets/images/icon_uv.svg",
                        title: "índice UV",
                        value: "5",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
