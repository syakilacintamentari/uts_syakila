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
        final order = dummyOrders[index];
        return OrderItem(
          order: order,
          onDone: () => _updateStatus(index, 'done'),
        onCancel: () => _updateStatus(index, 'cancelled'),
        );
      },
    ),
  );
}
}

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onDone;
  final VoidCallback onCancel;

  const OrderItem({super.key,
  required this.order,
  required this.onDone,
  required this.onCancel
  });

  @override
  Widget build(BuildContext context){
    final String status = order ['status'] as String;
    final bool isPending = status == 'pending';

    return Padding(padding: const EdgeInsetsGeometry.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //gambar makanan
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Image.network(order['imageUrl'] as String,
          width: 96,
          height: 96,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 96,
              height: 96,
              color: Colors.orange.shade50,
              child: const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
              width: 96,
              height: 96,
              color: Colors.orange.shade50,
              child: Icon(Icons.fastfood_rounded,
              color: Colors.deepOrange.shade200),
          ),
          ),
        ),
        const SizedBox(width: 12),

        //detail pesanan
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('#${order['category']}',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.deepOrange.shade300,
            ),
            ),
            Text(
              order['title'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),
            ),
            Text('ID:${order['id']}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey[500],
            ),
            ),
          const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(fit: BoxFit.scaleDown,alignment: Alignment.centerLeft,
                        child: Text(
                          '\$${order['price']}',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                        color: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                    ),
                    if (isPending) ...[
                      _ActionButton(
                        label: 'Done',
                        filled: true,
                     onPressed: onDone,
                      ),
                      const SizedBox(width: 6),
                      _ActionButton(
                        label: 'Cancel',
                     filled: false,
                        onPressed: onCancel,
                      ),
                    ] else
                      Text(
                        status == 'done' ? 'Done' : 'Cancelled',
                        style: GoogleFonts.poppins(
                      fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: status == 'done'
                              ? Colors.green
                              : Colors.red.shade400,
                          ),
                      ),
                  ],
                   ),
                  ],
             ),
                ),
         ],
         ),
      );
    }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool filled;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.filled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
    const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 0);
    const size = Size(0, 34);

    if (filled) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,foregroundColor: Colors.white,
          elevation: 0,
          shape: shape,
          padding: padding,
          minimumSize: size,
        ),
        child: Text(label, style: GoogleFonts.poppins(fontSize: 13)),
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.deepOrange.shade400,
        side: BorderSide(color: Colors.deepOrange.shade300),
        shape: shape,
        padding: padding,
        minimumSize: size,
      ),
      child: Text(label, style: GoogleFonts.poppins(fontSize: 13)),
    );
  }
}

