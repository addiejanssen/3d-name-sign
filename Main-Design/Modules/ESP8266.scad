/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

ESP8266BoardX=58;
ESP8266BoardY=31;
ESP8266BoardZ=5;
ESP8266DrillHoleX=2.8;
ESP8266DrillHoleY=2.8;
ESP8266USBPlugX=15;
ESP8266USBPlugY=12;
ESP8266USBPlugZ=9;
ESP8266USBPlugOffsetZ=-2;

module ESP82662D()
{
    color("blue")
        difference() {
            square([ESP8266BoardX, ESP8266BoardY]);

            translate([ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
                circle(d=3, $fn=360);

            translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
                circle(d=3, $fn=360);

            translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
                circle(d=3, $fn=360);

            translate([ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
                circle(d=3, $fn=360);

        }

    color("green")
        translate([ESP8266BoardX - 0.01, (ESP8266BoardY / 2) - (ESP8266USBPlugY / 2), 0])
            square([ESP8266USBPlugX + 0.01, ESP8266USBPlugY]);
}

module ESP82663D()
{
    color("blue")
        difference() {
            cube([ESP8266BoardX, ESP8266BoardY, ESP8266BoardZ]);

            translate([ESP8266DrillHoleX, ESP8266DrillHoleY, -0.01])
                cylinder(h=ESP8266BoardZ + 0.02, d=3, $fn=360);

            translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266DrillHoleY, -0.01])
                cylinder(h=ESP8266BoardZ + 0.02, d=3, $fn=360);

            translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, -0.01])
                cylinder(h=ESP8266BoardZ + 0.02, d=3, $fn=360);

            translate([ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, -0.01])
                cylinder(h=ESP8266BoardZ + 0.02, d=3, $fn=360);

        }

    color("green")
        translate([ESP8266BoardX - 0.01, (ESP8266BoardY / 2) - (ESP8266USBPlugY / 2), ESP8266USBPlugOffsetZ])
            cube([ESP8266USBPlugX + 0.01, ESP8266USBPlugY, ESP8266USBPlugZ]);
}


module ESP8266M2MountPoints3D(height=5)
{
    translate([ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }

    translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }

    translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }

    translate([ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=5, $fn=360);
            cylinder(h=height + 0.01, d=1.6, $fn=360);
        }
}

module ESP8266M3MountPoints3D(height=5)
{
    translate([ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }

    translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }

    translate([ESP8266BoardX - ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }

    translate([ESP8266DrillHoleX, ESP8266BoardY - ESP8266DrillHoleY, 0])
        difference() {
            cylinder(h=height, d=6, $fn=360);
            cylinder(h=height + 0.01, d=2.5, $fn=360);
        }
}

module ESP8266USBHole3D(height=5)
{
    translate([ESP8266BoardX - 0.01, (ESP8266BoardY / 2) - (ESP8266USBPlugY / 2), height + ESP8266USBPlugOffsetZ])
        cube([ESP8266USBPlugX + 0.01, ESP8266USBPlugY, ESP8266USBPlugZ]);
}


/*
ESP8266M3MountPoints3D(10);

/*
rotate([0,0,270]) {
    ESP8266MountPoints3D(10);

    difference() {
        translate([0,0,10])
            ESP82663D();
        ESP8266USBHole3D(10);
    }

}
*/