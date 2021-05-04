/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

$fa = 0.01;
$fs = 0.01;

CaseHeight=100;
OuterFontName="Namskout";
InnerFontName="NamskoutIn";

Text="M";

View="Inner"; //[Inner, Outer]

if (View=="Inner")
    mirror([1,0,0])
        text("M", CaseHeight, font=InnerFontName, valign="baseline");

if (View=="Outer")
    mirror([1,0,0])
        text("M", CaseHeight, font=OuterFontName, valign="baseline");
