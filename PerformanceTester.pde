class PerformanceTester {
  public void runPerformanceTest() {
    println("Running performance test:");
    int summedFrameRates = 0;

    // For num pixels in the largest frame
    for (int i = 0; i < Frame.FRAME_SIZE_120; i++) {
      int time = millis();

      this.setRadialZoneFrames(i);
      // this.setSideZoneFrames(i);
      kaleidoscopeApp.renderer().renderAllFrames();

      int renderTime = millis() - time;
      int frameRate = 1000 / renderTime;
      summedFrameRates += frameRate;

      println("Frame render time: " + renderTime + "ms");
      println("Frame rate: " + frameRate + " frames per second");
    }

    println(
        "Average frame rate: " + summedFrameRates / Frame.FRAME_SIZE_120 + " frames per second");
  }

  private void setRadialZoneFrames(int i) {
    Frame frame = new Frame(Frame.FRAME_SIZE_60);

    if (i < Frame.FRAME_SIZE_60) {
      frame.setPixel(i, new Pixel(new White()));
    } else {
      frame.setPixel(Frame.FRAME_SIZE_120 - 1 - i, new Pixel(new White()));
    }

    for (Strip strip : kaleidoscopeApp.zoneController().radialZone().strips()) {
      strip.setFrame(frame);
    }
  }

  private void setSideZoneFrames(int i) {
    Frame frame = new Frame(Frame.FRAME_SIZE_120);
    frame.setPixel(i, new Pixel(new White()));

    for (Strip strip : kaleidoscopeApp.zoneController().sideZone().strips()) {
      strip.setFrame(frame);
    }
  }

  public void displayStripOrder(int delayTime) {
    println("Turning on each strip in sequence:");

    this.displayRadialZoneStripOrder(delayTime);
    // this.displaySideZoneStripOrder(delayTime);

    println("Done");
  }

  private void displayRadialZoneStripOrder(int delayTime) {
    println("Radial Zone:");

    ArrayList<Strip> radialStrips = kaleidoscopeApp.zoneController().radialZone().strips();
    Color[] colors =
        {new Red(), new Orange(), new Yellow(), new YellowGreen(), new Green(), new Teal(),
            new Cyan(), new LightBlue(), new Blue(), new Purple(), new Magenta(), new White()};

    for (int i = 0; i < radialStrips.size(); i++) {
      kaleidoscopeApp.zoneController().clearAllStrips();
      radialStrips.get(i).setFrame(new Frame(Frame.FRAME_SIZE_60, colors[i]));
      kaleidoscopeApp.renderer().renderAllFrames();

      println(i + ": " + radialStrips.get(i).port());
      delay(delayTime);
    }
  }

  private void displaySideZoneStripOrder(int delayTime) {
    println("Side Zone:");
    ArrayList<Strip> sideStrips = kaleidoscopeApp.zoneController().sideZone().strips();

    for (int i = 0; i < sideStrips.size(); i++) {
      kaleidoscopeApp.zoneController().clearAllStrips();
      sideStrips.get(i).setFrame(new Frame(Frame.FRAME_SIZE_120, new White()));
      kaleidoscopeApp.renderer().renderAllFrames();
      
      println(i + ": " + sideStrips.get(i).port());
      delay(delayTime);
    }
  }
}
