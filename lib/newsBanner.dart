import 'package:flutter/material.dart';
import 'package:proj/someStyles.dart';

class NewsBanner extends StatelessWidget {
  const NewsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Image.asset(
            'assets/kidsbanner.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black.withOpacity(0.4),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyleMainText(
                    text: 'This Week\'s Highlight ✨',
                    colour: Color.fromARGB(255, 255, 255, 255),
                  ),
                  StyleSubText(
                    text: 'Over 2,000 volunteers jioned local cleanup efforts!',
                    colour: Color.fromARGB(
                      255,
                      225,
                      225,
                      225,
                    ), // Color for subtext
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
