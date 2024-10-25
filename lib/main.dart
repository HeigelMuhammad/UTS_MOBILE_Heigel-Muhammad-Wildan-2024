import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(VoidKomputerApp());

class VoidKomputerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/search') {
          final String category = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => SearchResultsPage(category: category),
          );
        }
        return null;
      },
    );
  }
}

// Halaman Login dan Signup (Page 1)
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menambahkan gaya pada gambar
            Image.asset(
              'assets/komputer.png', // Gambar dari lokal
              height: 200,
            ),
            SizedBox(height: 50),
            Text(
              'Selamat Datang di Void Komputer',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Ubah warna menjadi putih
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            // Tombol Log In
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Ubah warna menjadi putih
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 80), // Memperpanjang tombol
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Menambahkan sudut melengkung
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tombol Sign Up
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Sign Up
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.purple, // Ubah warna menjadi ungu
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Ubah latar belakang menjadi putih
                padding: EdgeInsets.symmetric(
                    vertical: 15, horizontal: 80), // Memperpanjang tombol
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Menambahkan sudut melengkung
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Beranda (Page 2 & 3)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Void Komputer',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white)), // Ubah warna menjadi putih
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Selamat Datang!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Ubah warna menjadi putih
              ),
            ),
            SizedBox(height: 10),
            SearchBar(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  ServiceCard('Processor', 'assets/prosesor.jpg'),
                  ServiceCard('GPU', 'assets/gpu.jpg'),
                  ServiceCard('Motherboard', 'assets/motherboard.jpg'),
                  ServiceCard('RAM', 'assets/ram.png'),
                  ServiceCard('Power Supply', 'assets/power_supply.png'),
                  ServiceCard('Storage', 'assets/ssd.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Aktivitas',
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
    );
  }
}

// Komponen Search Bar
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari Komponen',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onSubmitted: (query) {
        Navigator.pushNamed(context, '/search', arguments: query);
      },
    );
  }
}

// Komponen Kartu Layanan
class ServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  ServiceCard(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade100,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/search', arguments: title);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl, height: 100), // Ukuran gambar disesuaikan
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Hasil Pencarian Produk
class SearchResultsPage extends StatelessWidget {
  final String category;

  SearchResultsPage({required this.category});

  final Map<String, List<ProductCard>> products = {
    'Processor': [
      ProductCard(
          'Processor Intel i9-11900K', 'Rp 6.000.000', 'assets/prosesor.jpg'),
      ProductCard(
          'Processor AMD Ryzen 9', 'Rp 5.500.000', 'assets/prosesor.jpg'),
    ],
    'GPU': [
      ProductCard('NVIDIA RTX 3080', 'Rp 12.000.000', 'assets/gpu.jpg'),
      ProductCard('AMD Radeon RX 6900XT', 'Rp 13.500.000', 'assets/gpu.jpg'),
    ],
    'Motherboard': [
      ProductCard(
          'Motherboard ASUS Z590', 'Rp 3.500.000', 'assets/motherboard.jpg'),
      ProductCard(
          'Motherboard MSI B450', 'Rp 1.700.000', 'assets/motherboard.jpg'),
    ],
    'RAM': [
      ProductCard('RAM 16GB DDR4', 'Rp 1.200.000', 'assets/ram.png'),
      ProductCard('RAM 32GB DDR4', 'Rp 2.500.000', 'assets/ram.png'),
    ],
    'Power Supply': [
      ProductCard(
          'PSU Corsair 750W', 'Rp 1.300.000', 'assets/power_supply.png'),
      ProductCard(
          'PSU Seasonic 650W', 'Rp 1.000.000', 'assets/power_supply.png'),
    ],
    'Storage': [
      ProductCard('SSD Samsung 1TB', 'Rp 2.000.000', 'assets/ssd.jpg'),
      ProductCard('HDD Seagate 2TB', 'Rp 900.000', 'assets/ssd.jpg'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pencarian: $category',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: products[category] ?? [],
        ),
      ),
    );
  }
}

// Komponen Kartu Produk
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  ProductCard(this.name, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 100), // Ukuran gambar disesuaikan
          SizedBox(height: 10),
          Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          Text(price, style: GoogleFonts.poppins()),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Beli', style: GoogleFonts.poppins()),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          ),
        ],
      ),
    );
  }
}
