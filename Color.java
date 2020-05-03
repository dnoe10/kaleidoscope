abstract class Color {
  public abstract int r();

  public abstract int g();

  public abstract int b();

  // This corresponds to the value found in the color table in the Launchpad MK2 Programmer's
  // Reference Manual.
  public abstract int launchpadColorID();
}


class Red extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 0;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 5;
  }
}


class Orange extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 165;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 9;
  }
}


class Yellow extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 13;
  }
}


class Green extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 21;
  }
}


class Teal extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 127;
  }

  public int launchpadColorID() {
    return 33;
  }
}


class Cyan extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 254;
  }

  public int launchpadColorID() {
    return 37;
  }
}


class Blue extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 0;
  }

  public int b() {
    return 254;
  }

  public int launchpadColorID() {
    return 45;
  }
}


class Purple extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 0;
  }

  public int b() {
    return 254;
  }

  public int launchpadColorID() {
    return 49;
  }
}


class YellowGreen extends Color {
  public int r() {
    return 127;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 16;
  }
}


class LightBlue extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 127;
  }

  public int b() {
    return 254;
  }

  public int launchpadColorID() {
    return 41;
  }
}


class Magenta extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 0;
  }

  public int b() {
    return 127;
  }

  public int launchpadColorID() {
    return 54;
  }
}


class White extends Color {
  public int r() {
    return 254;
  }

  public int g() {
    return 254;
  }

  public int b() {
    return 254;
  }

  public int launchpadColorID() {
    return 2;
  }
}


class Black extends Color {
  public int r() {
    return 0;
  }

  public int g() {
    return 0;
  }

  public int b() {
    return 0;
  }

  public int launchpadColorID() {
    return 0;
  }
}


class CustomColor extends Color {
  int r;
  int g;
  int b;

  public CustomColor() {
    this.r = 0;
    this.g = 0;
    this.b = 0;
  }

  public int r() {
    return this.r;
  }

  public int g() {
    return this.g;
  }

  public int b() {
    return this.b;
  }

  public void setR(int r) {
    this.r = r;
  }

  public void setG(int g) {
    this.g = g;
  }

  public void setB(int b) {
    this.b = b;
  }

  public int launchpadColorID() {
    return 1;
  }
}


class RainbowColor extends Color {
  private Color[] colors;
  private int currentColorIndex;

  public RainbowColor() {
    this.colors = new Color[] {new Red(), new Orange(), new Yellow(), new Green(), new Teal(),
        new Cyan(), new Blue(), new Purple()};
    this.currentColorIndex = 0;
  }

  public int r() {
    return this.colors[this.currentColorIndex].r();
  }

  public int g() {
    return this.colors[this.currentColorIndex].g();
  }

  public int b() {
    return this.colors[this.currentColorIndex].b();
  }

  public int launchpadColorID() {
    return 1;
  }

  public void tick() {
    this.currentColorIndex =
        this.currentColorIndex == colors.length - 1 ? 0 : this.currentColorIndex + 1;
  }
}
