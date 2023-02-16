private double fractionLength = 0.8; 
private int smallestBranch = 10; 
private double branchAngle = .4;

public void setup() 
{   
  size(600, 500);    
  noLoop(); 
} 

public void draw() 
{      
  background(160, 230, 247);
  
  noStroke(); 
  fill(32, 214, 30);
  rect(0, 450, 600, 50); 
  
  stroke(147, 100, 49);    
  line(300,480,300,380);   
  drawBranches(300, 380, 100, 3 * Math.PI/2);  //first two are endpoints of trunk
} 

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle; 
  branchLength = branchLength * fractionLength; 
  int endX1 = (int)(branchLength * Math.cos(angle1) + x); 
  int endY1 = (int)(branchLength * Math.sin(angle1) + y); 
  int endX2 = (int)(branchLength * Math.cos(angle2) + x); 
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);
  
  if(branchLength <= 35){
    stroke(43, 170, 41); 
  } else {
    stroke(147, 100, 49);
  }
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
    
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2); 
  }
}
