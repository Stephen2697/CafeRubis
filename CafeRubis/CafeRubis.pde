//Student: Stephen Alger C16377163

//Global ArrayLists & Variables
ArrayList<Product> products = new ArrayList<Product>(); 
ArrayList<Product> bills = new ArrayList<Product>(); 

int selectionIndex=-1;
float totalCost=0;
boolean maxFlag=false;
boolean sketchTooSmall;
float relativeBodyTextSize=14;
float relativeTitleTextSize=32;



//Method: setup()
//Function: Set Sketch Size, Load CSV data & Output this to Console
void setup()
{
  size(800,600);
  sketchTooSmall = (width<300 || height <200)? true: false;
  
  loadData();
  printProducts();
  
  //Check if sketch size is too small for practical operation
  if (sketchTooSmall)
  {
    //call - Program terminating method - which contains user feedback & ending protocols 
    terminateProgram();
  }//end if
  
}//end setup()

//Method: draw()
//Function: Set Sketch Size, Load CSV data method & Output this to Console
void draw()
{
  //method positioning variables
  int lineBuffer =  (int)(height*.85);
  int textBuffer = (int)(((height/2)*.30)/2);
  
  //In cases of a small sketch width, Body Text is scaled down.
  if (width <500)
  {
    relativeBodyTextSize = map(14,0,600,0, width);
    
  }//end if
  
  //In cases of a small sketch Height, Title text is scaled down.
  if (height<400)
  {
    relativeTitleTextSize = map(32,0,500,0, height);
  }//end if
  
  background(180,180,180);
  displayProducts();
  stroke(0);
  
  line(width/2, lineBuffer, width/2, height-lineBuffer);
  fill(0);
  
  textAlign(CENTER, CENTER);
  textSize(relativeTitleTextSize);

  
  text("Café Rubis Till System", width/2, textBuffer);
  
  //output products to Sketch
  displayBill();
  
}//end draw()

//Method: loadData()
//Function: Create table & input CSV data into Table.
void loadData()
{
  Table table = loadTable("cafe.csv", "header");
  
  for(TableRow row:table.rows())
  {
    Product product = new Product(row);    
    products.add(product);
  } //end for
}//end loadData()

//Method: printProducts()
//Function: iterate through ArrayList: products & output to console
void printProducts()
{
  for(Product product:products)
  {
    println(product);
  }//end for
}  //printProducts()

//Method: displayProducts()
//Function: iterate through ArrayList: products & output to console
void displayProducts()
{
  float menuWidth = (width/2)*.80;
  float menuHeight = ((height/products.size())*.6);
  float insetBufferX = (width/2)*.10;
  float insetBufferY = (height/2)*.30;
  float insetText = insetBufferX + menuWidth*.1;
  float gap = menuHeight + (height/products.size()*.2);
  
  //Iterate through ArrayList: products & present data in Button Format
  for (int i=0; i<products.size();i++)
  {
    //setup & draw product rectangle
    fill(255);
    stroke(0);
    textSize(relativeBodyTextSize);
    rect(insetBufferX,insetBufferY, menuWidth, menuHeight);
    
    //Draw & Align Product name & pricing text from ArrayList: products
    fill(0);
    textAlign(LEFT, CENTER);
    text(products.get(i).name, insetText, insetBufferY+(menuHeight/2));
    text(nf(products.get(i).price, 1, 2), menuWidth - (insetText*.25), insetBufferY+(menuHeight/2));
    
    //save product button locations into ArrayList - utilised for tracking button presses 
    products.get(i).xCord = insetBufferX;
    products.get(i).yCord = insetBufferY;
    
    //move Y values for loop
    insetBufferY+= gap;
    
  }//end for loop
  
  
}//end displayProducts()

//Method: mousePressed()
//Call Event: Method is called upon mouse press event by system
//Function: To filter button presses, checking if the user has selected a Menu Item
void mousePressed()
{
  //Positioning Variables utilised in method.
  float menuWidth = (width/2)*.8;
  float menuHeight = ((height/products.size())*.6);
  
  //iterate through ArrayList: products
  for(int i=0; i<products.size(); i++)
  {
    //The mouse has been pressed - but was it a valid menu selection?
    //Compare mouse position to each button's boundaries
    if(mouseX > products.get(i).xCord && mouseX < products.get(i).xCord+ menuWidth 
    && mouseY > products.get(i).yCord && mouseY < products.get(i).yCord+ menuHeight)
    {
      //Save the index of the user's valid menu selection
      selectionIndex = i;
      
      //Design & Interactivity formatting
      fill(255,0,0,60);
      stroke(0);
      frameRate(10); //specifies that 10 frames are to be drawn per second - to help illustrate button press to user
      
      //give user feedback on button press - glow the selected button red on click
      rect(products.get(i).xCord,products.get(i).yCord, menuWidth, menuHeight);
      
      //call the operateBill() method, passing in the User's selection
      operateBill(selectionIndex);
      
      break;
    }//end if
  }//end for
}//end mousePressed()

//Method: displayBill()
//Function: To filter button presses, checking if the user has selected a Menu Item
void displayBill()
{
  //Positioning Variable Declarations...
  float billX = (width/2)+ (width/2)*.1;
  float billY = (height/2)*.30;
  float billWidth = (width/2)*.8;
  float billHeight = height*.8;
  float insetBufferX_FromLeft= (width/2)+ (width/2)*.15;
  float insetBufferX_FromRight = width + (width/2 - insetBufferX_FromLeft);
  float gapCounter = (height/2)*.30+40;
  float gapIncremementor = 30 ;
  
  
  //Formatting & Design specifications of Bill Pane...
  fill(255);
  stroke(0);
  rect(billX, billY, billWidth, billHeight);
  
  //Further Formatting & Design specifications of Bill Pane...
  fill(0);
  textSize(relativeBodyTextSize);
  textAlign(CENTER, CENTER);
  text("Your Bill", (billX + (billWidth/2)), billY+20 );
  
  //Execute Code if there are items in the ArrayList: bills
  if (bills.size()>0)
  {
    //scale down gaps in bill entries when encoutering smaller sketch heights 
    if (height <400)
    {
      gapIncremementor =  map(30,0,300,0, height);
    }//end if
    
    //Iterate through the bills ArrayList
    for (int i=0; i<bills.size();i++)
    {
      //Keeping track of the boundaries of the Bill - Ensuring too many items don't overflow the sketch
      if (gapCounter< (billY+billHeight)-(gapIncremementor*2.5))
      {
        //Output ArrayList: bills in formatted fashion to the sketch
        textAlign(LEFT, CENTER);
        text(bills.get(i).name, insetBufferX_FromLeft, gapCounter);
        textAlign(RIGHT, CENTER);
        text(nf(bills.get(i).price, 1, 2), insetBufferX_FromRight, gapCounter);
        gapCounter += gapIncremementor;
      } //end if
      
      //Otherwise deal with the scenario that the user has made the maximum number of selections
      else
      {
        textAlign(LEFT, CENTER);
        text("Max QTY: Purchases.", insetBufferX_FromLeft, gapCounter);
        gapCounter += gapIncremementor;
        
        //end for loop manually
        i = bills.size();
        
        //Flag maximum selection made - preventing further additions to the ArrayList: bills
        maxFlag = true;
        
      }//end else
    }//end for
  }//end if
  
  //Print the bill total
  fill(0);
  textAlign(LEFT, CENTER);
  text("Total: ", insetBufferX_FromLeft, gapCounter);
  textAlign(RIGHT, CENTER);
  text(nf(totalCost, 1, 2), insetBufferX_FromRight , gapCounter);
  
}//end displayBill()

//Method: operateBill()
//Parameter: int selectionIndex - Pass in the index of the user's menu selection
//Function: To make additions to the ArrayList: bills based on user selection.
void operateBill (int selectionIndex)
{
  //Check that the Bill pane is not overflowing
  if (maxFlag != true)
  {
    //keep track of running bill total
    totalCost += products.get(selectionIndex).price;
    //add selected product to ArrayList: bill 
    bills.add(products.get(selectionIndex));
    
    //reset trigger variable
    selectionIndex=-1;
  }//end if
 
}//end function()

//Method: terminateProgram()
//Function: To provide user feedback on program end & physically end the program
void terminateProgram()
{
  fill(255,0,0);
  stroke(0);
  rect(0,0,width,height);
  fill(255);      
  textSize(map(100,0,250,0,width));
  textAlign(CENTER, CENTER);
  text("FAIL!", width/2, height/2);
  textSize(map(28,0,250,0,width));
  text("Sketch Too Small.", width/2, height*.90);
  frameRate(.25);
  exit();
}//end function()