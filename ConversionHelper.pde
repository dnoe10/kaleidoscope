static class ConversionHelper {
  public static int animationLayerIndexToColorPickerPitch(int animationLayerIndex) {
    switch (animationLayerIndex) {
      case AnimationStack.LAYER_5:
        return 89;
      case AnimationStack.LAYER_4:
        return 79;
      case AnimationStack.LAYER_3:
        return 69;
      case AnimationStack.LAYER_2:
        return 59;
      case AnimationStack.LAYER_1:
        return 49;
      case AnimationStack.LAYER_0:
        return 39;
      default:
        throw new IllegalArgumentException("Invalid animationLayerIndex passed to "
            + "ConversionHelper.animationLayerIndexToColorPickerPitch()");
    }
  }

  public static int[] animationLayerIndexToLaunchpadRow(int animationLayerIndex) {
    switch (animationLayerIndex) {
      case AnimationStack.LAYER_5:
        return new int[] {81, 82, 83, 84, 85, 86, 87, 88};
      case AnimationStack.LAYER_4:
        return new int[] {71, 72, 73, 74, 75, 76, 77, 78};
      case AnimationStack.LAYER_3:
        return new int[] {61, 62, 63, 64, 65, 66, 67, 68};
      case AnimationStack.LAYER_2:
        return new int[] {51, 52, 53, 54, 55, 56, 57, 58};
      case AnimationStack.LAYER_1:
        return new int[] {41, 42, 43, 44, 45, 46, 47, 48};
      case AnimationStack.LAYER_0:
        return new int[] {31, 32, 33, 34, 35, 36, 37, 38};
      default:
        throw new IllegalArgumentException("Invalid animationLayerIndex passed to "
            + "ConversionHelper.animationLayerIndexToLaunchpadRow()");
    }
  }

  // Convert an int in the range [0-127] to [0-254]
  public static int convert127to254(int value) {
    return (int) (value / 127.0 * 254.0);
  }

  // Convert an int in the range [0-127] to a double in the range [0-1]
  public static double convert127to1(int value) {
    return value / 127.0 * 1.0;
  }

  public static int pitchToAnimationLayerIndex(int pitch) {
    if (pitch >= 81 && pitch <= 89)
      return AnimationStack.LAYER_5;
    if (pitch >= 71 && pitch <= 79)
      return AnimationStack.LAYER_4;
    if (pitch >= 61 && pitch <= 69)
      return AnimationStack.LAYER_3;
    if (pitch >= 51 && pitch <= 59)
      return AnimationStack.LAYER_2;
    if (pitch >= 41 && pitch <= 49)
      return AnimationStack.LAYER_1;
    if (pitch >= 31 && pitch <= 39)
      return AnimationStack.LAYER_0;
    throw new IllegalArgumentException(
        "Invalid pitch passed to " + "ConversionHelper.pitchToAnimationLayerIndex()");
  }
}
