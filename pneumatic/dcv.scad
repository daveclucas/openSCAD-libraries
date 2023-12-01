use <mirror_copy.scad>
l=41.5; w=22.5; h=23.6;
port1zOffset=15;
    port24zOffset=12.7;
    port24xOffset=6.5;
    difference(){
        valveBlock();
        translate([0,0,21.6])pilot();
    }
    translate([0,25,0 ])pilot();

//dcv();
//translate([port24xOffset+6,-w/2,port24zOffset]) rotate([90,0,0]) text("4",size=4,valign="center",halign="center");

module dcv(){
    valveBlock();
    translate([0,0,23.6]) pilot();
}

module valveBlock(l=41.5,w=22.5,h=23.6){
    port1zOffset=15;
    port24zOffset=12.7;
    port24xOffset=6.5;
    difference(){
        translate([0,0,h/2]) cube([l,w,h],center=true);
        translate([0,0,port1zOffset]) rotate([-90,0,0]) 
        cylinder(h=15,d=8); //port 1
        translate([6,w/2,port1zOffset]) rotate([90,0,180]) 
        text("1",size=4,valign="center",halign="center");
        translate([port24xOffset,-16,port24zOffset]) rotate([-90,0,0]) 
        cylinder(h=15,d=8); //port 4
        translate([port24xOffset+6,-w/2,port24zOffset]) rotate([90,0,0]) 
        text("4",size=4,valign="center",halign="center");
        translate([-port24xOffset,-16,port24zOffset]) rotate([-90,0,0]) 
        cylinder(h=15,d=8);    //port 2
        translate([-(port24xOffset+6),-w/2,port24zOffset]) rotate([90,0,0]) 
        text("2",size=4,valign="center",halign="center");
        translate([10,0,7]) rotate([-90,0,0]) cylinder(h=15,d=8); //exhaust
        translate([-10,0,7]) rotate([-90,0,0]) cylinder(h=15,d=8); //exhaust 
        translate([0,0,h/2])cube([31,10,h*2],center=true);
        mirror_copy([1,0,0]){
            translate([15,8,-1])cylinder(h=30,d=4,$fn=20);
            translate([15,8,10])cylinder(h=30,d=6,$fn=20);
        }
    }
}

module pilot(){
    l=31;
    w=10;
    h=21;
    pilotH=23.6;
    difference(){
        translate([-l/2,-5,]) cube([l,w,h]);
        cylinder(h=27,d=4,$fn=20);
        translate([0,0,5])cylinder(h=27,d=7,$fn=20);
    }
    mirror_copy([1,0,0]) color("Gray") difference(){
        translate([l/2,-5,0]) cube([10,10,pilotH]);
        translate([20.5,0,7]) cylinder(h=17,d=8);
        cylinder(h=40,d=4,$fn=20);
    }
}