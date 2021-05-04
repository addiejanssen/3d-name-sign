/*--------------------------------------------------------*/
/* 3D Name Sign
/*
/* Created by Addie Janssen (February 1, 2021)
/*--------------------------------------------------------*/

module QRBoxCasing2D()
{
    translate(QROuterOffset)
        import(QROuterSVG);
}

module QRBoxCasing3D()
{
    difference() {
        translate(QROuterOffset)
            linear_extrude(height=CaseDepth, convexity=32)
                import(QROuterSVG);
        CutOut3D();
        translate(QRBoxPosition + ESP8266Position)
            rotate(ESP8266Rotation)
                ESP8266USBHole3D(MountPointHeight);
    }
}

module QRBoxFront2D()
{
    difference() {
        translate(QRInnerOffset)
                import(QRInnerSVG);
        translate(QRCodeOffset)
                QRBoxRenderCode(QRCodeSize);
    }
}

module QRBoxFront3D()
{
    translate([0, 0, QRBoxBackInnerWallDepth + QRBoxLEDLayerInnerWallDepth])
        linear_extrude(height=CaseDepth - (QRBoxBackInnerWallDepth + QRBoxLEDLayerInnerWallDepth + FrontThickness), convexity=32)
            difference()
            {
                translate(QRInnerOffset)
                        import(QRInnerSVG);
                offset(delta=-(InnerWallThickness))
                    translate(QRInnerOffset)
                            import(QRInnerSVG);
            }

    translate([0, 0, CaseDepth - FrontThickness]) {
        linear_extrude(height=FrontThickness / 2, convexity=32)
            translate(QRInnerOffset)
                    import(QRInnerSVG);
    }
}

module QRBoxBack2D()
{
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

module QRBoxBack2DInner()
{
    translate(QRInnerOffset)
        import(QRInnerSVG);
}

module QRBoxBack3D()
{
    linear_extrude(height=BackThickness, convexity=32)
        QRBoxBack2D();

    difference() {
        translate([0, 0, BackThickness])
            linear_extrude(height=QRBoxBackInnerWallDepth, convexity=32)
                difference()
                {
                    QRBoxBack2DInner();
                    offset(delta=-(InnerWallThickness))
                        QRBoxBack2DInner();
                }
        translate([0,0,BackThickness])
            CutOut3D();
        translate(QRBoxPosition + ESP8266Position + [0,0,BackThickness])
            rotate(ESP8266Rotation)
                ESP8266USBHole3D(MountPointHeight);
    }

    translate(QRBoxPosition + TXS0108Position + [0,0,BackThickness])
        rotate(TXS0108Rotation) {
            TXS0108M2MountPoints3D(MountPointHeight);
            
            if ($preview) {
                translate([0,0,MountPointHeight])
                    TXS01083D();
            }
        }

    translate(QRBoxPosition + ESP8266Position + [0,0,BackThickness])
        rotate(ESP8266Rotation) {
            ESP8266M2MountPoints3D(MountPointHeight);
            
            if ($preview) {
                translate([0,0,MountPointHeight])
                    ESP82663D();
            }
        }
}

//
// Check this code; the size isn't working as expected
//
module QRBoxRenderCode(size) {
    maxmod = len(QRCode) - 1;
    module_size = size/maxmod;
    union() {
        for(r = [0 : maxmod]) {
            for(c = [0 : maxmod]) {
                if(QRCode[r][c] == 1){
                    xo = c * module_size;
                    yo = (maxmod - r) * module_size;
                    
                    translate([xo, yo, 0])
                        square([module_size + 0.01, module_size + 0.01], center=false);
                }
            }
        }
    }
}

module QRBoxLED2D() {

    translate(QRBoxPosition)
       for (strip_index = [0 : len(QRLED) -1])
        {
            count = QRLED[strip_index][0];
            x = QRLED[strip_index][1];
            y = QRLED[strip_index][2];
            angle = QRLED[strip_index][3];
            LEDIndividual2DStrip(count, x, y, angle);
        }
}

module QRBoxLED3D() {

    translate(QRBoxPosition + [0,0,QRBoxBackInnerWallDepth + LEDReflectionLayer])
       for (strip_index = [0 : len(QRLED) -1])
        {
            count = QRLED[strip_index][0];
            x = QRLED[strip_index][1];
            y = QRLED[strip_index][2];
            angle = QRLED[strip_index][3];
            
            LEDIndividual3DStrip(count, x, y, angle);
        }
}

module QRBoxLED() {

    if (View == "3D")
        QRBoxLED3D();
    else
        QRBoxLED2D();
}

module QRBoxLEDLayer() {
    
    if (View == "3D") {
        difference() {
            translate([0, 0, QRBoxBackInnerWallDepth]) {
                linear_extrude(height = LEDReflectionLayer, convexity=32)
                        translate(QRInnerOffset)
                                import(QRInnerSVG);
                linear_extrude(height=QRBoxLEDLayerInnerWallDepth, convexity=32)
                    difference()
                    {
                        translate(QRInnerOffset)
                                import(QRInnerSVG);
                        offset(delta=-(InnerWallThickness))
                            translate(QRInnerOffset)
                                    import(QRInnerSVG);
                    }
            }
            translate(QRBoxPosition + QRBoxLEDLayerCableHolePosition + [0,0,-0.01])
                cylinder(d=QRBoxLEDLayerCableHoleDiameter, h=QRBoxBackInnerWallDepth +LEDReflectionLayer+0.02, $fn=360);
        }

        QRBoxLED3D();
    }
}

module QRBoxCodeLayer() {

    translate([0, 0, CaseDepth - (FrontThickness / 2)]) {
        linear_extrude(height=FrontThickness / 2, convexity=32)
            translate(QRInnerOffset)
                    import(QRInnerSVG);
        color("black")
            linear_extrude(height=1, convexity=32)
                translate(QRCodeOffset)
                        QRBoxRenderCode(QRCodeSize);
    }
}