
File[] listOfFiles;
int I = -1;
long time_lastUpdate = -1;
long DURATION_FLAG_VISIBLE = 10 * 1000;


void setup(){
	size(980, 980); 
	noFill();
	background(40);
	stroke(255);
  
  File folder = new File("/home/nate/src/logtest03/flags_input");
  listOfFiles = folder.listFiles();
  System.out.println("number of flags to process:\t" + listOfFiles.length);
  

}

void draw() {
  if(I >= listOfFiles.length){
    return;
  }
  
  if(System.currentTimeMillis() < time_lastUpdate + DURATION_FLAG_VISIBLE){
    return;
  }
  background(40);
  time_lastUpdate = System.currentTimeMillis(); 
  I += 1;
  
  String filename = listOfFiles[I].getAbsolutePath();
  System.out.println("");
  System.out.println("Handling flag:\t\t" + filename);
  PImage testImage = loadImage(filename);

  int padding = 10;

  for(int y=0; y<testImage.height; y++){
    float scaledX_previous = padding;
    for(int x=0; x<testImage.width; x++){

      color pixel = testImage.get(x, y);
      stroke(pixel);
      fill(pixel);

      float scaledX = padding + (80 * log(x));
      float offsetY = padding + y;
      line(scaledX_previous, offsetY, scaledX, offsetY);

      scaledX_previous = scaledX;
    }
  }

  image(testImage, padding, (2*padding) + testImage.height);

  for(int y=0; y<testImage.height; y++){
    float scaledX_previous = padding;
    for(int x=testImage.width; x>0; x--){

      color pixel = testImage.get(x, y);
      stroke(pixel);
      fill(pixel);

      float scaledX = padding + (float)Math.pow(x,2) / 400f;
      float offsetY = (3*padding) + (2*testImage.height) + y;
      line(scaledX_previous, offsetY, scaledX, offsetY);

      scaledX_previous = scaledX;
    }
  }
  
  System.out.println("Completed flag:\t\t" + (I+1) + " of " + listOfFiles.length);
  System.out.println("Waiting for duration:\t" + DURATION_FLAG_VISIBLE/1000 + "s");
  
}