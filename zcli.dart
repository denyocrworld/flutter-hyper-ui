import 'dart:io';

void main(args) {
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

  var output = File("./view_template.json");
  output.writeAsStringSync("""
{
  ${codes.join(",\n")}
}
""");

  if (File("c:/yo/owner.txt").existsSync()) {
    var output2 = File(
        r"C:\Users\denyo\Documents\FLUTTER_PROJECT\flutter-hyper-extension-vscode\snippets\view_template.json");
    output2.writeAsStringSync("""
{
  ${codes.join(",\n")}
}
""");
  }
}
