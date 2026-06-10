import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controllers/home_controller.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = 1.sw < 800;
    final isTablet = 1.sw < 1000;

    return Container(
      color: AppColors.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 80.w,
        vertical: isMobile ? 40.h : 80.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'My ',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: isMobile ? Get.width * 0.06 : 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Projects',
                  style: TextStyle(
                    fontSize: isMobile ? Get.width * 0.06 : 48.sp,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          AppColors.secondaryColor,
                          AppColors.secondary2Color,
                        ],
                      ).createShader(Rect.fromLTWH(0, 0, 300, 100)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: isMobile ? 150.w : 190.w,
            height: isMobile ? 2.h : 6.h,
            color: AppColors.secondaryColor,
            margin: EdgeInsets.only(top: 10.h, bottom: 40.h),
          ),
          Wrap(
            spacing: isMobile ? 30.w : 15.w,
            runSpacing: 15.h,
            alignment: WrapAlignment.center,
            children: [
              _buildCategoryButton('All', isMobile),
              _buildCategoryButton('AI', isMobile),
              _buildCategoryButton('Flutter', isMobile),
              _buildCategoryButton('Web Development', isMobile),
              _buildCategoryButton('Android', isMobile),
            ],
          ),
          SizedBox(height: isMobile ? 50.h : 70.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile
                  ? 1
                  : isTablet
                  ? 2
                  : 3,
              crossAxisSpacing: isMobile ? 20.w : 30.w,
              mainAxisSpacing: isMobile ? 20.h : 30.h,
              childAspectRatio: isMobile
                  ? 0.68
                  : isTablet
                  ? 0.52
                  : 0.65,
            ),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(
                project: _projects[index],
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category, bool isMobile) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cardColor,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.w : 25.w,
          vertical: isMobile ? 10.h : 12.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: AppColors.primaryColor, width: 1.w),
        ),
        elevation: 3,
      ),
      child: Text(
        category,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: isMobile ? Get.width * 0.028 : 25.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'E-Panipuri Cart',
      'description':
          'Multi-platform IoT-integrated franchise management system (Mobile App + Web Admin + Super Admin Panel). Features real-time order processing, dispenser & device management, QR-based machine identification, and Firebase auth with secure token-based session management.',
      'imageUrl': 'images/project.png',
      // 'link': 'https://super-panel.epanipuricart.com',
      // 'linkLabel': 'View Live',
      'link': null,
      'linkLabel': null,
      'playStoreLink':
          'https://play.google.com/store/apps/details?id=com.epanipuricart.partner',
      'techStack': ['Flutter', 'Firebase', 'IoT', 'REST APIs', 'Web Admin'],
    },
    {
      'title': 'Discount Lala',
      'description':
          'Hyperlocal discount & coupon marketplace for Tier-2/3 cities (client project at FutureDesks). My contribution: Flutter mobile app, Node.js backend APIs, and full API integration. Features phone OTP auth, digital coupon generation, booklet purchases, add-on offers, referral & distributor commission system, GPS-based city detection, cart management, and coupon redemption. Admin panel built by a fellow team member.',
      'imageUrl': 'images/project.png',
      'link': null,
      'linkLabel': null,
      'techStack': [
        'Flutter',
        'Node.js',
        'PostgreSQL',
        'Prisma ORM',
        'Firebase Auth',
        'BLoC',
        'JWT',
      ],
    },
    {
      'title': 'BetaBuddy',
      'description':
          'Enterprise Flutter application using Clean Architecture for employee communication, tasks, alerts, and approvals. Real-time voice calling via WebRTC & Socket.IO, FCM push notifications, secure role-based auth, and an AI-powered "Ask AI" assistant with chat & voice recognition.',
      'imageUrl': 'images/project.png',
      'link': null,
      'linkLabel': null,
      'techStack': [
        'Flutter',
        'WebRTC',
        'Socket.IO',
        'FCM',
        'Clean Architecture',
        'AI',
      ],
    },
    {
      'title': 'FoodCo',
      'description':
          'Community meal-sharing platform where households monetize their culinary skills. Built with Flutter, GetX state management, and SQFlite for offline support — enabling fast local data access without connectivity.',
      'imageUrl': 'images/project.png',
      'link': 'https://github.com/payalkumawat/foodco',
      'linkLabel': 'GitHub',
      'techStack': ['Flutter', 'Dart', 'GetX', 'SQFlite'],
    },
    {
      'title': 'AI Code Reviewer',
      'description':
          'Web app that uses AI to analyze and review code snippets in real time. Provides instant feedback on syntax, performance, and coding best practices through an intuitive frontend and robust backend logic.',
      'imageUrl': 'images/project.png',
      'link': 'https://github.com/PayalKmt/AI-Code-Reviewer',
      'linkLabel': 'GitHub',
      'techStack': ['React.js', 'Node.js', 'AI / LLM', 'REST APIs'],
    },
    {
      'title': 'AI Image Generator',
      'description':
          'Flutter mobile app leveraging the Imagine.art API to generate AI-driven images from text prompts. Built with Bloc state management, offering real-time preview and a polished user experience.',
      'imageUrl': 'images/project.png',
      'link': 'https://github.com/PayalKmt/AI-Image-Generator',
      'linkLabel': 'GitHub',
      'techStack': ['Flutter', 'Bloc', 'AI API', 'Dart'],
    },
  ];
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final bool isMobile;

  const _ProjectCard({required this.project, required this.isMobile});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isMobile = widget.isMobile;
    final techStack = (project['techStack'] as List?)?.cast<String>() ?? [];
    final linkLabel = project['linkLabel'] as String?;
    final link = project['link'] as String?;
    final playStoreLink = project['playStoreLink'] as String?;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: _isHovered
                ? AppColors.primaryColor.withValues(alpha: 0.7)
                : AppColors.primaryColor.withValues(alpha: 0.15),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primaryColor.withValues(alpha: 0.18)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: _isHovered ? 28.r : 10.r,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient accent bar
            Container(
              height: isMobile ? 3.h : 4.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.secondaryColor],
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              ),
            ),
            // Image placeholder
            ClipRRect(
              child: Image.network(
                project['imageUrl']!,
                fit: BoxFit.cover,
                height: isMobile ? 320.h : 460.h,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isMobile ? 320.h : 460.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primaryColor.withValues(alpha: 0.2),
                          AppColors.secondaryColor.withValues(alpha: 0.08),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.code_rounded,
                            size: isMobile ? 60.sp : 70.sp,
                            color: AppColors.primaryColor.withValues(
                              alpha: 0.45,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            project['title']!,
                            style: TextStyle(
                              color: AppColors.textLightColor,
                              fontSize: isMobile ? Get.width * 0.038 : 26.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title']!,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: isMobile ? Get.width * 0.052 : 34.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (techStack.isNotEmpty) ...[
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 6.h,
                      children: techStack
                          .map((tech) => _buildTechChip(tech, isMobile))
                          .toList(),
                    ),
                    SizedBox(height: 12.h),
                  ],
                  Text(
                    project['description']!,
                    style: TextStyle(
                      color: AppColors.textLightColor,
                      fontSize: isMobile ? Get.width * 0.031 : 22.sp,
                      height: 1.55,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (link != null && linkLabel != null ||
                      playStoreLink != null) ...[
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 16.w,
                      runSpacing: 8.h,
                      children: [
                        if (link != null && linkLabel != null)
                          TextButton.icon(
                            onPressed: () =>
                                Get.find<HomeController>().openUrl(link),
                            icon: Icon(
                              linkLabel == 'View Live'
                                  ? Icons.open_in_new_rounded
                                  : Icons.code_rounded,
                              size: isMobile ? Get.width * 0.038 : 22.sp,
                              color: AppColors.primaryColor,
                            ),
                            label: Text(
                              linkLabel,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: isMobile ? Get.width * 0.031 : 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        if (playStoreLink != null)
                          TextButton.icon(
                            onPressed: () => Get.find<HomeController>().openUrl(
                              playStoreLink,
                            ),
                            icon: Icon(
                              Icons.android_rounded,
                              size: isMobile ? Get.width * 0.038 : 22.sp,
                              color: const Color(0xFF3DDC84),
                            ),
                            label: Text(
                              'Play Store',
                              style: TextStyle(
                                color: const Color(0xFF3DDC84),
                                fontSize: isMobile ? Get.width * 0.031 : 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechChip(String label, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8.w : 10.w,
        vertical: isMobile ? 3.h : 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.3),
          width: 0.8,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: isMobile ? Get.width * 0.024 : 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
