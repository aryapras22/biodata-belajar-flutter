import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late DateTime date;
  final DateFormat formatter = DateFormat.yMd();
  @override
  void initState() {
    super.initState();
    date = DateTime.now(); // Initialize date with current date
  }

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
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                String formatted = formatter.format(newDate);
                date = DateTime.parse(formatted);
              });
            },
          ),
          title: "Airlangga University",
          subtitle: "Information System Undergraduate",
          trailing: "GPA 3.75/4.00",
        ),
        _buildExperienceItem(
          type: "Organizational Experience",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "Chairman of HIMSI UNAIR",
        ),
        _buildExperienceItem(
          type: "",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "Organizational Supervisory Board HIMSI UNAIR",
        ),
        _buildExperienceItem(
          type: "",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "Event Staff Pendekar FST Universitas Airlangga",
        ),
        _buildExperienceItem(
          type: "",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "Liaison Officer Get to Know Airlangga 2.0",
        ),
        _buildExperienceItem(
          type: "Achievement",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "Finalist Komescom 2022",
          subtitle: "Nov 2022",
        ),
        _buildExperienceItem(
          type: "",
          date: DatePickerWidget(
            initialDate: DateTime.now(),
            onDateChanged: (newDate) {
              setState(() {
                // Update the date value
                date = newDate;
              });
            },
          ),
          title: "3rd Place at Jogja Information Technology Sessions UGM",
        ),

        // Add other experiences here
      ],
    );
  }

  Widget _buildExperienceItem({
    required String type,
    required Widget date,
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
          leading: date,
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

class DatePickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const DatePickerWidget({
    Key? key,
    required this.initialDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Text(
        DateFormat.yMMMM().format(selectedDate),
        style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateChanged(selectedDate);
      });
    }
  }
}
