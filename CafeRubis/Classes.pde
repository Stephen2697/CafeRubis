class Product 
{
  String name;
  float price;
  float xCord;
  float yCord;
  
  
  Product(TableRow row)
  {
    name = row.getString("Name");
    price = row.getFloat("Price");
    
  }//end product constructor
  
  String toString()
  {
    //X & Y cords used for debugging & implementing button clicks - not active at submission.
    return name + ", " + price + "x=[" + xCord + "] " + price + "y=[" + yCord + "] " ;
  } //end toString()
  
}//end class encapsulation