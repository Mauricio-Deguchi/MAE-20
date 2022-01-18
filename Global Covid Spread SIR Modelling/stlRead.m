function mesh = stlRead(filelocation)
% stlRead takes the location a modified stl file (.txt format) is ...
% stored, reads the file, and finds the required parameters.
% Input:
% fileLocation: location of the tab delimited .txt file to be read
% Output:
% mesh: an array of structs representing the vertices. Each ...
% element has members "location" and "neighbors". "location" is a 1x3 ...
% array of x, y, z coordinates, and "neighbors" is an array of indices ...
% of the point's neighbors.


%% Importing data
modifiedSphereSTL = readcell(filelocation,'Delimiter','\t');    % imports the file into a large cell array
vertices = zeros(1,3);                  % initializes a vertices array which will store all the unique points in array format for ease of searching
rows = length(modifiedSphereSTL);       % finds the tital number of rows in our cell array that we will have to search
index = 1;                              % used to identify the index of of a unique coordinate to be stores in our vertices array 
mesh.location = [0 0 0];                % initializes the mesh structure for location
mesh.neighbors = [];                    % initializes the mesh structure for neighbors
j = 1;                                  % dummy variable used for indexing in the mesh structure and identifying neighbors

%% Extracting data 
for i = 1:rows                          % we will search through all of the rows of the cell array 
    textbox = modifiedSphereSTL{i};     % we will extract each of our first column entries to check what it's label is
    switch textbox                      % there are two things we are looking for in the first column
        case "outerLoop"                % outerLoops will indicate the start of a facet which will identify blocks of 3 points which are neighbors of one anotehr
            point1 = sum(ismember(vertices,horzcat(modifiedSphereSTL{i+1,2:4}),'rows'));    % checks if the first point in the facet is unique 
            point2 = sum(ismember(vertices,horzcat(modifiedSphereSTL{i+2,2:4}),'rows'));    % checks if the second point in the facet is unique 
            point3 = sum(ismember(vertices,horzcat(modifiedSphereSTL{i+3,2:4}),'rows'));    % checks if the third point in the facet is unique 
            idx1 = find(ismember(vertices,horzcat(modifiedSphereSTL{i+1,2:4}),'rows'));     % finds the index of the first point in the facet if it is not unique, if it is this will be unused later
            idx2 = find(ismember(vertices,horzcat(modifiedSphereSTL{i+2,2:4}),'rows'));     % finds the index of the second point in the facet if it is not unique, if it is this will be unused later
            idx3 = find(ismember(vertices,horzcat(modifiedSphereSTL{i+3,2:4}),'rows'));     % finds the index of the third point in the facet if it is not unique, if it is this will be unused later
           
            if (point1 == 0) && (point2 == 0) && (point3 == 0)                              % if all three points are unique
                mesh(j).location = horzcat(modifiedSphereSTL{i+1,2:4});         % we will add the first coordinate into the structure
                mesh(j).neighbors = [j+1 j+2];                                  % we will add the second and third point as neighbors
                j = j + 1;                                                      % we will move on to the next index
                mesh(j).location = horzcat(modifiedSphereSTL{i+2,2:4});         % similarly, we will add the second coordinate into the structure
                mesh(j).neighbors = [j-1 j+1];                                  % we will add the first and third point as neighbors
                j = j + 1;                                                      % we will move on to the next index
                mesh(j).location = horzcat(modifiedSphereSTL{i+3,2:4});         % we will add the third coordinate into the structure
                mesh(j).neighbors = [j-2 j-1];                                  % we will add the first and second point as neighbors
                j = j + 1;                                                      % we will move on to the next index 

            elseif (point1~=0) && (point2 == 0) && (point3 == 0)                % if point 1 is not unique, 
                mesh(j).location = horzcat(modifiedSphereSTL{i+2,2:4});         % we will add the second point into the location structure
                mesh(j).neighbors = union(mesh(j).neighbors,[idx1 j+1]);        % we will add the first point and third point as neighbors, using the idx1 for the first point
                j = j + 1;                                                      % we will move on to the next index
                mesh(j).location = horzcat(modifiedSphereSTL{i+3,2:4});         % we will also add the third point into the location structure
                mesh(j).neighbors = union(mesh(j).neighbors,[idx1 j-1]);        % similarly, we will add the first and second point into the neighbos of point 3
                j = j + 1;                                                      % we will move on to the next index
                mesh(idx1).neighbors = union(mesh(idx1).neighbors,[j-2 j-1]);   % we will add points 2 and 3 as the existing neighbors list of point 1

            elseif (point1 == 0) && (point2 ~= 0) && (point3 == 0)              % if point 2 is not unique, we will follow the same format of if point1 is not unique but switching the index for point 2
                mesh(j).location = horzcat(modifiedSphereSTL{i+1,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[idx2 j+2]);
                j = j + 1;                                       
                mesh(j).location = horzcat(modifiedSphereSTL{i+3,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[j-2 idx2]);
                j = j + 1;                                                     
                mesh(idx2).neighbors = union(mesh(idx2).neighbors,[j-2 j-1]);

            elseif (point1 == 0) && (point2 == 0) && (point3 ~= 0)              % again, if point 3 is not unique, we will follow the same format of if point1 is not unique but switching the index for point 3
                mesh(j).location = horzcat(modifiedSphereSTL{i+1,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[j+1 idx3]);
                j = j + 1;                                                  
                mesh(j).location = horzcat(modifiedSphereSTL{i+2,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[j-1 idx3]);
                j = j + 1;                                            
                mesh(idx3).neighbors = union(mesh(idx3).neighbors,[j-2 j-1]);

            elseif (point1 == 0) && (point2 ~= 0) && (point3 ~= 0)              % if points 1 is the only unique point
                mesh(j).location = horzcat(modifiedSphereSTL{i+1,2:4});         % we will add point 1 into the mesh structure
                mesh(j).neighbors = union(mesh(j).neighbors,[idx2 idx3]);       % we will need to add point 2 and 3 into the neighbors of point 1 using their index 
                j = j + 1;                                                      % we will move on to the next index
                mesh(idx2).neighbors = union(mesh(idx2).neighbors,[j-1 idx3]);  % we will then add point 1 and point 3 into the existing neighbors of point 2
                mesh(idx3).neighbors = union(mesh(idx3).neighbors,[j-1 idx2]);  % we will also add point 1 and point 2 into the existing neighbors of point 3

            elseif (point1 ~= 0) && (point2 == 0) && (point3 ~= 0)              % if point 2 is the only unique point, we will follow a near identical form to that of the previous section
                mesh(j).location = horzcat(modifiedSphereSTL{i+2,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[idx1 idx3]);
                j = j + 1;                                         
                mesh(idx1).neighbors = union(mesh(idx1).neighbors,[j-1 idx3]);
                mesh(idx3).neighbors = union(mesh(idx3).neighbors,[j-1 idx1]);

            elseif (point1 ~= 0) && (point2 ~= 0) && (point3 == 0)              % again, if point 3 is the only unique point, we will follow a near identical form to that of the previous section
                mesh(j).location = horzcat(modifiedSphereSTL{i+3,2:4});
                mesh(j).neighbors = union(mesh(j).neighbors,[idx1 idx2]);
                j = j + 1;                                      
                mesh(idx1).neighbors = union(mesh(idx1).neighbors,[j-1 idx2]);
                mesh(idx2).neighbors = union(mesh(idx2).neighbors,[j-1 idx1]);

            elseif (point1 ~= 0) && (point2 ~= 0) && (point3 ~= 0)              % if we have no unique points, 
                mesh(idx1).neighbors = union(mesh(idx1).neighbors,[idx2 idx3]); % we will update the neighbors of point 1 to include points 2 and 3
                mesh(idx2).neighbors = union(mesh(idx2).neighbors,[idx1 idx3]); % we will update the neighbors of point 2 to include points 1 and 3
                mesh(idx3).neighbors = union(mesh(idx3).neighbors,[idx1 idx2]); % we will update the neighbors of point 3 to include points 1 and 2
            end
        case "corner"                           % we will also be looking for any corner points
            if sum(ismember(vertices,horzcat(modifiedSphereSTL{i,2:4}),'rows')) == 0        % if the point is unique,
            vertices(index,:) = horzcat(modifiedSphereSTL{i,2:4});      % we will add the point into the vertices array
            index = index + 1;                                          % and increase the number index of vertices to the next position 
            end
        otherwise
    end
end
end