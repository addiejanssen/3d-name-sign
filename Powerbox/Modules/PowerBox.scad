/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module CableMountGuide() {

    CableWidth=6;
    CableHeight=3.6;

    translate(CableMountPosition) {
        translate([-0.01 + (CableHeight/2),-0.01,6])
            rotate([0,0,90])
                RoundedCube([15.02, CableHeight, CableWidth],CableHeight/2);
        translate([-0.01,11,9])
            rotate([0,90,270])
                rotate_extrude(angle=180) //, $fn=90)
                    translate([6, 0])
                        square([2,7]);
        translate([-0.01,4,2])
            cube([1.5,7,14]);
    }
}

module CableMountBlock() {

    translate(CableMountPosition - [0,0,12]) {
        difference() {
        cube([10,15,30]);
        translate([-5,-0.01,0])
            rotate([270,0,0])
                cylinder(15.02,d=25);
        }
    }
}

module PowerBoxCasing2D()
{
    translate(PowerBoxOuterSVGOffset)
        mirror([1,0,0])
            import(PowerBoxOuterSVG);
}

module CablePassThrough() {

    CableWidth=6;
    CableHeight=3.6;

    translate(CablePassThroughPosition)
        RoundedCube([CablePassThroughLength, CableHeight, CableWidth], CableHeight/2);
}

module PowerBoxCasing3D()
{

    difference() {
        union() {
            linear_extrude(height=(MWLRS50BoxZ + (2 * MountPointHeight)) - BackThickness, convexity=32)
                PowerBoxCasing2D();
            CableMountBlock();
        }

        translate([11,24.8,0])
            for (i = [0 : 10])
                translate([i*6 + 2,0,MountPointHeight + BackThickness])
                    rotate([0,0,90])
                        RoundedCube([5,2,(MWLRS50BoxZ + (2 * MountPointHeight)) - 2 * (MountPointHeight + BackThickness)], 1);
        translate([11,118,0])
            for (i = [0 : 15])
                translate([i*6 + 2,0,MountPointHeight + BackThickness])
                    rotate([0,0,90])
                        RoundedCube([5,2,(MWLRS50BoxZ + (2 * MountPointHeight)) - 2 * (MountPointHeight + BackThickness)], 1);
        translate([1.5,109,0])
            for (i = [0 : 12])
                translate([0,i*-6,MountPointHeight + BackThickness])
                    RoundedCube([5,2,(MWLRS50BoxZ + (2 * MountPointHeight)) - 2 * (MountPointHeight + BackThickness)], 1);
    
        CableMountGuide();
        CablePassThrough();
    }
}

module PowerBox2D()
{
    PowerBoxCasing2D();

    difference() {
        offset(r=1)
            translate(PowerBoxInnerSVGOffset)
                mirror([1,0,0])
                    import(PowerBoxInnerSVG);
        translate(PowerBoxCableHolePosition)
            circle(d=QRBoxCableHoleDiameter); //, $fn=360);

        for(screw_hole=PowerBoxScrewHoles)
            translate(screw_hole)
                circle(d=PowerBoxScrewHoleSize);
    }
}

module PowerBox3D(showPSU=true, showInnerWall=false)
{
    linear_extrude(height=BackThickness, convexity=32)
        PowerBox2D();

    if (!$preview)
        PowerBoxCasing3D();

        translate(MWLRS50Position + [0,0,BackThickness])
            rotate(MWLRS50Rotation) {
                MWLRS50M3MountPoints3D(MountPointHeight);

                if ($preview && showPSU)
                    translate([0,0,MountPointHeight])
                        color("green")
                            MWLRS50_3D();
            }

    if ($preview && showInnerWall)
        color("green")
            translate([0, 0, BackThickness])
                linear_extrude(height=MountPointHeight, convexity=32)
                    difference()
                    {
                        offset(delta=InnerWallThickness)
                            PowerBoxLid2DInner();
                        PowerBoxLid2DInner();
                    }

}

module PowerBoxLid2DInner()
{
    translate(PowerBoxInnerSVGOffset)
        mirror([1,0,0])
            import(PowerBoxInnerSVG);
}

module PowerBoxLid2D()
{
    PowerBoxCasing2D();

    offset(r=1)
        PowerBoxLid2DInner();
}

module PowerBoxLid3D()
{
    translate([0,0,MWLRS50BoxZ + (2 * MountPointHeight) - BackThickness])
        linear_extrude(height=BackThickness, convexity=32)
            PowerBoxLid2D();

    translate([0, 0, MWLRS50BoxZ + (2 * MountPointHeight) - MountPointHeight - BackThickness])
        linear_extrude(height=MountPointHeight, convexity=32)
            difference()
            {
                PowerBoxLid2DInner();
                offset(delta=-(InnerWallThickness))
                    PowerBoxLid2DInner();
            }
}

module PowerBox()
{
    if (View=="3D")
    {
        if (Section=="All") {
                PowerBox3D();
        }
    } else {
        if (Section=="All") {
            PowerBox2D();
        }
    }
}
