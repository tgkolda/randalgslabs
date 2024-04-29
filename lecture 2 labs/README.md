# Data Descriptions and Sources



## amazon0312.mat

- Description: Network was collected by crawling Amazon website. It is based on Customers Who Bought This Item Also Bought feature of the Amazon website. If a product i is frequently co-purchased with product j, the graph contains a directed edge from i to j. The data was collected in March 12 2003. 
- Original source (citation): J. Leskovec, L. Adamic and B. Adamic. The Dynamics of Viral Marketing. ACM Transactions on the Web (ACM TWEB), 1(1), 2007.
- MATLAB mat-file from: https://www.cise.ufl.edu/research/sparse/mat/SNAP/amazon0312.mat
- Parameters of *un*directed version of graph
  - Nodes: 400,727 
  - Edges: 2,349,869
  - Triangles: 3,686,467

## ca-AstroPh.mat

- Description: Arxiv ASTRO-PH (Astro Physics) collaboration network is from the e-print arXiv and covers scientific collaborations between authors papers submitted to Astro Physics category. If an author i co-authored a paper with author j, the graph contains a undirected edge from i to j. If the paper is co-authored by k authors this generates a completely connected (sub)graph on k nodes. The data covers papers in the period from January 1993 to April 2003 (124 months). It begins within a few months of the inception of the arXiv, and thus represents essentially the complete history of its ASTRO-PH section.
- Original source: J. Leskovec, J. Kleinberg and C. Faloutsos. Graph Evolution: Densification and Shrinking Diameters. ACM Transactions on Knowledge Discovery from Data (ACM KDD), 1(1), 2007
- MATLAB mat-file from: https://www.cise.ufl.edu/research/sparse/mat/SNAP/ca-AstroPh.mat
- Parameters of undirected graph
  - Nodes: 18,772
  - Edges: 198,050
  - Triangles: 1,351,441

## wiki-Vote.mat

- Description: Wikipedia is a free encyclopedia written collaboratively by volunteers around the world. A small part of Wikipedia contributors are administrators, who are users with access to additional technical features that aid in maintenance. In order for a user to become an administrator a Request for adminship (RfA) is issued and the Wikipedia community via a public discussion or a vote decides who to promote to adminship. Using the latest complete dump of Wikipedia page edit history (from January 3 2008) we extracted all administrator elections and vote history data. This gave us 2,794 elections with 103,663 total votes and 7,066 users participating in the elections (either casting a vote or being voted on). Out of these 1,235 elections resulted in a successful promotion, while 1,559 elections did not result in the promotion. About half of the votes in the dataset are by existing admins, while the other half comes from ordinary Wikipedia users. The network contains all the users and discussion from the inception of Wikipedia till January 2008. Nodes in the network represent wikipedia users and a directed edge from node i to node j represents that user i voted on user j. 
- Origina sources: (1) J. Leskovec, D. Huttenlocher, J. Kleinberg. Signed Networks in Social Media. CHI 2010. (2) J. Leskovec, D. Huttenlocher, J. Kleinberg. Predicting Positive and Negative Links in Online Social Networks. WWW 2010.
- MATLAB mat-file from: https://www.cise.ufl.edu/research/sparse/mat/SNAP/wiki-Vote.mat
- Parameters of undirected graph
  - Nodes: 7115
  - Edges: 103689
  - Triangles: 608389
