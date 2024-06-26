import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';

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
                "  Forfaits Mixtes",
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
                  itemCount: Constantes.forfaitsMixte.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = Constantes.forfaitsMixte[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: SizedBox(
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.colorCustomButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.credit,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorCustom2,
                                ),
                              ),
                              Text(
                                item.mega,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorCustom2,
                                ),
                              ),
                              Text(
                                'valide ${item.validite} + ${item.msg} sms',
                                style:
                                    const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: ColorConstants.colorCustom2,
                                      ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${item.prix} XOF',
                                style: const TextStyle(fontWeight: FontWeight.bold,
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
