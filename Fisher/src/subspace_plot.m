%part d

load fisheriris

%take the mean
xmean = mean(meas(1:150, 1));
ymean = mean(meas(1:150, 2));
zmean = mean(meas(1:150, 3));

%normalize the points
xreg = meas(1:150, 1) - xmean * ones(150, 1);
yreg = meas(1:150, 2) - ymean * ones(150, 1);
zreg = meas(1:150, 3) - zmean * ones(150, 1);
measreg = [xreg, yreg, zreg];

%plane is spanned by any two vectors in this plane


%find normal
point1 = measreg(62,:)';
point2 = measreg(60,:)';
point3 = measreg(65,:)';

normal = cross(point1-point2, point1 - point3)
point = measreg(60,:)
d = -point*normal; 

%# create x,y
[xx,yy]=ndgrid(-5:5,-5:5);


%# calculate corresponding z
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);

figure(4); clf
scatter3(measreg(1:50, 1), measreg(1:50, 2), measreg(1:50, 3), 'ro');
hold on
scatter3(measreg(51:100, 1), measreg(51:100, 2), measreg(51:100, 3), 'bx');
hold on
scatter3(measreg(101:150, 1), measreg(101:150, 2), measreg(101:150, 3), 'gx');
hold on
surf(xx,yy,z)


