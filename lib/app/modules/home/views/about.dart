import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../controllers/home_controller.dart';

class About extends GetView<HomeController> {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = 1.sw < 800;

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
                  text: 'About ',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: isMobile ? Get.width * 0.06 : 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Me',
                  style: TextStyle(
                    fontSize: isMobile ? Get.width * 0.06 : 48.sp,
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
            width: isMobile ? 150.w : 190.w,
            height: isMobile ? 2.h : 6.h,
            color: AppColors.secondaryColor,
            margin: EdgeInsets.only(top: 10.h, bottom: 40.h),
          ),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left side: Image/Illustration
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isMobile ? 30.h : 0.h,
                    right: isMobile ? 0.h : 50.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 1600),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.only(
                          top: controller.isMoveUp.value ? 0.h : 20.h,
                        ),
                        width:
                            isMobile
                                ? MediaQuery.of(context).size.width * 0.75
                                : 320.w,
                        height:
                            isMobile
                                ? MediaQuery.of(context).size.width * 0.5
                                : 670.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          // border: Border.all(
                          //   color: Colors.grey.shade600,
                          //   width: 2,
                          // ),
                        ),
                        clipBehavior:
                            Clip.hardEdge, // makes image respect border radius
                        child: Image.asset(
                          'images/profile_pic.jpeg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.cardColor,
                              child: Center(
                                child: Text(
                                  'Image Not Found',
                                  style: TextStyle(
                                    color: AppColors.textLightColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Right side: Text content and stats
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Column(
                  crossAxisAlignment:
                      isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'm Payal Kumawat",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: isMobile ? Get.width * 0.04 : 44.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Flutter Developer & Full Stack Engineer — B.Tech CSE graduate with 9.00 CGPA from Central University of Haryana. I build production-ready, cross-platform applications using Flutter, Dart, Firebase, Node.js, and React. My work spans IoT-integrated franchise platforms, AI-powered enterprise communication tools, real-time WebRTC calling, and offline-capable mobile apps.",
                      style: TextStyle(
                        color: AppColors.textLightColor,
                        fontSize: isMobile ? Get.width * 0.035 : 25.sp,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "I bring both mobile and backend depth to every project — writing clean architectures, integrating real-time features, and delivering systems that scale in production. Currently exploring Java and always on the lookout for new technologies to add to my toolkit. Driven by real-world impact, I continuously push the boundaries of what I can build.",
                      style: TextStyle(
                        color: AppColors.textLightColor,
                        fontSize: isMobile ? Get.width * 0.035 : 25.sp,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    SizedBox(height: 40.h),
                    // Stats (e.g., 4+ projects, 2 years experience)
                    Wrap(
                      spacing: 15.w,
                      runSpacing: 20.h,
                      alignment:
                          isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: [
                        _buildStatCard(context, '4+', 'Projects'),
                        _buildStatCard(context, '4+', 'Experiences'),
                        _buildStatCard(context, '2+', 'Certificates'),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    Text(
                      'Key Technologies',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: isMobile ? Get.width * 0.04 : 28.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    SizedBox(height: 15.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: [
                        _buildSkillChip('Flutter', const Color(0xFF42A5F5)),
                        _buildSkillChip('Dart', const Color(0xFF29B6F6)),
                        _buildSkillChip('Node.js', const Color(0xFF66BB6A)),
                        _buildSkillChip('React.js', const Color(0xFF26C6DA)),
                        _buildSkillChip('Firebase', const Color(0xFFFFCA28)),
                        _buildSkillChip('GetX / Bloc', const Color(0xFFAB47BC)),
                        _buildSkillChip('WebRTC', const Color(0xFFFF7043)),
                        _buildSkillChip('Socket.IO', const Color(0xFF00BCD4)),
                        _buildSkillChip('MongoDB', const Color(0xFF4CAF50)),
                        _buildSkillChip('MySQL', const Color(0xFF03A9F4)),
                        _buildSkillChip('Clean Architecture', const Color(0xFF7E57C2)),
                        _buildSkillChip('REST APIs', const Color(0xFF26A69A)),
                        _buildSkillChip('FCM', const Color(0xFFEF5350)),
                        _buildSkillChip('Git & GitHub', const Color(0xFFBDBDBD)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, Color color) {
    bool isMobile = 1.sw < 800;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12.w : 16.w,
        vertical: isMobile ? 5.h : 7.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.15), color.withValues(alpha: 0.07)],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1.w),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: isMobile ? Get.width * 0.028 : 20.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String count, String label) {
    bool isMobile = 1.sw < 800; // Smaller breakpoint for cards
    return Container(
      width: isMobile ? Get.width * 0.5 : 300.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 8),
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: isMobile ? Get.width * 0.05 : 60.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: isMobile ? Get.width * 0.04 : 40.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
