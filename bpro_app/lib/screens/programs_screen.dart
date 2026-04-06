import 'package:flutter/material.dart';
import '../widgets/section_header.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Beginner', 'Intermediate', 'Advanced'];

  final List<Map<String, dynamic>> _programs = [
    {
      'title': 'Dribbling Mastery',
      'description': 'Master close control and advanced dribbling techniques used by pros.',
      'level': 'Advanced',
      'weeks': 8,
      'sessions': 24,
      'isPremium': true,
      'icon': Icons.sports_soccer,
    },
    {
      'title': 'Speed & Agility',
      'description': 'Build explosive speed and quick directional changes on the field.',
      'level': 'Intermediate',
      'weeks': 6,
      'sessions': 18,
      'isPremium': false,
      'icon': Icons.bolt_rounded,
    },
    {
      'title': 'Shooting Power',
      'description': 'Develop powerful and accurate shots from any position.',
      'level': 'Beginner',
      'weeks': 4,
      'sessions': 12,
      'isPremium': false,
      'icon': Icons.sports,
    },
    {
      'title': 'Defensive Wall',
      'description': 'Elite defensive skills — positioning, tackling, and reading the game.',
      'level': 'Intermediate',
      'weeks': 6,
      'sessions': 16,
      'isPremium': true,
      'icon': Icons.shield_rounded,
    },
    {
      'title': 'GK Reflexes',
      'description': 'Goalkeeper-specific training for reflexes, positioning and distribution.',
      'level': 'Advanced',
      'weeks': 10,
      'sessions': 30,
      'isPremium': true,
      'icon': Icons.back_hand_rounded,
    },
    {
      'title': 'First Touch',
      'description': 'Perfect your first touch to control any ball with confidence.',
      'level': 'Beginner',
      'weeks': 3,
      'sessions': 9,
      'isPremium': false,
      'icon': Icons.touch_app_rounded,
    },
  ];

  List<Map<String, dynamic>> get _filteredPrograms {
    if (_selectedFilter == 0) return _programs;
    return _programs.where((p) => p['level'] == _filters[_selectedFilter]).toList();
  }

  Color _levelColor(String level) {
    switch (level) {
      case 'Beginner':
        return const Color(0xFF2E7D32);
      case 'Intermediate':
        return const Color(0xFFE65100);
      case 'Advanced':
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter chips
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Training Programs',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0D0D0D),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${_programs.length} programs available',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_filters.length, (i) {
                    final isSelected = _selectedFilter == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFilter = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFD32F2F) : const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _filters[i],
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
        // Programs list
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            itemCount: _filteredPrograms.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, i) {
              final program = _filteredPrograms[i];
              return _ProgramListCard(
                title: program['title'],
                description: program['description'],
                level: program['level'],
                weeks: program['weeks'],
                sessions: program['sessions'],
                isPremium: program['isPremium'],
                icon: program['icon'],
                levelColor: _levelColor(program['level']),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProgramListCard extends StatelessWidget {
  final String title, description, level;
  final int weeks, sessions;
  final bool isPremium;
  final IconData icon;
  final Color levelColor;

  const _ProgramListCard({
    required this.title,
    required this.description,
    required this.level,
    required this.weeks,
    required this.sessions,
    required this.isPremium,
    required this.icon,
    required this.levelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
          // Icon box
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFD32F2F).withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFFD32F2F), size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0D0D0D),
                        ),
                      ),
                    ),
                    if (isPremium)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD32F2F),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'PRO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9E9E9E),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _tag(Icons.bar_chart_rounded, level, levelColor),
                    const SizedBox(width: 8),
                    _tag(Icons.calendar_today_rounded, '$weeks wks', const Color(0xFF616161)),
                    const SizedBox(width: 8),
                    _tag(Icons.play_circle_outline_rounded, '$sessions sessions', const Color(0xFF616161)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 11, color: color),
        const SizedBox(width: 3),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
