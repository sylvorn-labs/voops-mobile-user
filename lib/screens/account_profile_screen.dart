
import 'package:flutter/material.dart';
import '../constants/color.dart';

class AccountProfileScreen extends StatelessWidget {
  const AccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Account / Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: BrandColor.brand1,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: BrandColor.brand1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 45,
              backgroundColor: BrandColor.brand1.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person_outline,
                size: 50,
                color: BrandColor.brand1,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: BrandColor.brand1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage your personal account details.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),

            _profileOption(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {},
            ),
            _profileOption(
              icon: Icons.email_outlined,
              title: 'Email Address',
              onTap: () {},
            ),
            _profileOption(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {},
            ),
            _profileOption(
              icon: Icons.settings_outlined,
              title: 'Account Settings',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(
        icon,
        color: BrandColor.brand1,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
