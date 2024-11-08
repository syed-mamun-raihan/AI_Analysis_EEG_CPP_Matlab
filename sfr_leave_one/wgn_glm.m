%-- 9/24/06 11:50 AM --%
cd ../rv1
load validation4.mat
vaso1 = wgn(1,111:115);
nonvaso1=wgn(1,271:275);
cd ../masse2
load validation4.mat
vaso2 = wgn(6,1:5);
nonvaso2 = wgn(6,46:50);
cd ../voth3
load validation9.mat
vaso3 = wgn(5,1:5);
nonvaso3 = wgn(5,76:80);
cd ../liz4/
load validation6.mat
vaso4=wgn(2,1:5);
nonvaso4=wgn(2,26:30);
cd ../coma8
load validation5.mat
vaso5=wgn(2,31:35);
nonvaso5=wgn(2,1:5);
cd ../coma9
load validation2.mat
vaso6=wgn(3,6:10);
nonvaso6=wgn(3,41:45);
set1v =[vaso1; vaso2; vaso3; vaso4; vaso5];
set1n =[nonvaso1; nonvaso2; nonvaso3; nonvaso4; nonvaso5];
set2v =[vaso2; vaso3; vaso4; vaso5; vaso6;];
set2n =[nonvaso2; nonvaso3; nonvaso4; nonvaso5; nonvaso6];
set3v =[vaso3; vaso4; vaso5; vaso6; vaso1];
set3n =[nonvaso3; nonvaso4; nonvaso5; nonvaso6; nonvaso1];
set4v =[vaso4; vaso5; vaso6; vaso1; vaso2];
set4n =[nonvaso4; nonvaso5; nonvaso6; nonvaso1; nonvaso2];
set5v =[vaso5; vaso6; vaso1; vaso2; vaso3];
set5n =[nonvaso5; nonvaso6; nonvaso1; nonvaso2; nonvaso3];
set6v =[vaso6; vaso1; vaso2; vaso3; vaso4];
set6n =[nonvaso6; nonvaso1; nonvaso2; nonvaso3; nonvaso4];
groups = [.95;.95;.95;.95;.95;.05;.05;.05;.05;.05];
vcor = 0;
ncor = 0;
tot = 0;
b=glmfit([set1v;set1n],groups);
class=glmval(b,vaso6,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso6,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;

b=glmfit([set2v;set2n],groups);
class=glmval(b,vaso1,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso1,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;

b=glmfit([set3v;set3n],groups);
class=glmval(b,vaso2,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso2,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;

b=glmfit([set4v;set4n],groups);
class=glmval(b,vaso3,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso3,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;

b=glmfit([set5v;set5n],groups);
class=glmval(b,vaso4,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso4,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;

b=glmfit([set6v;set6n],groups);
class=glmval(b,vaso5,'identity');
if class > 0.5
    vcor = vcor+1;
end
    tot = tot+1;

class=glmval(b,nonvaso5,'identity');
if class < 0.5
    ncor = ncor+1;
end
    tot = tot+1;
    tot = tot/2;
disp('-----------------')    
disp('Test result with Residual using logistic regression')
disp('-----------------')
disp(sprintf('True positive segments %i out of %i',vcor, tot));
disp(sprintf('True negetive segments %i out of %i',ncor, tot));
TPF = (vcor / tot)*100;
TNF = (ncor / tot)*100;
disp(sprintf('TPF %2.2f%%',TPF));
disp(sprintf('TNF %2.2f%%',TNF));
cd ../sfr_leave_one
save wgn_glm.mat;