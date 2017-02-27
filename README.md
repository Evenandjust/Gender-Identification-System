# Gender-Identification-System

A system capable of telling the gender of the input speech signal implemented using Matlab.

Some Details:

(a) The file folder ‘VQ’ contains all the files needed to implement this system based on Vector Quantization Model.
    The file folder ‘GMM’ contains all the files needed to implement this system based on Gaussian Mixture Model.

(c) To do the test of VQ-based system, please follow the instructions below:

	1. Make sure all the m files (All in the folder named ‘VQ’) and audio files are under the same folder. 

	2. Type in the following command to run:

		project3('filename',fs);

   	   For example, project3('male11.wav',8000);

	3. Then you should see the result in the console, the label 'Male' or 'Female'. 
	   (I don't store the returned label in a variable 'g' as suggested on Blackboard. 
	    I think maybe showing the label directly is better.)

(d) To test GMM-based system, just use all the files in the folder named ‘GMM’. Pay attention to the work path, the other steps are similar to VQ system test.

	The command to run is: 
	
	project3_GMM('filename',fs);

