import 'package:flutter/material.dart';
import 'dummy_menu.dart';

class HomePage extends StatelessWidget {
  final String username;
  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Selamat datang, $username",
                style: TextStyle(fontSize: 18), textAlign: TextAlign.start),
            Text(
              "Ini adalah Menu Makanan",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final foodMenu = foodMenuList[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodMenu.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Category: ${foodMenu.category}'),
                      Text('Price: ${foodMenu.price}'),
                      Text('Description: ${foodMenu.description}'),
                      Text('Ingredients: ${foodMenu.ingredients}'),
                      Text('Cooking Time: ${foodMenu.cookingTime}'),
                      SizedBox(height: 10),

                      // Display Image
                      Image.asset(
                        foodMenu.imageAsset,
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: foodMenu.imageUrls.map((url) {
                          return Image.network(url, width: 100, height: 100);
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ElevatedButton diletakkan di bagian bawah layar
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Menambahkan padding agar ada jarak dari tepi bawah
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // background merah
                foregroundColor: const Color.fromARGB(
                    255, 255, 255, 255), // warna teks putih
              ),
              onPressed: () {
                Navigator.pop(context); // Aksi ketika tombol ditekan
              },
              child: Text("Logout"), // Label pada tombol
            ),
          ),
        ],
      ),
    );
  }
}
