import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141E30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation
            SizedBox(
              height: 180,
              child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_jcikwtux.json',
                repeat: true,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Scanning URL...",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Analyzing for threats",
              style: GoogleFonts.poppins(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}