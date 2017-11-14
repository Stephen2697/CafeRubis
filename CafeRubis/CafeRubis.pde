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
  }
}//end loadData()