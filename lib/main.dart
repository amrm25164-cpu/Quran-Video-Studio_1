
import 'package:flutter/material.dart';

void main() {
  runApp(const QuranStudio());
}

class QuranStudio extends StatelessWidget {
  const QuranStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Video Studio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1514),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD8B15A),
          brightness: Brightness.dark,
        ),
      ),
      home: const StudioHome(),
    );
  }
}

class StudioHome extends StatefulWidget {
  const StudioHome({super.key});

  @override
  State<StudioHome> createState() => _StudioHomeState();
}

class _StudioHomeState extends State<StudioHome> {
  final verseController = TextEditingController(
    text: 'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
  );

  double fontSize = 30;
  double opacity = 1;

  @override
  void dispose() {
    verseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Video Studio'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'صانع فيديوهات القرآن الكريم',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF142B29),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD8B15A),
                width: 2,
              ),
            ),
            child: Text(
              verseController.text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: fontSize,
                height: 1.8,
                color: const Color(0xFFF5E6B8)
                    .withOpacity(opacity),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('اكتب نص الآية'),
          const SizedBox(height: 8),
          TextField(
            controller: verseController,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            maxLines: 3,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              hintText: 'اكتب النص هنا',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text('حجم الخط: ${fontSize.round()}'),
          Slider(
            value: fontSize,
            min: 18,
            max: 44,
            onChanged: (value) {
              setState(() => fontSize = value);
            },
          ),
          Text('شفافية النص: ${(opacity * 100).round()}%'),
          Slider(
            value: opacity,
            min: 0.2,
            max: 1,
            onChanged: (value) {
              setState(() => opacity = value);
            },
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'الخطوة الأولى: تجهيز واجهة تصميم الفيديو.\n'
                'سنضيف لاحقًا الخلفيات والصوت وتصدير MP4.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}