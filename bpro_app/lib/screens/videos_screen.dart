import 'package:flutter/material.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  int _selectedCategory = 0;
  final List<String> _categories = ['All', 'Shooting', 'Dribbling', 'Defense', 'Fitness'];

  final List<Map<String, dynamic>> _videos = [
    {
      'title': 'How to Score from Long Range',
      'category': 'Shooting',
      'duration': '12:34',
      'views': '45.2K',
      'isFree': true,
      'color': Color(0xFFD32F2F),
    },
    {
      'title': 'Pro Dribbling Techniques',
      'category': 'Dribbling',
      'duration': '08:22',
      'views': '82.1K',
      'isFree': true,
      'color': Color(0xFF212121),
    },
    {
      'title': 'Defensive Positioning 101',
      'category': 'Defense',
      'duration': '15:10',
      'views': '31.5K',
      'isFree': false,
      'color': Color(0xFF1A237E),
    },
    {
      'title': 'Sprint Training for Wingers',
      'category': 'Fitness',
      'duration': '20:05',
      'views': '28.7K',
      'isFree': false,
      'color': Color(0xFF1B5E20),
    },
    {
      'title': 'Free-kick Mastery Guide',
      'category': 'Shooting',
      'duration': '18:47',
      'views': '110K',
      'isFree': false,
      'color': Color(0xFF880E4F),
    },
    {
      'title': 'Ball Control Drills',
      'category': 'Dribbling',
      'duration': '11:29',
      'views': '60.3K',
      'isFree': true,
      'color': Color(0xFFBF360C),
    },
    {
      'title': 'Reading the Game — Midfield',
      'category': 'Defense',
      'duration': '22:15',
      'views': '19.8K',
      'isFree': false,
      'color': Color(0xFF004D40),
    },
  ];

  List<Map<String, dynamic>> get _filtered {
    if (_selectedCategory == 0) return _videos;
    return _videos.where((v) => v['category'] == _categories[_selectedCategory]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Training Videos',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0D0D0D),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${_videos.length} videos in library',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              Container(
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search videos...',
                    hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                    prefixIcon: Icon(Icons.search_rounded, color: Color(0xFFBDBDBD), size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (i) {
                    final isSelected = _selectedCategory == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFD32F2F) : const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _categories[i],
                          style: TextStyle(
                            color: isSelected ? Colors.white : const Color(0xFF616161),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            itemCount: _filtered.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, i) => _VideoCard(video: _filtered[i]),
          ),
        ),
      ],
    );
  }
}

class _VideoCard extends StatelessWidget {
  final Map<String, dynamic> video;
  const _VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
            child: Container(
              width: 120,
              color: video['color'] as Color,
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.sports_soccer,
                      size: 40,
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                  if (!video['isFree'])
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD32F2F),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'PRO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        video['duration'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD32F2F).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      video['category'],
                      style: const TextStyle(
                        color: Color(0xFFD32F2F),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    video['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0D0D0D),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye_rounded, size: 12, color: Color(0xFF9E9E9E)),
                      const SizedBox(width: 4),
                      Text(
                        video['views'],
                        style: const TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: video['isFree'] ? const Color(0xFF9E9E9E) : const Color(0xFFD32F2F),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
