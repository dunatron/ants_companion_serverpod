String sanitizeString(String input) {
  // Replace multiple spaces with a single space
  String sanitized = input.replaceAll(RegExp(r'\s+'), ' ');
  // Trim any leading or trailing spaces
  return sanitized.trim();
}
