import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_map/route_map.dart';
import 'package:wordpress_flutter/app/data/model/language/language_model.dart';
import 'package:wordpress_flutter/app/presentation/home_page/home_page.dart';
import 'package:wordpress_flutter/app/presentation/wellcome/cubit/wellcome_cubit.dart';
import 'package:wordpress_flutter/app/router/router.routes.dart';
import 'package:wordpress_flutter/core/base/base_widget.dart';
import 'package:wordpress_flutter/core/res/decorations.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';
import 'package:wordpress_flutter/core/util/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RouteMap(name: "/")
class WellcomePage extends BaseWidget<WellcomeCubit, WellcomeState> {
  const WellcomePage({super.key});

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
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
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
                  child: Text(
                    AppLocalizations.of(context).wellcomeSubtitle,
                  ),
                ),
                const Spacer(flex: 1),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: AppDecorations.domainInputDecoration,
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
                const SizedBox(height: AppDimens.l),
                DropdownButtonFormField<Language>(
                  decoration: AppDecorations.languageSelectorInputDecoration,
                  value: Language(1, "Türkçe", "🇹🇷", "tr"),
                  items: [
                    Language(1, "Türkçe", "🇹🇷", "tr"),
                    Language(2, "English", "🇺🇸", "en"),
                  ]
                      .map(
                        (Language e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.flag),
                              Text(e.languageCode),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {},
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
