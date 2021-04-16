function u = func_training(xx) 

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

%%% Data for Training %%%%
stretch_L = [1,1.01200000000000,1.03600000000000,1.05500000000000,1.07200000000000,1.09400000000000,1.11200000000000,1.13000000000000,1.14900000000000,1.18600000000000,1.20400000000000,1.22200000000000,1.24100000000000,1.27500000000000,1.30200000000000,1.33300000000000,1.37100000000000,1.40300000000000];
time_L = [3,3.05500000000000,3.12200000000000,3.18300000000000,3.27000000000000,3.38800000000000,3.46900000000000,3.53100000000000,3.59700000000000,3.69900000000000,3.75000000000000,3.84700000000000,3.92900000000000,4,4.10700000000000,4.19400000000000,4.29600000000000,4.37300000000000,4.49000000000000,4.54600000000000,4.62800000000000,4.67900000000000,4.73500000000000,4.78100000000000,4.84200000000000,4.90800000000000,4.97400000000000,5.03000000000000,5.06600000000000,5.10600000000000,5.15700000000000,5.20300000000000,5.23900000000000,5.30500000000000,5.36100000000000,5.39600000000000,5.46300000000000,5.54400000000000,5.60600000000000,5.71800000000000,5.80500000000000,5.90800000000000,5.96400000000000];
time_L1 = [3,3.07500000000000,3.13000000000000,3.18000000000000,3.25000000000000,3.31900000000000,3.38900000000000,3.48400000000000,3.55900000000000,3.59900000000000,3.68300000000000,3.73300000000000,3.81300000000000,3.90700000000000,3.99700000000000,4.10200000000000,4.21100000000000,4.28600000000000,4.38100000000000,4.47500000000000,4.56000000000000,4.65000000000000,4.76000000000000,4.85900000000000,4.95400000000000,5.03400000000000,5.11300000000000,5.17800000000000,5.27300000000000,5.34300000000000,5.42700000000000,5.50700000000000,5.59200000000000,5.65600000000000,5.72600000000000,5.80100000000000,5.87000000000000,5.93500000000000,6.03500000000000,6.08900000000000,6.14900000000000,6.21400000000000,6.27400000000000,6.30800000000000,6.35800000000000,6.38800000000000];


stress_100_12 = [0,0.743000000000000,1.38500000000000,1.73800000000000,2.13100000000000,2.40600000000000,2.78600000000000,3.02200000000000,3.31000000000000,3.79400000000000,4.03000000000000,4.26500000000000,4.51400000000000,4.84100000000000,5.15500000000000,5.48200000000000,5.90100000000000,6.29400000000000];
stress_100_50 = [3.10600000000000,3.05900000000000,3.02900000000000,3,2.93500000000000,2.87000000000000,2.82800000000000,2.80500000000000,2.71600000000000,2.65700000000000,2.60400000000000,2.54500000000000,2.47400000000000,2.38600000000000,2.27300000000000,2.20800000000000,2.10800000000000,2.00800000000000,1.88400000000000,1.81900000000000,1.73600000000000,1.68300000000000,1.59500000000000,1.51200000000000,1.43500000000000,1.32300000000000,1.25200000000000,1.13400000000000,1.05200000000000,0.999000000000000,0.893000000000000,0.781000000000000,0.704000000000000,0.592000000000000,0.521000000000000,0.485000000000000,0.426000000000000,0.350000000000000,0.314000000000000,0.273000000000000,0.232000000000000,0.208000000000000,0.208000000000000];
stress_60_20 = [2.00300000000000,1.99100000000000,1.97100000000000,1.96200000000000,1.95000000000000,1.92900000000000,1.92500000000000,1.90500000000000,1.89200000000000,1.89700000000000,1.87200000000000,1.86400000000000,1.85500000000000,1.84300000000000,1.83500000000000,1.82300000000000,1.81400000000000,1.81400000000000,1.80200000000000,1.78600000000000,1.77700000000000,1.78200000000000,1.76900000000000,1.76500000000000,1.74900000000000,1.73600000000000,1.72800000000000,1.72000000000000,1.71200000000000,1.70300000000000,1.67900000000000,1.67900000000000,1.65800000000000,1.63400000000000,1.62100000000000,1.60100000000000,1.58400000000000,1.56000000000000,1.53100000000000,1.50600000000000,1.48200000000000,1.46500000000000,1.43600000000000,1.42000000000000,1.39900000000000,1.37100000000000];


nos_L_1 = size(stretch_L,2);% number of segments for stretch
nos_L_2 = size(time_L,2); % number of segments for stretch
nos_L_3 = size(time_L1,2); % number of segments for stretch

y1 = zeros(1,nos_L_1);% number of segments for stress
y2 = zeros(1,nos_L_2);% number of segments for stress
y3 = zeros(1,nos_L_3);% number of segments for stress

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
    
    yy = zeros(3,3);
    F = [stretch_L(i) 0 0;0 (stretch_L(i))^-0.5 0;0 0 (stretch_L(i))^-0.5];
    
  theta = 100;
  time = log(12*3600);

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
        map = (tt+uu)*1;
        yy = yy+map;
    end
    
    F_inv =inv(F);
    p = yy(3,3)/F_inv(3,3);
    yy = yy - p*F_inv;
    y1(i)= yy(1,1)*((mm1*(((jj1*theta+kk1*time+ll1)))^1)+(qq1*(nn1*theta+oo1*time+pp1)^1));
end

for i=1:nos_L_2
    
    stretch_L2 = 1.5;
    yy = zeros(3,3);
    F = [stretch_L2 0 0;0 (stretch_L2)^-0.5 0;0 0 (stretch_L2)^-0.5];
    
    theta = 100;
    time = time_L(i);

    for j=1:21
        d = DDD(j,:)';
        lamda = sqrt(d'*(F'*F)*d);
        beta = sqrt(d'*(inv(F)*inv(F)')*d);
        if lamda > lamda_max1(j)
           
            lamda_max1(j) = lamda;
            
        end
        if beta > beta_max1(j)
           
            beta_max1(j) = beta;
            
        end
        
        tt1 = (www(j)/lamda)*(cc*(aa*lamda+bb)+gg*sin(ee*lamda+ff)+jj*tan(hh*lamda+ii)+mm*exp(kk*lamda+ll))*F*kron(d',d);
        uu1 = -(www(j)/beta)*(pp*exp(nn*beta+oo)+bb1*(qq*beta+aa1)^3+ff1*(cc1*beta+ee1)^5+ii1*tan(gg1*beta+hh1))*inv(F)*inv(F)*inv(F)*kron(d',d);
        map1 = (tt1+uu1)*(1);
        yy = yy+map1;
    end
    
    F_inv =inv(F);
    p = yy(3,3)/F_inv(3,3);
    yy = yy - p*F_inv;
    y2(i)= yy(1,1)*((mm1*(((jj1*theta+kk1*time+ll1)))^3)+(qq1*(nn1*theta+oo1*time+pp1)^1));
end


for i=1:nos_L_3
    
    stretch_L3 = 1.2;
    yy = zeros(3,3);
    F = [stretch_L3 0 0;0 (stretch_L3)^-0.5 0;0 0 (stretch_L3)^-0.5];
    
    theta = 60;
    time = time_L1(i);

    for j=1:21
        d = DDD(j,:)';
        lamda = sqrt(d'*(F'*F)*d);
        beta = sqrt(d'*(inv(F)*inv(F)')*d);
        if lamda > lamda_max1(j)
           
            lamda_max1(j) = lamda;
            
        end
        if beta > beta_max1(j)
           
            beta_max1(j) = beta;
            
        end
        
        tt3 = (www(j)/lamda)*(cc*(aa*lamda+bb)+gg*sin(ee*lamda+ff)+jj*tan(hh*lamda+ii)+mm*exp(kk*lamda+ll))*F*kron(d',d);
        uu3 = -(www(j)/beta)*(pp*exp(nn*beta+oo)+bb1*(qq*beta+aa1)^3+ff1*(cc1*beta+ee1)^5+ii1*tan(gg1*beta+hh1))*inv(F)*inv(F)*inv(F)*kron(d',d);
        map3 = (tt3+uu3)*(1);
        yy = yy+map3;
    end
    
    F_inv =inv(F);
    p = yy(3,3)/F_inv(3,3);
    yy = yy - p*F_inv;
    y3(i)= yy(1,1)*((mm1*(((jj1*theta+kk1*time+ll1)))^3)+(qq1*(nn1*theta+oo1*time+pp1)^1));
end


y_final = [y1,y2, y3];
p_final = [stress_100_12,stress_100_50,stress_60_20];

error = sum((y_final-p_final).^2);


u = error;
end
