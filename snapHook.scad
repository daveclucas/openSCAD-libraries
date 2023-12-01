use<mirror_copy.scad>

//********************* variables ***********************
/*
eps=0.5*6/100;//Elongation at break of PLA=6%
Epm=0.06;   //max permissible strain
SF=2;       //safety factor
t=1.5;  //wallyhickness
l=10;  //arm length(x)
w=5;    //arm width
f=1;    //factor
help=false; //help message
angle=30;   //taper angle
y=1;
E=Epm/SF;   //design strain
*/
//********************* calculated variables ***********************

//root=h(E,l,y);
//fillet=max(root/5,0.4);

//********************* functions ***********************

//finger(l,root,y,xland,angle,yland)
//creates a path for the shape of the finger
function finger(l,root,y,xLand,angle,yLand)=
    [[0,0],[l,0],[l+y,y],
    [l+y+xLand,y],[l+y+xLand+y/tan(angle),0],
    [l+y+xLand+y/tan(angle),-yLand],[0,-root]];
//calculates the root thickness required(h)
function h(E,l,y)=1.09*E*pow(l,2)/y;

//Example:
hook();

module hook(
eps=0.5*6/100,//Elongation at break of PLA=6%
Epm=0.06,   //max permissible strain
SF=2,       //safety factor
t=1.5,  //wallyhickness
l=10,  //arm length(x)
w=5,    //arm width
f=1,    //factor
help=false, //help message
angle=30,   //taper angle
y=1
){
    E=Epm/SF;   //design strain
    root=h(E,l,y);
    fillet=max(root/5,0.4);
    //********************* construct finger **************************  
    translate([w/2,0,fillet])rotate([0,-90,0])
    linear_extrude(w)polygon(finger(l,root,y,xLand=1,angle=30,yLand=1));
    translate([0,-root/2,0])
    difference(){
        translate([0,0,fillet/2])
        cube([w+2*fillet,root+2*fillet,fillet],center=true); //base
        mirror_copy([0,1,0])translate([0,root/2+fillet,fillet])
        rotate([0,90,0])cylinder(h=w+2*fillet,r=fillet,$fn=20,center=true);
        mirror_copy([1,0,0])translate([w/2+fillet,0,fillet])
        rotate([90,0,0])cylinder(h=root+2*fillet,r=fillet,$fn=20,
        center=true);
    }
}

