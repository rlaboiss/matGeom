function [intersects, edgeIndices] = intersectRayPolygon(ray, poly, varargin)
%INTERSECTRAYPOLYGON Intersection points between a ray and a polygon.
%
%   PTS = intersectRayPolygon(RAY, POLY)
%   Returns the intersection points of the ray RAY with polygon POLY. 
%   RAY is a 1x4 array containing parametric representation of the ray
%   (in the form [x0 y0 dx dy], see createRay for details). 
%   POLY is a N-by-2 array containing coordinates of polygon vertices.
%   
%   [PTS, INDS] = intersectRayPolygon(...)
%   Also returns index of polygon intersected edge(s). See
%   intersectLinePolygon for details.
%
%   See also
%     rays2d, polygons2d, intersectLinePolygon
%

% ------
% Author: David Legland
% e-mail: david.legland@inrae.fr
% created the 26/01/2010


%   HISTORY
%   2010/01/26 creation from intersectLinePolygon
%   2013-02-11 also returns edgeIndices

% compute intersections with supporting line
[intersects, edgeIndices, pos] = intersectLinePolygon(ray, poly, varargin{:});

% keep only intersects with non-negative position on line
indPos = pos >= 0;
intersects  = intersects(indPos, :);
edgeIndices = edgeIndices(indPos);
