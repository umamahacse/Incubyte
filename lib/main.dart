import 'package:flutter/material.dart';
import 'package:incubyte/constants/app_colors.dart';
import 'package:incubyte/view/string_calculator.dart';
import 'package:incubyte/view_model/string_cal_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => StringCalViewmodel()),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incubyte',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const StringCalculator(),
    );
  }
}
