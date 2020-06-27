# README

This project is written for a specific hardware configuration in my room and is not designed to be portable. It is here merely for show and tell.

**NOTE:** Processing requires that all .pde files reside in the same-level directory. For this reason, there are no subdirectories in this project. I can remove this limitation by converting the project to pure Java, though that is not a priority at the moment.

## Demos

https://youtu.be/YYPqyf0oePs

https://youtu.be/2EUHKSSlQbg

## Files

**Kaleidoscope.pde**
This is the runner file. It contains the `setup()` and `draw()` functions required by Processing and instantiates the global `KaleidoscopeApp` object used throughout the application. It also contains some other functions that are required to be placed at the top level.

**KaleidoscopeApp.pde**
This is the global application object. It initializes the application and contains references to every class that needs to be called by a different class. If we need the Renderer class to do something, for example, we call `kaleidoscopeApp.renderer().doSomething()`. It also handles every call to `draw()`.

**Initializer.pde**
This class kicks off everything we want to do before the user can interact with the application. This includes running a performance test and initializing the colors displayed on the Launchpad.

**PerformanceTester.pde**
We run this performance test every time we start the application in order to verify we can successfully render frames to each strip at expected frame rates. We also verify that the strips are sequenced correctly, since the ordering of the strips matters for various animations.

**Color.java**
This pure Java file contains the abstract class `Color` and every implementation of that class. There are a number of statically-defined colors as well as one dynamic `CustomColor`.

**Pixel.pde**
A `Pixel` represents a single LED on a strip. It contains the RGB values to be pushed to the LED strip.

**Frame.pde**
A `Frame` is a series of `Pixels`. Each LED strip displays one frame at a time.

**Strip.pde**
Represents an LED strip. It encapsulates a `Frame` and a `BlinkyTape` object.

**BlinkyTape.pde**
This is the provided API for the LED strips. It handles the low-level serial I/O. See [https://blinkinlabs.com/blinkytape/processing/](https://blinkinlabs.com/blinkytape/processing/).

**Zone.pde**
A `Zone` is a cluster of strips with the same number of LEDs that conceptually form a cohesive unit. Zones enable the possibility of adding non-BlinkyTape LED strips to the project with varying numbers of LEDs. Currently, we define the `RadialZone`, which contains the original 12 BlinkyTape strips arranged in a radial pattern, and the `SideZone`, which will one day contain two 120-LED NeoPixel strips, one on each side of the radial.

**ZoneController.pde**
Encapsulates the various `Zones` in the application so they can be accessed by other components.

**Animation.pde**
This is where the magic happens! There are many animations in the project. Each one extends the abstract `Animation` class and must implement the abstract `generateFrames()` method. Every time Processing's `draw()` method is called, we call `generateFrames()` on every "active" animation. Each `Animation`, which is initialized with a particular `Zone`, then "prints" `Frames` to the particular `Strips` in that`Zone`. `Animations` have internal state that is "advanced" every time `generateFrames()`is called, so that calling `generateFrames()` yields the next set of `Frames` in the animation. Some `Animations` are very similar to each other so they extend from a parent class that extends from `Animation`. We will take a closer look some `Animations` later.

**AnimationStack.pde**
Each `Zone` has an `AnimationStack`. The `AnimationStack` contains the `Animations` that are currently active in that `Zone`. We call it an `AnimationStack` because the `Animations` are layered on top of each other. When we are generating frames, we first generate frames for the `Animation(s)` at the bottom layer. We then make our way up the layers, with each layer overwriting the layers underneath. This results in some `Animations` being in the "background" while others are in the "foreground."

**AnimationCatalog.pde**
This class contains a catalog of all the possible `Animations` we can use. Every `Animation`is instantiated at the start of the application and inserted into the catalog. `Animations` become "active" when they are added to an `AnimationStack`, and similarly "deactivated" when they are removed from an `AnimationStack`. The reason we instantiate `Animations` once and re-use them instead of re-instantiating them when we want them to become active is so that we can turn them off and back on again and have them "continue where they left off" instead of having them start over every time they are turned back on.

**ColorCatalog.pde**
Like the `AnimationCatalog`, the `ColorCatalog` contains every `Color` that can be used in the application.

**Renderer.pde**
After we are done generating the `Frames` for all the `Strips`, we push that data to the physical strips so they can display our beautiful patterns. The `Renderer` spawns a new thread for each `Strip`and instructs each `Strip`class to send its frame data to the physical strip via the `BlinkyTape` class. Each serial I/O operation takes a relatively significant amount of time to complete, so we parallelize them across all the threads. Otherwise, we would have to push data to one strip at a time. By using one thread per strip, we cut down on the render time by a factor equal to the amount of strips. For example, if we have 12 strips, we cut the render time (and thus increase the frame rate) by 12x. The main thread is blocked until each `Strip` reports that rendering is complete.

**MidiHardware.pde**
This is an abstract class defining a human interface device that we use to interact with the application over the MIDI protocol. The project currently makes use of two such devices - a Novation Launchpad MK2 and a Novation LaunchControl XL.

**Launchpad.pde** & **LaunchControl.pde**
These two classes are implementations of `MidiHardware`. They map human input to changes in the application's state. This is where we define which buttons, sliders, and knobs do what.

**MidiController.pde**
Like the `ZoneController`, this class encapsulates the various `MidiHardware` objects so they can be referenced from other parts of the application.

**StateManager.pde**
This is a central repository and handler for all application state that the user has control over. When a `MidiHardware` receives input from the user, it saves the new state in the `StateManager`. Other classes, such as `Animations`, then read that state from the `StateManager`. The exception to this pattern is the activating and deactivating of `Animations`. This occurs by inserting `Animations` into and removing them from an `AnimationStack`, respectively. In that case, this class serves as the intermediary between the `MidiHardware` and the `AnimationStack`.

**ConversionHelper.pde**
A helper class with utilities for converting various values into others.

**RandomHelper.pde**
A helper class with utilities for generating random values.
