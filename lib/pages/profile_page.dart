import 'package:baia_ui/constants.dart';
import 'package:baia_ui/widgets/io/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    void _selectTime(int index, bool isOpenHour) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: CupertinoTimerPicker(
              initialTimerDuration: Duration(
                hours: isOpenHour
                    ? horarioLista[index]['openHour'].hour
                    : horarioLista[index]['closeHour'].hour,
                minutes: isOpenHour
                    ? horarioLista[index]['openHour'].minute
                    : horarioLista[index]['closeHour'].minute,
              ),
              onTimerDurationChanged: (Duration newDuration) {
                setState(() {
                  if (isOpenHour) {
                    horarioLista[index]['openHour'] = TimeOfDay(
                        hour: newDuration.inHours,
                        minute: newDuration.inMinutes % 60);
                  } else {
                    horarioLista[index]['closeHour'] = TimeOfDay(
                        hour: newDuration.inHours,
                        minute: newDuration.inMinutes % 60);
                  }
                });
              },
              mode: CupertinoTimerPickerMode.hm,
            ),
          );
        },
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTextField(
              hintText: "Nombre",
            ),
            const AppTextField(
              hintText: "Descripcion",
            ),
            const Text(
              "Horario",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: horarioLista.map((item) {
                  double textFontSize = 16;
                  int index = horarioLista.indexOf(item);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item["day"],
                          style: TextStyle(fontSize: textFontSize)),
                      // Cuperti
                      Row(
                        children: [
                          CupertinoButton(
                            onPressed: () => _selectTime(index, true),
                            child: Text(
                              "${item['openHour'].format(context)}",
                              style: TextStyle(fontSize: textFontSize),
                            ),
                          ),
                          const Text("-"),
                          CupertinoButton(
                            onPressed: () => _selectTime(index, false),
                            child: Text(
                              "${item['closeHour'].format(context)}",
                              style: TextStyle(fontSize: textFontSize),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
