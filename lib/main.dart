import 'package:flutter/material.dart';
import 'approval_screen.dart'; // make sure this file exists

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ApprovalScreen(), // ✅ Test only your screen
  ));
}