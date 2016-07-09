#How I did the project

##Step 1: Getting the data
After downloading the zip file, I unpacked it in a subfolder 'data' in my R working directory folder, so that I had it as a .txt file there. 
From that point onwards, I start every R script obtaining the data from this .txt file. 
I chose to only load the required data and not the entire data first.

##Step 2: Preparing data
In order to make time series plots, the Date and Time data had to be transformed to a suitable class. This was not achieved using the strptime() function, since this was far too inconvenient. Working with the as.POSIXct() function was very coventient for the time, and for data a simple call to as.Date() was enough.

These two steps were the same for all 4 R scripts. Plotting was the only variable part.

##Step 3: Plotting
For each required plot, an R Script was written consisting of above two steps and the desired plot. After constructing the plot on the screen device, the plot ws copied to a PNG device.

##The Assignments:
4 plots were required and are provided in this repo.
Running plot1.R leads to plot1.png
Running plot2.R leads to plot2.png
Running plot3.R leads to plot3.png
Running plot4.R leads to plot4.png
But only, if in the current working directory a subfolder 'data' is present, holding the analysis data in the file called 'household_power_consumption.txt'.
