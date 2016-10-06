
% Intersection Of Line Through Ellipsoid
% Nuwan Perera
% This function finds the point(s) of intersection between a line and 
% an ellipsoid given two points on a line and the a b and c values of
% the ellipsoid. It is assummed that the r value of the ellipsoid is 1.
% The function returns two points, being the points of intersection in
% between the line and the sphere.

function [poi1, poi2] = line_ellipsoid_intersection(point1, point2, a,b,c)
    point1 = point1';
    point2 = point2';
    v = point1 - point2; % Directional vector to create the equation of a line
    syms t;
    % Solve for t in the equation of a circle with the equation of a line
    % substituted by components x y and z.
    poi = solve((((point1(1)+v(1)*t)^2)/a)+(((point1(2)+v(2)*t)^2)/b)+...
        (((point1(3)+v(3)*t)^2)/c)==1, t);
 
    if (isreal(poi) == 0)
        % No real intersection points
        poi1 = [NaN;NaN;NaN];
        poi2 = [NaN; NaN; NaN];
    else
        % 1 or 2 real intersection points
        poi1 = point1+v*double(poi(1));
        poi2 = point1+v*double(poi(2));
    end
    poi1 = poi1';
    poi2 = poi2';
end
