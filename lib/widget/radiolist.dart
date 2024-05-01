import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class radiolist extends StatefulWidget {
  final List<dynamic>? criteria;

  radiolist({this.criteria});

  @override
  _radiolistState createState() => _radiolistState();
}

class _radiolistState extends State<radiolist> {
  Map<String, String> selectedOptions = {};

  Map<String, String> getSelectedValues() {
    return selectedOptions;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.criteria == null || widget.criteria!.isEmpty) {
      // If criteria is null or empty, display nothing
      return Container();
    } else {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (widget.criteria! as List<dynamic>).map((item) {
              if (item is Map<dynamic, dynamic>) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (item.entries.toList() as List<MapEntry<dynamic, dynamic>>).map((items) {
                    List<dynamic> options = items.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        // Divider
                        Container(
                          width: 360.w,
                          height: 1.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 360.w,
                          height: 19.h,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              items.key.toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: options.map((option) {
                            if (option is String) {
                              return Row(
                                children: [
                                  Radio(
                                    value: option,
                                    groupValue: selectedOptions[items.key],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOptions[items.key] =
                                            value.toString();
                                      });
                                    },
                                  ),
                                  Text(option),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return SizedBox();
              }
            }).toList(),
          ),
        ),
      );
    }
  }
}

