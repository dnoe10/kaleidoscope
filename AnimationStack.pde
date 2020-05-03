class AnimationStack {
  public static final int NUM_LAYERS = 6;

  public static final int LAYER_0 = 0;
  public static final int LAYER_1 = 1;
  public static final int LAYER_2 = 2;
  public static final int LAYER_3 = 3;
  public static final int LAYER_4 = 4;
  public static final int LAYER_5 = 5;

  private ArrayList<Animation> layer0Animations;
  private ArrayList<Animation> layer1Animations;
  private ArrayList<Animation> layer2Animations;
  private ArrayList<Animation> layer3Animations;
  private ArrayList<Animation> layer4Animations;
  private ArrayList<Animation> layer5Animations;

  public AnimationStack() {
    this.layer0Animations = new ArrayList<Animation>();
    this.layer1Animations = new ArrayList<Animation>();
    this.layer2Animations = new ArrayList<Animation>();
    this.layer3Animations = new ArrayList<Animation>();
    this.layer4Animations = new ArrayList<Animation>();
    this.layer5Animations = new ArrayList<Animation>();
  }

  public void toggleAnimation(Animation animation) {
    ArrayList<Animation> layer = this.getLayer(animation.layerIndex());

    if (this.isAnimationEnabledInLayer(layer, animation)) {
      this.disableAnimation(animation);
    } else {
      this.enableAnimation(animation);
    }
  }

  public void enableAnimation(Animation animation) {
    ArrayList<Animation> layer = this.getLayer(animation.layerIndex());
    animation.reset();
    
    // Only add the animation if it is not already present in the layer. Otherwise, we could have
    // multiple instances of the same animation in the same layer.
    if (!this.isAnimationEnabledInLayer(layer, animation)) {
      layer.add(animation);
    }
  }

  public void disableAnimation(Animation animation) {
    ArrayList<Animation> layer = this.getLayer(animation.layerIndex());
    this.removeAnimationFromLayer(layer, animation);
  }

  public void generateFrames() {
    this.generateFramesForLayer(LAYER_0);
    this.generateFramesForLayer(LAYER_1);
    this.generateFramesForLayer(LAYER_2);
    this.generateFramesForLayer(LAYER_3);
    this.generateFramesForLayer(LAYER_4);
    this.generateFramesForLayer(LAYER_5);
  }

  private ArrayList<Animation> getLayer(int layerIndex) {
    switch (layerIndex) {
      case LAYER_0:
        return this.layer0Animations;
      case LAYER_1:
        return this.layer1Animations;
      case LAYER_2:
        return this.layer2Animations;
      case LAYER_3:
        return this.layer3Animations;
      case LAYER_4:
        return this.layer4Animations;
      case LAYER_5:
        return this.layer5Animations;
      default:
        throw new IllegalArgumentException(
            "Invalid layer index passed to AnimationStack.getLayer()");
    }
  }

  private boolean isAnimationEnabledInLayer(ArrayList<Animation> layer, Animation animation) {
    Iterator<Animation> iterator = layer.iterator();

    while (iterator.hasNext()) {
      Animation next = iterator.next();

      if (next == animation) {
        return true;
      }
    }

    return false;
  }

  private void removeAnimationFromLayer(ArrayList<Animation> layer, Animation animation) {
    Iterator<Animation> iterator = layer.iterator();

    while (iterator.hasNext()) {
      Animation next = iterator.next();

      if (next == animation) {
        iterator.remove();
      }
    }
  }

  private void generateFramesForLayer(int layerIndex) {
    try{
      ArrayList<Animation> layer = this.getLayer(layerIndex);
      Iterator<Animation> iterator = layer.iterator();

      while (iterator.hasNext()) {
        Animation animation = iterator.next();

        if (animation.isComplete()) {
          iterator.remove();
        } else if (animation.brightnessFactor() != 0.0) {
          animation.generateFrames();
        }
      }
    } catch (ConcurrentModificationException e) {
      // Occurs when we try to add or remove an Animation whose layer we are currently generating
      // frames for. We just ignore the exception since the frames will be properly generated 
      // on the next invocation of this method and the missing frames will be imperceptible.
    }
  }
}
