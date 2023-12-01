use <fillet.scad>
module pcbPost(h=50){ //h= height(width) of pcb
    difference(){
        translate([0,0,32.5]) cube([8,8,h+15],center=true);   //post. 15 offset allows room for wires to pass underneath
        translate([-1,-0.13,15]) cube([2,4.2,h+1]);    //slot
    }
    fillet(5);
}
