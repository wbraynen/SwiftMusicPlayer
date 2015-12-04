# SwiftMusicPlayer
An mp3 player written in Swift for playing and viewing the artwork of best albums from pianowill.com, online or offline.  Uses AVAudioPlayer.

Screenshots of what I have implemented so far:

|MasterViewController|Detail, playing|Detail, paused|
|---|---|---|
|![image](https://cloud.githubusercontent.com/assets/4765449/11490289/74a0f258-9794-11e5-8046-0a111f5167b5.png)|![image](https://cloud.githubusercontent.com/assets/4765449/11544444/1a70dcbe-98ff-11e5-95e8-a1c29d5ede01.png)|![image](https://cloud.githubusercontent.com/assets/4765449/11544445/1a7168f0-98ff-11e5-99ec-e6521981dc28.png)|

The plan is to start with a mocked-up but functional player and then build on that.  For example, serve up hardcoded data, then add a CoreData store, then add http with my own node.js server (just like the one my lighthouse-api.org project uses); or just use RestKit instead of AFNetworking from the get go.

Why not in Swift, you ask?  Well, wanted to code some stuff for fun in obj-c, but of course Swift is the man and I do plan to port the player over to Swift once I knock out all the basic functionality in obj-c.


## Still work to be done

|MasterViewController|On first track (bad*)|On last track (good)|
|---|---|---|
|![image](https://cloud.githubusercontent.com/assets/4765449/11490289/74a0f258-9794-11e5-8046-0a111f5167b5.png)|![image](https://cloud.githubusercontent.com/assets/4765449/11545239/645ad1b4-9903-11e5-9f4b-bcb025805100.png)|![image](https://cloud.githubusercontent.com/assets/4765449/11545238/6459cd78-9903-11e5-933b-e1e67dbe8859.jpg)|

*Back button should be enable even on first track and should rewind to beginning of track, no?
