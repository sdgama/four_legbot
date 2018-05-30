clear all; clc; format compact;

%% Length of the links in cms.

r1 = 5; %5; %9.6
r2 = 6; %6; %8

%% Retriving the x and y co-odinate using a function legbot and defining the iternation value.

P = legbot(0.01);
P1=P(:,1);
P2 = P(:,2);

figure(1)
subplot(2,1,2);
plot(P1,P2);
axis equal
grid on
np = 400;
t1=zeros(np,1);
t2=zeros(np,1);
j=1;
i=1;

%% Using a while loop to iterate the point plot.

while j<=400
    
    rQx=P1(i);
    rQy=P2(i);
    
    A=r1*rQx;
    B=r1*rQy;    
    C=-1/2*(r1^2-r2^2+rQx^2+rQy^2);
    sigma = -1; % The assembly mode and can be 1 or -1
    t=(-B + sigma*sqrt(abs(B^2 - C^2 +A^2)))/(C-A);
    t1(j) = 2*atand(t);
    t2(j) = atan2d((rQy - r1*sind(t1(j))),(rQx - r1*cosd(t1(j))));
    
    %% Definition of Vectors
    
    R1=r1*[cosd(t1(j)); sind(t1(j))];
    R2=r2*[cosd(t2(j)); sind(t2(j))];
    RQ = R1 + R2;
    
    %% Plot of joints and points of interect.
    
    plot(0,0,'Ko'), hold on, axis equal tight
    plot(rQx, rQy, 'k*')
    plot(R1(1), R1(2), 'bo')
    plot(RQ(1), RQ(2),'ro')
    grid on
    
    %% Plot of links
    
    plot([0,R1(1)],[0,R1(2)], 'b-')
    plot([R1(1),RQ(1)],[R1(2),RQ(2)], 'r')
    pause(0.005);
    
     i=i+1;
     j=j+1;
     
end

%% Revalutating the angles as per each servo on arduino.

% For servo1
t1p=360 + t1 -180;  
% For servo2
%t2p= t2-t1p-90;      
t2p= t2-t1p+270;      
save results t1p t2p

%% Creating a polynominal for theta 1 and theta 2 as polynomial equations

Pans1 = polyfit([0.01:0.01:4]',t1p,4);
Pans2 =polyfit([0.01:0.01:4]',t2p,4);

poly1 = poly2sym(Pans1(1,:));
disp('Polynominal Equation for theta1:');
% Using vpa for converting fraction to a decimal of 5 digits only.
disp(vpa(poly1,5));                                

poly2 = poly2sym(Pans2(1,:));
disp('Polynominal Equation for theta2:');
% Using vpa for converting fraction to a decimal of 5 digits only.
disp(vpa(poly2,5)); 



