# OOP_Assignment
This is the second year project for Object Orientated Programming using Processing for DT228

My video is here :
[![Video](http://img.youtube.com/vi/t6xtGr71CgI/0.jpg)](https://www.youtube.com/watch?v=t6xtGr71CgI)

The concept for my OOP assignment was based on a Mining Colony on one of Jupiters Moons Europa.

My assignment contains one main method and six other classes which do various function throughout the sketch.

When first launched, the user will see a loading screen with the logo, a moving star and a greeting.
The logo is an imported image from the data file. The moving star took me a while to get working, it is one of the things I am most proud of because
it involves trigonometry. It takes 5 parameters, first two are its x and y co-ordinates. The third is the first radius or the inside circle
the fourth is the second radius or the outside circle where the points reach. The fifth and final parameter is the number of points on the star.
I used this to work out the angle of the points(triangle). The text is just a simple text added to the co-ordinates.

![load](/screenshots/load.png?raw=true "load")

After the load screen the user will be displayed a menu screen with the logo and four options.
the four options are "Dig Sites", "Mineral Information”, “Population" and "Logout". The menu buttons where achieved
by using the pushMatrix and popMatrix functions. First a blue rectangle was translated into position then the text was translated over the box.
To check which button was clicked a mousePressed function was called and if statements to check if the mouse was within the boxes x and y co-ordinates.

![Menu](/screenshots/menu.png?raw=true "Menu")

When the user clicks on "Dig Sites" they will be taken to the screen below. On the screen are a logo, text with the sites name and an image of a 
Lunar surface along with plotted points. When the user hovers over a site it turns yellow and when the user clicks on a mining site text appears on the left-hand side providing information about the 
Sites name, its Status (Active, Nearly Depleted, Abandoned and Investigating), Primary Ore found at that location along with the Secondary Ore found
at the same location. There is also a button to bring them back to the main screen.

To plot the points on the Lunar surface a csv file was imported where all the information (State, Site Name, Primary Ore, Secondary Ore, disX, disY, size) is stored.
The information was imported using a TableRow function with headers for each column this was done inside the Class DigData.
In the map class the disX and disY co-ordinates and the map function was used to map the co-ordinates onto the image. The disX and disY were stored as PVectors for easier use.
It is also within this class where I could change the colour of the ellipse that indicated a dig site and able to track what was clicked using a for loop 
and local variables.
There is also extra information on the csv file (disA, disB, disC, disD) which I wanted to use for more "Dig Sites" unfortunately I didn't get that part to work.
The "Main Menu" button works the same as the buttons on the menu page.

![Map](/screenshots/map.png?raw=true "Map")

When the user clicks "Mineral Information" it displays a screen with the logo in the top right, main menu button in the top left
and, four images of four rock types. When the user hovers over a rock information about the rock will be displayed in the middle
of the screen. When the user is finished, they can click the "Main Menu" to go back.

All images on this page where plotted with the push and popMatrix functions. To check what image the user is hovering over the mouseClicked function
and an if statement checking the co-ordinates of the mouse are used. when the user hovers over an image a flag relating to that image is set to true
and the corresponding information is displayed using the text function which took four parameters, first and second are the x and y co-ordinates of 
the top left hand corner of the text, the third is the width of the text box and the fourth is the height of the text box. When the user moves off 
the image the flag is set to false and the text disappears.

![Dig](/screenshots/rock.png?raw=true "Dig")

When "Population" is clicked on the main screen it takes you to the screen below. On the screen the user will see the logo in the top left, four
words (Birth Rate, Death Rate, Population and All) with coloured lines beside them and the "Main Menu" button. When one of the options are clicked
a corresponding graph is shown. when all is clicked all the graphs are shown. When the user is finished, they can click the "Main Menu" to go back.

The text options have a corresponding colour beside which shows the colour they show on the line graph. To gather the information in the line graphs
a tsv file was imported in the PopData class. When this option is first clicked the calcMinMax is run from the Calc class to calculate 
all the maximum and minimum values in all three graphs. Inside the Population class all the text is placed using Push and PopMatrix. To check if a 
user has clicked one the mousePressed function along with x and y co-ordinates are used. If they have click a valued are the corresponding flag is set to
true and the rest are set to false, except when all is clicked and all graphs are printed. To get the graphs to print on the screen the map function was 
used to set the x and y locations of the line which were drawn.

![graph1](/screenshots/graph1.png?raw=true "graph1")

![graph2](/screenshots/graph2.png?raw=true "graph2")

![graph3](/screenshots/graph3.png?raw=true "graph3")

![graph4](/screenshots/graph4.png?raw=true "graph4")

When the user clicks Exit a similar screen to the load screen appears and it say goodbye.

![Exit](/screenshots/exit.png?raw=true "exit")
