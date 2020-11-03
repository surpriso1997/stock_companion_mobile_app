processIndexTitle(String title) {
  if (title.contains("Index")) {
    var item = title.split("Index");
    return item.first;
  } else if (title.toLowerCase().contains('manufacturing')) {
    return "Manufac & Pro";
  }
  return title;
}
