function u = funcSD_60_20(xx) 

%%%% weights relted to microsphere concept %%%%
www = [0.0265214244093, 0.0265214244093, 0.0265214244093,... 
   0.0199301476312, 0.0199301476312, 0.0199301476312, 0.0199301476312...
    0.0199301476312, 0.0199301476312, 0.0250712367487,...
   0.0250712367487, 0.0250712367487, 0.0250712367487, 0.0250712367487...
    0.0250712367487, 0.0250712367487, 0.0250712367487,...
   0.0250712367487, 0.0250712367487, 0.0250712367487, 0.0250712367487];

%%%%% directions related to microsphere concept %%%%
DDD = zeros(21,3);
DDD(1,:)=[1, 0, 0];
DDD(2,:)=[0, 1, 0];
DDD(3,:)=[0, 0, 1];
DDD(4,:)=[0.707107, 0.707107, 0];
DDD(5,:)=[0.707107, -0.707107, 0];
DDD(6,:)=[0.707107, 0, 0.707107];
DDD(7,:)=[0.707107, 0, -0.707107];
DDD(8,:)=[0, 0.707107, 0.707107];
DDD(9,:)=[0, 0.707107, -0.707107];
DDD(10,:)=[0.387907, 0.387907, 0.830097];
DDD(11,:)=[0.387907, 0.387907, -0.830097];
DDD(12,:)=[0.387907, -0.387907, 0.830097];
DDD(13,:)=[0.387907, 0.387907, -0.830097];
DDD(14,:)=[0.387907, 0.830097, 0.387907];
DDD(15,:)=[0.387907, 0.830097, -0.387907];
DDD(16,:)=[0.387907, -0.830097, 0.387907];
DDD(17,:)=[0.387907, -0.830097, -0.387907];
DDD(18,:)=[0.830097, 0.387907, 0.387907];
DDD(19,:)=[0.830097, 0.387907, -0.387907];
DDD(20,:)=[0.830097, -0.387907, 0.387907];
DDD(21,:)=[0.830097, -0.387907, -0.387907];


%%% Data for Prediction %%%%
time_L = [3,3.07500000000000,3.13000000000000,3.18000000000000,3.25000000000000,3.31900000000000,3.38900000000000,3.48400000000000,3.55900000000000,3.59900000000000,3.68300000000000,3.73300000000000,3.81300000000000,3.90700000000000,3.99700000000000,4.10200000000000,4.21100000000000,4.28600000000000,4.38100000000000,4.47500000000000,4.56000000000000,4.65000000000000,4.76000000000000,4.85900000000000,4.95400000000000,5.03400000000000,5.11300000000000,5.17800000000000,5.27300000000000,5.34300000000000,5.42700000000000,5.50700000000000,5.59200000000000,5.65600000000000,5.72600000000000,5.80100000000000,5.87000000000000,5.93500000000000,6.03500000000000,6.08900000000000,6.14900000000000,6.21400000000000,6.27400000000000,6.30800000000000,6.35800000000000,6.38800000000000];


nos_L_1 = size(time_L,2);% number of segments for stretch

y1 = zeros(1,nos_L_1);% number of segments for stress

lamda_max = zeros(1,21);
beta_max = zeros(1,21);
lamda_max1 = zeros(1,21);
beta_max1 = zeros(1,21);


%%%%% weights related to ANN %%%%
aa = xx(1);
bb = xx(2);
cc = xx(3);
ee = xx(4);
ff = xx(5);
gg = xx(6);
hh = xx(7);
ii = xx(8);
jj = xx(9);
kk = xx(10);
ll = xx(11);
mm = xx(12);
nn = xx(13);
oo = xx(14);
pp = xx(15);
qq = xx(16);
aa1 = xx(17);
bb1 = xx(18);
cc1 = xx(19);
ee1 = xx(20);
ff1 = xx(21);
gg1 = xx(22);
hh1 = xx(23);
ii1 = xx(24);
jj1 = xx(25);
kk1 = xx(26);
ll1 = xx(27);
mm1= xx(28);
nn1 = xx(29);
oo1 = xx(30);
pp1 = xx(31);
qq1 = xx(32);




for i=1:nos_L_1
    
    stretch_L = 1.2;
    yy = zeros(3,3);
    F = [stretch_L 0 0;0 (stretch_L)^-0.5 0;0 0 (stretch_L)^-0.5];
    
  theta = 60;
  time = time_L(i);

    for j=1:21
        d = DDD(j,:)';
        lamda = sqrt(d'*(F'*F)*d);
        beta = sqrt(d'*(inv(F)*inv(F)')*d);
        if lamda > lamda_max(j)
           
            lamda_max(j) = lamda;
            
        end
        if beta > beta_max(j)
           
            beta_max(j) = beta;
            
        end
        
        tt = (www(j)/lamda)*(cc*(aa*lamda+bb)+gg*sin(ee*lamda+ff)+jj*tan(hh*lamda+ii)+mm*exp(kk*lamda+ll))*F*kron(d',d);
        uu = -(www(j)/beta)*(pp*exp(nn*beta+oo)+bb1*(qq*beta+aa1)^3+ff1*(cc1*beta+ee1)^5+ii1*tan(gg1*beta+hh1))*inv(F)*inv(F)*inv(F)*kron(d',d);
        map = (tt+uu)*(1);
        yy = yy+map;
    end
    
    F_inv =inv(F);
    p = yy(3,3)/F_inv(3,3);
    yy = yy - p*F_inv;
    y1(i)= yy(1,1)*((mm1*(((jj1*theta+kk1*time+ll1)))^3)+(qq1*(nn1*theta+oo1*time+pp1)^1));
end

u = y1;
end
