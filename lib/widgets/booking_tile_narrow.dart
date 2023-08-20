import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NarrowBookingTile extends StatefulWidget {
  NarrowBookingTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      this.isDatePicker = false,
      this.isDropDown = false,
      this.dropDownItems = const [],
      this.isNumPicker = false,
      required this.controller});

  final IconData leadingIcon;
  final String title;
  final bool isDatePicker;
  final bool isDropDown;
  final bool isNumPicker;
  final List<String> dropDownItems;
  final TextEditingController controller;

  @override
  State<NarrowBookingTile> createState() => _NarrowBookingTileState();
}

class _NarrowBookingTileState extends State<NarrowBookingTile> {

  @override
  void initState() {
    super.initState();
    if (widget.isDropDown) {
      widget.controller.text = widget.dropDownItems[0];
    }
    if (widget.isNumPicker) {
      widget.controller.text = '1';
    }
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      widget.leadingIcon,
      color: Color.fromRGBO(12, 34, 55, 1),
    );
    var title = Text(
      widget.title,
      style: TextStyle(
        color: Color.fromRGBO(12, 34, 55, 1),
        fontSize: MediaQuery.of(context).size.width * 0.038,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
    return InkWell(
      onTap: () async {
        // await datePicker(context);
        if (widget.isDatePicker) {
          await datePicker(context);
        }
        if (widget.isDropDown) {
          await dropDown(context, widget.dropDownItems);
        }
        if (widget.isNumPicker) {
          await numPicker(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(12, 34, 55, 1),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            Row(
              children: [
                icon,
                Text(
                  widget.controller.text.isEmpty ? "Select Date" : widget.controller.text,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color.fromRGBO(12, 34, 55, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      //initial date to now when no date is selected but selected date when a date is selected
      initialDate: widget.controller.text.isEmpty
          ? DateTime.now()
          : DateFormat('dd/MM/yyyy').parse(widget.controller.text),
      firstDate: DateTime.now(),
      lastDate:
          DateTime.now().add(Duration(days: 3650)), // 10 years into the future
    );
    if (pickedDate != null) {
      // widget.controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      //set the state to update the UI
      setState(() {
        widget.controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  Future<void> dropDown(
      BuildContext context, List<String> dropDownItems) async {
    final RenderBox inkWellBox = context.findRenderObject() as RenderBox;
    final menuPosition = RelativeRect.fromRect(
      Rect.fromPoints(
        inkWellBox.localToGlobal(Offset(0, inkWellBox.size.height + 10)),
        inkWellBox.localToGlobal(inkWellBox.size.bottomRight(Offset.zero)),
      ),
      Offset.zero & MediaQuery.of(context).size,
    );
    final String? pickedItem = await showMenu(
      context: context,
      position: menuPosition,
      items: dropDownItems.map((String item) {
        return PopupMenuItem<String>(
            value: item,
            child: InkWell(
              onTap: () {
                Navigator.pop(context, item);
              },
              child: Text(item),
            ));
      }).toList(),
    );

    if (pickedItem != null) {
      //set the state to update the UI
      setState(() {
        widget.controller.text = pickedItem;
      });
    }
  }

  Future<void> numPicker(BuildContext context) async {
    final RenderBox inkWellBox = context.findRenderObject() as RenderBox;
    final menuPosition = RelativeRect.fromRect(
      Rect.fromPoints(
        inkWellBox.localToGlobal(Offset(0, inkWellBox.size.height + 10)),
        inkWellBox.localToGlobal(inkWellBox.size.bottomRight(Offset.zero)),
      ),
      Offset.zero & MediaQuery.of(context).size,
    );
    List<int> dropDownItems = [1, 2, 3, 4, 5];
    final int? pickedNum = await showMenu<int>(
      context: context,
      position: menuPosition,
      items: dropDownItems.map((int item) {
        return PopupMenuItem<int>(
            value: item,
            child: InkWell(
              onTap: () {
                Navigator.pop(context, item);
              },
              child: Text(item.toString()),
            ));
      }).toList(),
    );

    if (pickedNum != null) {
      //set the state to update the UI
      setState(() {
        widget.controller.text = pickedNum.toString();
      });
    }
  }
}
