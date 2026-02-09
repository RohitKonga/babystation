import 'package:babystation/features/account/view/faq.dart';
import 'package:babystation/features/account/view/favorites.dart';
import 'package:babystation/features/account/view/privacy_policy.dart';
import 'package:babystation/features/account/view/support.dart';
import 'package:babystation/features/account/view/terms_conditions.dart';
import 'package:babystation/features/auth/controller/auth_controller.dart';
import 'package:babystation/features/account/view/manage_address.dart';
import 'package:babystation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const Color headerColor = Color(0xFF9C278F);

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: headerColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// ================= HEADER =================
              Obx(() {
                final user = controller.user.value;
                final isLoggedIn = user != null;

                final name = user?.name.trim() ?? '';
                final email = user?.email.trim() ?? '';

                // Initials (null-safe)
                String initials = '';
                if (name.isNotEmpty) {
                  final parts = name.split(RegExp(r'\s+'));
                  initials = parts.length >= 2
                      ? parts[0][0] + parts[1][0]
                      : parts[0][0];
                }

                return InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: isLoggedIn
                      ? () => Get.toNamed(Routes.profile)
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// LEFT SIDE (name + email)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name.isNotEmpty ? name : "Account",
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              email.isNotEmpty
                                  ? email
                                  : "Log in to get exclusive offers",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),

                        /// RIGHT SIDE (login / avatar)
                        isLoggedIn
                            ? CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade400,
                                child: initials.isEmpty
                                    ? const Icon(Icons.person,
                                        color: Colors.black)
                                    : Text(
                                        initials.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: headerColor,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.login);
                                },
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 20),

              /// ================= MENU =================
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenu(
                      Icons.favorite,
                      "Favorites",
                      "Your saved products",
                      () => Get.to(() => Favorites()),
                    ),
                    _buildMenu(
                      Icons.location_on,
                      "Manage Address",
                      "Your saved address",
                      () => Get.to(() => ManageAddress()),
                    ),
                    _buildMenu(
                      Icons.mail,
                      "Support",
                      "Connect us for issue & feedback",
                      () => Get.to(() => Support()),
                    ),
                    _buildMenu(
                      Icons.privacy_tip,
                      "Privacy Policy",
                      "Know our privacy policy",
                      () => Get.to(() => PrivacyPolicy()),
                    ),
                    _buildMenu(
                      Icons.assignment,
                      "Terms & Conditions",
                      "Know our terms & conditions",
                      () => Get.to(() => TermsConditions()),
                    ),
                    _buildMenu(
                      Icons.live_help_rounded,
                      "FAQs",
                      "Get your question’s answered",
                      () => Get.to(() => Faq()),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ================= LOGOUT =================
              Obx(() {
                if (controller.user.value == null) {
                  return const SizedBox.shrink();
                }

                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: headerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.logout,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 6),
                        Text(
                          "LOGOUT",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: headerColor, size: 30),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
