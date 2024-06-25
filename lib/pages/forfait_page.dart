import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mob_se/constants/color_constants.dart';

class ForfaitPage extends StatelessWidget {
  const ForfaitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const Text(
            "Achat de forfaits",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ElevatedButton(onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.colorCustomButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call_made,
                    size: 40,
                    color: Colors.black,),
                    SizedBox(height: 15,),
                    Text('Forfait voix',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,),
                    ),
                  ],
                )),
              ),
              const SizedBox(width: 25,),
              SizedBox(
                width: 150,
                height: 150,
                child: ElevatedButton(onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.colorCustomButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.earthAfrica,
                    size: 40,
                    color: Colors.black,),
                    SizedBox(height: 15,),
                    Text('Forfait data',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,),
                    ),
                  ],
                )),
              ),  
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ElevatedButton(onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.colorCustomButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.mixer,
                    size: 40,
                    color: Colors.black,),
                    SizedBox(height: 15,),
                    Text('Forfait mixte',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,),
                    ),
                  ],
                )),
              ),
              const SizedBox(width: 25,),
              SizedBox(
                width: 150,
                height: 150,
                child: ElevatedButton(onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.colorCustomButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.solidMoon,
                    size: 40,
                    color: Colors.black,),
                    SizedBox(height: 15,),
                    Text('Forfait nuit',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,),
                    ),
                  ],
                )),
              ),  
            ],
          ),
        ],
      ),
    );
  }
}
