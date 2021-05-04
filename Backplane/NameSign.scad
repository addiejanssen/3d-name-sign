/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

$fa = 0.2;
$fs = 0.2;

//View
View="3D"; //[3D, 2D]
Section="All"; //[All,1,2,3,4,5,6]


//-------------------------------------------------------------------------------
//  Here we go. The code is split up in different modules.
//-------------------------------------------------------------------------------

include <Settings.scad>;
include <Modules\Back.scad>;


if (Section=="All") {
    color("green")
        Back();

    // 1
    translate([-5,190,-5])
        color("orange")
            square([70,130]);
    // 2
    translate([65,70,-5])
        color("yellow")
            square([190,250]);
    // 3
    translate([80,-5,-5])
        color("purple")
            square([190,75]);
    // 4
    translate([255,100,-5])
        color("orange")
            square([185,220]);
    // 5
    translate([440,-5,-5])
        color("yellow")
            square([180,250]);
    // 6
    translate([620,-5,-5])
        color("orange")
            square([180,250]);
}

if (Section=="1")
    intersection() {
        color("green")
            Back();
        translate([-5,190,-5])
            color("orange")
                cube([70,130,100]);
    }

if (Section=="2")
    intersection() {
        color("green")
            Back();
        translate([65,70,-5])
            color("yellow")
                cube([190,250,100]);
    }

if (Section=="3")
    intersection() {
        color("green")
            Back();
        translate([80,-5,-5])
            color("purple")
                cube([190,75,100]);
    }

if (Section=="4")
    intersection() {
        color("green")
            Back();
        translate([255,100,-5])
            color("orange")
                cube([185,220,100]);
    }

if (Section=="5")
    intersection() {
        color("green")
            Back();
        translate([440,-5,-5])
            color("yellow")
                cube([180,250,100]);
    }

if (Section=="6")
    intersection() {
        color("green")
            Back();
        translate([620,-5,-5])
            color("orange")
                cube([180,250,100]);
    }
