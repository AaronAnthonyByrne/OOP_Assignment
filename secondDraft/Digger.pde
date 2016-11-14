class Digger
{
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float radius;

  PShape miningMachine = createShape(GROUP);

  Digger(float x, float y, float theta)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;

    create();
  }

  void create()
  {
    fill(125);
    PShape body = createShape(RECT, 0, 50, 50, 100);
    PShape drill = createShape(TRIANGLE, 0, 150, 50, 150,25,200);
    

    // Add the two "child" shapes to the parent group
    miningMachine.addChild(drill);
    miningMachine.addChild(body);
  }

  void render()
  {
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
    rotate(theta);    


    shape(miningMachine, 0, 0);
    popMatrix(); // Restore the transform
  }
}