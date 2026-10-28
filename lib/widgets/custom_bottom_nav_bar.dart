import 'package:flutter/material.dart';
import '../constants/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Gray_palette.gray3, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.folder_outlined, 1),
          _buildNavItem(Icons.account_balance_wallet_outlined, 2),
          _buildNavItem(Icons.group_outlined, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? BrandColor.brand1 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Gray_palette.gray7,
          size: 24,
        ),
      ),
    );
  }
}