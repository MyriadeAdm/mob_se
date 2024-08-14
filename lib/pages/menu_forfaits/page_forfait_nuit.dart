import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/constantes.dart';
import '../../constants/reseaux.dart';
import '../../widgets/custum_bottom_sheet.dart';

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
              padding: const EdgeInsets.only(left: 5,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        returnBack(context),
                        const Text(
                          "Forfaits Nuit",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                    ),
                    onPressed: () {
                      (context.watch<Reseaux>().reseau=="Togocom") ?
                      FlutterPhoneDirectCaller.callNumber(Constantes.soldeTogocom[0].codeNormal) :
                      FlutterPhoneDirectCaller.callNumber(Constantes.soldeMoov[0].codeNormal) ;
                    },
                    child: Text(
                      "Solde",
                      style: TextStyle(
                        color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
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
                  itemCount: (context.watch<Reseaux>().reseau=="Togocom") ? Constantes.forfaitsNuitTogocom.length : Constantes.forfaitsNuitMoov.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = (context.watch<Reseaux>().reseau=="Togocom") ? Constantes.forfaitsNuitTogocom[index] : Constantes.forfaitsNuitMoov[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 30),
                      child: SizedBox(
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () {
                            callButtomSheet(
                                context, '', '', item.validite, item.prix, item.codeMMCredit, item.codeAutruiCredit, item.codeMoneyMM, item.codeMoneyAutruit, item.mega, item.typeforfait);
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
                                      Icon(
                                        Icons.language,
                                        color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item.mega,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item.validite,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                item.prix,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
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
