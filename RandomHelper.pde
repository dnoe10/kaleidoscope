class RandomHelper {
  // Get a random strip from the radial zone that's not the given strip
  public Strip getRandomRadialStrip(Strip strip) {
    ArrayList<Strip> radialStrips =
        (ArrayList<Strip>) kaleidoscopeApp.zoneController().radialZone().strips().clone();
    radialStrips.remove(strip);
    int random = (int) random(radialStrips.size());
    return radialStrips.get(random);
  }
}
