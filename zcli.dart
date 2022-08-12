import 'dart:io';

String command = "";
String value = "";

void main(args) {
  command = args.isNotEmpty ? args[0] : "";
  value = args.length > 1 ? args[1] : "";

  switch (command) {
    case "snippet":
      generateSnippet();
      break;
    case "remove_unused":
      removeAllUnusedPackages();
      break;
  }
}

generateSnippet() async {
  var dir = Directory("./lib");
  var dirs = dir.listSync(
    recursive: true,
  );

  List codes = [];
  List code = [];
  String prefix = "";
  bool read = true;

  for (var file in dirs) {
    if (file is File) {
      String path = file.path;
      path = path.toString().replaceAll("\\", "/");

      String content = File(path.toString()).readAsStringSync();
      var lines = content.split("\n");

      for (var i = 0; i < lines.length; i++) {
        var line = lines[i];

        if (line.contains("#TEMPLATE")) {
          //start
          prefix = line.split(" ").last;
          code = [];
          read = true;
        } else if (line.contains("#END")) {
          //end

          for (var i = 0; i < code.length; i++) {
            code[i] = code[i].toString().replaceAll('"', '\\"').trim();
            code[i] = code[i].toString().replaceAll('\\\$', '\\\\\$').trim();

            if (i == code.length - 1) {
              code[i] = "\"${code[i]}\$2\"";
            } else {
              code[i] = "\"${code[i]}\",";
            }
          }

          codes.add("""
            "${prefix.trim()}": {
                "prefix": "${prefix.trim()}",
                "body": [
                    ${code.join("\n")}
                ]
            }
          """);

          read = false;
        } else {
          if (read) {
            code.add(line);
          }
        }
      }

      File(path.toString()).writeAsStringSync(lines.join("\n"));
    }
    if (file is Directory) {}
  }

  if (File("c:/yo/owner.txt").existsSync()) {
// //     var output = File("./template.json");
// //     output.writeAsStringSync("""
// // {
// //   ${codes.join(",\n")}
// // }
// // """);

    var output2 = File(
        r"C:\Users\denyo\Documents\FLUTTER_PROJECT\flutter-hyper-extension-vscode\snippets\template.json");
    output2.writeAsStringSync("""
{
  ${codes.join(",\n")}
}
""");

    // ignore: avoid_print
    print("Snippet is Generated!");
  }
}

removeAllUnusedPackages() async {
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
