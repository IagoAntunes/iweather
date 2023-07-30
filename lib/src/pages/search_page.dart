import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iweather/core/styles/colos.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with WidgetsBindingObserver {
  final SearchController searchController = SearchController();

  final TextEditingController controller = TextEditingController();
  bool keyboardOpen = false;
  List<String> lista = [
    "Banana",
    "Laranja",
    "Peixe",
    "Melancia",
  ];
  @override
  Widget build(BuildContext context) {
    keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
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
                    SearchAnchor.bar(
                      viewBackgroundColor: AppColors.backgroundLight,
                      isFullScreen: false,
                      barHintStyle: const MaterialStatePropertyAll(
                        TextStyle(color: Colors.white),
                      ),
                      barBackgroundColor: const MaterialStatePropertyAll(
                          AppColors.backgroundLight),
                      barTextStyle: const MaterialStatePropertyAll(
                        TextStyle(color: Colors.white),
                      ),
                      barShape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      barLeading: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      viewLeading: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          searchController.closeView(null);
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      viewHeaderTextStyle: const TextStyle(color: Colors.white),
                      searchController: searchController,
                      suggestionsBuilder: (context, controller) {
                        List<String> listFilter = lista
                            .where(
                                (element) => element.contains(controller.text))
                            .toList();
                        return List<ListTile>.generate(listFilter.length,
                            (int index) {
                          return ListTile(
                            title: Text(
                              listFilter[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              setState(() {
                                controller.closeView(listFilter[index]);
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
