use <rotate_copy.scad>

base(0,3,90);

module base(index,n,angle){
    dims=[[4,5,8],[6,5,13]];
    id=dims[index][0];spigot=dims[index][1];length=dims[index][2];
    difference(){
        cube(size=length,center=true);  //body
        for(i=[0:n-1]){ //spigot holes
            rotate_copy([0,i*angle]) cylinder(h=length/2+1,d=spigot,$fn=20);
        }
        rotate([90,0,0])cylinder(h=length+2,d=4,$fn=20,center=true);  //screw hole
    }
}