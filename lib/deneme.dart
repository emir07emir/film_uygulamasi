import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ColorScheme Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: MyHomePage(colorScheme: colorScheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ColorScheme colorScheme;

  const MyHomePage({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: Text(
          'ColorScheme Örneği',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.secondary,
        child: Icon(Icons.add, color: colorScheme.onSecondary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bu bir kart (surface rengi)',
                  style: TextStyle(color: colorScheme.onSurface),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
              onPressed: () {},
              child: const Text('Primary Buton'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
              ),
              onPressed: () {},
              child: const Text('Secondary Buton'),
            ),
          ],
        ),
      ),
    );
  }
}
