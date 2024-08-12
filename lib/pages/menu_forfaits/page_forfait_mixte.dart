import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';

import '../../widgets/custum_bottom_sheet.dart';
//import 'package:mob_se/widgets/custum_bottom_sheet.dart';


class ForfaitMixtePage extends StatelessWidget {
  const ForfaitMixtePage({super.key});

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
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      returnBack(context),
                      const Text(
                        "Forfaits Mixte",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colorCustomButton,
                    ),
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(Constantes.soldeTogocom[2].codeNormal);
                    },
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
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
              thickness: 1,
            ),
            Expanded(
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: Constantes.forfaitsMixteTogocom.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = Constantes.forfaitsMixteTogocom[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
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
                              context, item.credit, item.msg, item.validite, item.prix, item.codeNormal, item.codeAutruiCredit, item.codeMoneyMM, item.codeMoneyAutruit, item.mega, item.typeforfait);
                            // Ici nous faisons appel au bottomsheet en tant que action futur
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.call,
                                        color: ColorConstants.colorCustom2,
                                        size: 18,
                                      ),
                                      Text(
                                        item.credit,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.colorCustom2,
                                        ),
                                      ),
                                    ],
                                  ),
                                const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.language,
                                        color: ColorConstants.colorCustom2,
                                        size: 18,
                                      ),
                                      Text(
                                        item.mega,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.colorCustom2,
                                        ),
                                      ),
                                    ],
                                  ),
                                    ],
                                  ),
                                  Text(
                                    '${item.validite} + ${item.msg}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: ColorConstants.colorCustom2,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                item.prix,
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
