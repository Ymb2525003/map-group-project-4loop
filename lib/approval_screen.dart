import 'package:flutter/material.dart';

class ApprovalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awaiting Approval')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         // Icon(Icons.hourglass_empty, size: 80, color: Colors.blue),
Text('⏳', style: TextStyle(fontSize: 60)), // emoji fallback

            SizedBox(height: 20),
            Text(
              'Waiting for pharmacist approval...',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
