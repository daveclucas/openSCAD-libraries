use<mirror_copy.scad>
use<knurl.scad>

rail=[75,75,3,11]; //y,z,thickness,radius
carriageRail=[25,25,2]; //y,z,thickness
bearing=[21,10,9]; //od,id,thickness
railFlat=rail[0]-2*(rail[3]);echo(railFlat);
midSpacer=railFlat-2*bearing[2];echo(midSpacer);
od=26; id=10;t=9;

//
spacer(od=22,id=10.5,l=10);
//mirror_copy([0,0,1])translate([0,0,(rail[0]-rail[3])/2]) 
//spacer(od=22,id=10.5,l=rail[3]);  //end spacer
//mirror_copy([0,0,1])translate([0,0,railFlat/2-bearing[2]]) bearing(od,id,t); //bearing


module bearing(od,id,t){
    difference(){
        cylinder(h=t,d=od); //bearing
        cylinder(h=t,d=id); //bearing
    }
}
module spacer(od,id,l,center=false){
    difference(){
        cylinder(h=l-1,d=od); //bearing
        cylinder(h=l+1,d=id); //bearing
        cylinder(h=8.5,d=19.5,$fn=6);
    }
}

