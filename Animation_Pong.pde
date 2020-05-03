class Animation_Pong extends Animation {
  private static final int PONG_LENGTH = 20;

  // Determines if we are moving towards the end or the beginning of the strip, where true means
  // moving towards the end
  private boolean[] directions;
  // Keeps track of the starting index of each see saw
  private int[] startingIndices;

  public Animation_Pong(int zoneID, int index) {
    super(zoneID, index);
    this.directions = new boolean[this.numFrames()];
    this.startingIndices = new int[this.numFrames()];
    this.createRandomInitialState();
  }

  public void generateFrames() {
    for (int i = 0; i < this.numFrames(); i++) {
      Frame frame = this.generateFrame(i);
      this.zone().getStrip(i).mergeFrame(frame);
      this.advanceAnimation(i);
    }

    this.frameCount = this.frameCount >= this.genericSpeedModifier() ? 0 : frameCount + 1;
  }

  private void createRandomInitialState() {
    for (int i = 0; i < this.numFrames(); i++) {
      int random = (int) random(this.zone().frameSize() - PONG_LENGTH);
      this.startingIndices[i] = random;
    }
  }

  private Frame generateFrame(int stripIndex) {
    int startingIndex = this.startingIndices[stripIndex];
    Frame frame = new Frame(this.frameSize());

    for (int i = 0; i < this.frameSize(); i++) {
      if (i >= startingIndex && i <= startingIndex + 7) {
        Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor() / 3
            + (i - startingIndex) / 8.0 * this.brightnessFactor() * 2 / 3);
        frame.setPixel(i, pixel);
      } else if (i >= startingIndex + 8 && i <= startingIndex + 11) {
        Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor());
        frame.setPixel(i, pixel);
      } else if (i >= startingIndex + 12 && i <= startingIndex + 19) {
        Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor()
            - (i - startingIndex - 12) / 8.0 * this.brightnessFactor() * 2 / 3);
        frame.setPixel(i, pixel);
      }
    }

    return frame;
  }

  private void advanceAnimation(int stripIndex) {
    if (this.frameCount == this.genericSpeedModifier()) {
      int startingIndex = this.startingIndices[stripIndex];
      boolean forwardDirection = this.directions[stripIndex];

      if (forwardDirection) {
        if (startingIndex >= this.frameSize() - PONG_LENGTH) {
          this.directions[stripIndex] = false;
          this.startingIndices[stripIndex] = startingIndex - 1;
        } else {
          this.startingIndices[stripIndex] = startingIndex + 1;
        }
      } else {
        if (startingIndex <= 0) {
          this.directions[stripIndex] = true;
          this.startingIndices[stripIndex] = startingIndex + 1;
        } else {
          this.startingIndices[stripIndex] = startingIndex - 1;
        }
      }
    }
  }
}
