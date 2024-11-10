// Class to represent each dot
class Dot {
  double x; // Current position
  double y;
  final double originX; // Home position
  final double originY;
  double vx; // Velocity
  double vy;

  Dot({
    required this.x,
    required this.y,
    required this.originX,
    required this.originY,
    this.vx = 0,
    this.vy = 0,
  });
}
