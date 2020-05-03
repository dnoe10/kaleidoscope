abstract class Animation {
  public static final int DEFAULT_SPEED_MODIFIER = 5;

  protected boolean completed;
  /**
   * A note about frameCount:
   * This integer provides a common way to track the number of times generateFrames() has been
   * called. However, it is the responsibility of each Animation to actually increment the counter
   * and use it in whichever way is desired. It is particularly important to note that the reset()
   * method resets frameCount to 0 and that reset() is called every time an Animation is added to an
   * AnimationStack. Therefore, any Animations which DIRECTLY use frameCount to generate a frame
   * will be reset every time they are enabled. Some Animations behave this way
   * (e.g. Animation_Pulse), but most Animations don't. They use additional internal state so
   * that the Animation can "continue where it left off" when it is reactivated. The common pattern
   * used to acommplish this is to "advance" the internal state every X ticks of frameCount.
   */
  protected int frameCount;
  protected int layerIndex;
  protected int zoneID;

  abstract void generateFrames();

  public Animation(int zoneID, int layerIndex) {
    this.completed = false;
    this.frameCount = 0;
    this.layerIndex = layerIndex;
    this.zoneID = zoneID;
  }

  public boolean isComplete() {
    return this.completed;
  }

  public int layerIndex() {
    return this.layerIndex;
  }

  public int zoneID() {
    return this.zoneID;
  }

  public Zone zone() {
    return kaleidoscopeApp.zoneController().getZone(this.zoneID);
  }

  public Color getColor() {
    return kaleidoscopeApp.stateManager().getAnimationColor(this.layerIndex);
  }

  public Double brightnessFactor() {
    return kaleidoscopeApp.stateManager().getAnimationBrightnessFactor(this.layerIndex);
  }

  public int genericSpeedModifier() {
    return kaleidoscopeApp.stateManager().getGenericAnimationSpeedModifier();
  }

  public int frameSize() {
    return this.zone().frameSize();
  }

  public int numFrames() {
    return this.zone().numStrips();
  }

  // NOTE: This function is called every time an Animation is enabled.
  public void reset() {
    this.completed = false;
    this.frameCount = 0;
  }

  protected void rainbowColorTick() {
    kaleidoscopeApp.colorCatalog().getRainbowColor().tick();
  }
}
