

public class Faces extends Filter
{
    public Faces(PImage icon, String name, PVector position, boolean show) {
       super(icon, name, position, show);
    }
    
    String name()
    {
        return "face";
    }

    PImage icon()
    {
        return icon;
    }
    
    

    void display(PGraphics pg)
    {
         pushMatrix();
         flip(pg);
        //translate(width/2, height/2);  
        //imageMode(CENTER);
        //scale(-1, 1);
        //scale(3);
        opencvfaces.loadImage(cam);
        faces = opencvfaces.detect();
        
        //image(cam, 0, 0);
       // popMatrix();
       
        drawIcons();
        noFill();
        stroke(0, 255, 0);
        strokeWeight(3);
        for (int i = 0; i < faces.length; i++) {
          if (crownBoolean) {
            println(faces[i].x, faces[i].y);
            image(crown, faces[i].x+80, faces[i].y-20, faces[i].width*1.2, faces[i].height);
          }
          else if (wigBoolean) {
           
           wigChoice(i);
          }
          
          else if (glassesBoolean)  {
           glassesChoice(i); 
          }
          
          
        }
        popMatrix();
  }
  
  void drawIcons() {
  image(crownIcon, 50, 50);
  image(wigIcon, 50, 120);
  image(glassesIcon, 50, 190);
}

void wigChoice(int i) {
  image(wigGreen, 650, 50, 60, 60);
  image(wigBoy, 650, 120, 60, 60);
  image(blondeGirl, 650, 190, 60, 60);
  image(blueClown, 650, 260, 60, 60);
  
  if (chooseWig == "green") {
    image(wigGreen, faces[i].x+100, faces[i].y+150, faces[i].width*2, faces[i].height*2.6);
  }
  else if (chooseWig == "boy") {
    image(wigBoy, faces[i].x+105, faces[i].y+95, faces[i].width*1.5, faces[i].height*1.5);
  }
  else if (chooseWig == "blondeGirl") {
    image(blondeGirl, faces[i].x+100, faces[i].y+230, faces[i].width*3.6, faces[i].height*3);
  }
  else if (chooseWig == "blueClown") {
    image(blueClown, faces[i].x+100, faces[i].y+100, faces[i].width*3, faces[i].height*3);
  }
  else {
    image(wigGreen, faces[i].x+100, faces[i].y+150, faces[i].width*2, faces[i].height*2.6);
  }
  
  
}

void glassesChoice(int i) {
  image(readingGlasses, 650, 50, 65, 50);
  image(sunglassesBasic, 650, 120, 65, 66);
  image(rainbowGlasses, 650, 190, 65, 55);
  image(skiGoggles, 650, 260, 85, 75);
  if (chooseGlasses == "reading") {
    image(readingGlasses, faces[i].x+107, faces[i].y+140, faces[i].width*1.3, faces[i].height/2);
  }
  else if (chooseGlasses == "sunglassesBasic") {
    image(sunglassesBasic, faces[i].x+110, faces[i].y+125, faces[i].width*1.2, faces[i].height);
  }
  else if (chooseGlasses == "rainbowGlasses") {
     image(rainbowGlasses, faces[i].x+110, faces[i].y+120, faces[i].width*1.2, faces[i].height*0.8);
  }
  else if (chooseGlasses == "skiGoggles") {
     image(skiGoggles, faces[i].x+110, faces[i].y+135, faces[i].width*1.8, faces[i].height*1.7);
  }
}

          
   

}