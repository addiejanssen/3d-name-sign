/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module CutOut2D()
{
    for (i = [0 : len(CutOuts) - 1]) {
        translate(CutOuts[i][0])
            rotate(CutOuts[i][1])
                square([15,10]);
    }
}

module CutOut3D()
{
    for (i = [0 : len(CutOuts) - 1]) {
        translate(CutOuts[i][0] + [0,0,-0.01])
            rotate(CutOuts[i][1])
                cube([15,10,BackInnerWallDepth + 0.02]);
    }
}

module CutOut()
{
    if (View=="3D")
        translate([0, 0, BackThickness])
            CutOut3D();
}
