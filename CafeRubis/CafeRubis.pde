//Student: Stephen Alger C16377163
//global variables
ArrayList<Product> products = new ArrayList<Product>(); 
ArrayList<Product> bill = new ArrayList<Product>(); 

void setup()
{
  size(800,600);
  loadData();

}//end setup()

void draw()
{
  
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