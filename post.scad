/*
Author: Dave Clucas 2021 version 0
This module creates a post for supporting PCB mounted circuits
Options are size and shape and a fillet at the base of the post
Choosing a hole size of 0 or less omits the hole
Setting pin to true fills the hole with a pin which protrudes 3 units
Pin position may be offset using offsets x,y,z
*/
//use <arc.scad>
use <quadrant.scad>

module post(h=10,d=6,pd=2,f=3,shape=0,ph=3){
	holePos=[[0,0,0],[d/2,d/2,0],[d/2*sin(45),d/2*sin(45),0]];	//hole position for each shape

	difference(){		
		shape(s=shape,r=d,f=3,h=h,t=0,ph=0,pd=0);	//create basic shape
		translate(holePos[shape]){
			cylinder(h=h+ph+0.2,d=abs(pd),$fn=20,center=false); //make hole
		}
	}
}

module fillet(f){
	difference(){   //fillet shape
		square(f);
		translate([f,f,0])
		circle(f,$fn=20);
	}
}

module shape(s=2,r=8,h=12,f=3,t=0,ph=0,pd=0){
	//create shape without hole
	if (s==0){
		cylinder(h,d=r,$fn=20);
		rotate_extrude(angle=360,convexity=10)
		translate([r/2,0,-0.1])
		fillet(f);
	}
	if (s==1){
		cube([abs(r),abs(r),h]);	//shape is square
		translate([r/2,r/2,0]){
			rotate_extrude(angle=360,convexity=10)//
			translate([r/2,0,0])
			fillet(f);
		}
	}
	if (s==2){
		quadrant(r,f,h,brim=0,fn=50);	//shape is quadrant (radius,fillet,height,facet no)
//		cylinder(h+ph,pd,pd);
	}
}

post(h=40,d=6,pd=2,f=3,shape=2,ph=2);
