import 'package:flutter/material.dart';

void main() => runApp(MedicalApp());

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InviteStaffPage(),
        '/pending': (context) => PendingInvitationsPage(),
        '/approved': (context) => StatusPage(title: 'Approved'),
        '/rejected': (context) => StatusPage(title: 'Rejected'),
      },
    );
  }
}

class InviteStaffPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('invite staff'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('staff Email', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/pending'),
                child: const Text('invite', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingInvitationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending invitations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('invited invitations', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            InvitationCard(
              name: 'Yaseen',
              email: 'parakot@graduate.utm.my',
              onApprove: () => Navigator.pushNamed(context, '/approved'),
              onReject: () => Navigator.pushNamed(context, '/rejected'),
            ),
          ],
        ),
      ),
    );
  }
}

class InvitationCard extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const InvitationCard({
    required this.name,
    required this.email,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(email, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onReject,
                  child: const Text('Reject', style: TextStyle(color: Colors.red)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onApprove,
                  child: const Text('Approve'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusPage extends StatelessWidget {
  final String title;

  const StatusPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (title == 'Rejected') ...[
              const SizedBox(height: 30),
              const Text('Yaseen!', style: TextStyle(fontSize: 22)),
              const Text('try again.', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}