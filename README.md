# VigilantBot 🚨 
> Violence does not discriminate by race, religion, culture, class or country. Worldwide, one in three women have experienced either physical and/or sexual violence, and more than 15 million girls aged 15-19 years have experienced rape.

![News Bias](news_bias.jpg)

**Vigilant Bot** is an **Embedded Hardware device** which can detect distress calls using complex hand gestures and help to convey the distress signals in ways such as text messages to family and automatic calls to authorities. Using Inertial Measurement Units (IMU) combined with Deep Learning algorithms served on a Matlab backend, the bot can **detect distress calls** with pinpoint accuracy and take action on the same on a real time basis.

![Perspective Bot](perspectivebot.png)

### Problem Statement
* The process of dialling a number and calling someone in an emergency can prove to be time taking.  We need FASTER ways of doing so because in such situations, every second is important.  
* In situations involving criminal acts, for example kidnapping, blackmailing etc, one can be restricted from making a phone call by the offender. We need SUBTLER ways of informing the authorities concerned without bringing it to the knowledge of the offender.

### Solution
We built a pipeline based on the state-of-the-art Intertial Measurement Unit with TensorFlow to gather all the information available on Twitter about the query searched and automatically cluster them based on different opinions grouped by Country using the Google Maps API to reduce bias by presenting different view-points about the same query.  
* •	Our team integrated Arduino sitting on top of MATLAB computation engine to get live stream accelerometer and gyroscopic data from a BNO055  **Inertial Measurement Unit (IMU)** attached to a person's wrist and sampling at a frequency of 20 Hz. 
* A continuous data link is established between **MATLAB** and **TensorFlow** to enable live hand gesture detection using a **deep learning** model. Given the continuous inflow of data, TensorFlow makes approximately 2 predictions every second using an **input vector containing 480 data points**.
* If a critical/target gesture is detected by TensorFlow, an **e-mail is sent** on behalf of the bot to the added Emergency Contact notifying them on the distress call with the **victim's details such as name, location, etc**.

### Screenshots
![Click](http://52.246.249.29:3030/public/screen3.jpg)
![Webpage](http://52.246.249.29:3030/public/screen4.png)

### Installation
1. Download Google Chrome Extention from [here](https://github.com/slimechips/intuition/tree/master/chrome_ext).
2. In the Chrome Address Bar, type `chrome://extensions/` and Toggle `Developer Mode` to ON (top-right pane)
3. Using the `Load unpacked` button, select the folder downloaded in Step 1 to load the app in Chrome and enable the extension.

### Team
1. [Mehul Damani](https://github.com/damanimehul)
2. [Jay Gupta](https://github.com/guptajay)
3. [Ritwik Kanodia](https://github.com/ritwikkanodia)

---

> Built for Hack&Roll 2020
