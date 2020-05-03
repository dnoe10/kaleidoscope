class AnimationCatalog {
  private HashMap<Integer, Animation> catalog;

  public AnimationCatalog() {
    this.catalog = this.buildCatalog();
  }

  public Animation getAnimation(int id) {
    return this.catalog.get(id);
  }

  private HashMap<Integer, Animation> buildCatalog() {
    HashMap<Integer, Animation> catalog = new HashMap<Integer, Animation>();

    // This map associates Animations with their locations on the Launchpad. Since there is only one
    // Animation per location, the values can be used to uniquely identify Animations throughout the
    // application.
    catalog.put(31, new Animation_Twinkle(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(32, new Animation_Spiral(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(33, new Animation_Step_Outward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(34, new Animation_Step_Inward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(35, new Animation_Train_Outward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(36, new Animation_Train_Inward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(37, new Animation_Dot_Outward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));
    catalog.put(38, new Animation_Dot_Inward(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_0));

    catalog.put(41, new Animation_Pong(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_1));
    catalog.put(42, new Animation_Turbine(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_1));
    catalog.put(43, new Animation_Clock(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_1));
    catalog.put(48, new Animation_Dot_Random(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_1));

    catalog.put(71, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 0));
    catalog.put(72, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 1));
    catalog.put(73, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 2));
    catalog.put(74, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 3));
    catalog.put(75, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 4));
    catalog.put(76, new Animation_Pulse_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4, 5));
    catalog.put(77, new Animation_Pulse_Horizontal(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4));
    catalog.put(78, new Animation_Pulse_Vertical(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_4));

    catalog.put(81, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 0));
    catalog.put(82, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 1));
    catalog.put(83, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 2));
    catalog.put(84, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 3));
    catalog.put(85, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 4));
    catalog.put(86, new Animation_Strobe_Sixth(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5, 5));
    catalog.put(87, new Animation_Strobe_Horizontal(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5));
    catalog.put(88, new Animation_Strobe_Vertical(ZoneController.RADIAL_ZONE, AnimationStack.LAYER_5));

    return catalog;
  }
}
