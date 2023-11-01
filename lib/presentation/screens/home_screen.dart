import 'package:flutter/material.dart';
import 'package:orion_tek_challenge/core/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.companies)),
      body: ListView(
        children: const [
          CompanyCard(
              name: Strings.appName,
              logo:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtH6ctIDoPfhmlQreh9wC8fy65XzroD6O5Xg&usqp=CAU"),
        ],
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final String name;
  final String logo;
  final void Function()? onTap;

  const CompanyCard({
    super.key,
    required this.name,
    required this.logo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Image.network(
              logo,
              width: double.infinity,
              height: 150,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}