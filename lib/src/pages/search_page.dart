import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iweather/core/styles/colos.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController searchController = SearchController();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/Logo.svg"),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Boas vindas ao',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: 'Type Weather',
                            style: GoogleFonts.nunito(
                              color: AppColors.secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Escolha um local para ver a previsão do tempo",
                      style: GoogleFonts.nunito(
                        color: const Color(0xffBFBFD4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SearchAnchor(
                      searchController: searchController,
                      builder: (context, controller) {
                        return SearchBar(
                          controller: controller,
                          backgroundColor: const MaterialStatePropertyAll(
                            AppColors.backgroundLight,
                          ),
                          elevation: const MaterialStatePropertyAll(0),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            controller.openView();
                          },
                          hintText: 'Buscar local',
                          hintStyle: MaterialStatePropertyAll(
                            GoogleFonts.nunito(
                              color: const Color(0xffBFBFD4),
                            ),
                          ),
                          textStyle: MaterialStatePropertyAll(
                            GoogleFonts.nunito(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      suggestionsBuilder: (context, controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(controller.text),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
