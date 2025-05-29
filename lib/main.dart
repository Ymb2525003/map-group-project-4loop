import 'package:flutter/material.dart';
import 'approval_screen.dart'; // 👈 your screen

void main() {
  runApp(MedicalApp());
}

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // 👈 start from home
      routes: {
        '/': (context) => InviteStaffPage(),
        '/pending': (context) => PendingInvitationsPage(),
        '/approved': (context) => StatusPage(title: 'Approved'),
        '/rejected': (context) => StatusPage(title: 'Rejected'),
        '/approval': (context) => ApprovalScreen(), // ✅ your route added here
      },
    );
  }
}
