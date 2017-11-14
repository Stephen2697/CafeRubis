class Product 
{
  String name;
  float price;
  
  
  Product(TableRow row)
  {
    name = row.getString("Name");
    price = row.getFloat("Price");
    
  }//end product constructor
  
  String toString()
  {
    return name + "," + price;
  } //end toString()
  
}//end class encapsulation