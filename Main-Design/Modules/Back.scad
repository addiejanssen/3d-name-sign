/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module Back2D(section)
{
    difference() {
        for (l = [0 : LineCount]) {
            translate ([LineXSpace[l] - XSpace[LineStart[l]], LineYSpace[l],0])
                for (i = [LineStart[l] : LineEnd[l] - 1]) {
                    if (section[i])
                    {
                        if (i < LineEnd[l] - 1)
                        {
                            difference() {
                                translate ([XSpace[i],0,0])
                                    union()
                                    {
                                        text(Text[i], CaseHeight, font=OuterFontName, valign="baseline");
                                        offset(r=1)
                                            text(Text[i], CaseHeight, font=InnerFontName, valign="baseline");
                                    }

                                translate ([XSpace[i + 1],0,0])
                                    union() {
                                        text(Text[i + 1], CaseHeight, font=OuterFontName, valign="baseline");
                                        offset(r=1)
                                            text(Text[i + 1], CaseHeight, font=InnerFontName, valign="baseline");
                                    }
                            }
                        }
                        else
                        {
                            translate ([XSpace[i],0,0])
                                union()
                                {
                                    text(Text[i], CaseHeight, font=OuterFontName, valign="baseline");
                                    offset(r=1)
                                        text(Text[i], CaseHeight, font=InnerFontName, valign="baseline");
                                }
                        }
                    }
                }
        }

        // This is a dirty hack to fix a little visual glitch.
        // The second "S" is causing a little line on top of the "E".
        translate([xspace9, Line2YSpace+CaseHeight-2.78,0])    
            square([10,10]);
    }
}

module Back2DInner(section)
{
    for (l = [0 : LineCount]) {
        translate ([LineXSpace[l] - XSpace[LineStart[l]], LineYSpace[l], 0])
            for (i = [LineStart[l] : LineEnd[l] - 1]) {
                if (section[i])
                {
                    if (i < LineEnd[l] - 1)
                    {
                        difference() {
                            translate ([XSpace[i],0,0])
                                text(Text[i], CaseHeight, font=InnerFontName, valign="baseline");

                            translate ([XSpace[i + 1],0,0])
                                union() {
                                    text(Text[i + 1], CaseHeight, font=OuterFontName, valign="baseline");
                                    offset(r=1)
                                        text(Text[i + 1], CaseHeight, font=InnerFontName, valign="baseline");
                                }
                        }
                    }
                    else
                    {
                        translate ([XSpace[i],0,0])
                            text(Text[i], CaseHeight, font=InnerFontName, valign="baseline");
                    }
                }
            }
    }
}

module Back3D(section)
{
    linear_extrude(height=BackThickness, convexity=32)
        Back2D(section);

    translate([0, 0, BackThickness]) {
        linear_extrude(height=LEDReflectionLayer, convexity=32)
            Back2DInner(section);

        linear_extrude(height=BackInnerWallDepth, convexity=32)
            difference()
            {
                Back2DInner(section);
                offset(delta=-(InnerWallThickness))
                    Back2DInner(section);
                CutOut2D();
            }
    }
}

module Back()
{
    if (View=="3D")
    {
        if (Section=="All") {
            Back3D(Section0);
            QRBoxBack3D();
        }
        else
        {
            if (Section=="1")
                difference(){
                    Back3D(Section1);
                    Back3D(Section2);
                    QRBoxBack3D();
                }
            if (Section=="2")
                difference(){
                    Back3D(Section2);
                    Back3D(Section3);
                    QRBoxBack3D();
                }
            if (Section=="3")
                difference(){
                    Back3D(Section3);
                    Back3D(Section4);
                }
            if (Section=="4")
                difference(){
                    Back3D(Section4);
                    Back3D(Section5);
                }
            if (Section=="5")
                Back3D(Section5);
            if (Section=="6")
                QRBoxBack3D();
        }
    } else {
        if (Section=="All") {
            Back2D(Section0);
            QRBoxBack2D();
        }
        else
        {
            if (Section=="1")
                difference(){
                    Back2D(Section1);
                    Back2D(Section2);
                    QRBoxBack2D();
                }
            if (Section=="2")
                difference(){
                    Back2D(Section2);
                    Back2D(Section3);
                    QRBoxBack2D();
                }
            if (Section=="3")
                difference(){
                    Back2D(Section3);
                    Back2D(Section4);
                }
            if (Section=="4")
                difference(){
                    Back2D(Section4);
                    Back2D(Section5);
                }
            if (Section=="5")
                Back2D(Section5);
            if (Section=="6")
                QRBoxBack2D();
        }
    }
}
