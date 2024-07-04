import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/widgets/custum_bottom_sheet.dart';

class ForfaitVoixPage extends StatelessWidget {
  const ForfaitVoixPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      returnBack(context),
                      const Text(
                        "  Forfaits Voix",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colorCustomButton,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Solde",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
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
                  itemCount: Constantes.forfaitsAppel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = Constantes.forfaitsAppel[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 30),
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.colorCustomButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () {
                            callButtomSheet(
                                context); // Ici nous faisons appel au bottomsheet en tant que action futur
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
                                        Icons.call,
                                        color: ColorConstants.colorCustom2,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item.credit,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.colorCustom2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'validité de ${item.validite} + ${item.msg} sms',
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
        ),
      ),
    );
  }
}
