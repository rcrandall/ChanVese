% Compute c1 and c2 as used in the Chan-Vese segmentation algorithm.
% c1 and c2 are given by
% c1 = integral(u0*H(phi))dxdy/integral(H(phi))dxdy
% c2 = integral(u0*(1-H(phi))dxdy/integral(1-H(phi))dxdy
%
% If epsilon == 0, we define H as the usual Heaviside function. Then c1 is
% the average of the image pixels over the set where phi is >= 0, and c2 is
% the average over {phi < 0}.
% If epsilon > 0, we use a smoothed version of the Heaviside function with
% parameter epsilon.

function [c1, c2] = GetAvgs(I,phi,epsilon)

% Non-smoothed calculation
if (0 == epsilon)
n1 = length(find(phi>=0));
n2 = length(find(phi<0));
Iplus = I.*(phi>=0);
Iminus = I.*(phi<0);
c1 = sum(sum(Iplus))/n1;
c2 = sum(sum(Iminus))/n2;

% Smoothed calculation
else
H_phi = .5*(1+(2/pi)*atan2(phi,epsilon));
c1 = sum(sum(I.*H_phi))/sum(sum(H_phi));
c2 = sum(sum(I.*(1-H_phi)))./sum(sum(1-H_phi));
end
end