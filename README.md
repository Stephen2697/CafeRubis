# Object Oriented Programming Lab Test 1 2017

## Rules of the test
- This is an open book test. You can use any of your own sketches, any of the examples from [the course website](https://github.com/skooter500/OOP-2017-2018) or the [Processing reference](https://processing.org/reference/) during the test.
- No conferring or collaboration.
- No use of Google, Facebook or any any other web resources permitted.
- There are marks going for correct use of git, so make sure and save your work and commit regularly.

## Instructions

In today's lab test, you will be making a prototype till system for a new Dublin winebar called Cafe Rubis that's located on 9 Parliament St. Come and check it out sometime.

- Here is a video of the sketch you will be making today:

  [![Video](http://img.youtube.com/vi/vT8zZTmGnAU/0.jpg)](http://www.youtube.com/watch?v=vT8zZTmGnAU)

- Start with a blank sketch. Set the drawing window size to be 800 x 600.
- Name the sketch CafeRubis and commit it to a new, public git repository called CafeRubis under your own GitHub account.
- Put your name and student number into the sketch comments.
- Download [this CSV file](https://raw.githubusercontent.com/skooter500/OOP_Labtest1_2017_Starter/master/cafe.csv?token=ABs707vNjWJXV5-NZWhvB9QP01xmz4e_ks5aEt06wA%3D%3D) to the data folder of your sketch folder. The file contains data on the products that Cafe Rubis sells.
- Create a class called ```Product``` with a field for ```name```, of type ```String``` and a field for ```price``` of type ```float```.
- Write a constructor on the ```Product``` class that takes a ```TableRow``` as a parameter and assigns the fields in the class from the appropriate columns in the ```TableRow```. 
- Declare two global ```ArrayList```s of ```Product``` objects and call them ```products``` and ```bill```.
- Write a function called ```loadData``` that loads the data from the file and populates the products ```ArrayList```.Call this from ```setup```.
- Write a function called ```printProducts``` that prints the contents of the ```ArrayList``` after it has been loaded. You should make a ```toString``` method on the ```Product``` class to help you do this. Call this from setup after you load the data to make sure the file gets loaded correctly.
- Write a function called ```displayProducts``` that displays the product menu that can be seen on the left side of the screen. You can use the function [```nf```](https://processing.org/reference/nf_.html) to format the price to two decimal places. You can use the function [```textAlign```](https://processing.org/reference/textAlign_.html) to align text to the left or right. You should write your code so that the menu gets displayed correctly even if the screen was to change size or if more products were added.
- Write code for the ```mousePressed``` function that allows the user to click on a product and have it added to the ```bill``` ArrayList.
- Write code for a function called ```displayBill``` that draws the bill to the screen as per the video.

Submit the URL of your git repository [here](https://docs.google.com/forms/d/e/1FAIpQLSexOO73umjdfvfzgd7aEAEkOQ-bXGCXkjnX7x5pif9tVSYyxA/viewform). *You can also upload a zip file to Webcourses as a backup* I'll check webcourses if I have problems with your git repository.

## Marking Scheme:

  | Description | Marks |
  |-------------|-------|
  | Product class & constructor |   10   |
  | loadData |  10     |
  | printData |  5    |
  | Declaring the two ArrayLists |  5    |
  | Displaying the products menu | 20  |
  | Clicking the products and adding to the bill | 20 |
  | Displaying the bill | 20 |
  | Correct use of git | 10 |
  | Total: | 100 |

  To get full marks for correct use of git, you must make at least 5 commits, so make a commit every time you get something working.
