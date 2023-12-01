use <pneumatic/pu.scad>
use <indicator.scad>
indicators(true,"bottom","bottom");
translate([0,50,0]) indicators(1,"top","top");
translate([0,100,0]) indicators(0,"right","right");
translate([0,150,0]) indicators(1,"left","left");

module indicators(state,label="",position="right"){
    indicator(state);
    //show label in poition N/S/E or W
    textLength=len(label);
    if(textLength){
        if(position=="right"){
            translate([16,0,0]) 
            color("blue") text(label,size = 8,halign = "left",valign="center");
        }
        if(position=="left"){
                translate([-16,0,0]) 
                color("blue") text(label,size = 8,halign = "right",valign="center");
            }
        if(position=="top"){
            translate([0,16,0]) 
            color("blue") text(label,size = 8,halign = "center",valign="bottom");
        }
        if(position=="bottom"){
            translate([0,-16,0]) 
            color("blue") text(label,size = 8,halign = "center",valign="top");
        } 
    }  
}
