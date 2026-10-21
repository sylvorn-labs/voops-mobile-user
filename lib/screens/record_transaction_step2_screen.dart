import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/field_label.dart';

class RecordTransactionStep2Screen extends StatefulWidget {
  const RecordTransactionStep2Screen({super.key});

  @override
  State<RecordTransactionStep2Screen> createState() =>
      _RecordTransactionStep2ScreenState();
}

class _RecordTransactionStep2ScreenState
    extends State<RecordTransactionStep2Screen> {
  final _formKey = GlobalKey<FormState>();

  // Selected values
  String selectedAccount = 'HDFC Bank';
  String selectedParty = 'Shree Laxman';
  String selectedProject = 'Voops';
  String selectedCategory = 'Marketing';

  // Account List
  final List<Map<String, dynamic>> accountList = const [
    {'code': 'HDFC Bank', 'label': 'HDFC Bank', 'icon': Icons.account_balance_wallet_outlined},
    {'code': 'SBI Bank', 'label': 'SBI Bank', 'icon': Icons.account_balance_outlined},
    {'code': 'Cash', 'label': 'Cash', 'icon': Icons.payments_outlined},
  ];

  // Party List
  final List<Map<String, dynamic>> partyList = const [
    {'code': 'Shree Laxman', 'label': 'Shree Laxman', 'icon': Icons.domain_outlined},
    {'code': 'Acme Corp', 'label': 'Acme Corp', 'icon': Icons.business_outlined},
    {'code': 'John Doe', 'label': 'John Doe', 'icon': Icons.person_outline},
  ];

  // Project List
  final List<Map<String, dynamic>> projectList = const [
    {'code': 'Voops', 'label': 'Voops', 'icon': Icons.folder_open_outlined},
    {'code': 'Website Redesign', 'label': 'Website Redesign', 'icon': Icons.folder_open_outlined},
    {'code': 'Mobile App', 'label': 'Mobile App', 'icon': Icons.folder_open_outlined},
  ];

  // Category List
  final List<Map<String, dynamic>> categoryList = const [
    {'code': 'Marketing', 'label': 'Marketing', 'icon': Icons.category_outlined},
    {'code': 'Development', 'label': 'Development', 'icon': Icons.category_outlined},
    {'code': 'Design', 'label': 'Design', 'icon': Icons.category_outlined},
  ];

  void submitTransaction() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Transaction saved successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  icon
    IconData getPrefixIcon(List<Map<String, dynamic>> list, String selectedCode) {
      return list.firstWhere(
            (item) => item['code'] == selectedCode,
        orElse: () => list.first,
      )['icon'] as IconData;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //  SPACE
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // BACK
                      GestureDetector(
                        onTap: () => Navigator.maybePop(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.chevron_left,
                              color: BrandColor.brand1,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: BrandColor.brand1,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(flex: 2),

                      // TITLE
                      const Text(
                        'Record Transaction',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: BrandColor.brand1,
                          letterSpacing: -0.5,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // SUBTITLE
                      const Text(
                        'Add a new transaction to your records.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Gray_palette.gray7,
                        ),
                      ),

                      const Spacer(flex: 3),

                      // ACCOUNT DROPDOWN
                      const FieldLabel(text: 'Account', isRequired: true),
                      const SizedBox(height: 6),
                      CustomDropdownField<String>(
                        value: selectedAccount,
                        prefixWidget: Icon(
                          getPrefixIcon(accountList, selectedAccount),
                          color: BrandColor.brand1,
                          size: 18,
                        ),
                        items: accountList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['code'],
                            child: Text(
                              item['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: BrandColor.brand1,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedAccount = value;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 16),

                      // PARTY DROPDOWN
                      const FieldLabel(text: 'Party', isRequired: true),
                      const SizedBox(height: 6),
                      CustomDropdownField<String>(
                        value: selectedParty,
                        prefixWidget: Icon(
                          getPrefixIcon(partyList, selectedParty),
                          color: BrandColor.brand1,
                          size: 18,
                        ),
                        items: partyList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['code'],
                            child: Text(
                              item['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: BrandColor.brand1,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedParty = value;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 16),

                      // PROJECT DROPDOWN
                      const FieldLabel(text: 'Project', isRequired: false),
                      const SizedBox(height: 6),
                      CustomDropdownField<String>(
                        value: selectedProject,
                        prefixWidget: Icon(
                          getPrefixIcon(projectList, selectedProject),
                          color: BrandColor.brand1,
                          size: 18,
                        ),
                        items: projectList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['code'],
                            child: Text(
                              item['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: BrandColor.brand1,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedProject = value;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 16),

                      // CATEGORY DROPDOWN
                      const FieldLabel(text: 'Category', isRequired: false),
                      const SizedBox(height: 6),
                      CustomDropdownField<String>(
                        value: selectedCategory,
                        prefixWidget: Icon(
                          getPrefixIcon(categoryList, selectedCategory),
                          color: BrandColor.brand1,
                          size: 18,
                        ),
                        items: categoryList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['code'],
                            child: Text(
                              item['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: BrandColor.brand1,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCategory = value;
                            });
                          }
                        },
                      ),

                      const Spacer(flex: 4),

                      // BACK & NEXT
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Gray_palette.gray2,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: BrandColor.brand1, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            // Back
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.maybePop(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: BrandColor.brand1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            // Next
                            Expanded(
                              child: GestureDetector(
                                onTap: submitTransaction,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BrandColor.brand1,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ),
            ),

            // MOUNTAIN BANNER
            Image.asset(
              'assets/images/mountain_banner.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}