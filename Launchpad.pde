class Launchpad extends MidiHardware {
  private static final int IN_DEVICE_NUM = 1;
  private static final int OUT_DEVICE_NUM = 4;
  private static final int CHANNEL = 0;

  public Launchpad(PApplet applet) {
    super(applet, IN_DEVICE_NUM, OUT_DEVICE_NUM, CHANNEL);
  }

  public void receiveNoteOn(int pitch, int velocity) {
    switch (pitch) {
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
        kaleidoscopeApp.stateManager().setAnimationColor(pitch);
        break;
      // case 26:
      // case 27:
      // case 28:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
        kaleidoscopeApp.stateManager().toggleAnimation(pitch);
        break;
      case 39:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
      case 41:
      case 42:
      case 43:
      // case 44:
      // case 45:
      // case 46:
      // case 47:
      case 48:
        kaleidoscopeApp.stateManager().toggleAnimation(pitch);
        break;
      case 49:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
      // case 51:
      // case 52:
      // case 53:
      // case 54:
      // case 55:
      // case 56:
      // case 57:
      // case 58:
        // kaleidoscopeApp.stateManager().enableAnimation(pitch);
        // break;
      case 59:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
      // case 61:
      // case 62:
      // case 63:
      // case 64:
      // case 65:
      // case 66:
      // case 67:
      // case 68:
      //   kaleidoscopeApp.stateManager().enableAnimation(pitch);
      //   break;
      case 69:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
        kaleidoscopeApp.stateManager().enableAnimation(pitch);
        break;
      case 79:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
        kaleidoscopeApp.stateManager().enableAnimation(pitch);
        break;
      case 89:
        kaleidoscopeApp.stateManager().setColorPickerLayerIndex(pitch);
        break;
    }
  }

  public void receiveNoteOff(int pitch, int velocity) {
    switch (pitch) {
      // case 31:
      // case 32:
      // case 33:
      // case 34:
      // case 35:
      // case 36:
      // case 37:
      // case 38:
      // case 41:
      // case 42:
      // case 43:
      // case 44:
      // case 45:
      // case 46:
      // case 47:
      // case 48:
      // case 51:
      // case 52:
      // case 53:
      // case 54:
      // case 55:
      // case 56:
      // case 57:
      // case 58:
      // case 61:
      // case 62:
      // case 63:
      // case 64:
      // case 65:
      // case 66:
      // case 67:
      // case 68:
      // case 71:
      // case 72:
      // case 73:
      // case 74:
      // case 75:
      // case 76:
      // case 77:
      // case 78:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
        kaleidoscopeApp.stateManager().disableAnimation(pitch);
      break;
    }
  }

  public void receiveControllerChange(int number, int value) {
    return;
  }
}
