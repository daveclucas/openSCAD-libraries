helpText="flute(width=20,height=50,depth=2)";

flute(width=20,height=50,depth=2);
flute(help=true);
module flute(width=20,height=50,depth=2,help=false,center=true){
    $fn=50;
    R=(width*width)/(8*depth)+depth/2;
    if(help)echo(helpText);
    translate([0,depth-R,0])
    difference(){
        cylinder(h=height+2,r=R,center=true);
        translate([0,-(depth+0.05),0])cube([2*R,2*R,height+4],center=true);
    }
}