function Viewcell(a,b)

% close all; %Close all the figures
% clc; %Clear the command window
% clear all; %Clear all variables
% % 
% url = 'http://192.168.0.100:8080/shot.jpg';%Url of Video Feed
% a=imread(url);%First Frame of Video Feed aquired
% b=image(a);%First Frame of Video Feed saved

arg1=1;%Filler variables
arg2=2;

global filenum;%Global variable for Timer
filenum=0;
global FPS;
global Totaltime;

%Begin Image save test
x = 0:pi/100:2*pi;
y = sin(x);
set(gca, 'position', [0 0 1 1], 'visible', 'off')
set(gcf,'PaperPositionMode','auto')
plot(x,y)
figure 
plot(x,y)
%End save image test

t = timer;% Timer assigment
t.StartDelay=FPS;%Start Delay assignment
disp(FPS);

t.StartFcn = @(~,thisEvent)disp([thisEvent.Type ' executed '...
    datestr(thisEvent.Data.time,'dd-mmm-yyyy HH:MM:SS.FFF')]);
% Start of Time tracking

t.TimerFcn = {@saveImage, arg1, arg2};%Timer function saves the Cell Image

t.StopFcn = @(~,thisEvent)disp([thisEvent.Type ' executed '...
    datestr(thisEvent.Data.time,'dd-mmm-yyyy HH:MM:SS.FFF')]);
%End of Time Tracking

t.Period = FPS;%time between calling Timer Fcn(saveImage.m)
disp(FPS);

t.TasksToExecute =3;%number of tasks the Timer Fcn is executed 

%the Timer ends after the number of tasks is executed

t.ExecutionMode = 'fixedRate';
start(t)% Timer starts

% while(1)%while loop to display Video Live Feed
%     a  = imread(url);%Frame a is most update Video Live Feed
%     set(b,'CData',a);%Frame b is now a
%     drawnow;%updates only Figure not x and y valus
%  end
end