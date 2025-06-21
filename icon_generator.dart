class IconGenerator {
  static String getMoodIconUrl(String mood) {
    switch (mood.toLowerCase()) {
      case 'stressed':
        return 'https://cdn-icons-png.freepik.com/512/166/166533.png';
      case 'tired':
        return 'https://cdn-icons-png.freepik.com/512/12579/12579168.png';
      case 'neutral':
        return 'https://cdn-icons-png.freepik.com/512/4803/4803430.png';
      case 'happy':
        return 'https://cdn-icons-png.freepik.com/512/9812/9812194.png';
      case 'content':
        return 'https://cdn-icons-png.freepik.com/512/2274/2274574.png';
      case 'calm':
        return 'https://cdn-icons-png.flaticon.com/512/742/742751.png';
      case 'energized':
        return 'https://cdn-icons-png.freepik.com/512/8380/8380251.png';
      case 'anxious':
        return 'https://cdn-icons-png.freepik.com/512/742/742752.png';
      default:
        return 'https://placehold.co/50x50/cccccc/000000?text=NA';
    }
  }
}
