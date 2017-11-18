# Fisher classification using iterative algorithms.

In 1936 Ronald Fisher published a famous paper on classification titled “The use of multiple measurements in taxonomic problems.”  In the paper, Fisher study the problem of classifying iris flowers based on measurements of the sepal and petal widths and lengths, depicted in the image below.
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Fisher/img/fisher.png)
Fisher’s dataset is available in Matlab (fisheriris.mat) and is widely available on the web(e.g., Wikipedia).  The dataset consists of 50 examples of three types of iris flowers.  The sepaland petal measurements can be used to classify the examples into the three types of flowers.

We write a Matlab program leastsq.m to “train” a classifier using Least Sqares based on 40 labeled examples of each of the three flower types and then test the performance of the classifier using the remaining 10 examples from each type. Then we repeat this with many different randomly chosen subsets of training and test. The average test error (number of mistakes divided by 30) is **0.0387**

Now we perform the above process while using Landweber(landweber.m) and SGD(sgd.m) iterative algorithms. We also comapare their convergence speeds.

LANDWEBER : **avg_of_all_classification_errors = 0.0327 , avg_iter = 1429**

SGD : **avg_of_all_classification_errors = 0.0210 , avg_iter = 99570**

**Thus SGR which has an avg_iter value of 99570 over Landweber’s 1429 has much lower convergence speed. Althogh the average error rate for SGD is lower than Landweber.**

Now we experiment with even smaller sized training sets (sizevserror.m) Clearly we need at least one training example  from  each  type  of  flower. We find out that the plot  of  average  test  error as  a  function  of training set size is :
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Fisher/img/sizevserror.png)

Using a 3d scatter plot(subspace_plot.m) to visualize the measurements we can find a 2-dimensional subspace (i.e., a plane) that the data approximately lie in. Subpspace plot :
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Fisher/img/3dplot.png)
Plane plot : 
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Fisher/img/plane.png)
