import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/cubit/wellcome_cubit.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/util/validator.dart';

class WellcomePage extends StatelessWidget {
  WellcomePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _domainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      body: BlocBuilder<WellcomeCubit, WellcomeState>(
        bloc: WellcomeCubit(),
        builder: (context, state) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppDimens.l, vertical: AppDimens.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Latest article \nwith ',
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontSize: 44),
                      children: [
                        TextSpan(
                          text: ' better ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            backgroundColor: Colors.yellow.shade200,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        const TextSpan(text: ' news!'),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.m,
                    ),
                    child: const Text(
                        "Browse the best news on latest strategies, trends various tools and news in the world"),
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              style: BorderStyle.solid,
                            ),
                          ),
                          labelText: "Domain",
                          hintText: 'http:// or https://',
                          // prefixText: "http",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      controller: _domainController,
                      validator: Validator.url,
                      onFieldSubmitted: (newValue) =>
                          _formKey.currentState!.validate(),
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.l,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade200,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: .2,
                          offset: Offset(3, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<WellcomeCubit>()
                              .onSave(_domainController.text)
                              .then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                ),
                              );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.m,
                            ),
                            child: const Center(
                              child: Text("Get started"),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.xs,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1.5),
                                top:
                                    BorderSide(color: Colors.black, width: 1.5),
                                right:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_right_alt,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
