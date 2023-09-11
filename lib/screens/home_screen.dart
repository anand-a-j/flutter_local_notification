import 'package:flutter/material.dart';
import 'package:flutter_local_notification/services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationService().showNotification(
                  title: "Sample Notification Text",
                  body: "Hello World!!!",
                );
              },
              child: const Text("Push Notification"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                NotificationService().showSchduledNotification(
                  title: "Schduled notification",
                  body: "Hello world",
                  payload: "Seconds 5",
                  scheduledDate: DateTime.now().add(
                    const Duration(seconds: 5),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Notification show in 5 seconds"),
                  ),
                );
              },
              child: const Text("Scheduled Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
