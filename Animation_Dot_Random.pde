class Animation_Dot_Random extends Animation {
  private static final int SPEED_MODIFIER = 3;

  private int[] randomPositions;

  public Animation_Dot_Random(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.randomPositions = this.generateRandomPositions();
  }

  public void generateFrames() {
    for (int i = 0; i < this.numFrames(); i++) {
      Frame frame = this.generateFrame(i);
      this.zone().getStrip(i).mergeFrame(frame);
    }

    if (this.frameCount >= SPEED_MODIFIER) {
      this.frameCount = 0;
      this.randomPositions = this.generateRandomPositions();
    } else {
      this.frameCount++;
    }
  }

  private Frame generateFrame(int stripIndex) {
    Frame frame = new Frame(this.frameSize());
    Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor());
    int position = this.randomPositions[stripIndex];

    frame.setPixel(position, pixel);

    return frame;
  }

  private int[] generateRandomPositions() {
    int[] positions = new int[this.numFrames()];

    for (int i = 0; i < this.numFrames(); i++) {
      positions[i] = (int) random(this.frameSize());
    }

    return positions;
  }
}
