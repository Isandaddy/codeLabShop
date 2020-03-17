import 'package:flutter/cupertino.dart';
//import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; 
import 'app.dart';
import 'models/app_state_model.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized ();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  runApp(ChangeNotifierProvider<AppStateModel>(
    create: (_) => AppStateModel()..loadProducts(),
    child: CupertinoStoreApp(), 
    ));
}


