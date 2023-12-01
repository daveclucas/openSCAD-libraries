// Sine/cosine demo
//
// Draws a dial face using two different methods:
// 
// For the major marks:      OpenSCAD translate/rotate
// For the minor marks:    OpenSCAD translate with sin () and cos () functions

dialRadius = 50;
dialDepth = 1;
scale=10;
majorDivision = 5;
majorDivisionWidth = .75;
minorDivision = 1;
gaugeFace();

module gaugeFace(
    dialRadius = 50,
    dialDepth = 1,
    scale=10,
    majorDivision = 5,
    majorDivisionWidth = .75,
    minorDivision = 1
    ){

    translate([0,0,-.1]) color("black") cylinder(h=.1,d=dialRadius*2+30);
    color("white") cylinder(h=.1,d=dialRadius*2+15);

    //Do an major mark each 30 degrees of a partial circle (last one gets done twice :-)
    rotate([0,0,-90]) for (d = [30:30:330])
    {
        majorDivisionMarker (d);
    }

    //Do a minor mark each 5 degrees of a partial circle (last one gets done twice :-)
    rotate([0,0,-90]) for (d = [30:6:330])
    {
        minorDivisionMarker (d);
    }
}

module digit(scale=1,angle,textSize=8){
   rotate([0,0,-90]) translate([0,-12,0]) linear_extrude(2) text(str(scale*(12-angle/30-1)), font = "Liberation Sans",size = textSize,halign="center"); 
}

module majorDivisionMarker (degrees)
{
    //Set colour from black to white while going through the circle to demonstrate direction
    //Math convention is to count angles counter-clockwise
//    color ([degrees/360, degrees/360, degrees/360])
        color("black")
        //Standard rotate - here OpenSCAD does the trigonometry for us
        rotate ([0, 0, degrees])
            //Translate out of centre
            translate ([dialRadius + majorDivision / 2 , 0, 0]){
                //Actual hour mark
                cube ([majorDivision, majorDivisionWidth, dialDepth], center = true);
    digit(angle=degrees,scale);
            }
}

module minorDivisionMarker (degrees)
{
    //Calculate how for from the centre the minute marks reside
    r = dialRadius -  minorDivision / 2;
    
    //Set colour from black to white while going through the circle to demonstrate direction
    //Math convention is to count angles counter-clockwise
    color ([degrees/360, degrees/360, degrees/360])
        //Translate using explicit trigonometry
        translate ([r * cos (degrees), r * sin (degrees), 0])
                //Actual minute mark - will show up in correct place without any rotation command used.
                cube ([minorDivision, minorDivision, dialDepth], center = true);
}