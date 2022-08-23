import 'dart:convert';
import 'dart:io';

String command = "";
String value = "";

void main(args) async {
  command = args.isNotEmpty ? args[0] : "";
  value = args.length > 1 ? args[1] : "";

  switch (command) {
    case "snippet":
      generateSnippet();
      break;
    case "remove_unused":
      removeAllUnusedPackages();
      break;
    case "core":
      await CoreGenerator.run();
      break;
    case "clean":
      await CoreGenerator.run();
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

  //

  //
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

    var f = File("./lib/generated_plugin_registrant.dart");
    if (f.existsSync()) {
      f.deleteSync();
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
    File("./pubspec.yaml").writeAsStringSync(lines.join("\n"));
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

String packageName = "";
void getPackageName() async {
  var pubSpecFile = File("./pubspec.yaml");
  var content = await pubSpecFile.readAsString(
    encoding: utf8,
  );

  var lines =
      content.contains("\r\n") ? content.split("\r\n") : content.split("\n");

  var selectedLines =
      lines.where((line) => line.startsWith("name: ")).toList()[0];

  packageName = selectedLines.split("name: ")[1];
  packageName = packageName.replaceAll("\r\n", "");
  packageName = packageName.replaceAll("\n", "");
  packageName = packageName.replaceAll(RegExp(r"/^\s\n+|\s\n+$/g"), "");
  packageName = packageName;

  packageName.split("\n")[0];
}

class CommonPackageExporter {
  static List commonExternalImportList = [
    "export 'package:get/get.dart';",
  ];

  static run() {
    var file = File("./lib/core.dart");
    var content = file.readAsStringSync();

    content += "\n" + commonExternalImportList.join("\n");

    file.writeAsStringSync(content);
  }
}

class CoreGenerator {
  /*
  A serious problem that occurs when we are activated: A package, can have the same class as other packages. So that an error occurs because the same class is recognized as more than 1.
  For now, it is highly recommended not to use it.
  */
  static bool appendExternalImportToCore = false;
  static List externalImportList = [];

  static run() async {
    externalImportList = [];
    List importStringList = [];

    Directory dir = Directory('./lib');
    await dir.list(recursive: true).forEach((f) {
      if (!f.path.endsWith(".dart")) return;
      if (f.path.contains("config.dart")) return;
      if (f.path.contains("generated_plugin_registrant.dart")) return;

      var fileName = cleanFileName(f.path);
      var importString = getImportString(fileName);

      importStringList.add(importString);
      cleanImportScript(f.path);
    });

    generateCoreFile(importStringList);

    if (appendExternalImportToCore) {
      appendCoreFileWithExternalImport();
    }

    CommonPackageExporter.run();
  }

  static cleanFileName(String fileName) {
    fileName = fileName.replaceAll("./", "");
    fileName = fileName.replaceAll("\\", "/");
    return fileName;
  }

  static getImportString(String fileName) {
    fileName = fileName.substring(4);
    return 'package:$packageName/$fileName';
  }

  static generateCorePackageFile() {
    List imports = [];
    var f = File("./pubspec.yaml");
    var pubspecContent = f.readAsStringSync();
    var lines = pubspecContent.split("\n");
    var read = false;

    for (var i = 0; i < lines.length; i++) {
      var line = lines[i].trim();

      //--------------
      var blocks = [
        "flutter_lints",
        "flutter_html",
        "permission_handler",
        "latlong2",
        "geolocator",
      ];
      if (read) {
        if (line == "flutter:") continue;
        if (line == "sdk: flutter") continue;
        if (line.contains(".") == false) continue;
        if (line.contains("#") == true) continue;
        if (line.contains("#ignore_import")) continue;

        var extraPackageName = line.split(":")[0];
        if (blocks.contains(extraPackageName)) continue;

        imports
            .add("export 'package:$extraPackageName/$extraPackageName.dart';");
      }
      //--------------

      if (line == "dependencies:") {
        read = true;
      } else if (line == "dev_dependencies:" ||
          line == "dependency_overrides:") {
        read = false;
      }
    }

    var fcp = File("./lib/core_package.dart");
    fcp.writeAsStringSync(imports.join("\n"));
  }

  static generateCoreFile(List importStringList) {
    // var sorting = ["module", "api", "shared"];
    generateCorePackageFile();
    var content = "";
    content += "export './core_package.dart';\n";

    for (var importString in importStringList) {
      content += "export '$importString';\n";
    }

    var file = File("./lib/core.dart");
    file.writeAsStringSync(content);
  }

  static appendCoreFileWithExternalImport() {
    var file = File("./lib/core.dart");
    var content = file.readAsStringSync();

    //Remove Duplicates
    externalImportList = externalImportList.toSet().toList();

    //Remove Common Package
    externalImportList.where((line) =>
        CommonPackageExporter.commonExternalImportList.contains(line));

    content += "\n" + externalImportList.join("\n");

    file.writeAsStringSync(content);
  }

  static cleanImportScript(filePath) {
    if (filePath.toString().contains("core.dart")) return;

    var file = File(filePath);
    var content = file.readAsStringSync();

    List lines = content.split("\n");

    var packageImportInLines = lines
        .where((line) => line.toString().contains("package:$packageName"))
        .toList();

    var needImportCore = false;
    if (packageImportInLines.isNotEmpty) {
      var coreImportInlines =
          lines.where((line) => line.toString().contains("core.dart")).toList();

      if (coreImportInlines.isEmpty) needImportCore = true;
    }

    lines.removeWhere((line) =>
        line.toString().contains("package:$packageName") &&
        !line.toString().contains("core.dart"));

    var externalPackageImportLines = lines
        .where(
          (line) =>
              line.toString().startsWith("import") &&
              !line.toString().contains("package:$packageName") &&
              !line.toString().contains("as ") &&
              line.toString().contains("package:flutter") == false &&
              line.toString().contains("dart:") == false,
        )
        .toList();

    if (appendExternalImportToCore) {
      externalPackageImportLines.removeWhere(
        (line) =>
            line.toString().contains("package:") == false &&
            line.toString().contains("dart:") == false,
      );

      //!important : Its must be removed before change the import String to Export
      lines.removeWhere((line) => externalPackageImportLines.contains(line));

      for (var i = 0; i < externalPackageImportLines.length; i++) {
        externalPackageImportLines[i] = externalPackageImportLines[i]
            .toString()
            .replaceFirst("import", "export");
      }

      externalImportList.addAll(externalPackageImportLines);
    }

    if (needImportCore) {
      var coreImportScript = "import 'package:$packageName/core.dart';";
      lines.insert(0, coreImportScript);
    }

    file.writeAsStringSync(lines.join("\n"));
  }
}
