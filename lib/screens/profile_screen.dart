import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/asky_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AskyColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildHeader(context),
              const SizedBox(height: 8),
              _buildProfileHero(context),
              const SizedBox(height: 24),
              _buildStats(),
              const SizedBox(height: 24),
              _buildMenuItems(context),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('My Profile', style: AskyTheme.headingStyle),
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: AskyColors.white, shape: BoxShape.circle,
              border: Border.all(color: AskyColors.subtle),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
            ),
            child: const Icon(Icons.settings_outlined, color: AskyColors.dark),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHero(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 112, height: 112,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AskyColors.accent, width: 2),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 4, right: 4,
              child: Container(
                width: 32, height: 32,
                decoration: const BoxDecoration(color: AskyColors.dark, shape: BoxShape.circle),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 15),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Moussa Ibrahim', style: AskyTheme.displayStyle.copyWith(fontSize: 24)),
        const SizedBox(height: 4),
        const Text('Niamey, Niger 🇳🇪', style: TextStyle(color: AskyColors.muted, fontSize: 13)),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AskyColors.dark,
            side: const BorderSide(color: AskyColors.subtle),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('Edit Profile', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: AskyTheme.cardDecoration,
        child: Row(
          children: [
            _StatItem(value: '12', label: 'Bookings'),
            Container(width: 1, height: 40, color: AskyColors.subtle),
            _StatItem(value: '4', label: 'Reviews'),
            Container(width: 1, height: 40, color: AskyColors.subtle),
            _StatItem(value: '8', label: 'Favorites'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Group 1
          Container(
            decoration: AskyTheme.cardDecoration,
            child: Column(
              children: [
                _MenuItem(icon: Icons.person_outline, label: 'Personal Information', onTap: () {}),
                Divider(height: 1, color: AskyColors.subtle.withOpacity(0.5)),
                _MenuItem(icon: Icons.credit_card_outlined, label: 'Payment Methods', onTap: () {}),
                Divider(height: 1, color: AskyColors.subtle.withOpacity(0.5)),
                _MenuItem(icon: Icons.notifications_outlined, label: 'Notifications', onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Provider Switch
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AskyColors.dark,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: AskyColors.dark.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.work_outline_rounded, color: AskyColors.accent),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Switch to Provider', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                        Text('Manage your services & schedule', style: TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Group 2
          Container(
            decoration: AskyTheme.cardDecoration,
            child: Column(
              children: [
                _MenuItem(icon: Icons.help_outline_rounded, label: 'Help Center', onTap: () {}),
                Divider(height: 1, color: AskyColors.subtle.withOpacity(0.5)),
                _MenuItem(icon: Icons.logout_rounded, label: 'Log Out', onTap: () {}, isDestructive: true),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Version 2.4.0 (Build 182)', style: AskyTheme.mutedStyle.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      children: [
        Text(value, style: AskyTheme.displayStyle.copyWith(fontSize: 22)),
        const SizedBox(height: 2),
        Text(label, style: AskyTheme.mutedStyle.copyWith(fontSize: 11)),
      ],
    ),
  );
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _MenuItem({required this.icon, required this.label, required this.onTap, this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AskyColors.danger : AskyColors.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: isDestructive ? AskyColors.danger.withOpacity(0.08) : AskyColors.bg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color))),
            const Icon(Icons.chevron_right, color: AskyColors.muted, size: 20),
          ],
        ),
      ),
    );
  }
}
