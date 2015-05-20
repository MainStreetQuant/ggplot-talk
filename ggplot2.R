
library(ggplot2) # load the ggplot2 package

### Making a scatter plot

# 1. Explore the dataset
?diamonds # get info about ggplot2's built-in diamonds dataset
head(diamonds) # look at the first few rows of data form the diamonds dataset

# 2. Make a scatter plot
MyPlot <- ggplot(aes(x = carat, y = price), data = diamonds) + geom_point()
MyPlot

#3. Change how the data points look
MyPlot <- ggplot(aes(x = carat, y = x), data = diamonds) + geom_point(alpha=0.5, color="darkgreen", size=2)
MyPlot

#4. Plot a third variable -- color
MyPlot <- ggplot(aes(x = carat, y = price, color = color), data = diamonds) + geom_point(alpha=0.6)
MyPlot

#5. Add a title and axis labels
MyPlot <- MyPlot + ggtitle("Weight vs. Price for 54,000 cut diamonds") +
  xlab("Weight (carat)") +
  ylab("Price (USD)")
MyPlot

#6. Adjust the y axis scale
MyPlot <- MyPlot + scale_y_continuous(limits=c(0, 10000), breaks = seq(0, 10000, 1000))
MyPlot

#7. Plot a line of best fit for each color
MyPlot <- MyPlot + geom_smooth()
MyPlot

#8. Plot a line of best fit for the entire data set using a linear model
MyPlot <- MyPlot + geom_smooth(method = "lm", color = "darkred", size = 1.3)
MyPlot

#9. Separate out each color into an individual facet (arranged in columns)
MyPlot <- ggplot(aes(x = carat, y = price, color = color), data = diamonds) +
  geom_point(alpha=0.4) +
  facet_grid(. ~ color)
MyPlot

#10. Add a series of facets (arranged in rows) for the clarity variable
MyPlot <- ggplot(aes(x = carat, y = price, color = color), data = diamonds) +
  geom_point(alpha=0.3) +
  facet_grid(clarity ~ color)
MyPlot <- MyPlot +
  xlab("Weight (carat)") +
  ylab("Price (USD)") +
  ggtitle("Weight vs. Price and Clarity for 54,000 cut diamonds")
MyPlot

### Making a Boxplot

#11. subset all diamonds with with a weight of 1 carat
SmallDiamonds <- subset(diamonds, carat == 1)

#12. Make a boxplot of diamons clarity vs price
MyBoxPlot <- ggplot(data = SmallDiamonds, aes(x = clarity, y = price)) + geom_boxplot()
MyBoxPlot

#13. Color the boxes
MyBoxPlot <- ggplot(data = SmallDiamonds, aes(x = clarity, y = price, fill=clarity)) + geom_boxplot()
MyBoxPlot

#14. Visualize the 'cut' variable using fill color
MyBoxPlot <- ggplot(data = SmallDiamonds, aes(x = clarity, y = price, fill=cut)) + geom_boxplot()
MyBoxPlot

#15. Change the fill colors and legend title
MyBoxPlot <- MyBoxPlot + scale_fill_brewer("Diamond cut", palette = "Reds")
MyBoxPlot

#16. Change the x axis labels
MyBoxPlot <- MyBoxPlot + scale_x_discrete("Clarity", labels=c("Inclusions", "Slight Incl2", "Slight Incl1", "V Slight Incl2", "V Slight Incl1", "VV Slight Incl2", "VV Slight Incl1", "Flawless"))
MyBoxPlot

#17. Given the plot a title and rename the y axis
MyBoxPlot <- MyBoxPlot + ggtitle("Clarity and cut vs price for 54,000 cut diamonds") +
  ylab("Price (USD)")
MyBoxPlot

#18. Add an annotation
MyBoxPlot <- MyBoxPlot + annotate("text", x=c("IF"), y=6000, label="Here's an \n annotation", size=4)
MyBoxPlot

############## Histograms

#19. Make a histogram of diamond prices, fill the bars dark blue
MyHistogram <- ggplot(diamonds, aes(x=price)) + geom_histogram(fill="darkblue")
MyHistogram

#20. Make a histogram of diamond cut values, make each bar a unique color
MyHistogram <- ggplot(diamonds, aes(x=cut, fill=cut)) + geom_histogram()
MyHistogram

#21. Create a stacked histogram with color as a second variables
MyHistogram <- ggplot(diamonds, aes(x=cut, fill=color)) + geom_histogram()
MyHistogram

#22. Unstack the histogram and break out the color variable into separate bars
MyHistogram <- ggplot(diamonds, aes(x=cut, fill=color)) + geom_histogram(position="dodge")
MyHistogram

#23 add axis labels and a title, change the color palette, and add a legend title
MyHistogram <- MyHistogram + ggtitle("Histogram of 54,000 diamonds by gem cut and color") +
  ylab("Frequency") +
  xlab("Cut") +
  scale_fill_brewer("Diamond\n color", palette="greens")
MyHistogram

#24 Make a density plot of overlapping samples
MyHistogram2 <- ggplot(data = mpg, aes(x = hwy)) + geom_histogram()
MyHistogram2

MyDensityPlot <- ggplot(data = mpg, aes(x = hwy, fill = drv)) +
  geom_density(position = "identity", alpha = 0.4) +
  xlab("Highway mpg") +
  ylab("PDF") +
  ggtitle("Density Distribution of mpg as a factor of transmission type for 38 cars models") +
  scale_fill_brewer("Transmission\n Type", palette="Set1") # \n inserts a line break in labels
MyDensityPlot

#25. Save the plot as a high resolution .png image

pmg(filename = "my saved density plot.png", type = "cairo", units = "in", width = 6, height = 4, pointsize = 16, res = 400) # create a new 6x4 inch png image file, call it 'my saved plot.png'
MyDensityPlot # write the plot to the image file
dev.off() # close the file (RStudio will now send plots back to the default plot window as usual)

#26 Use a more minimal black and white theme for non-data elements
MyHistogramBW <- ggplot(diamonds, aes(x = carat)) + geom_histogram() + theme_bw()
MyHistogramBW

