dimensions = [  [10, 20, 30],
  [20, 30, 40],
  [30, 40, 50]
];
type=[0,1,0];

module create_objects(i, prev_width) {
  if (i < len(dimensions)) {
    object_dimensions = dimensions[i];
    translate([prev_width, 0, 0]) {
        if(type[i]==0)
            translate([0,-object_dimensions[1]])cube(object_dimensions);
        else
            translate([object_dimensions[0]/2,-object_dimensions[1]/2,0])cylinder(h=object_dimensions[2],d=object_dimensions[0]);
    }

    create_objects(i+1, prev_width + object_dimensions[0]); // recursive call
  }
}

create_objects(0, 0); // start recursive function with initial values
