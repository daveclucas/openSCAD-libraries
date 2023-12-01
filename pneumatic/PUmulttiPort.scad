use <rotate_copy.scad>

d=4;
base(d);
rotate([0,180,0])translate([0,0,-3*d])branch(d);

module base(dia,n=3,angle=90){
    dims=[[4,5,8],[6,5,13]];
    spigot=dia+2;length=dia+4;
    difference(){
        cube(size=length,center=true);  //body
        for(i=[0:n-1]){ //spigot holes
            rotate_copy([0,i*angle-90]) cylinder(h=length+2,d=spigot,$fn=20);
        }
        rotate([90,0,0])cylinder(h=length+2,d=4,$fn=20,center=true);  //screw hole
    }
}

module branch(dia){
    od=dia;spigot=dia+2-.2;length=dia+2;
    difference(){
        union(){
            cylinder(h=dia+4,d=dia+4,$fn=20);
            //spigot
            translate([0,0,2])cylinder(h=length+1,d=spigot,$fn=20);
        }
        translate([0,0,-1])cylinder(h=length*2,d=dia,$fn=20); //hole
    }
}