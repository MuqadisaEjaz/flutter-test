class CreatePost {
  String type;
  String content;
  List<String> topics;

  CreatePost({
    required this.type,
    required this.content,
    required this.topics,
  });

  void setType(String newType) {
    type = newType;
  }

  void setContent(String newContent) {
    content = newContent;
  }

  void addTopic(String topic) {
    if (!topics.contains(topic)) {
      topics.add(topic);
    }
  }
}
