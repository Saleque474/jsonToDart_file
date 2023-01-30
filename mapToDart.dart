import 'dart:convert';

var data = {
  "Name": "Mohammad",
  "Age": 16,
  "Skills": {"python": 8, "java": 7}
};
var QuranData2 = {
  "listOfSurah": [
    {"name": "Al Fatihah"},
    {"name": "Al Kawsar"}
  ]
};
main() {
  GiveDataHere(QuranData2, "QuranData");
}

List listOfTerm = ["SecondObject", "ThirdObject", "ForthObject", "FifthObject"];
List listOfTerml = [
  "secondObject",
  "thirdObject",
  "forthObject",
  "fifthObject"
];

String aa = '';
String ab = '';
String ac = '';
String ad = '';
String ae = '';
String af = '';
String ag = '';
String ah = '';
String ai = '';
String aj = '';
String ak = '';
String al = '';
String am = '';
String an = '';
String ao = '';
String ap = '';
String aq = '';
String ar = '';
String as = '';
String at = '';
String au = '';
String av = '';
String aw = '';
String ax = '';
String ay = '';
String az = '';
List<String> collection = [
  aa,
  ab,
  ac,
  ad,
  ae,
  af,
  ag,
  ah,
  ai,
  aj,
  ak,
  al,
  am,
  an,
  ao,
  ap,
  aq,
  ar,
  as,
  at,
  au,
  av,
  aw,
  ax,
  ay,
  az,
];

GiveDataHere(var map, String mapName) {
  classFromDart(map, k: mapName);
  print(collection[0]);
  print(collection[1]);
  print(collection[2]);
  print(collection[3]);
  print(collection[4]);
  print(collection[5]);
  print(collection[6]);
  print(collection[7]);
  print(collection[8]);
  print(collection[9]);
  print(collection[10]);
  print(collection[11]);
  print(collection[12]);
  print(collection[13]);
  print(collection[14]);
  print(collection[15]);
  print(collection[16]);
  print(collection[17]);
  print(collection[18]);
  print(collection[19]);
  print(collection[20]);
  print(collection[21]);
  print(collection[22]);
  print(collection[23]);
  print(collection[24]);
  print(collection[25]);
}

void classFromDart(var a, {k, int loop = 0}) {
  if (a is Map) {
    k == null
        ? collection[loop] += "class TopObject{\n"
        : collection[loop] += "class $k{\n";
    var getThis = '';
    a.forEach((key, value) {
      String spaceClearedKey = key.toString().replaceAll(RegExp(r' '), '');
      spaceClearedKey = spaceClearedKey.replaceFirst(
          RegExp(spaceClearedKey[0]), spaceClearedKey[0].toLowerCase());
      if (value is Map) {
        var b = key.toString().replaceFirst(
            RegExp((key.toString()[0])), (key.toString()[0]).toUpperCase());

        collection[loop] += "$b ${spaceClearedKey};\n";
        classFromDart(value, k: b, loop: loop + 1);
      } else if (value is List<Map>) {
        var b = key.toString().replaceFirst(
            RegExp((key.toString()[0])), (key.toString()[0]).toUpperCase());
        collection[loop] += "List<$b> $spaceClearedKey;\n";
        classFromDart(value[0], k: b, loop: loop + 1);
      } else if (value is List) {
        if (value[0] is Map) {
          var b = key.toString().replaceFirst(
              RegExp((key.toString()[0])), (key.toString()[0]).toUpperCase());
          collection[loop] += "List<$b> $spaceClearedKey;\n";
          classFromDart(value[0], k: b, loop: loop + 1);
        } else {
          collection[loop] += "${value.runtimeType} ${spaceClearedKey};\n";
        }
      } else if (value == null) {
        collection[loop] += "dynamic ${spaceClearedKey};\n";
      } else {
        collection[loop] += "${value.runtimeType} ${spaceClearedKey};\n";
      }

      spaceClearedKey = spaceClearedKey.replaceFirst(
          RegExp(spaceClearedKey[0]), spaceClearedKey[0].toLowerCase());
      getThis += "this.${spaceClearedKey}, ";
    });

    collection[loop] +=
        k == null ? "TopObject($getThis);\n" : "$k($getThis);\n";

    collection[loop] +=
        'factory ${k == null ? "TopObject" : k}.fromJson(Map json)\n';
    collection[loop] += '    {\n';
    collection[loop] += '    return ${k == null ? "TopObject" : k}(\n';
    a.forEach((key, value) {
      var b = key.toString().replaceFirst(
          RegExp((key.toString()[0])), (key.toString()[0]).toUpperCase());
      if (value is Map) {
        collection[loop] += ' $b.fromJson(json["$key"]),\n';
      } else if (value is List<Map>) {
        collection[loop] +=
            ' (json["$key"] as List<dynamic>).map((e) => $b.fromJson(e)).toList(),\n';
      } else if (value is List) {
        if (value[0] is Map) {
          collection[loop] +=
              ' (json["$key"] as List<dynamic>).map((e) => $b.fromJson(e)).toList(),\n';
        } else {
          collection[loop] += ' json["$key"],\n';
        }
      } else {
        collection[loop] += ' json["$key"],\n';
      }
    });
    collection[loop] += '           );\n';
    collection[loop] += '     }\n';
    collection[loop] += "}\n";
  } else if (a is List<Map>) {
    collection[loop] += "class ${k == null ? "TopObject" : k} {\n";
    collection[loop] += "List<${listOfTerm[loop]}> ${listOfTerml[loop]};\n";
    collection[loop] +=
        "${k == null ? "TopObject" : k}(this.${listOfTerml[loop]});\n";
    collection[loop] +=
        "factory ${k == null ? "TopObject" : k}.fromJson(List<Map> json){ \n return ${k == null ? "TopObject" : k}(json.map((e) => ${listOfTerm[loop]}.fromJson(e)).toList());  \n   }\n";
    collection[loop] += "}";
    classFromDart(a[0], k: "${listOfTerm[loop]}", loop: loop + 1);
  } else if (a is String) {
    classFromDart(jsonDecode(a), k: k);
  }
  errors(a);
}

void errors(a) {
  if (a is int) {
    print("error for int");
  } else if (a is double) {
    print("error for double");
  }
}
