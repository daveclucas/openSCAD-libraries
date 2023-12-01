use<mirror_copy.scad>

//********************* variables ***********************

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

//********************* calculated variables ***********************


//********************* functions ***********************

//calculates the root thickness required(h)
function h(E,l,y)=1.09*E*pow(l,2)/y;
function hArm(la=10,y=1,root=3,angle=30)=[[0,0],[la,0],[la,y],[la+y,y],[la+y+(y+root/4)/tan(angle),-root/4],[la,-root/2],[0,-root]];
function y(K2,eps,la,r2)=1.64*K2*(eps*pow(la,2))/(r2);
//finger(l,root,y,xland,angle,yland)
//creates a path for the shape of the finger
function finger(l=5,root=5,y=1,xLand=1,angle=30,yLand=1,fillet=0.4)=
    [[0,0],[l,fillet],[l+y,y+fillet],
    [l+y+xLand,y+fillet],[l+y+xLand+y/tan(angle),-y/2],
    [l+y+xLand+y/tan(angle),-(yLand+y/2)],[l,-root/2+fillet],[0,-root]];


//Example:
hook();
//roundHook();

module hook(
    eps=0.5*6/100,//Elongation at break of PLA=6%
    Epm=0.06,   //max permissible strain
    SF=2,       //safety factor
    t=1.5,  //wallyhickness
    l=5,  //arm length(x)
    w=5,    //arm width
    f=1,    //factor
    help=false, //help message
    angle=30,   //taper angle
    y=0.5,
    E=Epm/SF   //design strain
){
    root=h(E,l,y);
    fillet=max(root/5,0.4);

    translate([w/2,-fillet,fillet])rotate([0,-90,0])
    linear_extrude(w)polygon(finger(l,root,fillet,y,angle));
    translate([0,-(root/2+fillet),0])
    difference(){
        translate([0,0,fillet/2])
        cube([w+2*fillet,root+2*fillet,fillet],center=true); //base
        //add fillets to root to reduce SCF
        mirror_copy([0,1,0])translate([0,root/2+fillet,fillet])
        rotate([0,90,0])cylinder(h=w+2*fillet,r=fillet,$fn=20,center=true);
        mirror_copy([1,0,0])translate([w/2+fillet,0,fillet])
        rotate([90,0,0])cylinder(h=root+2*fillet,r=fillet,$fn=20,
        center=true);
    }
}

module roundHook(lobes=6,l=10,angle=30,r2=5,K=2){
    echo(y(K,eps,l,r2));
    theta=180/lobes;
    for(i=[0:lobes-1])
    rotate([0,0,2*i*theta])rotate_extrude(angle=angle)
    translate([r2,0,0])mirror([1,-1,0])polygon(finger(y=y(K,eps,l,r2)));
}