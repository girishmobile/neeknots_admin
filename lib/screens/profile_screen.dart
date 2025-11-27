import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/utility/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: appTopPadding(context),
              bottom: appBottomPadding(context),
            ),
            children: [
              appProfileImage(imaheUrl: hostImage, radius: 60),
              SizedBox(height: 16),
              loadTitleText(
                title: "Girish Chauhan",
                textAlign: TextAlign.center,
              ),
              loadSubText(title: "iOS Developer", textAlign: TextAlign.center),
              SizedBox(height: 32),

              _builRowTitle(
                icon: Icons.person_outline_outlined,
                label: "Basic Information",
              ),
              SizedBox(height: 8),
              _buildPersonalInfo(),
              SizedBox(height: 24),
              _builRowTitle(
                icon: Icons.account_balance_outlined,
                label: "Company Relations",
              ),
              SizedBox(height: 8),
              _buildCompnayInfo(),
              SizedBox(height: 24),
              _builRowTitle(
                icon: Icons.call_outlined,
                label: "Contact Information",
              ),
              SizedBox(height: 8),
              _buildContactInfo(),
              SizedBox(height: 24),
              _builRowTitle(icon: Icons.book_outlined, label: "Document"),
              SizedBox(height: 8),
              _buildDocuments(),
              SizedBox(height: 24),
              _builRowTitle(
                icon: Icons.share_outlined,
                label: "Social Network",
              ),
              SizedBox(height: 8),
              _buildSocial(),
              SizedBox(height: 24),
              gradientButton(title: "LOGOUT", onPressed: () {}),
            ],
          ),
          appNavigationBar(
            title: "PROFILE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _builRowTitle({required IconData icon, required String label}) {
    return Row(
      spacing: 4,
      children: [
        appCircleIcon(icon: icon, gradient: appGradient()),
        appGradientText(
          text: label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          gradient: appGradient(),
        ),
      ],
    );
  }

  Widget _buildPersonalInfo() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          _builBasicRowInfo(label: "Full Name", titleText: "Girish Chauhan"),
          _builBasicRowInfo(label: "Employee ID", titleText: "068"),
          _builBasicRowInfo(
            label: "Personal Email",
            titleText: "girish@kaushalam.com",
          ),
          _builBasicRowInfo(
            label: "Company Email",
            titleText: "girish@kaushalam.com",
          ),
          _builBasicRowInfo(label: "Gender", titleText: "Male"),
          _builBasicRowInfo(label: "Birthday", titleText: "01-Feb-1990"),
          _builBasicRowInfo(label: "Blood Group", titleText: "-"),
          _builBasicRowInfo(label: "Marital Status", titleText: "Married"),
          _builBasicRowInfo(label: "Status", titleText: "Active"),
          _builBasicRowInfo(label: "External System Access", titleText: "Yes"),
        ],
      ),
    );
  }

  Widget _buildCompnayInfo() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          _builBasicRowInfo(label: "Department", titleText: "Mobile"),
          _builBasicRowInfo(label: "Designation", titleText: "iOS developer"),
          _builBasicRowInfo(label: "Batch", titleText: "9:30 to 7:30"),
          _builBasicRowInfo(label: "Reports To", titleText: "-"),
          _builBasicRowInfo(label: "Joining Date", titleText: "13-Jun-2013"),
          _builBasicRowInfo(label: "Probation End Date", titleText: "-"),
          _builBasicRowInfo(label: "Work Duration", titleText: "-"),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          _builBasicRowInfo(label: "Mobile Phone", titleText: "+91 9558697986"),
          _builBasicRowInfo(
            label: "Emergency Contact Number",
            titleText: "+91 9558697986",
          ),
          _builBasicRowInfo(
            label: "Emergency Contact Person",
            titleText: "Shreyansh Chauhan",
          ),
          _builBasicRowInfo(
            label: "Current Address",
            titleText:
                "I-404 Sahajanad Helenium, Chandkheda, Ahmedabad, 382424",
          ),
          _builBasicRowInfo(
            label: "Permanent Address",
            titleText: "Nari, Bhavnagar",
          ),
        ],
      ),
    );
  }

  Widget _buildDocuments() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          _builBasicRowInfo(label: "Driving License Number", titleText: "-"),
          _builBasicRowInfo(label: "PAN Number", titleText: "ABCDE1234D"),
          _builBasicRowInfo(label: "Aadhar Number", titleText: "245698745621"),
          _builBasicRowInfo(label: "Voter ID Number", titleText: "-"),
        ],
      ),
    );
  }

  Widget _buildSocial() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          _builBasicRowInfo(label: "Slack username", titleText: "-"),
          _builBasicRowInfo(label: "Facebook username", titleText: "-"),
          _builBasicRowInfo(label: "Twitter username", titleText: "-"),
          _builBasicRowInfo(label: "LinkedIn username", titleText: "-"),
        ],
      ),
    );
  }

  Widget _builBasicRowInfo({required String label, required String titleText}) {
    return Row(
      spacing: 8,

      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        loadTitleText(title: label, fontWight: FontWeight.w500, fontSize: 12),
        Expanded(
          child: loadSubText(
            title: titleText,
            textAlign: TextAlign.end,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
