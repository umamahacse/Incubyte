import 'package:flutter/material.dart';
import 'package:incubyte/constants/app_colors.dart';
import 'package:incubyte/view_model/string_cal_viewmodel.dart';
import 'package:provider/provider.dart';

class StringCalculator extends StatefulWidget {
  const StringCalculator({super.key});

  @override
  State<StringCalculator> createState() => _StringCalculatorState();
}

class _StringCalculatorState extends State<StringCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('String Calculator',
        style: TextStyle(color: AppColors.primaryTextColor, fontSize: 20),),),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Consumer<StringCalViewmodel>(
          builder: (context, provider, child) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Enter String',
                    style: TextStyle(color: AppColors.primaryTextColor, fontSize: 12),),
                    const SizedBox(height: 20,),
                    TextField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      controller: provider.inputStringController,
                    )
                  ]),
            );
          }
        )
            ),);
        
  }
}