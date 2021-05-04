/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module LEDIndividual2DStrip(count, x, y, angle)
{
    translate([x, y, 0])
        rotate([0,0, angle]) {
            color("gray")
                difference() {
                    square([LEDStripWidth, count* LEDSpacing]);
                    for (i = [0 : count - 1]) {
                        translate([(LEDStripWidth - LEDSize)/2, (i * LEDSpacing) + ((LEDSpacing - LEDSize)/2),0])
                                square([LEDSize, LEDSize]);
                    }
                    translate([1,1,0])
                        circle(r=1);
                }

            for (i = [0 : count - 1]) {
                translate([(LEDStripWidth - LEDSize)/2, (i * LEDSpacing) + ((LEDSpacing - LEDSize)/2),0])
                    color("white")
                        square([LEDSize, LEDSize]);
            }

            color("red")
                translate([1,1,0])
                    circle(r=1);
        }
}

module LED2DStrip(section)
{
    for (line = [0 : LineCount]) {
        translate ([LineXSpace[line] - XSpace[LineStart[line]], LineYSpace[line], 0])
            for (letter_index = [LineStart[line] : LineEnd[line] - 1]) {
                if (section[letter_index])
                {
                    strip = LEDStrips[letter_index];
                    if (len(strip) > 0)
                    {
                        for (strip_index = [0 : len(strip) -1])
                        {
                            count = strip[strip_index][0];
                            x = XSpace[letter_index] + strip[strip_index][1];
                            y = strip[strip_index][2];
                            angle = strip[strip_index][3];

                            LEDIndividual2DStrip(count, x, y, angle);
                        }
                    }
                }
            }
    }
}

module LEDIndividual3DStrip(count, x, y, angle)
{
    translate([x, y, 0])
        rotate([0,0, angle]) {
            if ($preview) {
                color("red")
                    translate([-1,-1,0])
                        cylinder(h=1, r=1, $fn=360);

                color("gray")
                    difference() {
                        cube([LEDStripWidth, count * LEDSpacing, LEDHeight/10]);
                        for (i = [0 : count - 1]) {
                            translate([(LEDStripWidth - LEDSize)/2, (i * LEDSpacing) + ((LEDSpacing - LEDSize)/2),0])
                                    cube([LEDSize, LEDSize, LEDHeight]);
                        }
                    }

                for (i = [0 : count - 1]) {
                    translate([(LEDStripWidth - LEDSize)/2, (i * LEDSpacing) + ((LEDSpacing - LEDSize)/2),0])
                        color("white")
                            cube([LEDSize, LEDSize, LEDHeight]);
                }
            }
            else {
                translate([-1,1.5,0])
                    cylinder(h=0.4, r=1.5, $fn=360);
                difference() {
                    cube([LEDStripWidth, count * LEDSpacing, 0.4]);
                    translate([0.5, 0, 0])
                        cube([LEDStripWidth - 1, count * LEDSpacing, 0.4]);
                }
            }
        }
}

module LED3DStrip(section)
{
    for (line = [0 : LineCount]) {
        translate ([LineXSpace[line] - XSpace[LineStart[line]], LineYSpace[line], BackThickness + LEDReflectionLayer])
            for (letter_index = [LineStart[line] : LineEnd[line] - 1]) {
                if (section[letter_index])
                {
                    strip = LEDStrips[letter_index];
                    if (len(strip) > 0)
                    {
                        for (strip_index = [0 : len(strip) -1])
                        {
                            count = strip[strip_index][0];
                            x = XSpace[letter_index] + strip[strip_index][1];
                            y = strip[strip_index][2];
                            angle = strip[strip_index][3];

                            LEDIndividual3DStrip(count, x, y, angle);
                        }
                    }
                }
            }
    }
}

module LED()
{
    if (View=="3D")
    {
        if (Section=="All")
            LED3DStrip(Section0);
        else
        {
            if (Section=="1")
                LED3DStrip(Section1);
            if (Section=="2")
                LED3DStrip(Section2);
            if (Section=="3")
                LED3DStrip(Section3);
            if (Section=="4")
                LED3DStrip(Section4);
            if (Section=="5")
                LED3DStrip(Section5);
        }
    } else {
        if (Section=="All") {
            LED2DStrip(Section0);
            QRBoxLED2D();
        }
        else
        {
            if (Section=="1")
                LED2DStrip(Section1);
            if (Section=="2")
                LED2DStrip(Section2);
            if (Section=="3")
                LED2DStrip(Section3);
            if (Section=="4")
                LED2DStrip(Section4);
            if (Section=="5")
                LED2DStrip(Section5);
            if (Section=="6")
                QRBoxLED2D();
        }
    }
}
