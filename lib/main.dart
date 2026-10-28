import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String _illustrationUrl = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836'
  '?auto=format&fit=crop&w=800&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.orange.shade100, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              //ilustrasi
              Expanded(
                flex: 5,
                child: Center(
                  child: AspectRatio(aspectRatio: 1, child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      //lingkaran krem
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(padding: const EdgeInsetsGeometry.all(16),
                      child: ClipOval(
                        child: Image.network(_illustrationUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepOrange,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.fastfood_rounded,
                            size: 96,
                            color: Colors.deepOrange.shade300,
                            ),
                          );
                        },
                        ),
                      ),
                      ), 
                    ],
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

