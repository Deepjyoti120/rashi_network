import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:rashi_network/services/api/api_access.dart';
import 'package:rashi_network/ui/custom/custom_text_form.dart';
import 'package:rashi_network/ui/widgets/progress_circle.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_utlis.dart';
import 'package:rashi_network/views/address/add_address.dart';
import 'package:rashi_network/views/kundali/free_kundali/details_check.dart';
import 'package:rashi_network/views/kundali/free_kundali/enter_details.dart';

class FreeKundali extends StatefulWidget {
  const FreeKundali({super.key});

  @override
  State<FreeKundali> createState() => _FreeKundaliState();
}

class _FreeKundaliState extends State<FreeKundali> {
  int selected = 0;
  final TextEditingController _searchController = TextEditingController();
  String _selectedLocation = '';
  String _selectedAddress = 'Search Address';
  Future<List<Location>> _searchLocations(String query) async {
    List<Location> locations = await locationFromAddress(query);
    // return locations;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      locations[0].latitude,
      locations[0].longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String formattedAddress =
          '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.thoroughfare} ';
      setState(() {
        _selectedAddress = formattedAddress;
      });
    } else {
      setState(() {
        _selectedAddress = 'Address not found';
      });
    }
    return locations;
  }

  Future<void> _onLocationSelected(Location location) async {
    setState(() {
      _searchController.text = _selectedAddress;
      _selectedLocation = '${location.latitude},${location.longitude}';
    });
  }

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat _timeFormat = DateFormat('HH:mm:ss');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = _timeFormat
            .format(DateTime(2023, 1, 1, pickedTime.hour, pickedTime.minute));
      });
    }
  }

  String getFormattedDateTime() {
    if (_selectedDate != null && _selectedTime != null) {
      final String formattedDate = _dateFormat.format(_selectedDate!);
      final String formattedTime = _timeFormat.format(
          DateTime(2023, 1, 1, _selectedTime!.hour, _selectedTime!.minute));

      // Adding "T" between date and time and timezone at the end
      return '${formattedDate}T$formattedTime+05:30';
    }
    return '';
  }

  final formState = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Form(
        key: formState,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: DesignColor.darkTeal2,
            title: const DesignText(
              'Enter Details',
              color: Colors.white,
              fontSize: 20,
              fontWeight: 700,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            centerTitle: true,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: FloatingActionButton.extended(
                  backgroundColor: DesignColor.darkTeal,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FreeKundaliDetails(),
                        ));

                    if (_selectedLocation.isEmpty) {
                      DesignUtlis.flutterToast('Address Required');
                    } else if (formState.currentState!.validate()) {
                      if (kDebugMode) {
                        print(getFormattedDateTime());
                        print(_selectedLocation);
                      }
                      setState(() => isLoading = true);
                      ApiAccess()
                          .orderGenerateFreeKundali(
                        coordinates: _selectedLocation,
                        datetime: getFormattedDateTime(),
                      )
                          .catchError((error, stackTrace) {
                        setState(() => isLoading = false);
                      }).then((value) {
                        print(value.mangalDosha!.description);
                      });
                    }
                  },
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  label: isLoading
                      ? const DesignProgress(color: Colors.white)
                      : const DesignText(
                          "Continue",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: 600,
                        )),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 60),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 56,
                  //   width: double.infinity,
                  //   child: DesignButtons(
                  //     onPressed: () async {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const AddAddress(),
                  //         ),
                  //       );
                  //     },
                  //     textLabel: 'Add New Address',
                  //     isTappedNotifier: ValueNotifier(false),
                  //     colorText: DesignColor.darkTeal,
                  //     fontSize: 16,
                  //     fontWeight: 700,
                  //     colorBorderSide: DesignColor.darkTeal,
                  //     borderSide: true,
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // ListView.builder(
                  //   itemCount: 12,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(bottom: 16),
                  //       child: Column(
                  //         children: [
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 height: 12,
                  //                 width: 20,
                  //                 child: Radio(
                  //                   activeColor: DesignColor.darkTeal,
                  //                   value: index == selected,
                  //                   groupValue: true,
                  //                   onChanged: (value) {
                  //                     setState(() {
                  //                       selected = index;
                  //                     });
                  //                   },
                  //                 ),
                  //               ),
                  //               const SizedBox(width: 8),
                  //               const DesignText(
                  //                 'Deepak Jha ',
                  //                 fontSize: 14,
                  //                 fontWeight: 700,
                  //               ),
                  //               const DesignText(
                  //                 '(Default)',
                  //                 fontSize: 10,
                  //                 fontWeight: 700,
                  //               ),
                  //             ],
                  //           ),
                  //           const SizedBox(height: 8),
                  //           const DesignText(
                  //             'Sai Siddhi Building Kajupada, Abhinav Nagar,Borivali EastMumbai, Maharashtra 400066',
                  //             fontSize: 11,
                  //             fontWeight: 400,
                  //           ),
                  //           const SizedBox(height: 12),
                  //           Row(
                  //             children: const [
                  //               DesignText(
                  //                 'Mobile No: ',
                  //                 fontSize: 11,
                  //                 fontWeight: 400,
                  //               ),
                  //               DesignText(
                  //                 '3849385968',
                  //                 fontSize: 11,
                  //                 fontWeight: 600,
                  //               ),
                  //             ],
                  //           ),
                  //           const SizedBox(height: 16),
                  //           Row(
                  //             children: [
                  //               SizedBox(
                  //                 height: 31,
                  //                 width: 81,
                  //                 child: DesignButtons(
                  //                   onPressed: () async {},
                  //                   textLabel: 'Edit',
                  //                   isTappedNotifier: ValueNotifier(false),
                  //                   sideWidth: 1,
                  //                   colorText: DesignColor.darkTeal1,
                  //                   borderSide: true,
                  //                   colorBorderSide: DesignColor.darkTeal1,
                  //                   fontSize: 12,
                  //                   fontWeight: 700,
                  //                   color: Colors.transparent,
                  //                 ),
                  //               ),
                  //               const SizedBox(width: 6),
                  //               SizedBox(
                  //                 height: 31,
                  //                 width: 81,
                  //                 child: DesignButtons(
                  //                   onPressed: () async {},
                  //                   textLabel: 'Remove',
                  //                   isTappedNotifier: ValueNotifier(false),
                  //                   sideWidth: 1,
                  //                   colorText: DesignColor.darkTeal1,
                  //                   borderSide: true,
                  //                   colorBorderSide: DesignColor.darkTeal1,
                  //                   fontSize: 12,
                  //                   fontWeight: 700,
                  //                   color: Colors.transparent,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           const SizedBox(height: 4),
                  //           const Divider(color: DesignColor.darkTeal, height: 1),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  const SizedBox(height: 10),
                  DesignFormField(
                    controller: _name,
                    hintText: 'Your Name',
                  ),
                  const SizedBox(height: 10),
                  TypeAheadField<Location>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search Address',
                        filled: true,
                        isDense: true,
                        fillColor: Colors.transparent,
                        // hintStyle: TextStyle(color: DesignColor.darkGrey),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.all(16),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: DesignColor.darkGrey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: DesignColor.lightGrey3, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: DesignColor.lightGrey3, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DesignColor.tapRed, width: 2.0),
                        ),
                      ),
                    ),
                    suggestionsCallback: _searchLocations,
                    itemBuilder: (context, Location location) {
                      return ListTile(
                        title: Text(_selectedAddress),
                      );
                    },
                    onSuggestionSelected: _onLocationSelected,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: DesignFormField(
                      controller: _dateController,
                      hintText: 'Select Date',
                      readOnly: true,
                      enabled: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _selectTime(context),
                    child: DesignFormField(
                      controller: _timeController,
                      hintText: 'Select Time',
                      readOnly: true,
                      enabled: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
