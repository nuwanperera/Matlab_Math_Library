% Points On a Sphere
% Created using reference from https://rbrundritt.wordpress.com/2008/10
% /14/conversion-between-spherical-and-cartesian-coordinates-systems/
% Function accepts a centre point, radius length and number of points
% to be generated. Returning an array with all of the points from the
% sphere and plotting the sphere in 3D.
function points = points_on_sphere(centre, radius, numPoints)
    % Transpose sphere centre coordinate to column vector for easier
    % calculations.
    centre = centre';
    points = zeros(3,numPoints);
    for i =1:numPoints
        theta = randi(90); % The angle between the z axis and the point in 
        % the zy plane, 90 degrees is required for the northern hemisphere
        % only.
        phi = randi(360); % The angle made by the point in the xy plane,
        % 360 degrees as any point in the xy plane can have a point on the
        % sphere in the northern hemisphere
        theta = theta*(pi/180); % Convert from degrees to radians
        phi = phi*(pi/180);
        % Find z coordinate using theta
        z = radius*cos(theta)+centre(3); 
        % project the vector onto xy plane
        rproj = radius*sin(theta);
        % Use the projection to solve for x and y coordinates about centre
        x = rproj*cos(phi) + centre(1);
        y = rproj*sin(phi) + centre(2);
        % Plot points
        points(:,i) = [x;y;z];
    end
    points = points';
end
