import 'package:audioplayers/audioplayers.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/mail_dialoog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoorbellWidget extends StatefulWidget {
  const DoorbellWidget({super.key});

  @override
  State<DoorbellWidget> createState() => _DoorbellWidgetState();
}

class _DoorbellWidgetState extends State<DoorbellWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animatieController;
  late Animation<double> trilAnimatie;

  AudioPlayer audioPlayer = AudioPlayer();

  bool isAangebeld = false;

  @override
  void initState() {
    super.initState();
    animatieController = AnimationController(
      vsync: this, // Koppelt animatie aan verversingssnelheid vh scherm
      duration: const Duration(seconds: 1),
    );

    trilAnimatie = Tween<double>(
      begin: -0.10,
      end: 0.10,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(animatieController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.richBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click, //op het web kun je klikken
              child: GestureDetector(
                onTap: activeerDeurbel,
                child: AnimatedBuilder(
                  animation: trilAnimatie,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: trilAnimatie.value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/deurbel.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void activeerDeurbel() async {
    animatieController.repeat(reverse: true);

    await audioPlayer.play(AssetSource('audio/foghorn.oga'));
    await audioPlayer.onPlayerComplete.first;
    await audioPlayer.play(AssetSource('audio/lurch.mp3'));

    await Future.delayed(Duration(milliseconds: 750));
    animatieController.reset();

    setState(() {
      isAangebeld = true;
    });

    String? emailBezoeker = await showDialog<String>(
      context: context,
      builder: (BuildContext context) => MailDialoog(),
    );
    if (emailBezoeker != null && emailBezoeker.isNotEmpty) {
      await stuurMail(emailBezoeker);
    }
  }

  Future<void> stuurMail(String emailBezoeker) async {
    final String subject = Uri.encodeComponent('Contact info');

    final String body = Uri.encodeComponent(
      'Dag Annemie, natuurlijk ben je geslaagd!!\n\n'
      'Maar ik heb een aantal vragen:\n'
      '--- Vul hier je vragen in ---\n\n'
      'Ik ontvang  de antwoorden graag op : $emailBezoeker',
    );

    final Uri emailUri = Uri.parse(
      'mailto:r0433145@student.thomasmore.be?subject=$subject&body=$body',
    );
    print('Emailadres bezoeker : $emailUri');
    bool gelukt = await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    );
    if (!gelukt) {
      print('Kon emailapp niet openen');
    }
  }

  @override
  void dispose() {
    animatieController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
