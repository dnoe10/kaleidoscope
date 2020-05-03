class StateManager {
  private ArrayList<Double> animationBrightnessFactors;
  private ArrayList<Color> animationColors;
  private int colorPickerLayerIndex;
  private int genericAnimationSpeedModifier;
  private int pulseAnimationDuration;
  private int strobeAnimationDuration;

  public StateManager() {
    this.animationBrightnessFactors =
        new ArrayList<Double>(Collections.nCopies(AnimationStack.NUM_LAYERS, Double.valueOf(1.0)));
    this.animationColors =
        new ArrayList<Color>(Collections.nCopies(AnimationStack.NUM_LAYERS, new Black()));
    this.colorPickerLayerIndex = AnimationStack.LAYER_0;
    this.genericAnimationSpeedModifier = Animation.DEFAULT_SPEED_MODIFIER;
    this.pulseAnimationDuration = Animation_Pulse.DEFAULT_ANIMATION_DURATION;
    this.strobeAnimationDuration = Animation_Strobe.DEFAULT_ANIMATION_DURATION;
  }

  public Double getAnimationBrightnessFactor(int animationLayerIndex) {
    return this.animationBrightnessFactors.get(animationLayerIndex);
  }

  public void setAnimationBrightnessFactor(int animationLayerIndex, double brightnessFactor) {
    this.animationBrightnessFactors.set(animationLayerIndex, brightnessFactor);
  }

  public Color getAnimationColor(int animationLayerIndex) {
    return this.animationColors.get(animationLayerIndex);
  }

  public void setAnimationColor(int pitch) {
    // Identify the color using the pitch value
    Color c = kaleidoscopeApp.colorCatalog().getColor(pitch);

    // Set the color for the currently selected layer
    this.animationColors.set(this.colorPickerLayerIndex, c);

    // Get all of the launchpad cells for the currently selected layer
    int[] launchpadRow =
        ConversionHelper.animationLayerIndexToLaunchpadRow(this.colorPickerLayerIndex);

    // Set all of the launchpad cells in the current layer to the corresponding colors
    for (int i = 0; i < launchpadRow.length; i++) {
      kaleidoscopeApp.midiController().sendNoteOn(Launchpad.CHANNEL, launchpadRow[i],
          c.launchpadColorID());
    }
  }

  public void setColorPickerLayerIndex(int pitch) {
    MidiController midiController = kaleidoscopeApp.midiController();

    // Use the current layer index to obtain the previous picker's pitch
    int previousColorPickerPitch =
        ConversionHelper.animationLayerIndexToColorPickerPitch(this.colorPickerLayerIndex);

    // Turn off the previous picker. Turn on the current one.
    midiController.sendNoteOff(Launchpad.CHANNEL, previousColorPickerPitch);
    midiController.sendNoteOn(Launchpad.CHANNEL, pitch, (new White()).launchpadColorID());

    // Update current layer index
    this.colorPickerLayerIndex = ConversionHelper.pitchToAnimationLayerIndex(pitch);
  }

  public void setCustomColorR(int value) {
    CustomColor customColor = kaleidoscopeApp.colorCatalog().getCustomColor();
    customColor.setR(value);
  }

  public void setCustomColorG(int value) {
    CustomColor customColor = kaleidoscopeApp.colorCatalog().getCustomColor();
    customColor.setG(value);
  }

  public void setCustomColorB(int value) {
    CustomColor customColor = kaleidoscopeApp.colorCatalog().getCustomColor();
    customColor.setB(value);
  }

  public int getGenericAnimationSpeedModifier() {
    return this.genericAnimationSpeedModifier;
  }

  public void setGenericAnimationSpeedModifier(int value) {
    this.genericAnimationSpeedModifier =
        (int) (value / 127.0 * Animation.DEFAULT_SPEED_MODIFIER * 3
            + Animation.DEFAULT_SPEED_MODIFIER);
  }

  public int getPulseAnimationDuration() {
    return this.pulseAnimationDuration;
  }

  public void setPulseAnimationDuration(int value) {
    this.pulseAnimationDuration =
        (int) (value / 127.0 * Animation_Pulse.DEFAULT_ANIMATION_DURATION * 3
            + Animation_Pulse.DEFAULT_ANIMATION_DURATION);
  }

  public int getStrobeAnimationDuration() {
    return this.strobeAnimationDuration;
  }

  public void setStrobeAnimationDuration(int value) {
    this.strobeAnimationDuration =
        (int) (value / 127.0 * Animation_Strobe.DEFAULT_ANIMATION_DURATION
            + Animation_Strobe.DEFAULT_ANIMATION_DURATION);
  }

  public void toggleAnimation(int animationID) {
    Animation animation = kaleidoscopeApp.animationCatalog().getAnimation(animationID);
    animation.zone().animationStack().toggleAnimation(animation);
  }

  public void enableAnimation(int animationID) {
    Animation animation = kaleidoscopeApp.animationCatalog().getAnimation(animationID);
    animation.zone().animationStack().enableAnimation(animation);
  }

  public void disableAnimation(int animationID) {
    Animation animation = kaleidoscopeApp.animationCatalog().getAnimation(animationID);
    animation.zone().animationStack().disableAnimation(animation);
  }
}
