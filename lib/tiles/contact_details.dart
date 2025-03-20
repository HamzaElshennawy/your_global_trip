import 'package:flutter/material.dart';

class ContactDetailsForm extends StatefulWidget {
  const ContactDetailsForm({super.key});

  @override
  ContactDetailsFormState createState() => ContactDetailsFormState();
}

class ContactDetailsFormState extends State<ContactDetailsForm> {
  String? _gender = "Male";
  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;
  String? _selectedCity;
  String? _selectedLanguage;
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      // Ensures content is centered
      child: Container(
        width: screenWidth - 16,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(70, 0, 0, 0),
                offset: Offset(1, 2),
                blurRadius: 30)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border(),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Allows the column to take only required space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gender Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGenderOption("Male"),
                _buildGenderOption("Female"),
              ],
            ),
            SizedBox(height: 12),

            // Name Fields
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: _buildTextField("First name"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: _buildTextField("Last name"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Birthdate Label
            Text(
              "Birthdate",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 8),

            // Birthdate Dropdowns
            Row(
              children: [
                Expanded(
                    child: _buildDropdown(
                        "Day",
                        _selectedDay,
                        List.generate(31, (index) => "${index + 1}"),
                        (value) => setState(() => _selectedDay = value))),
                SizedBox(width: 8),
                Expanded(
                  child: _buildDropdown(
                    "Month",
                    _selectedMonth,
                    [
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec"
                    ],
                    (value) => setState(() => _selectedMonth = value),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                    child: _buildDropdown(
                        "Year",
                        _selectedYear,
                        List.generate(
                            100, (index) => "${DateTime.now().year - index}"),
                        (value) => setState(() => _selectedYear = value))),
              ],
            ),
            SizedBox(height: 16),

            // Email
            _buildTextField("Email"),
            SizedBox(height: 16),

            // Email
            _buildTextField("Phone"),
            SizedBox(height: 16),

            // Email
            _buildTextField("Address"),

            SizedBox(height: 12),

            // Name Fields
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildTextField("Zip Code"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildDropdown(
                      "City",
                      _selectedCity,
                      [
                        "Cairo",
                        "Alex",
                        "Luxor",
                        "Aswan",
                      ],
                      (value) => setState(() => _selectedCity = value),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Name Fields
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildDropdown(
                      "Language",
                      _selectedLanguage,
                      [
                        "Arabic",
                        "English",
                        "French",
                      ],
                      (value) => setState(() => _selectedLanguage = value),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildDropdown(
                      "Country",
                      _selectedCountry,
                      [
                        "Egypt",
                        "Denemark",
                        "England",
                      ],
                      (value) => setState(() => _selectedCountry = value),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: _gender,
          onChanged: (value) => setState(() => _gender = value),
          activeColor: Colors.orange,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildDropdown(String hint, String? value, List<String> items,
      Function(String?) onChanged) {
    return SizedBox(
      height: 45, // Ensuring same height as text fields
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        hint: Text(hint),
        value: value,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
