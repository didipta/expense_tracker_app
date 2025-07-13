import 'package:flutter/material.dart';
import 'profile_text_field.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileTextField(label: "Name", initialValue: "Enjelin Morgeana"),
        const ProfileTextField(label: "Email", initialValue: "enjelinmorgeana@gmail.com"),
        const ProfileTextField(label: "Password", isPassword: true, initialValue: "********"),
        const ProfileTextField(label: "Number of cards", initialValue: "1"),
        const ProfileTextField(label: "Number of Bank Accounts", initialValue: "2"),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          onPressed: () {},
          child: const Text("Update profile"),
        )
      ],
    );
  }
}
