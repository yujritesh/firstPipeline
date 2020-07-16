import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildItem(context,
                  'https://volument.com/blog/img/hn-dirt-big.png', '/news'),
              buildItem(
                  context, 'https://i.imgur.com/QwhZRyL.png', '/animation'),
              Expanded(
                child: buildItem(
                    context,
                    'https://cdn.shopify.com/s/files/1/1828/7479/articles/List_of_novel_foods_in_EU.jpg?v=1521017507',
                    '/pics'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildItem(
    BuildContext context,
    String imageUrl,
    String destination,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, destination);
      },
      child: Container(
        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.only(bottom: 16.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
