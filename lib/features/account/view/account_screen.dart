import 'package:babystation/features/account/view/faq.dart';
import 'package:babystation/features/account/view/favorites.dart';
import 'package:babystation/features/account/view/my_profile.dart';
import 'package:babystation/features/account/view/privacy_policy.dart';
import 'package:babystation/features/account/view/support.dart';
import 'package:babystation/features/account/view/terms_conditions.dart';
import 'package:babystation/features/home/view/manage_address.dart';
import 'package:babystation/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final headerColor = const Color(0xFF9C278F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Log in to get exclusive offers",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                          backgroundColor: const Color(0xFF9C278F),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
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
              ),

              SizedBox(height: 20),

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
                  spacing: 2,
                  children: [
                    _buildMenu(
                      Icons.favorite,
                      "Favorites",
                      "Your saved products",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Favorites()),
                      ),
                    ),
                    _buildMenu(
                      Icons.location_on,
                      "Manage Address",
                      "Your saved address",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageAddress(),
                        ),
                      ),
                    ),
                    _buildMenu(
                      Icons.mail,
                      "Support",
                      "Connect us for issue & feedback",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Support()),
                      ),
                    ),
                    _buildMenu(
                      Icons.privacy_tip,
                      "Privacy Policy",
                      "Know our privacy policy",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicy(),
                        ),
                      ),
                    ),
                    _buildMenu(
                      Icons.assignment,
                      "Terms  & Conditions",
                      "Know our terms  & conditions",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsConditions(),
                        ),
                      ),
                    ),
                    _buildMenu(
                      Icons.live_help_rounded,
                      "FAQs",
                      "Get your question’s answered",
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Faq()),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C278F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyProfile()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.logout),
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
              ),
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
      leading: Container(
        padding: const EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //   color: const Color(0xFF9C278F).withValues(alpha: 0.1),
        //   shape: BoxShape.circle,
        // ),
        child: Icon(icon, color: const Color(0xFF9C278F), size: 30),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 18)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
    );
  }
}
