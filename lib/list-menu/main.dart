import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class AddProductDialog extends StatefulWidget {
  final Function(Drink) addDrinkCallback;

  AddProductDialog({required this.addDrinkCallback});

  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Product'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: detailController,
              decoration: InputDecoration(labelText: 'Detail'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Đóng hộp thoại
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Thêm sản phẩm mới vào danh sách
            final String imageUrl = imageUrlController.text;
            final String name = nameController.text;
            final double price = double.tryParse(priceController.text) ?? 0.0;
            final String detail = detailController.text;

            if (name.isNotEmpty && price > 0) {
              // Kiểm tra nếu thông tin sản phẩm hợp lệ
              final Drink newDrink = Drink(name: name, price: price, detail: detail, imageUrl: imageUrl);

              // Gọi callback để thêm sản phẩm vào danh sách ở MyApp
              widget.addDrinkCallback(newDrink);

              Navigator.of(context).pop(); // Đóng hộp thoại
            }
            print("Add button tapped");
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class Drink {
  final String name;
  final double price;
  final String detail;
  final String imageUrl;

  Drink({required this.name, required this.price, required this.detail, required this.imageUrl});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Drink> drinks = [
    Drink(
      name: "Coffee",
      price: 3.99,
      detail: "Delicious coffee",
      imageUrl: "https://nhadepso.com/wp-content/uploads/2023/01/hinh-anh-ly-ca-phe_27.jpg",
    ),
    Drink(
      name: "Tea",
      price: 2.49,
      detail: "Refreshing tea",
      imageUrl: "https://images.pexels.com/photos/4974553/pexels-photo-4974553.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    ),
    Drink(
      name: "Juice",
      price: 4.99,
      detail: "Freshly squeezed juice",
      imageUrl: "https://i1-vnexpress.vnecdn.net/2017/04/08/fruit-juice-9401-1491638667.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=lkKpDabfkfp5Czj7zoLNjA",
    ),
  ];

  void addDrink(Drink newDrink) {
    setState(() {
      drinks.add(newDrink);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrinkListScreen(drinks: drinks, addDrinkCallback: addDrink),
    );
  }
}

class DrinkListScreen extends StatelessWidget {
  final List<Drink> drinks;
  final Function(Drink) addDrinkCallback;

  DrinkListScreen({required this.drinks, required this.addDrinkCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink List'),
      ),
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(drinks[index].imageUrl),
            title: Text(drinks[index].name),
            subtitle: Text('\$${drinks[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrinkDetailScreen(drink: drinks[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddProductDialog(addDrinkCallback: addDrinkCallback),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DrinkDetailScreen extends StatelessWidget {
  final Drink drink;

  DrinkDetailScreen({required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(drink.imageUrl),
            Text('Name: ${drink.name}'),
            Text('Price: \$${drink.price.toStringAsFixed(2)}'),
            Text('Detail: ${drink.detail}'),
          ],
        ),
      ),
    );
  }
}
