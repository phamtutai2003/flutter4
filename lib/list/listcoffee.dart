import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(AppMenu());
}

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  static const showGrid = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu coffee',
      home: Scaffold(
          appBar: AppBar(title: Text('appbar')),
          body: Center(
              child: showGrid ? _buildGridCoffee() : _buildListCoffee())),
    );
  }

  Widget _buildGridCoffee() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileListCoffee(6),
    );
  }

  List<Container> _buildGridTileListCoffee(int count) {
    return List.generate(
        count,
        (index) => Container(
              child: Image.asset('images/Menu/drink-$index.jpg'),
            ));
  }

  Widget _buildListCoffee() {
    return ListView(
      children: [
        _tile('Cafe Nau', '25.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Capuchino', '35.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Sinh To Xoai', '40.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Sinh To Dua Hau', '40.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Nuoc Ep Tao', '45.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Nuoc Ep Dua', '45.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
        _tile('Sua Chua Danh Da', '35.000 Vnd',
            IconData(0xf709, fontFamily: 'MaterialIcons')),
      ],
    );
  }

  ListTile _tile(String title, String price, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(price),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}