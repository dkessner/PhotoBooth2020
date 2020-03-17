//hello
//gabi testing push

import processing.video.*;
import gab.opencv.Contour;
import gab.opencv.OpenCV;
boolean filterToggle = false;
boolean clear = false;

int threshold = 100;
int fps = 30;
int w = 640, h = 360;
PImage src, output;
OpenCV opencv;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;

Capture cam;
PImage mirrorIcon;
PImage tintIcon;
PImage pixelIcon;
PImage thermalCamIcon;
PImage blackWhiteIcon;
PImage paintBrushIcon;
PImage contourIcon;
PImage trash;
PImage blurIcon;
PGraphics pg;
Filter mirror;
Filter tint;
Filter pixel;
Filter thermalCam;
Filter blackWhite;
Filter paintBrush;
Filter contourLines;
Filter blur;
PVector mirrorPos = new PVector(670, 470);
PVector tintPos = new PVector(610, 470);
PVector pixelPos = new PVector(550, 470);
PVector thermalCamPos = new PVector(490,470);
PVector blackWhitePos = new PVector(430,470);
PVector paintBrushPos = new PVector(370, 470);
PVector contourPos = new PVector(310, 470);
PVector blurPos = new PVector(250,470);
ArrayList<Filter> filters;

void setup() {
  size(700, 500);
  filters = new ArrayList<Filter>();
  frameRate(fps);

    cam = new Capture(this, w,h,fps);
    cam.start(); 
    opencv = new OpenCV(this, w, h);
    opencv.gray();   

  mirrorIcon = loadImage("mirror.png");
  tintIcon = loadImage("tint.png");
  pixelIcon = loadImage("pixel.png");
  thermalCamIcon = loadImage("thermalCam.png");
  blackWhiteIcon = loadImage("blackWhite.png");
  paintBrushIcon = loadImage("paintbrush.png");
  contourIcon = loadImage("contour.png");
  blurIcon = loadImage("blur.png");
  pixelIcon.resize(70,70);
  mirrorIcon.resize(70,70);
  tintIcon.resize(60,60);
  thermalCamIcon.resize(70,70);
  blackWhiteIcon.resize(70,70);
  paintBrushIcon.resize(70,70);
  contourIcon.resize(70,70);
  blurIcon.resize(70,70);
  pg = createGraphics(700, 500);
  
  mirror = new Mirror(mirrorIcon, "mirror", mirrorPos, false);
  filters.add(mirror);
  
  tint = new Tint(tintIcon, "tint", tintPos, false);
  filters.add(tint);
  
  pixel = new Pixel(pixelIcon, "pixel", pixelPos, false);
  filters.add(pixel);
  
  thermalCam = new thermalCam(thermalCamIcon, "thermalCam", thermalCamPos, false);
  filters.add(thermalCam);
  
  blackWhite = new blackWhite(blackWhiteIcon, "blackWhite", blackWhitePos, false);
  filters.add(blackWhite);
  
  paintBrush = new paintBrush(paintBrushIcon, "Paint Brush", paintBrushPos, false);
  filters.add(paintBrush);
  
  contourLines = new contourLines(contourIcon, "contour", contourPos, false);
  filters.add(contourLines);
  
  blur = new Blur(blurIcon, "blur", blurPos, false);
  filters.add(blur);
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  background(0);  
  pushMatrix();
  translate(width/2, height/2);  
  imageMode(CENTER);
  scale(-1, 1);
  image(pg,0,0);
  popMatrix();
  pg.beginDraw();
  pg.image(cam,0,0,width,height);
  for (int i = 0; i < filters.size(); i++) {
    if (filters.get(i).show) {
      filters.get(i).display(pg);
    }
  }
  pg.endDraw();
  
  mirror.iconDraw();
  tint.iconDraw();
  pixel.iconDraw();
  thermalCam.iconDraw();
  blackWhite.iconDraw();
  paintBrush.iconDraw();
  contourLines.iconDraw();
  blur.iconDraw();
  
 
}

void mousePressed() {
  for (Filter f: filters) {
    
    if ((abs(mouseX-f.position.x) <= 30 && abs(mouseY-f.position.y) <= 30)) {
      println("worked!");
      f.show = !f.show; 
  }
  }
  if (paintBrush.show == true && abs(mouseX-650) <= 30 && abs(mouseY-50) <= 30) {
    clear = true;
    
    println("clear");
  }
}
void keyPressed() {
  if (key == ' '){
    if (second()=1){
      
  }
}
