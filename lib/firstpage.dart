import 'package:flutter/material.dart';

class Fristpage extends StatefulWidget {
  const Fristpage({super.key});

  @override
  State<Fristpage> createState() => _FristpageState();
}

class _FristpageState extends State<Fristpage> {
  List<String> gender = ["ชาย", "หญิง", "LGBT+"];

  List<ListItem> prefix = [
    ListItem("boy", "เด็กชาย"),
    ListItem("girl", "เด็กหญิง"),
    ListItem("Mr", "นาย"),
    ListItem("Miss", "นางสาว"),
    ListItem("Mrs", "นาง"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdowmMenuItem = [];
  ListItem? _selectePrefix;

  String _selectedItem = "หญิง";
  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> prefix) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem pf in prefix) {
      items.add(DropdownMenuItem(
        value: pf,
        child: Text(pf.name),
      ));
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdowmMenuItem = buildDropdownMenuItem(prefix);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lad07 Drodown"),
      ),
      body: Column(
        children: [
          Text("เลือกเพศ"),
          DropdownButton(
            value: _selectedItem,
            items: gender.map((item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          ),
          Divider(),
          Text("คำนำหน้า"),
          DropdownButton(
              value: _selectePrefix,
              items: _dropdowmMenuItem,
              onChanged: (value) {
                setState(() {
                  _selectePrefix = value;
                });
              })
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
