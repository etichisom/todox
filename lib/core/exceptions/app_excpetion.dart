class ServerError {
  String message;
  ServerError(this.message);
  @override
  String toString() {
    return message.toString();
  }
}
