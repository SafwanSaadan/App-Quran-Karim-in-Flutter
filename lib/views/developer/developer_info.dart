// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading:
              BackButton(color: Theme.of(context).textTheme.bodyLarge?.color),
          elevation: 0.0,
          title: Text(
            "مطور التطبيق",
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('safwan1.PNG'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ':تم تطوير هذا التطبيق بواسطة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' م / صفوان سعدان',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _openWhatsApp('+967735878939');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('whatsApp.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _openURL('https://t.me/SafwanSaadan');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('telegram.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _openURL(
                                'https://www.facebook.com/profile.php?id=100026356111617');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('facebook.jpeg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _openURL('https://safwansadaan7@gmail.com/');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('email.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _openURL('https://github.com/SafwanSaadan');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('github.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _openURL(
                                'https://www.linkedin.com/in/صفوان-سعدان-181b252a0');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('linkedin.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _openURL(
                                'https://safwansaadan.github.io/Safwan-Saadan-CV/');
                          },
                          icon: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('web2.jpeg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openWhatsApp(String phoneNumber) async {
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openEmail(String email, String subject, String body) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    final String url = _emailLaunchUri.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
