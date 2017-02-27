# Gender-Identification-System

A system capable of telling the gender of the input speech signal implemented using Matlab.

Some Details:

(a) The file folder ‘VQ’ contains all the files needed to implement this system based on Vector Quantization Model.
    The file folder ‘GMM’ contains all the files needed to implement this system based on Gaussian Mixture Model.

(b) To do the test of VQ-based system, please follow the instructions below:

	1. Make sure all the m files (All in the folder named ‘VQ’) and audio files are under the same folder. 

	2. Type in the following command to run:

		project3('filename',fs);

   	   For example, project3('male11.wav',8000);

	3. Then the result is shown in the console, the label 'Male' or 'Female'. 

(c) To test GMM-based system, just use all the files in the folder named ‘GMM’. Pay attention to the work path, the other steps are similar to VQ system test.

	The command to run is: 
	
	project3_GMM('filename',fs);

