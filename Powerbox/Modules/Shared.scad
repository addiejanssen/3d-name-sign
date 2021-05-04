/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module M3NutHolder() {
    
    difference() {
        cylinder(h=4,d=12, $fn=6);
        translate([0,0,1.5])
            cylinder(h=2.51, d=6.1, $fn=6);
        translate([0,0,-0.01])
            cylinder(h=4.02, d=3.2, $fn=90);
    }
}

module RoundedCube(size, radius) {

    cube_size=[size[2],size[1],size[0]];

    translate(size/2)
        rotate([0,90,0]) {
            cube(cube_size - [2*radius,0,0], true);
            cube(cube_size - [0,2*radius,0], true);
            for (x = [radius-size[2]/2, -radius+size[2]/2],
                   y = [radius-size[1]/2, -radius+size[1]/2]) {
              translate([x,y,0]) cylinder(r=radius, h=size[0], center=true);
            }
        }
}
