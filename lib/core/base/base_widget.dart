import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_flutter/core/base/base_view_model.dart';
import 'package:wordpress_flutter/core/di/locator.dart';

abstract class BaseWidget<T extends Cubit<K>, K extends BaseCubitState>
    extends Widget {
  const BaseWidget({Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T viewModel, K state);

  @protected
  onModelReady(BuildContext context, T viewModel) {}

  @override
  DataProviderElement<T, K> createElement() => DataProviderElement<T, K>(this);
}

class DataProviderElement<T extends Cubit<K>, K extends BaseCubitState>
    extends ComponentElement {
  DataProviderElement(BaseWidget widget) : super(widget);
  @override
  BaseWidget get widget => super.widget as BaseWidget;

  @override
  Widget build() {
    T model = getIt<T>();
    return BlocProvider<T>(
      create: (_) {
        widget.onModelReady(this, model);
        return model;
      },
      child: BlocBuilder<T, K>(
        builder: ((context, value) {
          return widget.build(context, model, value);
        }),
      ),
    );
  }
}

class ViewModelBuilder<T extends Cubit<K>, K extends BaseCubitState>
    extends StatelessWidget {
  const ViewModelBuilder(
      {super.key, required this.builder, required this.viewModel});
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel, K state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => viewModel,
      child: BlocBuilder<T, K>(
        builder: (context, value) {
          return builder(context, viewModel, value);
        },
      ),
    );
  }
}

abstract class BaseState<T extends Cubit<K>, K extends BaseCubitState,
    P extends StatefulWidget> extends State<P> {
  T model = getIt<T>();

  init(BuildContext context, T viewModel);

  Widget buildView(BuildContext context, T viewModel, K state);

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
    return BlocProvider<T>(
      create: (_) => model,
      child: BlocBuilder<T, K>(
        builder: (context, value) {
          return buildView(context, model, value);
        },
      ),
    );
  }
}
