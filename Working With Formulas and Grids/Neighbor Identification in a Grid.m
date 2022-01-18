%{
Filename: hw2_405582562_p3.m

Description: This program will ask the user to define an MxN grid and and a
cell P. The program will then return the neighbors of cell P in ascending
order.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront Stuff
clc; clear all; close all;

%% Taking inputs
m = input('Enter the number of rows: ');
M = floor(m);  % allows code to run even when an decimal is input 
n = input('Enter the number of columns: ');
N = floor(n);  % allows code to run even when an decimal is input 
p = input('Enter your specified cell: ');
P = floor(p);  % allows code to run even when an decimal is input 
%% Checking validity
if (P > M*N) || (P < 1) % checks if the input tiles lies within their defined grid
    error('Your cell is not in the grid')

elseif (M < 3) || (N < 3) % ensures that the grid is at least 3x3
    error('Your grid is not well defined')
end
%% Identifying type of tile 
% Corner pieces
if (P == 1)                     % top left corner tile
    edge1 = P + 1;              % bottom neighbor
    edge2 = P + M;              % right neighbor
    edge3 = P + M + 1;          % bottom right neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f\n', P, edge1, edge2, edge3)
    fprintf('Corner Node\n');
elseif (P == M)                 % bottom left corner tile
    edge1 = P - 1;              % top neighbor
    edge2 = P + M -1 ;          % top right neighbor
    edge3 = P + M;              % right neighbor 
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f\n', P, edge1, edge2, edge3)
    fprintf('Corner Node\n');
elseif (P == M*N)               % Bottom right corner tile
    edge1 = P - M - 1;          % top left neighbor
    edge2 = P - M;              % left neighbor
    edge3 = P - 1;              % top neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f\n', P, edge1, edge2, edge3)
    fprintf('Corner Node\n');
elseif (P == M*N-M+1)           % top right corner tile
    edge1 = P - M;              % left neighbor
    edge2 = P - M + 1;          % bottom left neighbor
    edge3 = P + 1;              % bottom neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f\n', P, edge1, edge2, edge3)
    fprintf('Corner Node\n');    
    
    
% Bottom edge tiles
elseif (rem(P,M) == 0) && (P ~= M) && (P ~= M*N)
    edge1 = P - M - 1;          % top left neighbor
    edge2 = edge1 + 1;          % left neighbor
    edge3 = P - 1;              % top neighbor
    edge4 = P + M -1;           % top right neighbor
    edge5 = edge4 + 1;          % right neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f %.0f %.0f\n', P, edge1, edge2, edge3, edge4, edge5)

% left edge tiles
elseif P < M 
    edge1 = P - 1;              % top neighbor
    edge2 = P + 1;              % bottom neighbor
    edge3 = P + M - 1;          % top right neighbor
    edge4 = edge3 + 1;          % right neighbor
    edge5 = edge4 + 1;          % bottom right neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f %.0f %.0f\n', P, edge1, edge2, edge3, edge4, edge5)

% Top tiles
elseif rem((P-1),M) == 0
    edge1 = P - M;              % left neighbor
    edge2 = edge1 + 1;          % bottom left neighbor
    edge3 = P + 1;              % bottom neighbor
    edge4 = P + M;              % right neighbor
    edge5 = edge4 + 1;          % bottom right neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f %.0f %.0f\n', P, edge1, edge2, edge3, edge4, edge5)

% Right edge tiles
elseif (P > (N*M - M + 1))
    edge1 = P - M - 1;          % top left neighbor
    edge2 = edge1 + 1;          % left neighbor
    edge3 = edge2 + 1;          % bottom left neighbor
    edge4 = P -1;               % top neighbor
    edge5 = P + 1;              % bottom neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f %.0f %.0f\n', P, edge1, edge2, edge3, edge4, edge5);

% Middle Tile
elseif ((P - M - 1) > 0) && ((P + M + 1) <= N*M)  % we have a center tile
    edge1 = P - M - 1;          % top left neighbor
    edge2 = edge1 + 1;          % left neighbor
    edge3 = edge2 + 1;          % bottom left neighbor
    edge4 = P -1;               % top neighbor
    edge5 = P +1;               % bottom neighbor
    edge6 = P + M -1;           % top right neighbor
    edge7 = edge6 + 1;          % right neighbor
    edge8 = edge7 + 1;          % bottom right neighbor
    fprintf('The neighbors for Node %.0f are %.0f %.0f %.0f %.0f %.0f %.0f %.0f %.0f\n', P, edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8);


end
