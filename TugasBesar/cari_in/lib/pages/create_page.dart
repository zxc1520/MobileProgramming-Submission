import 'dart:io';

import 'package:cari_in/controllers/lost_item.dart';
import 'package:cari_in/pages/home_page.dart';
import 'package:cari_in/services/signin_with_google.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController datelost = TextEditingController();

  File? image;

  Future getimage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    image = File(photo!.path);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Publikasikan barang temuan",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
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
            image != null
                ? Column(
                    children: [
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )),
                    ],
                  )
                : Container(),
            ElevatedButton(
                onPressed: () async {
                  await getimage();
                },
                child: Text("Take Photo")),
            ElevatedButton(
                onPressed: () {
                  final path = image.toString();
                  final nama = name.text;
                  final desk = desc.text;
                  final hari = datelost.text;

                  createLost(
                      path: path, name: nama, desc: desk, datelost: hari);
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
