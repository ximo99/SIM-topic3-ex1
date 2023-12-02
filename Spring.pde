// Class Spring
class Spring
{
  PVector wide;
  PVector fA, fB;
  
  float k = 80;
  float am = 10;
  float len, Epe, elongation;
  
  Extreme a;
  Extreme b;
  
  Spring (Extreme a_, Extreme b_, float l)
  {
    a = a_;
    b = b_;
    len = l;
    
    wide = new PVector(b.s.x - a.s.x, b.s.y - a.s.y);
    
    fA = new PVector();
    fB = new PVector();
  }
  
  // Update spring forces in different directions
  void update()
  {
    wide.x = b.s.x - a.s.x;
    wide.y = b.s.y - a.s.y;
    
    // Get the current elongation
    elongation = wide.mag() - len;
    wide.normalize();
    
    // Addition of the forces exerted on the springs
    // Elastic force - Damping force
    fA.x = k* wide.x* elongation - (a.v.x - b.v.x)*am;
    fA.y = k* wide.y* elongation - (a.v.y - b.v.y)*am;
    
    // This force must be applied to both ends
    a.applyForce(fA);
    
    fB.x = -k* wide.x* elongation - (b.v.x - a.v.x)*am;
    fB.y = -k* wide.y* elongation - (b.v.y - a.v.y)*am;
    b.applyForce(fB);
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(0);
    line(a.s.x, a.s.y, b.s.x, b.s.y);
  }
}
