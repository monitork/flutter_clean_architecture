import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/auth_service.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = inject<AuthService>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _oneRow("Username:", authState.currentUser?.name),
            _oneRow("Email:", authState.currentUser?.email),
            _oneRow("Phone:", authState.currentUser?.phone),
          ],
        ),
      ),
    );
  }

  Widget _oneRow(String label, String? text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(text: label),
        ),
        TextWidget(text: text??''),
      ],
    );
  }
}
