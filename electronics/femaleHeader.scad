use<bezel.scad>
femaleHeaderHousingCutout(pins=12,label="+5V");
//femaleHeader(pins=12,color="red",center=true);
//translate([0,0,-4.5])bezel(w=12*2.5,d=2.5,h=8.3,flange=2,t=1.5,shrinkage=[0.7,0.7,0.6]);

module femaleHeader(d=2.5,pitch=2.5,h=9.2,pins=40,pinLength=3.2,color="black",center=false){
    translation=(center) ? [-pins/2*pitch,-d/2,0] : [0,0,0];
    translate(translation){
        length=pitch * pins;
        for (i=[0:pins-1]){
            translate([pitch/2+pitch*i,d/2,-(h+pinLength/2)]) 
            cube([.5,0.5,pinLength],center=true,$fn=20);  //pins
        }
        difference(){
                translate([0,0,-h]) color(color) cube([length,d,h]);
            for (i=[0:pins-1]){
                translate([pitch/2+pitch*i,d/2,0.1-h]) cylinder(h,d=0.5,$fn=20);
            }
        }
    }
}

module femaleHeaderHousing(flange=10,d=2.5,pitch=2.5,h=9.2,pins=40,label="label"){
    l=pitch*pins;   
    difference(){
        union(){    //flange & body
            translate([0,0,-1.5/2])cube([l+flange,2.5+2*flange,1.5],center=true);
            translate([0,0,-10.2/2])cube([l+2,2.5+2,9.2+1],center=true);
        }
        translate([0,0,-9.2/2])cube([l,2.5,9.2],center=true);   //cutout for header
        translate([0,0,-9.2/2])cube([l,1.5,12],center=true);    //cutout for pins
    }
  color("black")translate([0,-(d+flange)/2,0])linear_extrude(0.5)text(label,size=5,halign="center",valign="center");  
}

module femaleHeaderHousingCutout(flange=10,d=2.5,pitch=2.5,h=9.2,pins=40,label="label"){
    l=pitch*pins;   
    cube([l+flange,2.5+2*flange,2],center=true);
}
