import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/constantes.dart';
import '../widgets/custum_bottom_sheet.dart';

class ForfaitNuitPage extends StatelessWidget {
  const ForfaitNuitPage({super.key});

  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  returnBack(context),
                  const Text(
                    "  Forfaits Nuit",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 50,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
              thickness: 1,
            ),

            Expanded(
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: Constantes.forfaitsNuit.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = Constantes.forfaitsNuit[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 30),
                      child: SizedBox(
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.colorCustomButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () {
                            callButtomSheet(
                                context, item.mega); 
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.language,
                                        color: ColorConstants.colorCustom2,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item.mega,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.colorCustom2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'validité de ${item.validite}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: ColorConstants.colorCustom2,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${item.prix} XOF',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: ColorConstants.colorCustom2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),),
    );
  }
}
