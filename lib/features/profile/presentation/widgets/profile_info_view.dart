import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoView extends StatelessWidget {
  Function ? onEditPressed;
  ProfileInfoView({super.key, this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              width: 48.w,
              height: 48.w,
              child: TextButton(onPressed: () {
                if (onEditPressed != null) {
                  onEditPressed!();
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
                  child: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
                size: 20,
              )),
            )
          ],
        ),
        const SizedBox(height: 10),
        _infoRow("Name", "Enjelin Morgeana"),
        _infoRow("Email", "enjelinmorgeana@gmail.com"),
        _infoRow("Password", "********", true),
        _infoRow("Number of cards", "1"),
        _infoRow("Number of Bank Accounts", "2"),
      ],
    );
  }

  Widget _infoRow(String title, String value, [bool isSensitive = false]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF666666))
        ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)
                      ),
              isSensitive ? TextButton(
                style: TextButton.styleFrom(

                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                ),
                onPressed: () {
                  // Handle password change
                },
                child:Icon(
                  Icons.visibility_off,
                  size: 20,
                )
              ) : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
