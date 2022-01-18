function animate(mesh,t,X)
% animate: a function that shows the change in the ratio of susceptible,
% infected, and recovered individuals in the grid as an image.
%   Inputs:
%       mesh: an struct of mesh information of the triangulated surface
%       t: the time vector
%       X: an N*3*length(t) matrix, where each Nx3 matrix corresponds to
%       the state of the S.I.R. system at a particular instance in time.
%       This 2D matrix is repeated for each time step, making it a 3D ...
%       matrix.
% Output: this function does not output anything.


N = length(mesh);   % number of nodes
coord = zeros(N,3); % coordinates of nodes
color = zeros(size(X)); % colors representing SIR
%color = zeros(N,3,length(t)); %alternative way

for i = 1:N                             % looping over each node
    coord(i,:) = mesh(i).location;      % saves our location structure as an array 
end

color(:,1,:) = X(:,2,:);     % red for infected
color(:,2,:) = X(:,3,:);     % green for recovered
color(:,3,:) = X(:,1,:);     % blue for susceptible

f1 = figure;                 % opens new figure window
currT = 0;              % starts time 
d = 20;                 % constant defined in the problem statement        
for i = 1:length(t)     % loop over time
    if t(i) >= currT
        %plot
        pcshow(coord,color(:,:,i),'MarkerSize',500);    % creates our plot
        xlabel('X');            % creates axes labels
        ylabel('Y');
        zlabel('Z');
        pause(0.1);             % leaves time between each plot
        drawnow                 % actively displays our plot on the figure window
        currT = currT + 0.1*d;  % update current time
%         saveas(f1, sprintf('animation_%.2f_step.png', i)); % used to help
%         save frames of the animation for the report but it greatly slows
%         down the process
    end
end








end
