import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task/features/home/presentation/providers/home_provider.dart';

class AllProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
  ];
}
