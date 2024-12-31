
import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/Sell_Product_Page.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ContactUs_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class more_page_screen extends StatefulWidget {
  const more_page_screen({super.key});

  @override
  State<more_page_screen> createState() => _more_page_screenState();
}

class _more_page_screenState extends State<more_page_screen> {
  static IconData icon1 =Icons.verified_outlined;
  static IconData icon2 =Icons.call;
  static IconData icon3 =Icons.security_rounded;
  static IconData icon4 =Icons.fact_check_sharp;
  static IconData icon5 =Icons.logout;
  static IconData icon6 =Icons.logout;

  Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse('https://phoneshree.com/legal/privacy_policy.html');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchTermsAndCondition() async {
    final Uri url = Uri.parse('https://phoneshree.com/legal/terms_and_condition.html');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss on tap outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                  color: customstheam.icon_col, // Border color
                  ),
                ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.priority_high,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        minimumSize: Size(100, 40),// Width and height for button
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        // Perform logout logic here
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: customstheam.icon_col,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        minimumSize: Size(100, 40),// Width and height for button
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss on tap outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(

                padding: EdgeInsets.fromLTRB(16, 56, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title Text
                    Text(
                      "Are you sure you want to delete your account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16, // Reduced title font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Description Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Proceed with caution: Deleting your account is a big step. Are you sure you want to go through with it? Remember, you can recover it if you log in within 48 hours.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 9, // Reduced description font size
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Add delete account functionality here
                              Navigator.of(context).pop(); // Close dialog
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: customstheam.icon_col,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Overlapping Icon
              Positioned(
                top: -35, // Adjusted for smaller size
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 35, // Reduced circle size
                    backgroundColor: customstheam.icon_col,
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30, // Smaller icon size
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.sizeOf(context).height;
    final double width= MediaQuery.sizeOf(context).width;


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50,left: 27),
            child: Image.asset("assets/images/logo.png",height: 80,width: 160,),
          ),
          // Image.asset("assets/images/logo.png", height: 80,width: 160,),

          //sell product
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SellProductPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon1,color:Colors.yellow.shade700,),
                      SizedBox(width: 15,),
                      Text("Sell Product",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

          //contact us
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactUs(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon2,color: customstheam.icon_col,),
                      SizedBox(width: 15,),
                      Text("Contact Us",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

          //privacy policy
          InkWell(
            onTap:_launchPrivacyPolicy,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                    //
                    // SvgPicture.asset(
                    //   'assets/icons/Privacy_icon.svg',
                    //   // color:customstheam.icon_col,
                    // ),
                      Icon(icon3,color:customstheam.icon_col,),
                      SizedBox(width: 15,),
                      Text("Privacy Policy",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

          //terms & conditions
          InkWell(
            onTap: _launchTermsAndCondition,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon4, color: customstheam.icon_col,),
                      SizedBox(width: 15,),
                      Text("Terms & Condition",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

          //log out
          InkWell(
            onTap: _showLogoutDialog,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/LogOut.svg',
                        width: 24,
                        height: 24,
                      ),

                      // Icon(icon5,color: customstheam.icon_col,),
                      SizedBox(width: 15,),
                      Text("Log out",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

          //delete account
          InkWell(
            onTap: _showDeleteAccountDialog,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,right: 14.0,left: 30.0,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/LogOut.svg',
                        width: 24,
                        height: 24,
                      ),
                      // Icon(icon6,color: customstheam.icon_col,),
                      SizedBox(width: 15,),
                      Text("Delete Account",style: TextStyle(
                        fontSize: customstheam.h1,
                        color: customstheam.h1_color,
                        fontWeight: customstheam.h1_weight,
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.navigate_next,
                        color: customstheam.icon_col,
                        size:  customstheam.icon_size,
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
