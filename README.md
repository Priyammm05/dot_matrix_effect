# Interactive Dot Grid Effect 🌟

A smooth, physics-based interactive dot grid animation built with Flutter. Each dot responds to touch input, creating a fluid, engaging user experience.

https://drive.google.com/file/d/1Cg9AJD7RyO-kZ3CH2ndXk6QlpnkkUXhs/view?usp=sharing

## ✨ Features

- Interactive particle system with touch response
- Physics-based animations with:
  - Velocity and inertia
  - Spring forces
  - Friction effects
- Smooth 60fps performance
- Pure Flutter implementation (no external packages)
- Customizable parameters
- Responsive design that adapts to any screen size

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed on your machine
- Basic understanding of Flutter/Dart

### Installation

1. Add this to your app by copying the following files:
```dart
matrix_effect.dart
```

2. Import it in your project:
```dart
import 'package:your_app/matrix_effect.dart';
```

3. Use it in your app:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatrixEffect(),
    );
  }
}
```

## 🎮 Usage

The effect works out of the box with default parameters. Simply add it to your widget tree:

```dart
Scaffold(
  body: MatrixEffect(),
)
```

### Customization

You can customize the effect by modifying these constants in the MatrixEffect class:

```dart
static const double dotSize = 2.0;        // Size of each dot
static const double dotSpacing = 15;      // Space between dots
static const double touchBoundingSize = 70;   // Touch influence radius
static const double dotInertia = 0.19;    // Dot movement inertia
```

## 🛠️ How It Works

The effect uses several key Flutter concepts:

1. **CustomPainter** for efficient rendering
2. **AnimationController** for smooth animations
3. **GestureDetector** for touch handling
4. Physics calculations for natural movement

Key components:
- `Dot` class manages individual dot properties
- `DotPainter` handles the rendering
- `AnimationController` maintains 60fps updates
- Physics system includes velocity, friction, and spring forces

## ⚡ Performance

The effect is optimized for performance:
- Uses squared distances to avoid expensive sqrt operations
- Only updates dots within touch radius
- Efficient batch rendering with CustomPainter
- Minimal widget rebuilds

## 🎨 Customization Examples

### Larger Dots
```dart
static const double dotSize = 4.0;
static const double dotSpacing = 20;
```

### More Responsive Movement
```dart
static const double dotInertia = 0.3;
```

### Wider Touch Area
```dart
static const double touchBoundingSize = 100;
```


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by similar effects in web and iOS implementations
- Thanks to the Flutter team for the amazing framework
- Community feedback and contributions

## 📬 Contact

Twitter - https://x.com/priyaamm

Medium Link: https://medium.com/@priyammm/creating-an-interactive-dot-effect-in-flutter-a-deep-dive-cf0829b66716
