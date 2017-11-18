# Generalized Linear Model (Poisson Distribution) for handwriting recognition.
The image on top shows a handwritten digit. The image below it is a simulation of a low-photon count observation of this image (as though we took a picture of the digit in a very dark room). Comparing the two images, you might be able to make out the digits pattern in the image of photon counts, but alone the image on the right probably isn’t recognizable. In this problem, we will use the GLM developed to estimate the original image from the count data.
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Handwriting/img/seven.png)![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Handwriting/img/count.png)
Now we model the natural parameter of the Poisson distribution i.e log(mu) with a linear model X w. Ultimately we obtain an estimated image using the above model for the low-photon count image. 
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Handwriting/img/poisson_glm.png)
Similarily we obtain an estimated image by using a Gaussian distributed model.
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/Handwriting/img/gaussian_glm.png)
