function [T,p,CC] = hoeffding_triangles(G,nsamples)
%HOEFFDING_TRIANGLES Estimate the number of triangles in a graph
%
%   T = HOEFFDING_TRIANGLES(G,N) estimates the number of triangles in G
%   using N samples.
%
%   [T,W] = HOEFFDING_TRIANGLES(G,N) also returns the number of wedges
%   (needed to interpret the error). 
%
%   [T,W,C] = HOEFFDING_TRIANGLES(G,N) also returns the estimate of the
%   clustering coefficient.
%
%   T. Kolda, A. Pinar, C. Seshadhri, 2012


%% Compute stuff
nnodes = size(G,1);

dv = full(sum(G,1))'; %<- Degree of each node
wv = (dv.*(dv-1))/2; %<- Wedges per node
cwv = cumsum(wv); %<- Cummulative wedges per node
p = cwv(end); %<- Total number of wedges

%% Get the list of neighbors for each node
% Specifically, the neighbors of node i are given by 
% nghbrs(nghbrs_idx(i)+1) through nghbrs(nghbrs_idx(i)+dv(i));
[nghbrs,~,~] = find(G);
nghbrs_idx = [0; cumsum(dv)];


%% Pick random wedges
% We actually double the number of wedges associated with each node to make
% it easier to pick the particular wedge. (Trick courtesy of Ali.)
sample = randi(2*p, nsamples, 1);

% Determine the vertex associated with each sample
dcwv = [1;2*cwv+1];
[~,vidx] = histc(sample,dcwv);

% Determine the particular neighbors for each vertex
wedgeid = sample - dcwv(vidx); %<- Wedge id
degm1 = dv(vidx) - 1; %<- Degree of wedge center minus 1
wii = floor(wedgeid ./ degm1) + 1; %<- 1st neighbor in 1:d(wedge ctr)
wjj = wedgeid - degm1.*(wii-1) + 1; %<- 2nd neighbor in 1:d(wedge ctr)-1
wjj = wjj + (wjj >= wii); %<- Adjust 2nd neighbor

% Map those to the true neighbor indices
wii = nghbrs(nghbrs_idx(vidx) + wii);
wjj = nghbrs(nghbrs_idx(vidx) + wjj);

%% Check wedges

% Create a sparse "Test" matrix with the list of edges we need to check
Test = sparse(wii,wjj,1,nnodes,nnodes);
% Do an elementwise multiply
C = G.*Test;

% Count up how many edges we found
cnt = full(sum(sum(C,1)));

% Use that to estimate the clustering coefficient
CC = cnt/nsamples;

% And the number of trianlges
T = round(CC*p/3);
