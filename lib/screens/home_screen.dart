import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../theme/asky_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 28),
              _buildCategories(),
              const SizedBox(height: 28),
              _buildFeaturedSection(context),
              const SizedBox(height: 28),
              _buildTopRated(context),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: AskyColors.accent, size: 16),
                  const SizedBox(width: 4),
                  Text('Niamey, Niger', style: AskyTheme.mutedStyle.copyWith(fontWeight: FontWeight.w600)),
                  const Icon(Icons.keyboard_arrow_down, size: 16, color: AskyColors.muted),
                ],
              ),
              const SizedBox(height: 4),
              Text('Find a specialist', style: AskyTheme.headingStyle),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AskyColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AskyColors.subtle),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                ),
                child: const Icon(Icons.notifications_outlined, color: AskyColors.dark),
              ),
              Positioned(
                top: 8, right: 10,
                child: Container(
                  width: 8, height: 8,
                  decoration: BoxDecoration(
                    color: AskyColors.accent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: AskyColors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AskyColors.subtle),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(Icons.search, color: AskyColors.muted),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search 'Fade', 'Manicure', 'Barber'...",
                  hintStyle: AskyTheme.mutedStyle,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AskyColors.dark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.tune, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.content_cut, 'label': 'Hair', 'active': true},
      {'icon': Icons.brush, 'label': 'Makeup', 'active': false},
      {'icon': Icons.spa, 'label': 'Nails', 'active': false},
      {'icon': Icons.face, 'label': 'Facial', 'active': false},
      {'icon': Icons.local_florist, 'label': 'Spa', 'active': false},
    ];

    return SizedBox(
      height: 96,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isActive = cat['active'] as bool;
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: isActive ? AskyColors.accent : AskyColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: isActive ? AskyColors.accent : AskyColors.subtle),
                    boxShadow: isActive ? [BoxShadow(color: AskyColors.accent.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))] : [],
                  ),
                  child: Icon(cat['icon'] as IconData, color: isActive ? Colors.white : AskyColors.dark, size: 26),
                ),
                const SizedBox(height: 6),
                Text(
                  cat['label'] as String,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive ? AskyColors.dark : AskyColors.muted,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Featured near you', style: AskyTheme.subheadingStyle),
              Text('See all', style: TextStyle(fontSize: 13, color: AskyColors.accent, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: SizedBox(
                height: 340,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://images.unsplash.com/photo-1585747860715-2ba37e788b70?w=800&q=80',
                      fit: BoxFit.cover,
                      placeholder: (c, u) => Container(color: AskyColors.subtle),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0xCC000000)],
                          stops: [0.3, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16, right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Text('4.9', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AskyColors.accent.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('PREMIUM', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
                            ),
                            const SizedBox(height: 8),
                            const Text("Gentleman's Quarter", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 4),
                            const Text('Classic cuts, beard trims & hot towel shaves.', style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 13)),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.white70, size: 16),
                                    Text(' 0.8 mi  •  ', style: TextStyle(color: Colors.white70, fontSize: 13)),
                                    Text('Open Now', style: TextStyle(color: Color(0xFF4CAF7D), fontSize: 13, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                Container(
                                  width: 40, height: 40,
                                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                  child: const Icon(Icons.arrow_forward, color: AskyColors.dark, size: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRated(BuildContext context) {
    final providers = [
      {
        'name': 'The Gallery Salon',
        'desc': 'Hair styling • Coloring • 1.2 mi',
        'rating': '4.8',
        'tags': ['Women', 'Color'],
        'image': 'https://images.unsplash.com/photo-1621605815971-fbc98d665033?w=300&q=80',
      },
      {
        'name': 'Fade & Blade',
        'desc': 'Barber • Shave • 0.5 mi',
        'rating': '5.0',
        'tags': ['Men', 'Beard'],
        'image': 'https://images.unsplash.com/photo-1622288432450-277d0fef5ed6?w=300&q=80',
      },
      {
        'name': 'Urban Oasis',
        'desc': 'Massage • Wellness • 2.4 mi',
        'rating': '4.7',
        'tags': ['Spa'],
        'image': 'https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?w=300&q=80',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated', style: AskyTheme.subheadingStyle),
          const SizedBox(height: 16),
          ...providers.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ProviderCard(provider: p),
          )),
        ],
      ),
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final Map<String, dynamic> provider;
  const _ProviderCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: AskyTheme.cardDecoration,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: provider['image'],
              width: 80, height: 80,
              fit: BoxFit.cover,
              placeholder: (c, u) => Container(color: AskyColors.subtle),
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
                    Text(provider['name'], style: AskyTheme.labelStyle.copyWith(fontSize: 14)),
                    Row(
                      children: [
                        const Icon(Icons.star, color: AskyColors.accent, size: 14),
                        const SizedBox(width: 2),
                        Text(provider['rating'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(provider['desc'], style: AskyTheme.mutedStyle.copyWith(fontSize: 11)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  children: (provider['tags'] as List<String>).map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AskyColors.bg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AskyColors.subtle),
                    ),
                    child: Text(tag, style: const TextStyle(fontSize: 10, color: AskyColors.muted, fontWeight: FontWeight.w600)),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
