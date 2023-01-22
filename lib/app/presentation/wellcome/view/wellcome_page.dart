import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/cubit/wellcome_cubit.dart';
import 'package:wordpress_flutter/app/router.routes.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/di/locator.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/source/local_data_source.dart';
import 'package:wordpress_flutter/core/util/validator.dart';

@RouteMap(name: "/")
class WellcomePage extends BaseWidget<WellcomeCubit, WellcomeState> {
  const WellcomePage({super.key});

  // @override
  // onModelReady(BuildContext context, WellcomeCubit viewModel) {
  //   if (viewModel.checkDomainRegistered() == true) {
  //     const HomePage().pushAndRemoveUntil(context, (p0) => false);
  //   }
  //   return super.onModelReady(context, viewModel);
  // }

  @override
  Widget build(
      BuildContext context, WellcomeCubit viewModel, WellcomeState state) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _domainController = TextEditingController();
    bool? isValid = viewModel.isValid;
    return Scaffold(
        backgroundColor: Colors.lightGreen.shade200,
        body: SafeArea(
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
                const Spacer(flex: 1),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                        ),
                      ),
                      labelText: "Domain",
                      hintText: 'http:// or https://',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: (isValid == null)
                          ? const Icon(Icons.question_mark)
                          : (isValid == true)
                              ? const Icon(
                                  Icons.verified_user,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                    ),
                    controller: _domainController,
                    validator: Validator.url,
                    onEditingComplete: () {
                      bool val = _formKey.currentState!.validate();
                      context.read<WellcomeCubit>().setValid = val;
                      // bool? val2 = context.read<WellcomeCubit>().isValid;
                      // print(val2);
                    },
                  ),
                ),
                const Spacer(flex: 2),
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
                              (value) => const HomePage()
                                  .pushAndRemoveUntil(context, (p0) => false),
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
                              top: BorderSide(color: Colors.black, width: 1.5),
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
                const Spacer(flex: 2)
              ],
            ),
          ),
        ));
  }
}
