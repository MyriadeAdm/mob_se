import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';

class ForfaitVoixPage extends StatelessWidget {
  const ForfaitVoixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "  Achat de forfaits",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
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
                                Icons.call_made,
                                color: ColorConstants.colorCustom2,
                              ),
                              Text(
                                item.credit,
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
