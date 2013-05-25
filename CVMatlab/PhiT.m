function phit = PhiT(phi,I,epsilon)

[c1,c2] = GetAvgs(I,phi,epsilon);

phit = (-(I-c1).^2+(I-c2).^2);

end