use<mirror_copy.scad>

//creates blind and through dovetails

//***************** variables *******************
shrinkage = 100 / 97;
lp = 12;     // length of pin
lb = 40;
tt = 15;     // thickness of tail
tp = 5;     // thickness of pin
n = 3;      // number of pins
clearance = 0;

//************* calulated variables **************
wp = 20 * shrinkage;   // width of pin
wt = 30 * shrinkage;   // width of tail
wb = 150 * shrinkage;   // board width
taper = lp / 7;
pitch = wt + wp - taper;
board_length = lb + 2 * (tt - lp);
board_width = wb;

//*************** example objects ****************
//creates a square carcase
mirror_copy([1,0,0]) mirror_copy([0,0,1])
translate([-board_length-tt/2, 0, tp-board_length]){
    board(board_length, board_width, tp, tt, lp, true);
    board(lb, wb, tp, tt, lp, false);
}

//***************** modules *******************
module board(lb, w, tp, tt, lp, pin) {
    if (pin) {
        t = tp;     // set board thickness to pin thickness (for blind dovetails)
        board_length = lb - 2 * (tt - lp);
        translate([tt, -w/2, 0])
            color("Red") cube([board_length, w, t]);     // board
        translate([tt - lp, 0, 0])
            color("lightGray") pin(lp, wp, tp, clearance);     // center pin
        for (i = [0 : (n - 1) / 2])
            translate([tt - lp, 0, 0])
                mirror_copy([0, 1, 0]) translate([0, i * pitch, 0])
                    color("lightGray") pin(lp, wp, tp, clearance);     // outer pins
    } else {
        t = tt;     // set board thickness to tail thickness (for blind dovetails)
        translate([0, -w/2, 0])
            color("Blue") cube([tt, w, lb]);     // board
        translate([tt - lp, 0, 0])
            pin(lp, wp, tp, clearance);     // center pin
        for (i = [0 : (n - 1) / 2])
            mirror_copy([0, 1, 0]) translate([tt - lp, i * pitch, 0])
                color("lightGray") pin(lp, wp, tp, clearance);     // outer pin sockets
    }
}

module pin(l, w, t, clearance) {
    translate([0, 0, t/2]) {     // move to Z0
        path = [
            [0, 0],
            [0, (w - clearance)/2],
            [l, w/2 - taper],
            [l, taper - w/2],
            [0, (clearance - w)/2]
        ];
        translate([0, 0, -t/2])
            linear_extrude(t) polygon(path);
    }
}
