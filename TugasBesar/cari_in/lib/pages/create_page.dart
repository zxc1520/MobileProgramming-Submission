import 'package:cari_in/controllers/lost_item.dart';
import 'package:cari_in/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController datelost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextFormField(
              controller: desc,
              decoration: InputDecoration(hintText: "Desc"),
            ),
            TextFormField(
              controller: datelost,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: 'Pick-Up a date'),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  String formatedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  setState(() {
                    datelost.text = formatedDate;
                  });
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  final nama = name.text;
                  final desk = desc.text;
                  final hari = datelost.text;

                  createLost(name: nama, desc: desk, datelost: hari);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Publish Lost Item",
                  style: GoogleFonts.ubuntu(),
                ))
          ],
        ),
      ),
    );
  }
}
