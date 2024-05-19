import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscription Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header Section
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Mark!',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, size: 28, color: Colors.purple),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  'Today is a good day to check all your subscriptions',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  'Recent subscriptions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubscriptionIcon(icon: Icons.subscriptions),
                    SubscriptionIcon(icon: Icons.play_circle_fill),
                    SubscriptionIcon(icon: Icons.video_library),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Offers of the week',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                OfferTile(
                  icon: Icons.music_note,
                  title: 'Music.Youtube',
                  price: '\$4/mo',
                  isActive: false,
                ),
                OfferTile(
                  icon: Icons.movie,
                  title: 'Netflix',
                  price: '\$5/mo',
                  isActive: true,
                ),
                OfferTile(
                  icon: Icons.tv,
                  title: 'HBO',
                  price: '\$6/mo',
                  isActive: false,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'More offers',
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ),
              ],
            ),
          ),
          // History of transactions Section
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'History of transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your remaining limit this month is',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            '\$15',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Payment details'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransactionSummary(daysRemaining: 10, icon: Icons.subscriptions),
                    TransactionSummary(daysRemaining: 9, icon: Icons.account_balance_wallet),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'The last six months',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Replace with your chart widget
                      Placeholder(
                        fallbackHeight: 200,
                        color: Colors.purple.shade200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Jun - Nov 2021',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Today',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.gamepad, size: 40, color: Colors.purple),
                  title: Text('Twitch'),
                  subtitle: Text('Next: 30 December'),
                  trailing: Text('-\$8'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, size: 40, color: Colors.purple),
                  title: Text('Amazon'),
                  subtitle: Text('Next: 30 December'),
                  trailing: Text('-\$8'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
    );
  }
}

class SubscriptionIcon extends StatelessWidget {
  final IconData icon;

  SubscriptionIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 50,
        color: Colors.purple,
      ),
    );
  }
}

class OfferTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String price;
  final bool isActive;

  OfferTile({required this.icon, required this.title, required this.price, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.purple,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(width: 10),
          isActive
              ? Icon(Icons.check_circle, color: Colors.green)
              : Icon(Icons.add_circle, color: Colors.purple),
        ],
      ),
    );
  }
}

class TransactionSummary extends StatelessWidget {
  final int daysRemaining;
  final IconData icon;

  TransactionSummary({required this.daysRemaining, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.purple,
          ),
          SizedBox(height: 10),
          Text(
            '$daysRemaining days remain',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
