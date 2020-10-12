import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.message,
  });

  Message message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Message({
    this.header,
    this.body,
  });

  Header header;
  List<dynamic> body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: List<dynamic>.from(json["body"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": List<dynamic>.from(body.map((x) => x)),
      };
}

class Header {
  Header({
    this.statusCode,
    this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}
