// Simulation of elastic rope / hair
// Author: Ximo Casanova

int Nrope = 100; // Number of ropes
final int Nsprings = 10;  // Number of spring
int Lrope = 150;  // Length of the strings
float Lspring = Lrope/Nsprings;  // Length of spring

float [] vE = new float [700];
int t = 0;

Hair hair;
Hair[] hairs = new Hair[Nrope];

void setup()
{
  size (700, 800);
  
  for (int np = 0; np < Nrope; np++)
  {
    PVector ini = new PVector (width * 0.3 + random(100), height * 0.3 + random(100)); //Se inicializarán en posiciones random 
    hair = new Hair (Lrope, Nsprings, ini);
    hairs[np] = hair;
  }
}

void draw()
{
  background(255);
  float Etotal = 0;
  fill(255,0,0);
  
  for (int np =0; np < Nrope; np++)
    hairs[np].update();
}

//interfaz de usuario --> se modelará mediante una función que detecta cuándo se ha seleccionado (o soltado) un pelo y se está arrastrando
void mousePressed()
{
  for (int np = 0; np < Nrope; np++)
    hairs[np].on_click();
}

void mouseReleased()
{
  for(int np = 0;np<Nrope;np++)
    hairs[np].release();
}

void plot_func(int time, int x1, int y1, int x2, int y2)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(153);
  
  rect(x1, y1, x2, y2);
  stroke(200, 210, 0);
  
  strokeWeight(1);
  stroke(255);
  
  for (int i = 0; i<time; i++)
    point(i, 600*0.5 - (vE[i] /6.5e5)*600);
}
