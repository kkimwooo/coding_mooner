import 'dart:async';

import 'package:process_run/shell.dart';

class RunShellScript {
  static Future<String> runShellScript() async {
    var shell = Shell();
    var result = await shell.run('ls -l');
    print("??? : " + result.toString());
    return result.toString();
  }
}
