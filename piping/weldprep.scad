weldprep();
module weldprep(d=48.3,r=3){
    difference(){
        rotate_extrude()translate([(d-4)/2,0,0])circle(r,$fn=20);
        cylinder(h=8,d=d,center=true);
    }
}