% Intersection of a Line and a Plane
% This function accepts two 3D points on a line, a point on a plane and the
% normal to the plane as a row vector with six coordinates. This function
% returns a 3 dimensional row vector with the point of intersection between
% the line and the plane. If the plane does not intersect with the line a
% row vector of NaN is returned instead.
function poi = line_plane_intersection(LinePoint1, LinePoint2, PlanePoints)
    % Transpose points to allow simpler calculations.
    LinePoint1 = LinePoint1';
    LinePoint2 = LinePoint2';
    PlanePoints = horzcat(PlanePoints(:,1:3)',PlanePoints(:,4:6)');
    % This function calculates whether or not a line is on a plane given two
    % points on a line, a point on a plane and a point normal to the plane.
    % This function returns the point of intersection between a line and a
    % plane.
    PlanePoint = PlanePoints(:,1);
    PlaneNormal = PlanePoints(:,2);
    % Solve for t in the equation Q = A + v*t where A is a point on the
    % line, v is a directional vector and t is a scalar of the directional
    % vector
    v = LinePoint2 - LinePoint1;
    % Solve for t using derivation 1.
    scalarT = dot(PlaneNormal,(PlanePoint - LinePoint1))/dot(v, PlaneNormal);
    %scalarT = solve(dot(LinePoint1 + v*t - PlanePoint,PlaneNormal)==0, t);
    % Verify that the point intersects with the plane using the dot product
    % If the point does not intersect the plane return a vector of NaN
    if (dot((LinePoint1 + v*scalarT - PlanePoint), PlaneNormal) < 0.00001)
        poi = double(LinePoint1+v*scalarT);
    else
        poi = [NaN; NaN; NaN];
    end
    % Transpose point of intersection for proper format of output
    poi = poi';
end

