cornerStyle(fillet=1);

module cornerStyle(h=20,fillet=0,chamfer=[0,0],internal=true,$fn=50){
    assert(!(fillet>0 && (chamfer.x > 0 || chamfer.y > 0)) ,"chamfer or fillet must not BOTH be used");
    assert(!(fillet==0 && (chamfer.x==0 || chamfer.y==0)),"fillet or chamfer values must be entered");
    $fn=$fn;
    if(fillet>0){
        if(internal)
        intersection(){
            cube([fillet,fillet,h]);
            cylinder(r=fillet,h=h);
        }
        else
        difference(){
            cube([fillet,fillet,h]);
            translate([0,0,-0.05])cylinder(r=fillet,h=h+0.1);
        }
    }
    else{
        path=[
        [0,0],
        [chamfer.x,0],
        [0,chamfer.y]
       ];
        linear_extrude(h)polygon([[0,0],[chamfer.x,0],[0,chamfer.y]]);
    }
}
