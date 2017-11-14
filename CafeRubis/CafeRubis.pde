//Student: Stephen Alger C16377163
//global variables
ArrayList<Product> products = new ArrayList<Product>(); 
ArrayList<Product> bill = new ArrayList<Product>(); 

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
}//end draw()

void loadData()
{
  Table table = loadTable("cafe.csv", "header");
  
  for(TableRow row:table.rows())
  {
    Product product = new Product(row);    
    products.add(product);
  } //end for
  
  //testing ArrayList
  //int spacing =50; 
  //for (int i=0; i<products.size(); i++)
  //{
  //  text("Test: " + products.get(i).name, 50,spacing);
  //  spacing += 50;
  //}
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
  float menuHeight = (height/2)*.25;
  float insetBufferX = (width/2)*.10;
  float insetBufferY = (height/2)*.10;
  fill(255);
  stroke(0);
  rect(insetBufferX,insetBufferY, menuWidth, menuHeight);
  
}//end displayProducts()