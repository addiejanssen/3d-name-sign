/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

$fa = 0.2;
$fs = 0.2;
$fn = 90;

//Which parts to print?
Parts="Back"; //[Back, Casing, Lid, Drill_Template]
ShowPSU=true; //[true, false]
ShowInnerWall=true; //[true, false]

//-------------------------------------------------------------------------------
//  Here we go. The code is split up in different modules.
//-------------------------------------------------------------------------------

include <Settings.scad>;
include <Modules\Shared.scad>;
include <Modules\MWLRS50.scad>;
include <Modules\PowerBox.scad>;

if (Parts=="Back")
    PowerBox3D(showPSU=ShowPSU, showInnerWall=ShowInnerWall);

if (Parts=="Casing")
    PowerBoxCasing3D();

if (Parts=="Lid")
    PowerBoxLid3D();

if (Parts=="Drill_Template") {

    PowerBoxScrewHoleSize=2;
    linear_extrude(height=0.6, convexity=32)
            PowerBox2D();
}
