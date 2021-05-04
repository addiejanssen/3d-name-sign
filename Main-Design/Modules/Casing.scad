/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module Casing2D(section)
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
                                    text(Text[i], CaseHeight, font=OuterFontName, valign="baseline");

                                translate ([XSpace[i + 1],0,0])
                                    union() {
                                        text(Text[i + 1], CaseHeight, font=OuterFontName, valign="baseline");
                                        offset(r=0.01)
                                            text(Text[i + 1], CaseHeight, font=InnerFontName, valign="baseline");
                                    }
                            }
                        }
                        else
                        {
                            translate ([XSpace[i],0,0])
                                text(Text[i], CaseHeight, font=OuterFontName, valign="baseline");
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

module Casing3D(section)
{
    difference() {
        linear_extrude(height=CaseDepth, convexity=32)
            Casing2D(section);
        CutOut3D();
    }
}

module Casing()
{
    if (View=="3D")
    {
        translate([0, 0, BackThickness])
        if (Section=="All")
        {
            Casing3D(Section0);
            QRBoxCasing3D();
        }
        else
        {
            if (Section=="1")
                difference(){
                    Casing3D(Section1);
                    Casing3D(Section2);
                    QRBoxCasing3D();
                }

            if (Section=="2")
                difference(){
                    Casing3D(Section2);
                    Casing3D(Section3);
                    QRBoxCasing3D();
                }

            if (Section=="3")
                difference(){
                    Casing3D(Section3);
                    Casing3D(Section4);
                }

            if (Section=="4")
                difference(){
                    Casing3D(Section4);
                    Casing3D(Section5);
                }

            if (Section=="5")
                Casing3D(Section5);

            if (Section=="6")
                QRBoxCasing3D();
        }
    } else {
        if (Section=="All")
        {
            difference() {
                union() {
                    Casing2D(Section0);
                    QRBoxCasing2D();
                }
                CutOut2D();
            }
        }
        else
        {
            if (Section=="1")
                difference(){
                    Casing2D(Section1);
                    Casing2D(Section2);
                    QRBoxCasing2D();
                }

            if (Section=="2")
                difference(){
                    Casing2D(Section2);
                    Casing2D(Section3);
                    QRBoxCasing2D();
                }

            if (Section=="3")
                difference(){
                    Casing2D(Section3);
                    Casing2D(Section4);
                }

            if (Section=="4")
                difference(){
                    Casing2D(Section4);
                    Casing2D(Section5);
                }

            if (Section=="5")
                Casing2D(Section5);

            if (Section=="6")
                QRBoxCasing2D();
        }
    }
}
