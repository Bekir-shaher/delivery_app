// يزيل المحارف الخفية مثل U+200E من نصوص الـ API
String cleanText(String? s) {
  return (s ?? '')
      .replaceAll(RegExp(r'[\u200E\u200F\u202A-\u202E]'), '')
      .trim();
}
