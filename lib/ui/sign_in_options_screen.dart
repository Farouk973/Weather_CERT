import 'package:flutter/material.dart';
import 'package:smart_irrigation/ui/csv.dart';
import 'package:smart_irrigation/ui/sign_in_button.dart';

import '../service_precipitation/menuprecipitation.dart';
import '../service_pression/menupresssion.dart';
import 'menupage.dart';

class SignInOptionsScreen extends StatelessWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Column(children: [
          SignInButton(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new menupression(
                          title: 'Monthly Morneg Statics',
                        ))),
            iconPath: 'assets/images/pres.png',
            textLabel: 'Pressure',
            backgroundColor: Colors.blue.shade50,
            elevation: 5.0,
          ),
          SizedBox(height: 10),
          SignInButton(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new menupage(
                          title: 'Monthly Morneg Statics',
                        ))),
            iconPath: 'assets/images/hum.png',
            textLabel: 'Temperateur',
            backgroundColor: Colors.blue.shade200,
            elevation: 0.0,
          ),
          SizedBox(height: 10),
          SignInButton(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new menuprecipitation(
                          title: 'Monthly Morneg Statics',
                        ))),
            iconPath: 'assets/images/rain.png',
            textLabel: 'Precipitation',
            backgroundColor: Colors.blue.shade300,
            elevation: 0.0,
          ),
          SizedBox(height: 10),
          SignInButton(
            onTap: () {},
            iconPath: 'assets/images/sun1.png',
            textLabel: 'Sollar Raduation',
            backgroundColor: Colors.blue.shade500,
            elevation: 0.0,
          ),
          SizedBox(height: 10),
          SignInButton(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => new csv())),
            iconPath: 'assets/images/rain.png',
            textLabel: 'Export data to csv file',
            backgroundColor: Colors.blue.shade800,
            elevation: 0.0,
          ),
        ])
      ],
    );
  }
}
