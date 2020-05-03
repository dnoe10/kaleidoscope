class Animation_Twinkle extends Animation {
  private static final float BRIGHTNESS_INCREMENT = 0.01;
  private static final int NUM_STARS_PER_STRIP = 2;
  private static final int SPEED_MODIFIER = 2;

  // Determines if we are becoming brighter or dimmer, where false equates to becoming brighter
  private boolean[][] directions;
  // A matrix of strips x pixels, i.e. all of the pixels, where the value is the brightness factor
  private float[][] starMatrix;

  public Animation_Twinkle(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.directions = new boolean[this.numFrames()][this.frameSize()];
    this.starMatrix = new float[this.numFrames()][this.frameSize()];
    this.createRandomInitialState();
  }

  public void generateFrames() {
    for (int i = 0; i < this.numFrames(); i++) {
      Frame frame = this.generateFrame(i);
      this.zone().getStrip(i).mergeFrame(frame);
    }

    this.frameCount = this.frameCount == SPEED_MODIFIER ? 0 : frameCount + 1;
  }

  private void createRandomInitialState() {
    for (int i = 0; i < this.numFrames(); i++) {
      for (int j = 0; j < NUM_STARS_PER_STRIP; j++) {
        int index = this.getRandomBlankIndex(this.starMatrix[i]);
        float randomBrightness = random(1);
        float randomDirection = random(2);
        this.starMatrix[i][index] = randomBrightness;
        this.directions[i][index] = randomDirection > 1.0;
      }
    }
  }

  private Frame generateFrame(int stripIndex) {
    Frame frame = new Frame(this.frameSize());

    for (int pixelIndex = 0; pixelIndex < this.frameSize(); pixelIndex++) {
      float starBrightness = this.starMatrix[stripIndex][pixelIndex];

      if (starBrightness > 0.0) {
        Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor() * starBrightness);
        frame.setPixel(pixelIndex, pixel);
        this.advanceAnimation(stripIndex, pixelIndex);
      }
    }

    return frame;
  }

  private int getRandomBlankIndex(float[] starVector) {
    int randomIndex = (int) random(this.frameSize());

    if (starVector[randomIndex] > 0.0)
      return this.getRandomBlankIndex(starVector);

    return randomIndex;
  }

  private void advanceAnimation(int i, int j) {
    if (this.frameCount >= SPEED_MODIFIER) {
      if (!this.directions[i][j]) {
        this.starMatrix[i][j] += BRIGHTNESS_INCREMENT;
      } else {
        this.starMatrix[i][j] -= BRIGHTNESS_INCREMENT;
      }

      // If the pixel has reached maximum brightness, reverse the direction. If the pixel has
      // reached minimum brightness, reset the pixel and randomly select another one.
      if (this.starMatrix[i][j] >= 1.0) {
        this.starMatrix[i][j] = 1.0 - BRIGHTNESS_INCREMENT;
        this.directions[i][j] = true;
      } else if (this.starMatrix[i][j] <= 0.0) {
        this.starMatrix[i][j] = 0.0;
        this.directions[i][j] = false;

        int index = getRandomBlankIndex(this.starMatrix[i]);
        this.starMatrix[i][index] += BRIGHTNESS_INCREMENT;
      }
    }
  }
}
