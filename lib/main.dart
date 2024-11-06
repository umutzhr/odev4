import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ürün Listesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Ürün listesi: Ürün adı ve fiyat bilgileri içeriyor
  final List<Map<String, dynamic>> products = [
    {'name': 'Logitech MX Master 3 Mouse', 'price': 1500},
    {'name': 'Razer DeathAdder V2 Mouse', 'price': 1000},
    {'name': 'SteelSeries Apex Pro Klavye', 'price': 3500},
    {'name': 'Corsair K95 RGB Platinum Klavye', 'price': 4000},
    {'name': 'Logitech G Pro X Klavye', 'price': 2500},
    {'name': 'HyperX Alloy FPS Pro Klavye', 'price': 1500},
    {'name': 'Razer Huntsman Mini Klavye', 'price': 2000},
    {'name': 'Asus ROG Chakram Mouse', 'price': 2000},
  ];

  int? selectedProductIndex; // Seçili ürünün indeksini tutuyor

  // Ürün seçildiğinde çalışacak fonksiyon
  void _onProductSelected(int index) {
    setState(() {
      selectedProductIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: Row(
        children: [
          
          Container(
            width: 100, 
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onProductSelected(index), // Ürün seçimi için tıklama
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index
                          ? Colors.blueAccent // Seçili ürün için mavi arka plan
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        products[index]['name'], // Ürün adını gösterir
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: selectedProductIndex == index
                              ? Colors.white // Seçili ürün için beyaz yazı rengi
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10), // ListView ve GridView arasında boşluk
          // GridView (Ürün Adı ve Fiyatı)
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // İki sütunlu GridView
                crossAxisSpacing: 10, 
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _onProductSelected(index), // Ürün seçimi için tıklama
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2, 
                          blurRadius: 5, 
                          offset: Offset(0, 3), 
                        ),
                      ],
                      border: Border.all(
                        color: selectedProductIndex == index
                            ? Colors.blue // Seçili ürün için mavi kenarlık
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index]['name'], // Ürün adı
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${products[index]['price']} ₺', // Ürün fiyatı
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
