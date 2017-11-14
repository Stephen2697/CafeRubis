//Student: Stephen Alger C16377163
//global variables
ArrayList<Product> products = new ArrayList<Product>(); 
ArrayList<Product> bills = new ArrayList<Product>(); 
int selectionIndex=-1;
float totalCost=0;

void setup()
{
  size(800,600);
  loadData();
  printProducts();

}//end setup()

void draw()
{
  background(180,180,180);
  displayProducts();
  stroke(0);
  float lineBuffer = 70;
  float textBuffer = 20;
  line(width/2, lineBuffer, width/2, height-lineBuffer);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Café Rubis Till System", width/2, textBuffer);
  displayBill();
  operateBill(selectionIndex);
  
  printProducts();
}//end draw()

void loadData()
{
  Table table = loadTable("cafe.csv", "header");
  
  for(TableRow row:table.rows())
  {
    Product product = new Product(row);    
    products.add(product);
  } //end for
}//end loadData()

void printProducts()
{
  for(Product product:products)
  {
    println(product);
  }
}  //printProducts()


void displayProducts()
{
  float menuWidth = (width/2)*.66;
  float menuHeight = ((height/products.size())*.6);
  float insetBufferX = (width/2)*.10;
  float insetBufferY = (height/2)*.30;
  float insetText = insetBufferX + menuWidth*.1;
  float gap = menuHeight + (height/products.size()*.2);
  
  for (int i=0; i<products.size();i++)
  {
    //setup rectangle
    fill(255);
    stroke(0);
    textSize(14);
    rect(insetBufferX,insetBufferY, menuWidth, menuHeight);
    
    //setup  Product text
    fill(0);
    textAlign(LEFT, CENTER);
    text(products.get(i).name, insetText, insetBufferY+(menuHeight/2));
    
    //setup Pricing text
    text(nf(products.get(i).price, 1, 2), menuWidth - (insetText*.25), insetBufferY+(menuHeight/2));
    
    //save product button locations 
    products.get(i).xCord = insetBufferX;
    products.get(i).yCord = insetBufferY;
    
    //move Y values for loop
    insetBufferY+= gap;
  }
  
  
}//end displayProducts()

//if mouse is pressed...
void mousePressed()
{
  float menuWidth = (width/2)*.66;
  float menuHeight = ((height/products.size())*.6);
  for(int i=0; i<products.size(); i++)
  {
    if(mouseX > products.get(i).xCord && mouseX < products.get(i).xCord+ menuWidth 
    && mouseY > products.get(i).yCord && mouseY < products.get(i).yCord+ menuHeight)
    {
      //select product
      selectionIndex = i;
      fill(255,0,0,60);
      stroke(0);
      frameRate(10);
      //give user feedback on button press
      rect(products.get(i).xCord,products.get(i).yCord, menuWidth, menuHeight);
    }//end if
  }//end for
}//end mousePressed()

void displayBill()
{
  float billX = (width/2)+ (width/2)*.1;
  float billY = (height/2)*.30;
  float billWidth = (width/2)*.8;
  float billHeight = height*.8;
  fill(255);
  stroke(0);
  rect(billX,billY, billWidth, billHeight);
  fill(0);
  textSize(14);
  textAlign(CENTER, CENTER);
  text("Your Bill", (billX + (billWidth/2)), billY+20 );
}

void operateBill (int selectionIndex)
{
  float insetBufferX = (width/2)+ (width/2)*.2;
  float gap = (height/2)*.30+30;
  
  //if button has been pressed
  if (selectionIndex != -1)
  {
    totalCost += products.get(selectionIndex).price;
    //add to bill arrayList
    bills.add(products.get(selectionIndex));
    //reset trigger variable
    selectionIndex=-1;
  }
  
  //print total
  fill(0);
  textAlign(LEFT, CENTER);
  text("Total: ", insetBufferX, gap);
  text(nf(totalCost, 1, 2), (width/2)+ (width/2)*.8 , gap);
  gap += 30;
  selectionIndex=-1;
}