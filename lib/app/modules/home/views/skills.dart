import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/app_colors.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = 1.sw < 800;
    final isTablet = 1.sw < 1000;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.sp : isTablet ? 40.sp : 80.sp,
        vertical: 40.sp,
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
                    fontSize: isMobile ? 30.sp : 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Skills',
                  style: TextStyle(
                    fontSize: isMobile ? 30.sp : 48.sp,
                    fontWeight: FontWeight.bold,
                    foreground:
                    Paint()
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
            width: isMobile ? 100.w : 190.w,
            height: isMobile ? 4.h : 6.h,
            margin: EdgeInsets.only(top: 10.h, bottom: 40.h),
            color: AppColors.secondaryColor,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile
                  ? 1
                  : isTablet
                  ? 2
                  : 4;
              final cardWidth = constraints.maxWidth / crossAxisCount - 10.w;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 60.w,
                  mainAxisSpacing: 50.h,
                  childAspectRatio: isMobile ? 1.0 : isTablet ? 1.5 :  0.8,
                ),
                itemCount: _skillCategories.length,
                itemBuilder: (context, index) {
                  final category = _skillCategories[index];
                  return _buildSkillCard(
                    context,
                    category['title']!,
                    category['icon'] as IconData,
                    category['skills'] as List<Map<String, dynamic>>,
                    cardWidth,
                    isMobile
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
      BuildContext context,
      String title,
      IconData icon,
      List<Map<String, dynamic>> skills,
      double maxWidth,
      bool isMobile
      ) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 40.w, vertical: isMobile ? 20.h : 40.h),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 10.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(icon, color: Colors.blueAccent, size: isMobile ? 22.sp : 40.sp),
                SizedBox(width: 15.w),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: isMobile ? 22.sp :30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 15.h : 22.h),
            ...skills.map((skill) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill['name']!,
                    style: TextStyle(
                      color: AppColors.textLightColor,
                      fontSize: isMobile ? 18.sp : 25.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  LinearProgressIndicator(
                    value: skill['level']! / 100,
                    backgroundColor: Colors.white.withValues(alpha: 5),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      skill['level']! > 75
                          ? AppColors.secondaryColor
                          : AppColors.primaryColor,
                    ),
                    minHeight: isMobile ? 4.h : 6.h,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  static const List<Map<String, dynamic>> _skillCategories = [
    {
      'title': 'Languages',
      'icon': FontAwesomeIcons.code,
      'skills': [
        {'name': 'Dart', 'level': 90},
        {'name': 'C/C++', 'level': 75},
        {'name': 'Python', 'level': 80},
        {'name': 'TypeScript', 'level': 85},
        {'name': 'HTML/CSS', 'level': 95},
      ],
    },
    {
      'title': 'Frameworks',
      'icon': FontAwesomeIcons.cube,
      'skills': [
        {'name': 'Flutter', 'level': 90},
        {'name': 'React', 'level': 80},
        {'name': 'Node.js', 'level': 85},
      ],
    },
    {
      'title': 'Databases',
      'icon': FontAwesomeIcons.database,
      'skills': [
        {'name': 'MySQL', 'level': 85},
        {'name': 'SQLite', 'level': 70},
        {'name': 'Firebase', 'level': 90},
      ],
    },
    {
      'title': 'Developer Tools',
      'icon': FontAwesomeIcons.screwdriverWrench,
      'skills': [
        {'name': 'VS Code', 'level': 95},
        {'name': 'Android Studio', 'level': 85},
        {'name': 'Git & GitHub', 'level': 90},
      ],
    },
  ];
}