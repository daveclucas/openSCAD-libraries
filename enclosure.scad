/* [Enclosure] */
// - x,y,z,length,width,height,thickness,fillet,xcentres,ycentres,label
cn=[0,0,0,255,165,25,2,3,240,155,"CN"];

module enclosure(x=0,y=0,z=0,l=100,w=50,h=25,t=2,r=3,xc=95,yc=45,label="Label"){
    translate([x,y,h/2-t]){ //move to position
        difference(){   //hollow out inner
            cube([l,w,h],center=true); //outer
            translate([0,0,t]){    //move inner up by thickness
                cube([l-2*t,w-2*t,h],center=true);   //inner
            }
        }
        //print id label
        text(label,size=5,halign="center");
    }
}
enclosure(cn[0],cn[1],cn[2],cn[3],cn[4],cn[5],cn[6],cn[7],cn[8],cn[9],cn[10]);

//enclosure(cn);