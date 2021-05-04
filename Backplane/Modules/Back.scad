/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module Back2D()
{
    difference() {
        union() {
            for (l = [0 : LineCount]) {
                translate ([LineXSpace[l] - XSpace[LineStart[l]], LineYSpace[l],0])
                    for (i = [LineStart[l] : LineEnd[l] - 1]) {
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

            translate(QROuterOffset)
                import(QROuterSVG);

            difference() {
                offset(r=1)
                    translate(QRInnerOffset)
                        import(QRInnerSVG);
                translate(QRBoxPosition + QRBoxCableHolePosition)
                    circle(d=QRBoxCableHoleDiameter, $fn=360);
            }
        }

        // This is a dirty hack to fix a little visual glitch.
        // The second "S" is causing a little line on top of the "E".
        translate([xspace9, Line2YSpace+CaseHeight-2.78,0])    
            square([10,10]);
    }
}

module Back3D()
{
    linear_extrude(height=BackThickness, convexity=32)
        Back2D();
}

module Back()
{
    if (View=="3D")
    {
        Back3D();
    } else {
        Back2D();
    }
}
