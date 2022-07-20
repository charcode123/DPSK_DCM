M=2;
%x=randi([0 M-1],500,1)
x=[1,0,1,1,0,1,1,0];
x=reshape(x,8,1);
y=dpskmod(x,M,pi/8);
cd = comm.ConstellationDiagram('ShowTrajectory',true,'ShowReferenceConstellation',false);
cd(y)