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

//Which parts to print?
Parts="Front_and_Casing"; //[Everything, QRBox_Code, QRBox_LED, Casing_only, Front_only, Back_only, LED_only, Front_and_Casing, Front_and_Back, Back_and_Casing, Back_and_LED, Casing_and_LED]

//-------------------------------------------------------------------------------
//  Here we go. The code is split up in different modules.
//-------------------------------------------------------------------------------

include <Settings.scad>;

include <Modules\CutOut.scad>;
include <Modules\Front.scad>;
include <Modules\Casing.scad>;
include <Modules\Back.scad>;
include <Modules\LED.scad>;
include <Modules\QRBox.scad>;
include <Modules\ESP8266.scad>;
include <Modules\TXS0108.scad>;

if (Parts=="Front_only" || Parts=="Everything")
{
    Front();
}

if (Parts=="Casing_only" || Parts=="Everything")
{
    color("blue")
        Casing();
}

if (Parts=="Back_only" || Parts=="Everything")
{
    color("green")
        Back();
}

if (Parts=="LED_only" || Parts=="Everything")
{
    Back2DInner(Section0);
    QRBoxBack2DInner();
    CutOut2D();

    LED();
    QRBoxLED();
}

if (Parts=="QRBox_LED")
{
    QRBoxLEDLayer();
}

if (Parts=="QRBox_Code")
{
    QRBoxCodeLayer();
}

if (Parts=="Front_and_Casing")
{
    Front();
    color("blue")
        Casing();
}

if (Parts=="Back_and_Casing")
{
    color("green")
        Back();
    color("blue")
        Casing();
}

if (Parts=="Front_and_Back")
{
    Front();
    color("green")
        Back();
}

if (Parts=="Back_and_LED")
{
    color("green")
        Back();
    LED();
}

if (Parts=="Casing_and_LED")
{
    color("blue")
        Casing();
    LED();
    QRBoxLED();
}
