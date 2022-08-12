import 'dart:io';

var projectName = "";
var pubspecPackages = [];
var usedPackages = [];
bool dependenciesBlock = false;
Future getProjectInfo() async {
  var content = File("./pubspec.yaml").readAsStringSync();
  var lines = content.split("\n");
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    if (line.startsWith("name:")) {
      projectName = line.split(":")[1].trim();
    }

    if (line.startsWith("dependencies:")) {
      dependenciesBlock = true;
    } else if (line.startsWith("dev_dependencies:")) {
      dependenciesBlock = false;
    }

    if (dependenciesBlock) {
      if (line.trim().startsWith("dependencies:")) continue;
      if (line.trim().startsWith("flutter:")) continue;
      if (line.trim().startsWith("sdk:")) continue;
      if (line.trim().startsWith("path:")) continue;
      if (line.trim().startsWith("git:")) continue;
      if (line.trim().contains(":") == false) continue;
      if (line.trim().contains("#")) continue;

      var p = line.trim().split(":")[0];
      pubspecPackages.add(p);
    }
  }
}

Future removeUnusedPackages() async {
  var unusedPackages = [];
  for (var i = 0; i < pubspecPackages.length; i++) {
    var p = pubspecPackages[i];
    if (usedPackages.contains(p) == false) {
      unusedPackages.add(p);
    }
  }

  var content = File("./pubspec.yaml").readAsStringSync();
  var lines = content.split("\n");
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];

    if (line.contains(":")) {
      var p = line.split(":")[0].trim();
      if (unusedPackages.contains(p)) {
        lines[i] = "";
      }
    }
  }

  //remove empty lines
  for (var n = 0; n < 3; n++) {
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].trim() == "") {
        lines.removeAt(i);
      }
    }
  }
  File("./pubspec.new.yaml").writeAsStringSync(lines.join("\n"));
}

void main() async {
  await getProjectInfo();
  // return;

  var f = File("./lib/generated_plugin_registrant.dart");
  if (f.existsSync()) {
    f.deleteSync();
  }

  var dir = Directory("./lib");
  var dirs = dir.listSync(
    recursive: true,
  );

  for (var file in dirs) {
    if (file is File) {
      if (file.path.endsWith("generated_plugin_registrant.dart")) continue;
      var content = File(file.path).readAsStringSync();
      var lines = content.split("\n");

      for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        if (line.startsWith("import ") && line.contains("package:")) {
          line = line.replaceAll('"', "'");
          line = line.replaceAll(';', "");
          line = line.replaceAll("'", "");
          line = line.replaceAll("import package:", "");
          var p = line.split("/")[0];
          if (p == projectName) continue;
          if (p == "flutter") continue;

          if (usedPackages.contains(p) == false) {
            usedPackages.add(p);
          }
        }
      }
    }
  }

  await removeUnusedPackages();
  return;
}
