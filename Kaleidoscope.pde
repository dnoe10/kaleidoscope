import java.lang.Thread;
import java.util.Collections;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import processing.serial.*;
import themidibus.*;

// Global application object
KaleidoscopeApp kaleidoscopeApp;

void setup() {
  frameRate(200);
  kaleidoscopeApp = new KaleidoscopeApp(this);
  kaleidoscopeApp.startApplication();
}

void draw() {
  kaleidoscopeApp.draw();
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);

  if (kaleidoscopeApp != null) {
    kaleidoscopeApp.midiController().receiveNoteOn(channel, pitch, velocity);
  }
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);

  if (kaleidoscopeApp != null) {
    kaleidoscopeApp.midiController().receiveNoteOff(channel, pitch, velocity);
  }
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);

  if (kaleidoscopeApp != null) {
    kaleidoscopeApp.midiController().receiveControllerChange(channel, number, value);
  }
}

public void renderFrame0() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(0).__renderFrame();
}

public void renderFrame1() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(1).__renderFrame();
}

public void renderFrame2() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(2).__renderFrame();
}

public void renderFrame3() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(3).__renderFrame();
}

public void renderFrame4() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(4).__renderFrame();
}

public void renderFrame5() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(5).__renderFrame();
}

public void renderFrame6() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(6).__renderFrame();
}

public void renderFrame7() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(7).__renderFrame();
}

public void renderFrame8() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(8).__renderFrame();
}

public void renderFrame9() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(9).__renderFrame();
}

public void renderFrame10() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(10).__renderFrame();
}

public void renderFrame11() {
  kaleidoscopeApp.zoneController().radialZone().getStrip(11).__renderFrame();
}

public void renderFrame12() {
  kaleidoscopeApp.zoneController().sideZone().getStrip(0).__renderFrame();
}

public void renderFrame13() {
  kaleidoscopeApp.zoneController().sideZone().getStrip(1).__renderFrame();
}
