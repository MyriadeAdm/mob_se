import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';

class ForfaitDataPage extends StatelessWidget {
  const ForfaitDataPage({super.key});

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
                "  forfaits Internet",
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
                  itemCount: Constantes.forfaitsInternet.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = Constantes.forfaitsInternet[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                              const Icon(
                                Icons.language,
                                color: ColorConstants.colorCustom2,
                              ),
                              Text(
                                item.mega,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorCustom2,
                                ),
                              ),
                              Text(
                                'validité de ${item.validite}',
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