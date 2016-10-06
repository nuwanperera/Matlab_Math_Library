% Points Off Sphere
% Nuwan Perera
% Created using reference from https://rbrundritt.wordpress.com/2008/10/14
% /conversion-between-spherical-and-cartesian-coordinates-systems/
% Function accepts a centre point, radius length and number of points
% to be generated. Returning an array with all of the points from the
% sphere and plotting the sphere in 3D.
function points = points_off_sphere(centre, radius, numPoints, MaxOff)
    % Transpose points to allow easier calculations
    centre = centre';
    points = points_on_sphere(centre', radius, numPoints);
    points = points';
    for i = 1:numPoints
        for j = 1:3
            if (MaxOff >0)
                offset = (2*rand(1,1)-1)*MaxOff; % Gives points away from
                % plane scaled between 1 and -1 to increase variability in
                % points
            else
                offset = 0;
            end
            % Apply offset to points
            points(j,i)= points(j,i) + offset;
        end
    end
    points = points';
end
