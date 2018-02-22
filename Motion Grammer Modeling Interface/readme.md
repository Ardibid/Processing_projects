### Generative Platform for Rolling Lines
In Fall 2015, I was working on Hot Wire Robotic Fabrication. This fabrication method is restricted to the realm of ruled surfaces. I had the opportunity to work with Daniel on a fabrication grammar that would enhance the application of robotic hot wire cutting systems. As a part of that project, I needed to have a generative platform to generate the rolling lines.

![initial starting page](https://github.com/Ardibid/Processing_projects/blob/master/Motion%20Grammer%20Modeling%20Interface/images/0.png)

This interface is basically a point generator in a cubic solid form. Two different points crawl on the surface of the cube and the lines that connect them represent a complex rolling surface.

![modeling in action](https://github.com/Ardibid/Processing_projects/blob/master/Motion%20Grammer%20Modeling%20Interface/images/01.png)

There are a series of GUI controls that let us define the dimension of the box and the number of rendered lines. The code is optimized to adapt output to the changes.

![examples](https://github.com/Ardibid/Processing_projects/blob/master/Motion%20Grammer%20Modeling%20Interface/images/03.jpg)

But, the most important key in the interface is responsible for sending data over OSC in order to let us receive it in grasshopper. Where we can use it to simulate the robotic fabrication process and generate RAPID code to be run on the robot.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/VP6QmxFpcOk/0.jpg)](https://www.youtube.com/watch?v=VP6QmxFpcOk)

And now we can use the robot to fabricate the model: <br>
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Z34OPZn9yao/0.jpg)](https://www.youtube.com/watch?v=Z34OPZn9yao?t=32)

To make complex geometries like these:
![fabricated model](https://github.com/Ardibid/Processing_projects/blob/master/Motion%20Grammer%20Modeling%20Interface/images/05.jpg)
