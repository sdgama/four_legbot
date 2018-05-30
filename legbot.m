
%% Defining a function that will plot the x and y co-ordinate of the path.
%% In this case we use a cosine equation to generate the path for the upper half of the motion. 

function b=  legbot(n);

xp = 4:-n:0.01;                                    % for 400 points 
y = -cosd(xp*90)*0.75 - 8;             % multiply the ampltitude for height.
x = xp-2;

%% Ploting the path.
figure(1)
subplot(2,1,1);
plot(x,y);
axis equal
grid on
ylabel('Amplitude')
xlabel('Path/Displacement')
save x y

%% Taking the x and y vector of 400 point into a single matrix of 2 x 400 points.

a = [x;y];
b = a.';

end
