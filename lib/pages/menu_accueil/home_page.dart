import 'package:flutter/material.dart';
import 'package:mob_se/components/my_gesture_detector_button.dart';
import 'package:mob_se/components/my_gesture_detector_text.dart';
import 'package:mob_se/components/my_historie_card.dart';
import 'package:mob_se/components/my_historie_title_line.dart';
import 'package:mob_se/components/my_title_row.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/widgets/custom_button.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_appel.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_internet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String cname = Provider.of<Reseaux>(context).reseau!;
    String mb = context.watch<Reseaux>().money!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const MyGestureDetectorButton(),
                  const SizedBox(width: 15),
                  MyGestureDetectorText(
                    cname: cname,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CustomButton(
                            label: 'Solde credit',
                            code: (cname == 'Togocom') ? "*909*0#" : "*101#")),
                    const SizedBox(width: 20),
                    Expanded(
                        child: CustomButton(
                            label: 'Solde $mb',
                            code: (cname == 'Togocom')
                                ? "*145*7*1#"
                                : "*155*6*1#")),
                  ],
                ),
              ),
              const MyTitleRow(title: "Forfait Internet"),
              (Provider.of<Reseaux>(context, listen: false).reseau ==
                  "Togocom")
                  ? const ForfaitInternetTogocom()
                  : const ForfaitInternetMoov(),
              const MyTitleRow(title: "Forfait Appel"),
              (context.watch<Reseaux>().reseau == 'Togocom')
                  ? const ForfaitAppelTogocom()
                  : const ForfaitAppelMoov(),
              const MyHistorieTitleLine(),
              //const SizedBox(height: 20,),
            ],
          ),
          const MyHistorieCard(),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class ForfaitAppelMoov extends StatelessWidget {
  const ForfaitAppelMoov({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constantes.forfaitsAppelMoov.length,
        itemBuilder: (BuildContext context, int index) {
          final item = Constantes.forfaitsAppelMoov[index];

          return CustomListViewForfaitAppel(
            icon: Icon(
              Icons.call,
              size: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            credit: item.credit,
            validity: item.validite,
            msg: item.msg,
            prix: item.prix,
            codeMMCredit: item.codeMMCredit,
            codeAutruiCredit: item.codeAutruiCredit,
            codeMoneyMM: item.codeMoneyMM,
            codeMoneyAutrui: item.codeMoneyAutruit,
            mega: item.mega,
            typeForfait: item.typeforfait,
          );
        },
      ),
    );
  }
}

class ForfaitAppelTogocom extends StatelessWidget {
  const ForfaitAppelTogocom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constantes.forfaitsAppelTogocom.length,
        itemBuilder: (BuildContext context, int index) {
          final item = Constantes.forfaitsAppelTogocom[index];

          return CustomListViewForfaitAppel(
            icon: Icon(
              Icons.call,
              size: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            credit: item.credit,
            validity: item.validite,
            msg: item.msg,
            prix: item.prix,
            codeMMCredit: item.codeMMCredit,
            codeAutruiCredit: item.codeAutruiCredit,
            codeMoneyMM: item.codeMoneyMM,
            codeMoneyAutrui: item.codeMoneyAutruit,
            mega: item.mega,
            typeForfait: item.typeforfait,
          );
        },
      ),
    );
  }
}

class ForfaitInternetTogocom extends StatelessWidget {
  const ForfaitInternetTogocom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Constantes.forfaitsInternetTogocom.length,
          itemBuilder: (BuildContext context, int index) {
            final item = Constantes.forfaitsInternetTogocom[index];
            return CustomListViewForfaitInternet(
              icon: Icon(
                Icons.public,
                size: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              mega: item.mega,
              validite: item.validite,
              prix: item.prix,
              codeMMCredit: item.codeMMCredit,
              codeAutruiCredit: item.codeAutruiCredit,
              codeMoneyMM: item.codeMoneyMM,
              codeMoneyAutruit: item.codeMoneyAutruit,
              typeforfait: item.typeforfait,
            );
          }),
    );
  }
}

class ForfaitInternetMoov extends StatelessWidget {
  const ForfaitInternetMoov({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Constantes.forfaitsInternetMoov.length,
          itemBuilder: (BuildContext context, int index) {
            final item = Constantes.forfaitsInternetMoov[index];
            return CustomListViewForfaitInternet(
              icon: Icon(
                Icons.public,
                size: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              mega: item.mega,
              validite: item.validite,
              prix: item.prix,
              codeMMCredit: item.codeMMCredit,
              codeAutruiCredit: item.codeAutruiCredit,
              codeMoneyMM: item.codeMoneyMM,
              codeMoneyAutruit: item.codeMoneyAutruit,
              typeforfait: item.typeforfait,
            );
          }),
    );
  }
}
