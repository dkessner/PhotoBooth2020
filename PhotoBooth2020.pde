import processing.video.Capture;
import java.awt.Rectangle;
import processing.video.*;
import gab.opencv.Contour;
import gab.opencv.OpenCV;
boolean filterToggle = false;
boolean clear = false;

int threshold = 100;
int fps = 60;
int w = 640, h = 360;
PImage src, output;
OpenCV opencv;
Rectangle[] faces;
OpenCV opencvfaces;

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
PImage faceIcon;
PImage one,two,three;
int numFrames = 3;
int frame = -1;
PImage[] countdown = new PImage[numFrames];
PGraphics pg;
Filter mirror;
Filter tint;
Filter pixel;
Filter thermalCam;
Filter blackWhite;
Filter paintBrush;
Filter contourLines;
Filter blur;
Filter face;
PVector mirrorPos = new PVector(670, 470);
PVector tintPos = new PVector(610, 470);
PVector pixelPos = new PVector(550, 470);
PVector thermalCamPos = new PVector(490,470);
PVector blackWhitePos = new PVector(430,470);
PVector paintBrushPos = new PVector(370, 470);
PVector contourPos = new PVector(310, 470);
PVector blurPos = new PVector(250,470);
PVector facePos = new PVector(190, 470);
ArrayList<Filter> filters;
//ArrayList<Filter> possiblefilters;
//ArrayList<Filter> appliedfilters;

PImage crown;
PImage crownIcon;
PImage wigGreen;
PImage wigIcon;
PImage wigBoy;
PImage blondeGirl;
PImage blueClown;
PImage readingGlasses;
PImage glassesIcon;
PImage sunglassesBasic;
PImage rainbowGlasses;
PImage skiGoggles;

Boolean crownBoolean = false;
Boolean wigBoolean = false;
Boolean glassesBoolean = false;

String chooseWig = "green";
String chooseGlasses = "reading";
String hat;


void setup() {
  size(700, 500);
  filters = new ArrayList<Filter>();
//possiblefilters = new ArrayList<Filter>();
//appliedfilters = new ArrayList<Filter>();

  frameRate(fps);

    cam = new Capture(this, w,h,fps);
    cam.start(); 
    opencv = new OpenCV(this, w, h);
    opencv.gray();  
    
    opencvfaces = new OpenCV(this, w, h);
    opencvfaces.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
   
    
    crown = loadImage("crown.png");
  crown.resize(90, 70);
  
  crownIcon = loadImage("crownIcon.png");
  crownIcon.resize(60, 60);
  
  wigGreen =  loadImage("wig.png");
  
  wigIcon = loadImage("wigIcon.png");
  faceIcon = loadImage("wigIcon.png");
  wigIcon.resize(60, 60);
  
  wigBoy = loadImage("boyWig.png");
  
  blondeGirl = loadImage("blonde.png");
  blueClown = loadImage("blueClown.png");
  
  readingGlasses = loadImage("readingGlasses.png");
  glassesIcon = loadImage("glassesIcon.png");
  glassesIcon.resize(65, 55);
  
  sunglassesBasic = loadImage("sunglassesBasic.png");
  rainbowGlasses = loadImage("rainbowGlasses.png");
  skiGoggles = loadImage("skiGoggles.png");

  mirrorIcon = loadImage("mirror.png");
  tintIcon = loadImage("tint.png");
  pixelIcon = loadImage("pixel.png");
  thermalCamIcon = loadImage("thermalCam.png");
  blackWhiteIcon = loadImage("blackWhite.png");
  paintBrushIcon = loadImage("paintbrush.png");
  contourIcon = loadImage("contour.png");
  blurIcon = loadImage("blur.png");
  countdown[2] = loadImage("one.png");
  countdown[1] = loadImage("two.png");
  countdown[0] = loadImage("three.png");
  pixelIcon.resize(70,70);
  mirrorIcon.resize(70,70);
  tintIcon.resize(60,60);
  thermalCamIcon.resize(70,70);
  blackWhiteIcon.resize(70,70);
  paintBrushIcon.resize(70,70);
  contourIcon.resize(70,70);
  blurIcon.resize(70,70);
  faceIcon.resize(70, 70);
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
  
  face = new Faces(faceIcon, "face", facePos, false);
  filters.add(face);
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
  face.iconDraw();
  
  if (key == ' '){
      //PImage photo = get(0,0,width,470);
      frame = frame+1;
    if (frame >= numFrames){
      saveFrame("photobooth-####.png");
    }
    if (frame > numFrames){
      image(countdown[frame],width/2,height/2);
    }
  }
}

void mousePressed() {
  for (Filter f: filters) {
    
    if ((abs(mouseX-f.position.x) <= 30 && abs(mouseY-f.position.y) <= 30)) {
      println("worked!");
      f.show = !f.show; 
      //if (possiblefilters.get(possiblefilters.indexOf(f)) != null)
        // {
          //Filter temp = possiblefilters.get(possiblefilters.indexOf(f);
          //possiblefilters.remove(possiblefilters.indexOf(f));
          //appliedfilters.add(temp);
  }
  }
  if (paintBrush.show == true && abs(mouseX-650) <= 30 && abs(mouseY-50) <= 30) {
    clear = true;
    
    println("clear");
  }
  if (face.show == true) {
      if (mouseX <70 && mouseY <70) {
        crownBoolean = !crownBoolean; 
        println("crown");
     }
     else if (mouseX < 70 && mouseY>90 && mouseY <160) {
        wigBoolean = !wigBoolean; 
     }
     
     else if (mouseX <70 && mouseY>180 && mouseY<240)  {
        glassesBoolean = !glassesBoolean; 
     }
     
     if (wigBoolean == true && mouseX>630 && mouseY <70) {
        chooseWig = "green"; 
     }
     else if (wigBoolean == true && mouseX>630 && mouseY >90 && mouseY<150) {
        chooseWig = "boy"; 
     }
     else if (wigBoolean == true && mouseX>630 && mouseY > 150 && mouseY<240) {
        chooseWig = "blondeGirl"; 
     }
     else if (wigBoolean == true && mouseX>630 && mouseY > 240 && mouseY<330) {
        chooseWig = "blueClown"; 
     }
     
     if (glassesBoolean == true && mouseX>630 && mouseY <70) {
       chooseGlasses = "reading";
     }
     else if (glassesBoolean == true && mouseX>630 && mouseY >90 && mouseY <150) {
        chooseGlasses = "sunglassesBasic"; 
     }
     else if (glassesBoolean == true && mouseX >630 && mouseY >150 && mouseY <240) {
       chooseGlasses = "rainbowGlasses";
     }
     else if (glassesBoolean == true && mouseX >630 && mouseY >240 && mouseY <330) {
       chooseGlasses = "skiGoggles";
     }
    
  }
}

void keyReleased() {
    if (key == ' '){
      frame = -1;
    }
}
