use<mirror_copy.scad>

$fn=50;

//*************************** modules ***************************
//wireframe([x,y,z],d)  size of frame (dimensions to centreline of wire), diameter of wire 
//wire(d,l) wire diameter, length. both ends are terminated with a sphere length between centres of spheres
//wire_rectangle([x,d,z],diagonals,split)   width, wire diameter, height (dimensions to centreline of wire), diagonals - if true will insert diagonal braces, split - if true will split rectangle vertically to create a wire shape 

//Examples
wire_rectangle([50,2,60]);
//wireframe();
//wire(3,150);
module wire_rectangle(size=[10,2,10],diagonals=false,split=true){
    difference(){
        union(){
            mirror_copy([0,0,1]){
            mirror_copy([1,0,0])
                //corners
                translate([size.x/2,0,size.z/2])sphere(d=size.y);
                //horizontals
                translate([0,0,size.z/2])rotate([0,90,0])cylinder(h=size.x,d=size.y,center=true);
            }
            //verticals
            mirror_copy([1,0,0])
                translate([size.x/2,0,0])cylinder(h=size.z,d=size.y,center=true,$fn=50);
            if(diagonals){
                diagonalLength=sqrt(pow(size.x,2)+pow(size.z,2)); echo(diagonalLength);
                angle=atan(size.x/size.z);
                rotate([0,angle,0])cylinder(h=diagonalLength,d=size.y,center=true,$fn=50);
                rotate([0,-angle,0])cylinder(h=diagonalLength,d=size.y,center=true,$fn=50);
            }
        }
        if(split)
            translate([0,size.y,0])cube(size+[size.y,size.y,size.y],center=true);
    }
}

module wireframe(size=[50,60,70],d=2){
    //verticals
    mirror_copy([0,1,0])mirror_copy([1,0,0])translate([size.x/2,size.y/2,0])wire(d=d,l=size.z);
    //horizontals
    mirror_copy([0,1,0])mirror_copy([0,0,1])translate([0,size.y/2,size.z/2])
    rotate([0,90,0])wire(d=d,l=size.x);    
    mirror_copy([1,0,0])mirror_copy([0,0,1])translate([size.x/2,0,size.z/2])
    rotate([90,0,0])wire(d=d,l=size.y);    
}

module wire(d=2,l=100){
    mirror_copy([0,0,1])translate([0,0,l/2])sphere(d/2);
    cylinder(h=l,d=d,center=true);
}