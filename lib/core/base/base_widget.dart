import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/di/locator.dart';

abstract class BaseWidget<T extends BaseViewModel> extends Widget {
  const BaseWidget({Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T viewModel);

  @protected
  onModelReady(BuildContext context, T viewModel) {}

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(this);
}

class DataProviderElement<T extends BaseViewModel> extends ComponentElement {
  DataProviderElement(BaseWidget widget) : super(widget);
  @override
  BaseWidget get widget => super.widget as BaseWidget;

  @override
  Widget build() {
    T model = getIt<T>();
    return ChangeNotifierProvider<T>(
      create: (_) {
        widget.onModelReady(this, model);
        return model;
      },
      child: Consumer<T>(
        builder: ((context, value, _) {
          return widget.build(context, value);
        }),
      ),
    );
  }
}

class ViewModelBuilder<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelBuilder(
      {super.key, required this.builder, required this.viewModel});
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => viewModel,
      child: Consumer<T>(
        builder: (context, value, _) {
          return builder(context, value);
        },
      ),
    );
  }
}

abstract class BaseState<T extends BaseViewModel, P extends StatefulWidget>
    extends State<P> {
  T model = getIt<T>();

  init(BuildContext context, T viewModel);

  Widget buildView(BuildContext context, T viewModel);

  bool _isFirst = true;
  @override
  void didChangeDependencies() {
    if (_isFirst) {
      init(context, model);
      _isFirst = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: (context, value, _) {
          return buildView(context, value);
        },
      ),
    );
  }
}
