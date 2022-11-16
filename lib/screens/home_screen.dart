import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zalik_task/widgets/data_html.dart';
import 'package:zalik_task/widgets/dropdown_button.dart';

import '../model/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDropDownButton(
                  onChanged: context.read<HomeModel>().setInstitute,
                  value: context.watch<HomeModel>().institute,
                  items: context.watch<HomeModel>().itemsInstitute),
              CustomDropDownButton(
                  onChanged: context.read<HomeModel>().setGroup,
                  value: context.watch<HomeModel>().group,
                  items: context.watch<HomeModel>().getGroups()),
              ElevatedButton(
                  onPressed: (() {
                    context.read<HomeModel>().pressShow();
                  }),
                  child: const Text('SHOW'))
            ],
          ),
        ),
        const DataHtml()
      ],
    ));
  }
}
