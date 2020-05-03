class LaunchControl extends MidiHardware {
  private static final int IN_DEVICE_NUM = 1;
  private static final int OUT_DEVICE_NUM = 4;
  private static final int CHANNEL = 8;

  public LaunchControl(PApplet applet) {
    super(applet, IN_DEVICE_NUM, OUT_DEVICE_NUM, CHANNEL);
  }

  public void receiveNoteOn(int pitch, int velocity) {
    return;
  }

  public void receiveNoteOff(int pitch, int velocity) {
    return;
  }

  public void receiveControllerChange(int number, int value) {
    switch (number) {
      case 19:
        kaleidoscopeApp.stateManager().setPulseAnimationDuration(value);
        break;
      case 20:
        kaleidoscopeApp.stateManager().setStrobeAnimationDuration(value);
        break;
      case 36:
        kaleidoscopeApp.stateManager().setGenericAnimationSpeedModifier(value);
        break;
      case 77:
        kaleidoscopeApp.stateManager().setCustomColorR(ConversionHelper.convert127to254(value));
        break;
      case 78:
        kaleidoscopeApp.stateManager().setCustomColorG(ConversionHelper.convert127to254(value));
        break;
      case 79:
        kaleidoscopeApp.stateManager().setCustomColorB(ConversionHelper.convert127to254(value));
        break;
      case 80:
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_0,
            ConversionHelper.convert127to1(value));
        break;
      case 81:
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_1,
            ConversionHelper.convert127to1(value));
        break;
      case 82:
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_2,
            ConversionHelper.convert127to1(value));
        break;
      case 83:
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_3,
            ConversionHelper.convert127to1(value));
        break;
      case 84:
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_4,
            ConversionHelper.convert127to1(value));
        kaleidoscopeApp.stateManager().setAnimationBrightnessFactor(AnimationStack.LAYER_5,
            ConversionHelper.convert127to1(value));
        break;
    }
  }
}
