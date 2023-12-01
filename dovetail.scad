use<mirror_copy.scad>

shrinkage=100/97;
lp=12;   //length of pin
wp=20*shrinkage;  //width of pin
wt=30*shrinkage;//width of tail
tt=15;  //thickness of tail
tp=5;   //thickness of pin
n=3;    //number of pins
wb=150*shrinkage;  //board width
lb=40;
clearance=0;
taper=lp/7;
pitch=wt+wp-taper;

//translate([-0.1,0,0])board(lb+2*(tt-lp),wb,tp,tt,lp,pin=true);
translate([0,0,0.1])board(lb,wb,tp,tt,lp,pin=false);

module board(lb=200,w=150,tp=15,tt=20,lp,pin=true){
    if(pin){
        t=tp;   //set board thickness to pin thickness
        translate([tt,-w/2,0])color("Red")cube([lb-2*(tt-lp),w,t]); //board
        translate([tt-lp,0,0])color("lightGray")pin(lp,wp,tp,clearance);    //centre pin
        for(i=[0:(n-1)/2])translate([tt-lp,0,0])
            mirror_copy([0,1,0])translate([0,i*pitch,0])color("lightGray")
            pin(lp,wp,tp,clearance);    //outer pins
    }
    else{
        t=tt;   //set board thickness to tail thickness
        difference(){
            translate([0,-w/2,0])color("Blue")cube([tt,w,lb]);   //board
            translate([tt-lp,0,0])pin(lp,wp,tp,clearance);    //centre pin
            for(i=[0:(n-1)/2])  
                mirror_copy([0,1,0])translate([tt-lp,i*pitch,0])color("lightGray")
                pin(lp,wp,tp,clearance);  //outer pin sockets
        }
    }
}

module pin(l,w,t,clearance){
    translate([0,0,t/2]){   //move to Z0
        path=[
        [0,0],
        [0,(w-clearance)/2],
        [l,w/2-taper],
        [l,taper-w/2],
        [0,(clearance-w)/2]
        ];
        translate([0,0,-t/2])
        linear_extrude(t)polygon(path);
    }    
}
