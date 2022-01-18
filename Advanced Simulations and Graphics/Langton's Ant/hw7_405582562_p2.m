%{
Filename: hw7_405582562_p2.m
Description: This script will simulate the motion of an ant in a large grid
dictated by the color of its standing tile. 
Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront stuff
clc; clear all; close all;

%% Establishing our grid
num_rows = 50;
num_cols = 50;

A = zeros(num_rows, num_cols);

%% initial conditions

xpos = ceil(50*rand());
ypos = ceil(50*rand());
face = 0;
generations = 2000;
colors = zeros(generations,4);
time = linspace(1,generations, generations);
video = struct('cdata', cell(1,generations), 'colormap', cell(1,generations));
%% Starting the loop
for i = 1:generations
    color = A(ypos,xpos);               % determines what color tile we are standing on
    switch color                        % switch case depending on the color of the tile
        % color coding: 
        % A = 0
        % B = 1
        % C = 2
        % D = 3
        case 0                          % when the color is color A
            color = 1;                  % we will switch the color to B
            if face < 3                 % & turn 90 degrees clockwise
                face = face + 1;
            elseif face == 3            
                face = 0;
            end
        case 1                          % when the color is color B
            color = 2;                  % we will switch the color to C
            if face < 3                 % & turn 90 degrees clockwise
                face = face + 1;
            elseif face == 3
                face = 0;
            end            
        case 2                          % when the color is color C
            color = 3;                  % we will switch the color to D
            if face == 0                % & turn 90 degrees counterclockwise
                face = 3;
            elseif face > 0
                face = face -1;
            end
        case 3                          % when the color is color D
            color = 0;                  % we will change to color A
            if face == 0                % & turn 90 degrees counter clockwise   
                face = 3;
            elseif face > 0
                face = face -1;
            end            
    end
    A(ypos,xpos) = color;               % we will then change the color of our tile
    switch face                         % depending on which was we are facing, we will move in a different direction
        % facing direction:
        % north: 0
        % east: 1
        % south = 2
        % west: 3
        case 0                          % when facing north, 
            if ypos-1 == 0              % we will move to the bottom most tile if we are at the top most tile
                ypos = 50;
            else
            ypos = ypos-1;              % or we will simply move upward one
            end
        case 1                          % when facing east
            if xpos+1 == 51             % we will move to the left most tile if we are at the right most tile
                xpos = 1;   
            else
            xpos = xpos + 1;            % or we will simply move right one
            end
        case 2                          % when facing south, 
            if ypos+1 == 51             % we will move to the top most tile if we are at the bottom most tile
                ypos = 1;       
            else
            ypos = ypos+1;              % or we will simply move down 1 tile
            end
        case 3                          % if we are facing west
            if xpos-1 == 0              % we will move to the right most tile if we are at the left most tile
                xpos = 50;
            else
            xpos = xpos-1;
            end
    end
    imagesc(A)                          % will display our colored grid 
    title(sprintf('Generations = %d', i))     % will display the
                                        % generation but is slow on my computer
    video(i) = getframe(gcf);                                    
    drawnow()                           % updates the figure window for each generation
    colors(i,1) = sum(sum(A == 0));
    colors(i,2) = sum(sum(A == 1));
    colors(i,3) = sum(sum(A == 2));
    colors(i,4) = sum(sum(A == 3));
end

writerObj = VideoWriter('LangtonsAnt1.avi');
writerObj.FrameRate = 24;
  % set the seconds per image
% open the video writer
open(writerObj);
% write the frames to the video
for i=1:length(video)
    % convert the image to a frame
    frame = video(i);    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);





%% Part b) Plotting
f2 = figure(2);
hold on
plot(time,colors(:,2)/(num_rows*num_cols),'b')
plot(time,colors(:,3)/(num_rows*num_cols),'g')
plot(time,colors(:,4)/(num_rows*num_cols),'y')
hold off
FONTNAME = 'Arial';
FONTSIZE = 12;
pWidth = 4;
pHeight = 3;
xlabel('Generation');
ylabel('Frequency');
title('Colors B, C, & D Occurences per Generation')
LEG = legend( 'Color B', 'Color C', 'Color D');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);



