import 'dart:math';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../data/quotes_data.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote currentQuote;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes.first;
  }

  void newQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  void shareQuote() {
    Share.share('${currentQuote.text}\n— ${currentQuote.author}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text('اقتباس اليوم'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuoteCard(quote: currentQuote),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: newQuote,
                  icon: const Icon(Icons.refresh),
                  label: const Text('اقتباس جديد'),
                ),
                ElevatedButton.icon(
                  onPressed: shareQuote,
                  icon: const Icon(Icons.share),
                  label: const Text('مشاركة'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
