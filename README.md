# Sermon-Upload
Automated Audio and Video upload process for the Spring Meadows SDA Church

## User Experience
1. Open unedited video in [AVIDemux](http://avidemux.sourceforge.net/)
2. Set Startpoint and Endpoint
3. Select Custom -> This Sabbath
  * Or Custom -> Some Other Week

## Backend Process
1. [AVIDemux](http://www.avidemux.org/admWiki/doku.php?id=using:scripting)
  * Custom Scripts "This Sabbath" & "Some Other Week"
    1. Saves cut video in preconfigured location
      * The only difference between the scripts is the location of saving
    2. Closes AVIDemux
2. [AutoHotKey](http://ahkscript.org/)
  1. Runs Silently in the background and when it detects that AVIDemux has closed and a file exists in one of the two preconfigured locations it starts the PowerShell Script.
    * Using AutoHotKey for it's easy ability to run in the background and monitor with a convient GUI by the system clock
3. [PowerShell](http://microsoft.com/powershell)
  1. Determine the Origin date of the cut video file
  2. Use the [JSON Podcast Feed](http://www.springmeadows.org/article/400) to pull the metadata
  3. Tag the video file with the metadata
  4. DeMux a copy of the Audio for CDs and Podcast feed
    * Retag if metadata gets lost
  5. Create a compressed and normalized copy of Audio for Podcast feed
    * Retag if metadata gets lost
  6. Upload Podcast file to website
  7. Upload Video to YouTube
    * Ensure it gets added to Sermons Playlist
  8. (Maybe) Burn CD(s)
  9. (Maybe) Create DVD
  10. (Maybe) Burn DVD(s)
