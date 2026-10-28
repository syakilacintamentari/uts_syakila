import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

              //judul
              Text('All your favorites',
              textAlign: TextAlign.center,
              style:GoogleFonts.poppins(fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
              ),
              ),
              const SizedBox(height: 12),

              //deskripsi
              Text(
                'Get all your loved foods in one once place, '
                'you just place the one we do the rest',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                  color: Colors.blueGrey[400],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                ),
                 child: Text("NEXT",
                 style: GoogleFonts.poppins(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
              ),
                 ),
                ),
              ),
              const SizedBox(
                height: 8
              ),


            //tautan skip
          TextButton(onPressed: () {},
           child: Text("Skip",
           style: GoogleFonts.poppins(fontSize: 14.0,
           fontWeight: FontWeight.w500,
           color: Colors.blueGrey[400],
           ),
           ),
          ),            
            ],
          ),
        ),
      ),
    );
  }

}


final List<Map<String, dynamic>> dummyOrders = [
  {
    'id': 32053,
    'category': 'Breakfast',
    'title': 'Chicken Thai Biriyani',
    'price': 60,
    'imageUrl': 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32054,
    'category': 'Lunch',
    'title': 'Beef Burger with Fries',
    'price': 45,
    'imageUrl': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32055,
    'category': 'Dinner',
    'title': 'Creamy Pasta Carbonara',
    'price': 55,
    'imageUrl': 'https://images.unsplash.com/photo-1612874742237-6526221588e3?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32056,
    'category': 'Dessert',
    'title': 'Berry Pancake Special',
    'price': 30,
    'imageUrl': 'https://images.unsplash.com/photo-1528207776546-365bb710ee93?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
];

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});


@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text('Food Order',
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[900],
      ),
      ),
    ),
    body: ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: dummyOrders.length,
      itemBuilder: (context, index){
        return OrderItem(order:dummyOrders[index]);
      },
    ),
  );
}
}

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsetsGeometry.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Image.network(order['imageUrl'] as String,
          width: 96,
          height: 96,
          fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('#${order['category']}'),
            Text(
              order['title'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('ID:${order['id']}'),
            Text('\$${order['price']}'),
            
          ],
        ),
        ),
      ],
    ),
    );
  }
  }

