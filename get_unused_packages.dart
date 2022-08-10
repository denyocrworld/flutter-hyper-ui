import 'dart:io';

var projectName = "";
Future getProjectInfo() async {
  var content = File("./pubspec.yaml").readAsStringSync();
  var lines = content.split("\n");
  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    if (line.startsWith("name:")) {
      projectName = line.split(":")[1].trim();
    }
  }
}

void main() async {
  await getProjectInfo();
  var dir = Directory("./lib");
  var dirs = dir.listSync(
    recursive: true,
  );

  for (var file in dirs) {
    if (file is File) {
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

          print(line);
        }
      }
    }
  }
}
