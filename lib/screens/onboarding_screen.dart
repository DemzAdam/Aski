import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/asky_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0; // 0: language, 1: role, 2: category (provider only)
  String? _selectedLanguage;
  String? _selectedRole;
  final Set<String> _selectedCategories = {};

  final languages = [
    {'code': 'fr', 'label': 'Français', 'sub': 'French', 'flag': '🇫🇷', 'primary': true},
    {'code': 'ha', 'label': 'Hausa', 'sub': 'Hausa', 'flag': '🇳🇬'},
    {'code': 'ar', 'label': 'العربية', 'sub': 'Arabic', 'flag': '🇸🇦'},
    {'code': 'en', 'label': 'English', 'sub': 'English', 'flag': '🇬🇧'},
    {'code': 'sw', 'label': 'Kiswahili', 'sub': 'Swahili', 'flag': '🇰🇪'},
    {'code': 'dje', 'label': 'Zarma', 'sub': 'Zarma', 'flag': '🇳🇪'},
    {'code': 'am', 'label': 'አማርኛ', 'sub': 'Amharic', 'flag': '🇪🇹'},
    {'code': 'yo', 'label': 'Yorùbá', 'sub': 'Yoruba', 'flag': '🇳🇬'},
    {'code': 'ig', 'label': 'Igbo', 'sub': 'Igbo', 'flag': '🇳🇬'},
  ];

  final categories = [
    {'id': 'hair', 'label': 'Hair & Barber', 'icon': Icons.content_cut},
    {'id': 'makeup', 'label': 'Makeup', 'icon': Icons.brush},
    {'id': 'esthetics', 'label': 'Esthetics', 'icon': Icons.auto_awesome},
    {'id': 'nails', 'label': 'Nails', 'icon': Icons.spa},
    {'id': 'massage', 'label': 'Massage', 'icon': Icons.water_drop_outlined},
    {'id': 'other', 'label': 'Other', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AskyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProgressBar(),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _step == 0 ? _buildLanguageStep() : _step == 1 ? _buildRoleStep() : _buildCategoryStep(),
              ),
            ),
            _buildContinueButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: List.generate(4, (i) => Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.only(right: i < 3 ? 8 : 0),
            decoration: BoxDecoration(
              color: i <= _step ? AskyColors.accent : AskyColors.subtle,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildLanguageStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose your language', style: AskyTheme.displayStyle.copyWith(fontSize: 28)),
          const SizedBox(height: 8),
          Text('Sélectionnez votre langue / اختر لغتك / Zaɓi Harshenka', style: AskyTheme.mutedStyle),
          const SizedBox(height: 28),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.0,
            children: languages.map((lang) {
              final isSelected = _selectedLanguage == lang['code'];
              final isPrimary = lang['primary'] == true;
              return GestureDetector(
                onTap: () => setState(() => _selectedLanguage = lang['code'] as String),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AskyColors.dark : AskyColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: isSelected ? AskyColors.accent : AskyColors.subtle, width: isSelected ? 2 : 1),
                    boxShadow: isSelected ? [BoxShadow(color: AskyColors.dark.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 4))] : [],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 38, height: 38,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white.withOpacity(0.1) : AskyColors.bg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text(lang['flag'] as String, style: const TextStyle(fontSize: 20))),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(lang['label'] as String, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: isSelected ? Colors.white : AskyColors.dark)),
                            Text(lang['sub'] as String, style: TextStyle(fontSize: 10, color: isSelected ? Colors.white60 : AskyColors.muted)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Qui êtes-vous?', style: AskyTheme.displayStyle.copyWith(fontSize: 28)),
          const SizedBox(height: 8),
          Text('Choisissez comment vous voulez utiliser Asky.', style: AskyTheme.mutedStyle),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(child: _RoleCard(
                icon: Icons.search_rounded,
                title: 'Client',
                subtitle: 'I want to book services',
                isSelected: _selectedRole == 'client',
                isDark: false,
                onTap: () => setState(() => _selectedRole = 'client'),
              )),
              const SizedBox(width: 16),
              Expanded(child: _RoleCard(
                icon: Icons.storefront_rounded,
                title: 'Provider',
                subtitle: 'I want to offer services',
                isSelected: _selectedRole == 'provider',
                isDark: true,
                onTap: () => setState(() => _selectedRole = 'provider'),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select your\nexpertise', style: AskyTheme.displayStyle.copyWith(fontSize: 28)),
              Text('Choose up to 3', style: AskyTheme.mutedStyle.copyWith(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 28),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.0,
            children: categories.map((cat) {
              final isSelected = _selectedCategories.contains(cat['id']);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedCategories.remove(cat['id']);
                    } else if (_selectedCategories.length < 3) {
                      _selectedCategories.add(cat['id'] as String);
                    }
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AskyColors.bg : AskyColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: isSelected ? AskyColors.accent : AskyColors.subtle, width: isSelected ? 2 : 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 38, height: 38,
                        decoration: BoxDecoration(
                          color: isSelected ? AskyColors.accent : AskyColors.bg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(cat['icon'] as IconData, color: isSelected ? Colors.white : AskyColors.muted, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(cat['label'] as String, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isSelected ? AskyColors.dark : AskyColors.muted)),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    final canContinue = (_step == 0 && _selectedLanguage != null) ||
        (_step == 1 && _selectedRole != null) ||
        (_step == 2 && _selectedCategories.isNotEmpty);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: canContinue ? () {
          if (_step == 0) setState(() => _step = 1);
          else if (_step == 1) {
            if (_selectedRole == 'provider') setState(() => _step = 2);
            else context.go('/');
          } else {
            context.go('/');
          }
        } : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: canContinue ? AskyColors.dark : AskyColors.subtle,
            borderRadius: BorderRadius.circular(30),
            boxShadow: canContinue ? [BoxShadow(color: AskyColors.dark.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 4))] : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue', style: TextStyle(color: canContinue ? Colors.white : AskyColors.muted, fontSize: 15, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: canContinue ? Colors.white : AskyColors.muted, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final bool isSelected, isDark;
  final VoidCallback onTap;

  const _RoleCard({required this.icon, required this.title, required this.subtitle, required this.isSelected, required this.isDark, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AskyColors.dark : AskyColors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: isSelected ? AskyColors.accent : AskyColors.subtle, width: isSelected ? 2 : 1),
          boxShadow: isSelected ? [BoxShadow(color: AskyColors.accent.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 4))] : [],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white.withOpacity(0.1) : AskyColors.bg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, color: isDark ? Colors.white : AskyColors.dark, size: 24),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: isDark ? Colors.white : AskyColors.dark)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: TextStyle(fontSize: 11, color: isDark ? Colors.white60 : AskyColors.muted)),
                  ],
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0, right: 0,
                child: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AskyColors.accent, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
