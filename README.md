# AR_STEM_Education 🤓📱🧬

The AR STEM Education project is an iOS application created in XCode to be an immersive and interactive learning experience. This was specifically coded to be used in the CUNY Advanced Science Research Center (ASRC) as a part of the outreach program. 

This AR application was designed as a part of the 2023 VR-REU run by Professor Wole. As the name suggests, the summer program is an REU, i.e. Research Experience for Undergraduates, sponsored by the National Science Foundation (NSF). This project specifically was supervised by Kendra Krueger. 

## Motivation 💭

The outreach program at the ASRC, led by Krueger, stands by the message of community science. They engage with the New York community in many ways, particularly through school field trips. It is through these tours that students learn what being a researcher/scientist is like. 

When I applied to the VR-REU, I selected this project as one of my top choices because hearing about the IlluminationSpace reminded me of my own childhood. The Museum of Science and Industry in Chicago has a very similar philosophy about inspiring kids to learn about STEM. I spent hours there as a kid, playing games while subconsciously learning. Museums like that taught me the basics of biology, and now here I am, pursuing it in college. 🫶🏼

## Goals & Ideas 📋

The project proposal started off quite vague. There were basically only two requirements:
- It had to deal with STEM education for middle school/high school/undergraduate students.
- It had to use XR (virtual reality, augmented reality, mixed reality) in some way.

The ASRC has five initiatives: Environmental Sciences, Nanoscience, Neuroscience, Photonics, and Structural Biology. Eventually, I narrowed the subject matter down to structural biology, since my background is biology. I was fresh out of my organic chemistry class and felt confident in my ability to quickly learn the material. 

For the XR component, I decided to make an iOS application. I have experience coding iOS apps, although it had been a long time since I last touched Xcode. I chose the iOS app route because that would make the application more accessible. At this time, most people don't own VR headsets. Making a smartphone app would be more intuitive and convenient.

Ultimately, the final goals of this application became to 1) make the tour through the ASRC more engaging and 2) teach students more about structural biology. The application scans QR codes placed at different places along the tour and uses AR to place 3D models of molecules in the area. 

## What the App Does 🛠️

As the application loads, there is a loading screen that informs you that everything is being prepared. 

The application opens up to the `Collection` tab. This is sort of the home page for the application. It contains three sections, separated by subject matter. There is information on protein structure, x-ray crystallography, and scientists at the ASRC. Each section has multiple cells that contain an image. Let's call each of these an `Item`. All the `Items` start out greyed-out. When the user unlocks an `Item`, its respective cell will no longer be greyed-out and is selectable. Clicking on the `Item` pulls up a screen with its name and a brief description.

The next tab is the `Camera` tab. The screen consists of just one large camera view with a circular button at the bottom. This is where the AR happens. When a QR code is captured within the camera's vision, a model (or image) is pulled up on top of the QR code. The model is stationary, so the user can move around and see the model from different perspectives. Pressing the button while a model is pulled up will unlock that `Item`.

Finally, there is the `Settings` tab. This page includes instructions on how to use the app. There are also two buttons: one to reset all progress and one to take the user study survey. 

**The app is designed for iOS 16.4.** 

## Outcome & Lessons 🧠

The application was completed on 7/12/2023. Preliminary user testing was done the next day with undergraduate students, and the feedback was generally positive! 

As of writing this, I'm still not completely sure what the future of this app will be. Hopefully they'll be able to use it at the ASRC! There were some issues, particularly with regards to sharing the app. Apple limits the number of devices that I can download the app onto unless I were to pay for a developer's license. We didn't do that for the REU because it takes some time to get approved and I found out about this the day of my user testing (pain 😭). Also to put an app on the App Store, I would need that license *plus* approval of the app. 

There were a lot of ups and downs with this project. For the middle weeks of the 8-week REU, I kept feeling like every time I made progress, I'd immediately discover five more issues. Here's a list of lessons that I learned from this project:
- Sometimes you just have to stare at things until you get it-- because you *always* will eventually figure it out.
- It may feel like there's a mountain of tasks in front of you, but if you start one at a time, you'll be done before you know it.
- Be ready to adapt on the fly because not everything will work out as planned.

Nevertheless, I'm just glad the app worked and that I was able to finish it in just 8 weeks! 🥳
