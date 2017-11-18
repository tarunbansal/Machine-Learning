# Design GLM to detect if a face image is happy.
Consider the two faces below. It is easy for a human, like yourself, to decide which is
happy and which is not. Can we get a machine to do it?
The key to this classification task is to find good features that may help to discriminate between happy and mad faces. What features do we pay attention to? The eyes, the mouth, maybe the brow?
![alt text](https://github.com/tarunbansal/Machine-Learning/blob/master/FaceData/img/faces.png)


We chose n = 9 of these distances as features for a classification algorithm. The features extracted from m = 128 face images (like the two shown above) are stored in the m × n matrix X in the Matlab file face_emotion_data.mat. This file also includes an m × 1 binary vector y; happy faces are labeled +1 and mad faces are labeled −1. The goal is to find a set of weights for the features in order to predict whether the emotion of a face image is happy or mad.
We use the training data X and y to design a classifier using logistic regression glmfit in Matlab to compute the MLE of classifier weights w.


Average error rate over 8 cross validations = 1.3750
