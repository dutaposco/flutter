import 'package:flutter/material.dart';
import '../widgets/section_header.dart';
import '../widgets/program_card.dart';
import '../widgets/featured_video_card.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Banner
          _HeroBanner(),
          const SizedBox(height: 28),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: StatCard(value: '50+', label: 'Programs', icon: Icons.fitness_center_rounded)),
                const SizedBox(width: 12),
                Expanded(child: StatCard(value: '200+', label: 'Videos', icon: Icons.play_circle_fill_rounded)),
                const SizedBox(width: 12),
                Expanded(child: StatCard(value: '10K+', label: 'Athletes', icon: Icons.people_rounded)),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Featured Programs
          SectionHeader(title: 'Top Programs', actionLabel: 'See All', onAction: () {}),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                ProgramCard(
                  title: 'Dribbling Mastery',
                  level: 'Advanced',
                  duration: '8 Weeks',
                  sessions: 24,
                  colorFrom: Color(0xFFD32F2F),
                  colorTo: Color(0xFFB71C1C),
                  isPremium: true,
                ),
                SizedBox(width: 16),
                ProgramCard(
                  title: 'Speed & Agility',
                  level: 'Intermediate',
                  duration: '6 Weeks',
                  sessions: 18,
                  colorFrom: Color(0xFF212121),
                  colorTo: Color(0xFF424242),
                  isPremium: false,
                ),
                SizedBox(width: 16),
                ProgramCard(
                  title: 'Shooting Power',
                  level: 'Beginner',
                  duration: '4 Weeks',
                  sessions: 12,
                  colorFrom: Color(0xFFB71C1C),
                  colorTo: Color(0xFFD32F2F),
                  isPremium: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Featured Videos
          SectionHeader(title: 'Latest Videos', actionLabel: 'See All', onAction: () {}),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                FeaturedVideoCard(
                  title: 'How to Score from Long Range',
                  category: 'Shooting',
                  duration: '12:34',
                  views: '45K',
                ),
                SizedBox(height: 14),
                FeaturedVideoCard(
                  title: 'Pro Dribbling Techniques',
                  category: 'Dribbling',
                  duration: '08:22',
                  views: '82K',
                ),
                SizedBox(height: 14),
                FeaturedVideoCard(
                  title: 'Defensive Positioning 101',
                  category: 'Defense',
                  duration: '15:10',
                  views: '31K',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD32F2F), Color(0xFF7B0000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD32F2F).withOpacity(0.35),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.sports_soccer,
              size: 180,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          Positioned(
            right: 30,
            top: 10,
            child: Icon(
              Icons.sports_soccer,
              size: 60,
              color: Colors.white.withOpacity(0.12),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '⚽  TRAIN LIKE A PRO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Elevate Your\nSoccer Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Start Training',
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
