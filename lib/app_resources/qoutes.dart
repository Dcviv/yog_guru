import 'dart:math';

class QuotesList {
  static var quotesList = [
    "Everyday is great day for yoga.",
    "The soul is here for its own joy.",
    "Yoga heals the soul.",
    "Yoga is a mirror.",
    "Life is too fast, slow down and do yoga.",
    "Yoga means addition.",
    "Yoga, it is about good to yourself.",
    "Yoga is path towards being boundness.",
    "The attitude of gratitude is the highest yoga."
  ];

  static getRandomQuotes<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
