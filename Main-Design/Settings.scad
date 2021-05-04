/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

/* [Hidden] */

//The text that we will work with....
Text="AddIEJANSSEN.coM";

//Height of the font; Total height = number of lines x the CaseHeight
CaseHeight=100;

//Depth of the sign
CaseDepth=50;

//front thickness
FrontThickness=.8;

//back thickness
BackThickness=2;

//wall thickness of the inner walls of the back and front
InnerWallThickness=1;

//The depth of the inner wall as attached to the back
BackInnerWallDepth=10;

//The fysical dimensions of the LED strip
LEDStripWidth=12;       // The width of the LED strip
LEDSpacing=1000/60;     // The space between the LEDs
LEDSize=5;              // The size of an individual LED; assuming they are squares
LEDHeight=2;            // The height of an individual LED

//This is a layer of material on the inner side of the back
// to reflect the light of the LEDs
LEDReflectionLayer=1;

//Fonts to use
OuterFontName="Namskout";
InnerFontName="NamskoutIn";

//QR
QRBoxPosition=[85,-1,0];
QRInnerSVG="QRBox-SVG\\QRBox-Inner.svg";
QROuterSVG="QRBox-SVG\\QRBox-Outer.svg";
QRInnerOffset=QRBoxPosition+[11,-184,0];    //+[96,-185,0];
QROuterOffset=QRBoxPosition+[2,-197,0];     //[87,-198,0];
QRCodeOffset=QRBoxPosition+[43,35,0];       //[128,34,0];
QRCodeSize=74;

QRBoxBackInnerWallDepth=20;
QRBoxLEDLayerInnerWallDepth=10;

//Locate the devices in the QRBox
TXS0108Position=[60,89,0];
TXS0108Rotation=[0,0,270];
ESP8266Position=[90,89,0];
ESP8266Rotation=[0,0,270];
MountPointHeight=6;
QRBoxCableHolePosition=[38,20,0];
QRBoxCableHoleDiameter=6;
QRBoxLEDLayerCableHolePosition=[60,40,0];
QRBoxLEDLayerCableHoleDiameter=6;

//The space in x-direction between the individual letters
Letter1XSpace  = 0;
Letter2XSpace  = 82;
Letter3XSpace  = 66;
Letter4XSpace  = 68;
Letter5XSpace  = 33;
Letter6XSpace  = 59;
Letter7XSpace  = 55;
Letter8XSpace  = 82;
Letter9XSpace  = 85;
Letter10XSpace = 74;
Letter11XSpace = 70;
Letter12XSpace = 67;
Letter13XSpace = 78;
Letter14XSpace = 18;
Letter15XSpace = 70;
Letter16XSpace = 80;

xspace1  =            Letter1XSpace;
xspace2  = xspace1  + Letter2XSpace;
xspace3  = xspace2  + Letter3XSpace;
xspace4  = xspace3  + Letter4XSpace;
xspace5  = xspace4  + Letter5XSpace;
xspace6  = xspace5  + Letter6XSpace;
xspace7  = xspace6  + Letter7XSpace;
xspace8  = xspace7  + Letter8XSpace;
xspace9  = xspace8  + Letter9XSpace;
xspace10 = xspace9  + Letter10XSpace;
xspace11 = xspace10 + Letter11XSpace;
xspace12 = xspace11 + Letter12XSpace;
xspace13 = xspace12 + Letter13XSpace;
xspace14 = xspace13 + Letter14XSpace;
xspace15 = xspace14 + Letter15XSpace;
xspace16 = xspace15 + Letter16XSpace;

XSpace = [xspace1, xspace2, xspace3, xspace4, xspace5, xspace6, xspace7, xspace8, xspace9, xspace10, xspace11, xspace12, xspace13, xspace14, xspace15, xspace16];

//The sign will use multiple lines; we need to spread the works in both the x- and y-direction
Line1XSpace = -3;
Line2XSpace = Line1XSpace + 148;
Line3XSpace = Line2XSpace + 323;

Line3YSpace = 25;
Line2YSpace = Line3YSpace + 94;
Line1YSpace = Line2YSpace + 93;

LineXSpace = [Line1XSpace, Line2XSpace, Line3XSpace];
LineYSpace = [Line1YSpace, Line2YSpace, Line3YSpace];

//We can not print the whole sign in one go; this is a breakup of the sign in sections to print
Section0 = [true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true  ];
Section1 = [true,  true,  true,  false, false, true,  false, false, false, false, false, false, false, false, false, false ];
Section2 = [false, false, false, true,  true,  false, true,  true,  false, false, false, false, false, false, false, false ];
Section3 = [false, false, false, false, false, false, false, false, true,  true,  true,  false, true,  true,  false, false ];
Section4 = [false, false, false, false, false, false, false, false, false, false, false, true,  false, false, true,  false ];
Section5 = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true  ];

LineStart = [0, 5, 12];
LineEnd = [5, 12, 16];
LineCount = 2;

//The location of the LEDs within each letter; [count, x, y, angle]

Letter1LED  = [ [2, 87,  4,  50],   [2, 53,  24, 120],  [2,  38, 62, 270],  [1,  48,  85, 270]  ];
Letter2LED  = [ [5, 25,  7,   0],   [3, 60,  87, 200],  [2,  42, 28, 270]                       ];
Letter3LED  = [ [5, 25,  7,   0],   [3, 60,  87, 200],  [2,  42, 28, 270]                       ];
Letter4LED  = [ [5, 25,  7,   0]                                                                ];
Letter5LED  = [ [4, 22, 25,   0],   [3, 36,  85, 270],  [2,  36, 55, 270],  [3,  36,  24, 270]  ];
Letter6LED  = [ [2, 55,  9,  75],   [3, 52,  25, 355],  [3,  71, 77,  90]                       ];
Letter7LED  = [ [2, 87,  4,  50],   [2, 53,  24, 120],  [2,  71, 50,  90],  [1,  64,  75,  90]  ];
Letter8LED  = [ [4, 32, 90, 184],   [2, 22,  18, 283],  [5,  79, 10,  31],  [3,  80,  61, 355]  ];
Letter9LED  = [ [3, 32, 86, 270],   [3, 29,  65, 254],  [4,  20, 35, 255]                       ];
Letter10LED = [ [3, 28, 85, 272],   [3, 72,  39,  74],  [4,  20, 35, 255]                       ];
Letter11LED = [ [4, 34, 90, 180],   [2, 44,  85, 270],  [2,  36, 55, 270],  [2,  44,  24, 270]  ];
Letter12LED = [ [4, 25, 23,   4],   [2, 21,  20, 275],  [5,  44, 90, 211],  [6,  97, 112, 182]  ];
Letter13LED = [ [1, 26,  6,  37]                                                                ];
Letter14LED = [ [2, 65, 56,  27],   [4, 42,  82, 180],  [2,  75, 40, 160]                       ];
Letter15LED = [ [3, 42, 10,  31],   [2, 56,  78, 121],  [3,  81, 38,  29],  [2,  90,  26, 121]  ];
Letter16LED = [ [4, 32, 77, 189],   [5, 75,  12,  31],  [3,  78, 42, 330],  [6, 129,  89, 180]  ];
QRLED       = [ [6, 33, 12,   0],   [4, 90, 106, 180],  [4, 120, 40,   0]                       ];

// 171 LEDs x 50 mA per LED at full power = 8.55 A

LEDStrips = [Letter1LED, Letter2LED, Letter3LED, Letter4LED, Letter5LED, Letter6LED, Letter7LED, Letter8LED, Letter9LED, Letter10LED, Letter11LED, Letter12LED, Letter13LED, Letter14LED, Letter15LED, Letter16LED];

// position, rotate
CutOuts  =  [
    [  [Line1XSpace - xspace1  + xspace1,  Line1YSpace, 0] + [ 49, 24, 0],  [0, 0,   0]  ],
    [  [Line1XSpace - xspace1  + xspace2,  Line1YSpace, 0] + [  8,  7, 0],  [0, 0,   0]  ],
    [  [Line1XSpace - xspace1  + xspace3,  Line1YSpace, 0] + [  8, 15, 0],  [0, 0,   0]  ],
    [  [Line1XSpace - xspace1  + xspace4,  Line1YSpace, 0] + [  7, 15, 0],  [0, 0,   0]  ],
    [  [Line1XSpace - xspace1  + xspace5,  Line1YSpace, 0] + [  7, 75, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace6,  Line2YSpace, 0] + [ 30, 88, 0],  [0, 0,  90]  ],
    [  [Line2XSpace - xspace6  + xspace6,  Line2YSpace, 0] + [ 44, -6, 0],  [0, 0,  90]  ],
    [  [Line2XSpace - xspace6  + xspace6,  Line2YSpace, 0] + [ 78, -6, 0],  [0, 0,  90]  ],
    [  [Line2XSpace - xspace6  + xspace7,  Line2YSpace, 0] + [ 49, 18, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace7,  Line2YSpace, 0] + [  4, 11, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace8,  Line2YSpace, 0] + [ 71, 50, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace8,  Line2YSpace, 0] + [ 48, 88, 0],  [0, 0,  90]  ],
    [  [Line2XSpace - xspace6  + xspace8,  Line2YSpace, 0] + [ 55, 16, 0],  [0, 0,  20]  ],
    [  [Line2XSpace - xspace6  + xspace9,  Line2YSpace, 0] + [  8, 64, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace10, Line2YSpace, 0] + [ 11, 10, 0],  [0, 0,  45]  ],
    [  [Line2XSpace - xspace6  + xspace11, Line2YSpace, 0] + [  5, 75, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace12, Line2YSpace, 0] + [  7, 12, 0],  [0, 0,   0]  ],
    [  [Line2XSpace - xspace6  + xspace12, Line2YSpace, 0] + [100, -5, 0],  [0, 0,  90]  ],
    [  [Line3XSpace - xspace13 + xspace13, Line3YSpace, 0] + [ 35, 15, 0],  [0, 0,  45]  ],
    [  [Line3XSpace - xspace13 + xspace14, Line3YSpace, 0] + [ 73, 57, 0],  [0, 0,   0]  ],
    [  [Line3XSpace - xspace13 + xspace15, Line3YSpace, 0] + [ 88, 29, 0],  [0, 0,   0]  ],
    [  [Line3XSpace - xspace13 + xspace16, Line3YSpace, 0] + [107, 28, 0],  [0, 0, 150]  ],
];

//
// QR code data for "https://www.addiejanssen.com" (25 x 25)
// Generated by Altair's OpenSCAD QR Code Generator
// https://ridercz.github.io/OpenSCAD-QR/
// https://github.com/ridercz/OpenSCAD-QR
//
QRCode = [[1,1,1,1,1,1,1,0,1,1,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1],
          [1,0,0,0,0,0,1,0,0,0,0,1,1,0,1,0,1,0,1,0,0,0,0,0,1],
          [1,0,1,1,1,0,1,0,0,1,0,1,0,1,0,1,0,0,1,0,1,1,1,0,1],
          [1,0,1,1,1,0,1,0,0,0,1,1,1,1,0,0,1,0,1,0,1,1,1,0,1],
          [1,0,1,1,1,0,1,0,0,0,1,1,1,0,1,0,1,0,1,0,1,1,1,0,1],
          [1,0,0,0,0,0,1,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1],
          [1,1,1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1],
          [0,0,0,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
          [1,1,0,1,1,0,1,0,0,1,0,1,1,0,1,0,1,0,1,0,0,0,0,0,1],
          [0,0,1,1,1,1,0,1,0,0,1,1,0,1,1,1,0,1,0,1,1,1,1,1,0],
          [1,1,0,1,0,1,1,0,0,1,0,1,0,1,0,1,0,0,1,1,0,1,0,0,1],
          [1,0,1,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1],
          [0,1,0,0,1,0,1,0,1,1,1,0,1,0,0,1,1,0,1,0,0,0,0,0,1],
          [1,1,1,0,0,1,0,0,0,0,1,1,0,1,0,1,1,1,0,0,1,0,0,1,0],
          [1,1,1,1,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,1,1,1,1,1],
          [1,0,1,1,1,0,0,1,0,1,0,1,1,0,0,0,0,1,0,1,0,1,1,0,1],
          [1,0,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,0],
          [0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,1,0,1,1,0],
          [1,1,1,1,1,1,1,0,0,0,0,1,1,0,1,0,1,0,1,0,1,0,0,0,1],
          [1,0,0,0,0,0,1,0,0,1,1,1,0,1,0,1,1,0,0,0,1,0,0,0,1],
          [1,0,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,0],
          [1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,1,1],
          [1,0,1,1,1,0,1,0,0,1,0,1,1,0,0,1,0,1,0,0,1,1,1,1,1],
          [1,0,0,0,0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,1,1,0,1,1,1],
          [1,1,1,1,1,1,1,0,1,1,1,0,1,0,0,0,1,1,0,0,0,1,0,0,1]];
