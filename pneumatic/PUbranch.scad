 branch(0);

module branch(index){
    dims=[[4,8,5,9,7],[6,11,5,10,8]];
    od=dims[index][1];spigot=dims[index][2];length=dims[index][3];depth=dims[index][4];bore=dims[index][0];
    difference(){
        cylinder(h=length,d=od,$fn=20);
        cylinder(h=depth,d=bore,$fn=20);
    }
    translate([0,0,length])cylinder(h=2,d=spigot,$fn=20);
}