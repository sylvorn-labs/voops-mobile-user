
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'business_settings_screen.dart';
import 'categories_screen.dart';
import 'members_screen.dart';
import 'account_profile_screen.dart';

import '../constants/color.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custome_graph.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  String selectedBusiness = 'Sylvorn Labs';

  final List<String> businesses = [
    'Sylvorn Labs',
    'Sylvorn Tech',
    'Sylvorn Global',
  ];

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

  final List chartData = const [
    {'month': 'Jan', 'income': 0.6, 'expense': 0.4},
    {'month': 'Feb', 'income': 0.8, 'expense': 0.5},
    {'month': 'Mar', 'income': 0.4, 'expense': 0.7},
    {'month': 'Apr', 'income': 0.9, 'expense': 0.3},
    {'month': 'May', 'income': 0.7, 'expense': 0.6},
    {'month': 'Jun', 'income': 0.85, 'expense': 0.4},
  ];

  // NAVIGATE TO DRAWER SCREENS
  void openPage(Widget page) {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  // RIGHT SIDE DRAWER
  Widget buildEndDrawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.78,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DRAWER HEADER
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: BrandColor.brand1,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedBusiness,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: BrandColor.brand1,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(),

            // MANAGEMENT SECTION
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 18, 20, 10),
              child: Text(
                'MANAGEMENT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),

            // CATEGORIES
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                color: BrandColor.brand1,
              ),
              title: const Text('Categories'),
              trailing: const Icon(Icons.chevron_right, size: 20),
              onTap: () {
                openPage(const CategoriesScreen());
              },
            ),

            // MEMBERS
            ListTile(
              leading: const Icon(
                Icons.people_outline,
                color: BrandColor.brand1,
              ),
              title: const Text('Members'),
              trailing: const Icon(Icons.chevron_right, size: 20),
              onTap: () {
                openPage(const MembersScreen());
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),

            // PERSONAL SECTION
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 10),
              child: Text(
                'PERSONAL',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),

            // ACCOUNT / PROFILE
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: BrandColor.brand1,
              ),
              title: const Text('Account / Profile'),
              trailing: const Icon(Icons.chevron_right, size: 20),
              onTap: () {
                openPage(const AccountProfileScreen());
              },
            ),

            const Spacer(),

            const Divider(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '$selectedBusiness • Expense Tracker',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

        // RIGHT SIDE DRAWER
        endDrawer: buildEndDrawer(),

        body: SafeArea(
          child: ColoredBox(
            color: BrandColor.brand1,
            child: Column(
              children: [
                // HEADER AND TOTAL BALANCE
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // BUSINESS ICON AND DETAILS
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: BrandColor.brand1,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BusinessSettingsScreen(),
                                      ),
                                    );
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        selectedBusiness,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: BrandColor.brand1,
                                        ),
                                      ),

                                      const SizedBox(width: 4),

                                      PopupMenuButton<String>(
                                        padding: EdgeInsets.zero,
                                        tooltip: 'Switch Business',
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: BrandColor.brand1,
                                        ),
                                        onSelected: (String newValue) {
                                          setState(() {
                                            selectedBusiness = newValue;
                                          });
                                        },
                                        itemBuilder:
                                            (BuildContext context) {
                                          return businesses.map(
                                                (String business) {
                                              return PopupMenuItem<String>(
                                                value: business,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.business,
                                                      size: 18,
                                                      color: business ==
                                                          selectedBusiness
                                                          ? BrandColor.brand1
                                                          : Colors.grey,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      business,
                                                      style: TextStyle(
                                                        fontWeight:
                                                        business ==
                                                            selectedBusiness
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ).toList();
                                        },
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 2),

                                  const Text(
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

                          // HAMBURGER MENU - TOP RIGHT
                          Builder(
                            builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  size: 25,
                                  color: BrandColor.brand1,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              );
                            },
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

                      // GRAPH
                      CustomeGraph(chartData: chartData),
                    ],
                  ),
                ),

                // INCOME AND EXPENSE BUTTONS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
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
                          icon: const Icon(
                            Icons.arrow_circle_down_outlined,
                            size: 20,
                          ),
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
                          icon: const Icon(
                            Icons.arrow_circle_up_outlined,
                            size: 20,
                          ),
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
                        top: Radius.circular(28),
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

                        // TRANSACTION LIST
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
                              final bool isIncome =
                              tx['isIncome'] as bool;

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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
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
