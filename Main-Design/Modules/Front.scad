/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module Front2D(section)
{
    for (l = [0 : LineCount]) {
        translate ([LineXSpace[l] - XSpace[LineStart[l]], LineYSpace[l],0])
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

module Front3D(section)
{
    translate([0, 0, BackInnerWallDepth])
        linear_extrude(height=CaseDepth - BackInnerWallDepth, convexity=32)
            difference()
            {
                Front2D(section);
                offset(delta=-(InnerWallThickness))
                    Front2D(section);
            }

    translate([0, 0, CaseDepth - FrontThickness])
        linear_extrude(height=FrontThickness, convexity=32)
            Front2D(section);
}

module Front()
{
    if (View=="3D")
    {
        translate([0, 0, BackThickness])
        if (Section=="All") {
            Front3D(Section0);
            QRBoxFront3D();
        }
        else
        {
            if (Section=="1")
                Front3D(Section1);
            if (Section=="2")
                Front3D(Section2);
            if (Section=="3")
                Front3D(Section3);
            if (Section=="4")
                Front3D(Section4);
            if (Section=="5")
                Front3D(Section5);
            if (Section=="6")
                QRBoxFront3D();
        }
    } else {
        if (Section=="All") {
            Front2D(Section0);
            QRBoxFront2D();
        }
        else
        {
            if (Section=="1")
                Front2D(Section1);
            if (Section=="2")
                Front2D(Section2);
            if (Section=="3")
                Front2D(Section3);
            if (Section=="4")
                Front2D(Section4);
            if (Section=="5")
                Front2D(Section5);
            if (Section=="6")
                QRBoxFront2D();
        }
    }
}
