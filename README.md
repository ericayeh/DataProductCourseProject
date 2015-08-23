# DataProductCourseProject

This application is a twist to the Word Cloud application available at (http://shiny.rstudio.com/gallery/word-cloud.html)

It allows you to select a text file from your computer upload it and generate a word cloud. It also allows you to view the content of the file.

The idea behind the project was to design an application that will provide with the frequency of the words in your resume.

To use the application, you could either access the one published on Rstudio's shiny server at (https://ericayeh.shinyapps.io/dataProductCourseProject) or download the ui.R and server.R codes available in this repository.

Steps to use the application:

1. Click on **Choose File** and select the text file of your choice.
2. This will automatically show you the content of the file (if there is no issue reading it) in the **Content** tab.
3. To view the generated word cloud, select the **Cloud** tab.
4. You can then "play" with the cloud by selecting the color, the number of colors to use, the frequency of the words, and the maximum number of words to show in the cloud.

If you opt to download the files, you will need to save them in your working directory, load the **shiny** library and run the application by typing *runApp()* in the command line.


