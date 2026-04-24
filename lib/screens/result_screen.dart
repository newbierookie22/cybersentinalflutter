import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const ResultScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String risk = data['risk'];
    int score = data['score'];
    List findings = data['findings'] ?? [];

    Color bgColor;

    if (risk == "Safe") {
      bgColor = Colors.green;
    } else if (risk == "Suspicious") {
      bgColor = Colors.orange;
    } else {
      bgColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Result"),
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Risk
            Text(
              risk,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: bgColor,
              ),
            ),

            const SizedBox(height: 10),

            // Score
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            // Findings
            const Text(
              "Findings:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...findings.map((f) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text("• $f"),
                )),

            const Spacer(),

            // Back button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"),
              ),
            )
          ],
        ),
      ),
    );
  }
}