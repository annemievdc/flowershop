import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/widgets/doorbell_widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          Text(
            'Het Duistere Project',
            style: AppTextStyles.subtitle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Deze webshop is geen vrolijk digitaal platform; het is een zorgvuldig gecultiveerd kabinet van botanische rariteiten. Tot leven gewekt als een verplichte, pijnlijke opdracht voor het vak Programming for Cloud aan de Thomas More Hogeschool. \n\n De heer Versweyveld eiste een functionele applicatie. Ik besloot de app te voorzien van een esthetiek die zijn bloed doet bevriezen.\n\n Hier worden geen bloemen verkocht om kamers op te vrolijken, maar flora voor het oproepen van geesten, het versturen van passief-agressieve dreigementen, of het op afstand houden van irritante, levende wezens.',
              style: AppTextStyles.body(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),

          Text(
            'De Architect van deze Ellende',
            style: AppTextStyles.subtitle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Annemie Vandecandelaere.\nEen oververmoeide werkstudent binnen de discipline graduaat programmeren, die bij voorkeur codeert in de schaduw van de nacht.',
            style: AppTextStyles.body(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),

          Text(
            'Onze Filosofie',
            style: AppTextStyles.subtitle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Bloemen zijn prachtig... vooral als ze langzaam verwelken...',
            style: AppTextStyles.body(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),

          Text(
            'Contacteer mij',
            style: AppTextStyles.subtitle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Mocht u de onbezonnen drang voelen om mij te confronteren met uw aanwezigheid, luid dan de deurbel hieronder. ',
            style: AppTextStyles.body(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          const SizedBox(
            height: 150,
            width: double.infinity,
            child: DoorbellWidget(),
          ),
        ],
      ),
    );
  }
}
