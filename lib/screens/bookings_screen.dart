import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/asky_theme.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedTab = 0;
  final tabs = ['Upcoming', 'Past', 'Canceled'];

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
              _buildTabs(),
              const SizedBox(height: 28),
              _buildNextAppointment(),
              const SizedBox(height: 28),
              _buildUpcomingList(),
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
              Text('My Bookings', style: AskyTheme.headingStyle),
              const SizedBox(height: 2),
              Text('Manage your appointments', style: AskyTheme.mutedStyle),
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
            child: const Icon(Icons.history_rounded, color: AskyColors.dark),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AskyColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AskyColors.subtle),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        ),
        child: Row(
          children: List.generate(tabs.length, (i) {
            final isActive = i == _selectedTab;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isActive ? AskyColors.dark : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: isActive ? [BoxShadow(color: AskyColors.dark.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))] : [],
                  ),
                  child: Text(
                    tabs[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : AskyColors.muted,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNextAppointment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NEXT APPOINTMENT', style: AskyTheme.mutedStyle.copyWith(fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AskyColors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AskyColors.subtle),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 16, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                Container(
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AskyColors.accent,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('14', style: AskyTheme.displayStyle.copyWith(fontSize: 40)),
                              Text('OCT, SAT', style: AskyTheme.mutedStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AskyColors.bg,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AskyColors.subtle),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.access_time, color: AskyColors.accent, size: 14),
                                    SizedBox(width: 4),
                                    Text('10:00 AM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AskyColors.dark)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(
                                    width: 6, height: 6,
                                    decoration: const BoxDecoration(color: AskyColors.green, shape: BoxShape.circle),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text('Confirmed', style: TextStyle(fontSize: 12, color: AskyColors.green, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: 'https://images.unsplash.com/photo-1585747860715-2ba37e788b70?w=300&q=80',
                              width: 56, height: 56,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gentleman's Quarter", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AskyColors.dark)),
                              SizedBox(height: 2),
                              Text('Premium Beard Trim & Hot Towel', style: TextStyle(fontSize: 13, color: AskyColors.muted)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: AskyColors.dark,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(color: AskyColors.dark.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
                              ),
                              child: const Text('Message', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            decoration: BoxDecoration(
                              color: AskyColors.bg,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AskyColors.subtle),
                            ),
                            child: const Text('Reschedule', style: TextStyle(color: AskyColors.dark, fontWeight: FontWeight.w600, fontSize: 13)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LATER THIS MONTH', style: AskyTheme.mutedStyle.copyWith(fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          _BookingListItem(month: 'OCT', day: '28', name: 'The Gallery Salon', service: 'Full Hair Coloring', time: '2:30 PM', price: '60,000 CFA', status: 'Pending', statusColor: AskyColors.orange),
          const SizedBox(height: 12),
          _BookingListItem(month: 'NOV', day: '02', name: 'Nails by Sarah', service: 'Gel Manicure + Art', time: '11:15 AM', price: '22,500 CFA', status: 'Unpaid', statusColor: AskyColors.muted),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1C1A17), Color(0xFF2D2A26)]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Need a trim?', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                    SizedBox(height: 4),
                    Text("Book again with Mike for 10% off", style: TextStyle(color: Colors.white60, fontSize: 12)),
                  ],
                ),
                Container(
                  width: 40, height: 40,
                  decoration: const BoxDecoration(color: AskyColors.accent, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingListItem extends StatelessWidget {
  final String month, day, name, service, time, price, status;
  final Color statusColor;

  const _BookingListItem({
    required this.month, required this.day, required this.name,
    required this.service, required this.time, required this.price,
    required this.status, required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AskyTheme.cardDecoration,
      child: Row(
        children: [
          Container(
            width: 56, height: 72,
            decoration: BoxDecoration(
              color: AskyColors.bg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AskyColors.subtle),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(month, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AskyColors.muted, letterSpacing: 0.5)),
                Text(day, style: AskyTheme.displayStyle.copyWith(fontSize: 22)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: AskyTheme.labelStyle.copyWith(fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: statusColor.withOpacity(0.3)),
                      ),
                      child: Text(status, style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(service, style: AskyTheme.mutedStyle.copyWith(fontSize: 12)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 12, color: AskyColors.accent),
                    const SizedBox(width: 4),
                    Text('$time  •  $price', style: AskyTheme.labelStyle.copyWith(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
