SetFactory("OpenCASCADE");


r1 = 0.4;
y1 = 1;
r2 = 0.25;
y2 = 0.2;
r3 = 0.04;
y3 = 0.5;
xc3 = r3 - r2;
yc3 = 0.25;  //bottom center y


Cylinder(1) = {0, 0, 0, 0, y1, 0, r1, 2*Pi};
Cylinder(2) = {0, 0, 0, 0, y2, 0, r2, 2*Pi};
Cylinder(3) = {xc3, yc3, 0, 0, y3, 0, r3, 2*Pi};

BooleanDifference(4) = { Volume{1}; Delete; }{ Volume{2}; Delete; };
BooleanDifference(5) = { Volume{4}; Delete; }{ Volume{3}; Delete; };


Field[1] = Cylinder;
Field[1].YAxis = y3;
Field[1].ZAxis = 0;
Field[1].XAxis = 0;
Field[1].XCenter = xc3;
Field[1].YCenter = yc3;
//+
Background Field = 1;
//+
Field[1].Radius = r3+0.001;
//+
Field[1].VIn = 0.02; //0.0245;
Field[1].VOut = 0.1; //0.09810000000000001;
//+
//Hide "*";
Hide {
Volume {4};
}
//+
Show {
Point{1,3};
Curve{1,4};
Surface{2};
}

