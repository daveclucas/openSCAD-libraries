//Example of Snap library  
/* on http://www.thingiverse.com/thing:1860118
 by fpetrac
 Licensed under the Creative Commons - Attribution - Non-Commercial license.
*/

//include <SnapLib.0.30.scad>
include <SnapLib.0.35.scad>
$fn=128;
//eps=0.5*12/100;//Elongation at break of ABS=12%
eps=.5*6/100;//Elongation at break of PLA=6%
$fn=64;
module ClipExample2(){
RSnapY(l=8,h=1,a=35,Lobi=6,r2=10,K2=2);
translate([0,0,-8])cylinder(h=8,r=12,$fn=128);
}

module ClipExample2test(){
difference(){
    cylinder(h=8*.99,r=20,$fn=128);
    translate([0,0,-18])
cylinder(h=2*18,r=10*1.01,$fn=128);
}
}


module ClipExample3(){
RRSnapY(l=10,h=3,a=35,Lobi=4,r2=8,K1=1.5);
translate([0,0,-8])cylinder(h=8,r=12,$fn=128);
}

module ClipExample3test(){
union(){
    cylinder(h=10*.99,r=8,$fn=128);
    translate([0,0,10])
cylinder(h=18,r=6,$fn=128);
}
}
//RRSnapY(l=3.8,h=1.2,a=35,Lobi=6,r2=8.8,K1=1.5);


module ClipExample1(){ //example CLIP
RR=6.6;
HH=RR*3/2;
LL=5;
h=3;
b=8;
difference(){
    union(){
        linear_extrude(height = b, center = f, convexity = 10, twist = 0)
            polygon([[0,-h],[-11,-h],[-11,HH+h],[0,HH+h]]);
        SnapY(l=LL,h=h,a=35,b=b);
        translate([0,HH,0])
        mirror([0,1,0])
        SnapY(l=LL,h=h,a=35,b=b);
    
    }
    translate([0,HH/2,-b/2])
        cylinder(h=2*b,d=RR,$fn=128);
}
}
module ClipExample1test()
{
RR=6.6;
HH=0.99*RR*3/2;
LL=0.99*5;
h=3;
b=8;
difference(){
linear_extrude(height = b, center = f, convexity = 10, twist = 0)
polygon([[0,0],[LL,00],[LL,HH],[0,HH]]);
translate([0,HH/2,-b/2])
cylinder(h=2*b,d=RR,$fn=128);
}
}
//ClipExample1();
//#ClipExample1test();
//ClipExample2();
//#ClipExample2test();
//ClipExample3();
//#ClipExample3test();