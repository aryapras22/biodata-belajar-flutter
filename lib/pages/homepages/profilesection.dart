import 'package:flutter/material.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      children: <Widget>[
        Center(
          child: Column(
            children: [
              Text("Arya Prasetya",
                  style: Theme.of(context).textTheme.headlineLarge),
              const ClipOval(
                child: Image(
                    image: AssetImage('assets/profile_pict.png'),
                    height: 150,
                    width: 150),
              ),
              _buildExperienceTab(), // Include _buildExperienceTab here
            ],
          ),
        ),
        // Add other profile information widgets here
      ],
    );
  }

  Widget _buildExperienceTab() {
    return ListView(
      shrinkWrap: true, // Ensure it doesn't occupy infinite space
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      children: [
        _buildExperienceItem(
          type: "Education",
          date: "2022-Present",
          title: "Airlangga University",
          subtitle: "Information System Undergraduate",
          trailing: "GPA 3.75/4.00",
        ),
        _buildExperienceItem(
          type: "Organizational Experience",
          date: "Dec 2023 — Present",
          title: "Chairman of HIMSI UNAIR",
        ),
        _buildExperienceItem(
          type: "",
          date: "Dec 2022 — Nov 2023",
          title: "Organizational Supervisory Board HIMSI UNAIR",
        ),
        _buildExperienceItem(
          type: "",
          date: "Apr 2023 — Aug 2023",
          title: "Event Staff Pendekar FST Universitas Airlangga",
        ),
        _buildExperienceItem(
          type: "",
          date: "Feb 2023 — Mar 2023",
          title: "Liaison Officer Get to Know Airlangga 2.0",
        ),
        _buildExperienceItem(
          type: "Achievement",
          date: "Nov 2022",
          title: "Finalist Komescom 2022",
          subtitle: "Nov 2022",
        ),
        _buildExperienceItem(
          type: "",
          date: "May 2023",
          title: "3rd Place at Jogja Information Technology Sessions UGM",
        ),

        // Add other experiences here
      ],
    );
  }

  Widget _buildExperienceItem({
    required String type,
    required String date,
    required String title,
    String? subtitle,
    String? trailing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (type.isNotEmpty) // Render title only if type is not empty
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              type,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ListTile(
          leading: Text(
            date,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 13),
          ),
          subtitle: subtitle != null ? Text(subtitle) : null,
          trailing: trailing != null ? SizedBox(child: Text(trailing)) : null,
        ),
      ],
    );
  }
}
