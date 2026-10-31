import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> transactions = const [
    {
      'title': '1st Milestone Payment',
      'date': '18th Apr 2026',
      'party': 'Acme Corp.',
      'category': 'E-Commerce Store',
      'amount': '\$1899',
      'isIncome': true,
    },
    {
      'title': '1st Milestone Payment',
      'date': '18th Apr 2026',
      'party': 'Acme Corp.',
      'category': 'E-Commerce Store',
      'amount': '\$1899',
      'isIncome': false,
    },
    {
      'title': '1st Milestone Payment',
      'date': '18th Apr 2026',
      'party': 'Acme Corp.',
      'category': 'E-Commerce Store',
      'amount': '\$1899',
      'isIncome': true,
    },
    {
      'title': '1st Milestone Payment',
      'date': '18th Apr 2026',
      'party': 'Acme Corp.',
      'category': 'E-Commerce Store',
      'amount': '\$1899',
      'isIncome': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(

          child: ColoredBox(
            color: BrandColor.brand1,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // HEADER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: BrandColor.brand1,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Sylvorn Labs',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: BrandColor.brand1,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'INR',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Gray_palette.gray7,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: BrandColor.brand1,
                              size: 26,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // TOTAL BALANCE
                      const Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 13,
                          color: Gray_palette.gray7,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '\$18,099.50',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: BrandColor.brand1,
                          letterSpacing: -0.5,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // ANALYTICS CHART
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Gray_palette.gray1,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Gray_palette.gray3),
                        ),
                        child: const Center(
                          child: Text(
                            'Analytics Chart Placeholder',
                            style: TextStyle(
                              color: Gray_palette.gray6,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // INCOME & EXPENSE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BrandColor.brand6,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_circle_down_outlined, size: 20),
                          label: const Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BrandColor.brand11,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_circle_up_outlined, size: 20),
                          label: const Text(
                            'Expense',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // RECENT TRANSACTIONS
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28), // Visible rounded top corners
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Recent Transactions',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: BrandColor.brand1,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: BrandColor.brand1,
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        // SCROLLABLE TRANSACTIONS LIST
                        Expanded(
                          child: ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            padding: const EdgeInsets.only(bottom: 20),
                            itemCount: transactions.length,
                            separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final tx = transactions[index];
                              final bool isIncome = tx['isIncome'];

                              return Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Gray_palette.gray1,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: isIncome
                                            ? BrandColor.brand6
                                            : BrandColor.brand11,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        isIncome
                                            ? Icons.arrow_downward
                                            : Icons.arrow_upward,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tx['title'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: BrandColor.brand1,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            '${tx['date']} • ${tx['party']}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Gray_palette.gray7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          tx['amount'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: isIncome
                                                ? BrandColor.brand7
                                                : BrandColor.brand11,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          tx['category'],
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Gray_palette.gray7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BOTTOM NAVIGATION BAR
                CustomBottomNavBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}