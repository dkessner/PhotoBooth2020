class Line
{
   float x1;
   float y1;
   float x2;
   float y2;
   float z;
   
   Line(float x1, float y1, float x2, float y2, float z)
   {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      this.z = z;
   }
   
   void display()
   {
     
      line(x1, y1, x2, y2);
   }
}