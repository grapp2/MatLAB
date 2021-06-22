rowvector = {'xyz',33.3,2:6,'a'<'c'};
transp = rowvector';
vec = reshape(transp,2,2);
celldisp(vec)