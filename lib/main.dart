import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => RouteOne(),
      '/detail': (context) => RouteTwo(image: '', name: '', price: 0),
    }),
  );
}

class PhotoItem {
  final String image;
  final String name;
  final num price;
  final num quantity;

  PhotoItem(this.image, this.name, this.price, this.quantity);
}

class RouteOne extends StatelessWidget {
  //images from https://www.eatthis.com/most-popular-snack-foods-america/

  final List<PhotoItem> _items = [
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/10/kit-kat-bar-wrapped.jpg?quality=82&strip=all",
        "Kit-Kat",
        1.00,
        100),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2020/02/cheez-it-original.jpg?quality=82&strip=all",
        "Cheese-its",
        5.00,
        20),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/11/Small-bag-of-cheetos.jpg?quality=82&strip=all",
        "Cheeto's",
        0.75,
        150),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2015/11/kelloggs-special-k-red-berries.jpg?quality=82&strip=all",
        "Special-K",
        3.00,
        60),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/10/campbells-tomato-soup.jpg?quality=82&strip=all",
        "Tomato Soup",
        0.50,
        200),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/07/nestle-tollhouse-chocolate-chip-cookie-dough.jpg?quality=82&strip=all",
        "Cookie Dough",
        5.00,
        50),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/10/dove-milk-chocolate-bars.jpg?quality=82&strip=all",
        "Dove Chocolate Bars",
        7.00,
        30),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/10/quaker-oats.jpg?quality=82&strip=all",
        "Oatmeal",
        0.75,
        120),
    PhotoItem(
        "https://www.eatthis.com/wp-content/uploads/sites/4/2019/01/tostitos-scoops.jpg?quality=82&strip=all",
        "Tostitos",
        4.00,
        50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Selection ☝️'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          // Item rendering
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteTwo(
                      image: _items[index].image,
                      name: _items[index].name,
                      price: _items[index].price),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;
  final num price;

  RouteTwo(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Details ✌️'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
