import 'package:flutter/material.dart';
import '../constants/color.dart';

class CustomeGraph extends StatelessWidget {
  final List chartData;

  const CustomeGraph({
    super.key,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Gray_palette.gray1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Gray_palette.gray3),
      ),
      child: Column(
        children: [
          // CHART LEGEND
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: BrandColor.brand1,
                ),
              ),
              Row(
                children: [
                  _buildLegendItem('Income', BrandColor.brand6),
                  const SizedBox(width: 12),
                  _buildLegendItem('Expense', BrandColor.brand11),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // DUAL BAR CHART IMPLEMENTATION
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: chartData.map((data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // INCOME BAR
                          FractionallySizedBox(
                            heightFactor: data['income'],
                            child: Container(
                              width: 8,
                              decoration: BoxDecoration(
                                color: BrandColor.brand6,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          // EXPENSE BAR
                          FractionallySizedBox(
                            heightFactor: data['expense'],
                            child: Container(
                              width: 8,
                              decoration: BoxDecoration(
                                color: BrandColor.brand11,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data['month'],
                      style: const TextStyle(
                        fontSize: 11,
                        color: Gray_palette.gray7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Gray_palette.gray7,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}