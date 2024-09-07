import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Bag',
      home: MyBag(),
    );
  }
}

class MyBag extends StatefulWidget {
  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  int _pulloverQuantity = 1;
  int _tshirtQuantity = 1;
  int _sportDressQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItem(
              'Pullover',
              'Black',
              'L',
              51,
              _pulloverQuantity,
                  (quantity) {
                setState(() {
                  _pulloverQuantity = quantity;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildItem(
              'T-Shirt',
              'Gray',
              'L',
              30,
              _tshirtQuantity,
                  (quantity) {
                setState(() {
                  _tshirtQuantity = quantity;
                });
              },
            ),
            SizedBox(height: 16.0),
            _buildItem(
              'Sport Dress',
              'Black',
              'M',
              43,
              _sportDressQuantity,
                  (quantity) {
                setState(() {
                  _sportDressQuantity = quantity;
                });
              },
            ),
            SizedBox(height: 32.0),
            Text(
              'Total amount:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${calculateTotal()}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Congratulations! Your order is placed.')),
                );
              },
              child: Text('CHECK OUT'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String color, String size, int price, int quantity, Function(int) onQuantityChanged) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('assets/t_shirts.png'),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Color: $color',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Size: $size',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '\$${price}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        onQuantityChanged(quantity - 1);
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text('$quantity'),
                    IconButton(
                      onPressed: () {
                        onQuantityChanged(quantity + 1);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int calculateTotal() {
    return _pulloverQuantity * 51 + _tshirtQuantity * 30 + _sportDressQuantity * 43;
  }
}
