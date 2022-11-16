import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../data/configurations.dart';
import '../model/home_model.dart';

class DataHtml extends StatelessWidget {
  const DataHtml({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<HomeModel>().initialized
        ? context.watch<HomeModel>().dataLoaded
            ? context.watch<HomeModel>().error
                ? const Text('Something went wrong')
                : Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Html(
                        data: context
                            .watch<HomeModel>()
                            .document
                            .getElementsByClassName(Configs.parseClassName)
                            .first
                            .innerHtml,
                      ),
                    ),
                  )
            : const CircularProgressIndicator()
        : const Text(
            'Press SHOW to see the result',
            style: TextStyle(
              fontSize: 15,
            ),
          );
  }
}
