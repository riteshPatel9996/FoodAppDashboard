import 'package:flutter/material.dart';
import 'package:mr_task/app/config/theme/app_theme.dart';

import '../../features/dashboard/data_model/dashboard_datamodel.dart';

class ProvinceDropDownButton extends StatefulWidget {
  final value;
  final List<dynamic>? items;
  final onChanges;

  const ProvinceDropDownButton({
    super.key,
    required this.value,
    required this.items,
    required this.onChanges,
  });

  @override
  State<ProvinceDropDownButton> createState() => _ProvinceDropDownButtonState();
}

class _ProvinceDropDownButtonState extends State<ProvinceDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10.0),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.appPrimaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9))),
      child: DropdownButtonFormField(
        decoration: const InputDecoration.collapsed(
          hintText: '',
        ),
        style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
        value: widget.value,
        onChanged: widget.onChanges,
        items: widget.items!.map<DropdownMenuItem<Province>>((value) {
          return DropdownMenuItem<Province>(
              value: value,
              child: Row(
                children: [
                  value.image != ''
                      ? Image.asset(
                          value.image,
                          height: 20,
                          width: 20,
                        )
                      : const Offstage(),
                  const SizedBox(width: 5),
                  Text(
                    value.title!,
                    style: const TextStyle(fontSize: 14.0, color: Color(0xff808080)),
                  )
                ],
              ));
        }).toList(),
      ),
    );
  }
}
