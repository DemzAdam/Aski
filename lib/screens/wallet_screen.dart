import 'package:flutter/material.dart';
import '../theme/asky_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AskyColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildBalanceCard(),
              const SizedBox(height: 28),
              _buildQuickActions(context),
              const SizedBox(height: 28),
              _buildPaymentMethods(context),
              const SizedBox(height: 28),
              _buildTransactionHistory(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Wallet', style: AskyTheme.headingStyle),
              const SizedBox(height: 2),
              Text('Balance & History', style: AskyTheme.mutedStyle),
            ],
          ),
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: AskyColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AskyColors.subtle),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
            ),
            child: const Icon(Icons.credit_card_rounded, color: AskyColors.dark),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AskyColors.dark,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [BoxShadow(color: AskyColors.dark.withOpacity(0.3), blurRadius: 24, offset: const Offset(0, 8))],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40, right: -40,
              child: Container(
                width: 160, height: 160,
                decoration: BoxDecoration(
                  color: AskyColors.accent.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total Balance', style: TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text('652,400 CFA', style: AskyTheme.displayStyle.copyWith(color: Colors.white, fontSize: 32)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.15)),
                      ),
                      child: const Text('ACTIVE', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ACCOUNT HOLDER', style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('Moussa Ibrahim', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.contactless, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.add, 'label': 'Top Up'},
      {'icon': Icons.arrow_upward, 'label': 'Withdraw'},
      {'icon': Icons.receipt_long_outlined, 'label': 'Statement'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions.map((a) => Column(
          children: [
            Container(
              width: 64, height: 64,
              decoration: BoxDecoration(
                color: AskyColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AskyColors.subtle),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
              ),
              child: Icon(a['icon'] as IconData, color: AskyColors.dark, size: 24),
            ),
            const SizedBox(height: 8),
            Text(a['label'] as String, style: AskyTheme.labelStyle.copyWith(fontSize: 12)),
          ],
        )).toList(),
      ),
    );
  }

  Widget _buildPaymentMethods(BuildContext context) {
    final methods = [
      {'label': 'Mobile Money', 'sub': 'Airtel, Moov, Orange', 'icon': Icons.phone_android, 'color1': const Color(0xFFF97316), 'color2': const Color(0xFFEA580C)},
      {'label': 'Cash', 'sub': 'Pay in person', 'icon': Icons.payments, 'color1': const Color(0xFF22C55E), 'color2': const Color(0xFF16A34A)},
      {'label': 'Debit/Credit', 'sub': 'Bank card', 'icon': Icons.credit_card, 'color1': const Color(0xFF3B82F6), 'color2': const Color(0xFF2563EB)},
      {'label': 'Bank Transfer', 'sub': 'Direct bancaire', 'icon': Icons.account_balance, 'color1': const Color(0xFFA855F7), 'color2': const Color(0xFF9333EA)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PAYMENT METHODS', style: AskyTheme.mutedStyle.copyWith(fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: methods.map((m) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [m['color1'] as Color, m['color2'] as Color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: (m['color1'] as Color).withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(m['icon'] as IconData, color: Colors.white, size: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m['label'] as String, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
                        Text(m['sub'] as String, style: const TextStyle(color: Colors.white70, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    final transactions = [
      {'icon': Icons.content_cut, 'name': "Gentleman's Quarter", 'sub': 'Haircut & Beard Trim', 'amount': '-32,500 CFA', 'date': 'Today, 10:00 AM', 'positive': false},
      {'icon': Icons.arrow_downward, 'name': 'Wallet Top Up', 'sub': 'Moov Money', 'amount': '+100,000 CFA', 'date': 'Oct 12, 4:30 PM', 'positive': true},
      {'icon': Icons.auto_awesome, 'name': 'Nails by Sarah', 'sub': 'Gel Manicure', 'amount': '-22,500 CFA', 'date': 'Oct 10, 2:15 PM', 'positive': false},
      {'icon': Icons.undo, 'name': 'Cancellation Refund', 'sub': 'Booking #29381', 'amount': '+15,000 CFA', 'date': 'Oct 05, 9:00 AM', 'positive': true},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Activity', style: AskyTheme.subheadingStyle),
              Text('View All', style: TextStyle(fontSize: 13, color: AskyColors.accent, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          ...transactions.map((t) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: t['positive'] as bool ? AskyColors.green.withOpacity(0.1) : AskyColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: t['positive'] as bool ? AskyColors.green.withOpacity(0.2) : AskyColors.subtle),
                  ),
                  child: Icon(t['icon'] as IconData, color: t['positive'] as bool ? AskyColors.green : AskyColors.dark, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t['name'] as String, style: AskyTheme.labelStyle.copyWith(fontSize: 13)),
                      Text(t['sub'] as String, style: AskyTheme.mutedStyle.copyWith(fontSize: 11)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(t['amount'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: t['positive'] as bool ? AskyColors.green : AskyColors.dark)),
                    Text(t['date'] as String, style: AskyTheme.mutedStyle.copyWith(fontSize: 11)),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
