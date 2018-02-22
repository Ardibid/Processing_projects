### CuminCAD data visualization

Cumincad is a web-based database that hosts a vast library of CAAD scholars. It has indexed and shared almost all major CAD conference’s proceedings since a long time ago. As of March 2015, they have 11700 records from journals and conferences such as ACADIA, ASCAAD, CAADRIA and …. I think mining in this treasure island will help us understand the trends in the CAD society during the past few years.
To begin, I tried to fetch the titles data from this web page and see which words were the most popular titles among these thousands of articles.<br> 

<div style="text-align:center"><img src="https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/keyword-page.png" alt="CUMINCAD index page" width="400">
<img src="https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/keyword-page_robot_.png" alt="CUMINCAD index page" width="400"><br>

Reviewing the page's HTML code, the data structure is easy to recognize the pattern they used to show this word on the web page. Every word is coming after a specific phrase and there is a series of constant characters after.
Using basic string functions in processing I could easily extract these words and the repetition value. You can have a look at the code [here](Cumincad_fetcher.pde). <br>

I pushed the project forward by automating the procedure, which made it much easier to harvest mass data from the server. Basically the code can go through every single paper web page in different databases to collect these items:
Author(s) name(s), title, keywords, publication year and abstract. <br>
However, for most of the papers the keywords and abstract is not indexed, thus those items were not used for further steps.

<div style="text-align:center"><img src="https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/01-1024x555.png" alt="CUMINCAD index page" width="400">
<img src="https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/02-1024x555.png" alt="CUMINCAD index page" width="400"><br>

Up until here, the sketch is pretty the same. Adding some blocks of codes, I managed to export the collected data in csv files. Since the fetching process takes a considerable amount of time, separating data collection and data visualization process may save precious time for us. <br>
Another sketch is developed to perform word analyzes. To do so, it uses hashMap to count the repetition of every word in the paper titles in every database in different years. The result is presented in the format of a circle, surrounded by rays of words. The length of rays and their brightness indicate the number if repetition of the word in that database/year.<br>
![data visualization samples](https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/6072frame.jpg)

![data visualization samples](https://github.com/Ardibid/Processing_projects/blob/master/CUMINCAD%20Data%20Visualization/images/2581frame.jpg)
Some other examples of the visualizations are available in the [images folder](CUMINCAD%20Data%20Visualization/images).
Hovering the mouse courser from left to right will navigate through the year in a specific database, while clicking on the screen will toggle through the databases. To keep the track of time and database, these two items are being shown at the center of the circle.
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/St112fmGPYY/0.jpg)](https://www.youtube.com/watch?v=St112fmGPYY)
