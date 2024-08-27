import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notification'),
        backgroundColor: Color(0xFFE48F45),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].subtitle),
              onTap: () {
                _showNotificationDialog(context, notifications[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showNotificationDialog(
      BuildContext context, NotificationItem notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification.title),
          content: Text(notification.message),
          actions: <Widget>[
            TextButton(
              child: Text('Proceed'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnotherPage()),
                );
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String message;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.message,
  });
}

List<NotificationItem> notifications = [
  NotificationItem(
    title: 'New Job Available',
    subtitle: 'Check out the new job opportunity',
    message:
        'A new job in your preferred category has been posted. Check it out now!',
  ),
  NotificationItem(
    title: 'Payment Received',
    subtitle: 'You have received a new payment',
    message: 'You have received a payment of ₱500.00. Check your balance now!',
  ),
  // Add more notifications here...
];

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}
