import 'package:flutter/material.dart';
import 'package:proj/newsBanner.dart';
import 'package:proj/card.dart';
import 'package:proj/theme.dart';

/////note that i didn't document all of my resources due to time
/////////////////mainly used net ninja course
void main() {
  runApp(
    MaterialApp(
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets Volunteer!'),
          leading: const Icon(Icons.arrow_back),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        body: const Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const NewsBanner(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                /////we can later add a loop here but we dont have the other pages rn
                VolunteerCard(
                  title: 'Beach Cleanup',
                  subtitle: 'Help clean up the coastline',
                  imagePath: 'assets/beach.png',
                ),
                VolunteerCard(
                  title: 'Blood Donation',
                  subtitle: 'Save lives by donating blood',
                  imagePath: 'assets/blood.png',
                ),
                VolunteerCard(
                  title: 'Beach Cleanup',
                  subtitle: 'Help clean up the coastline',
                  imagePath: 'assets/beach.png',
                ),
                VolunteerCard(
                  title: 'Blood Donation',
                  subtitle: 'Save lives by donating blood',
                  imagePath: 'assets/blood.png',
                ),
                VolunteerCard(
                  title: 'Beach Cleanup',
                  subtitle: 'Help clean up the coastline',
                  imagePath: 'assets/beach.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
