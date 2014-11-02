PikaDJ
======

Hey! This software, PikaDJ, was made by me, {FM} [Linux] PIKACHU! (http://steamcommunity.com/profiles/76561198034518769)
It is extremely easy to setup and use!

Prerequisites:
--------------

#### Required:

* bash
* pulseaudio
* libav-tools OR ffmpeg
* sox
* mplayer
* xdotool
* youtube-dl (http://rg3.github.io/youtube-dl/download.html)
	* **MUST BE INSTALLED FROM THE WEBSITE, NOT FROM A PACKAGE MANAGER**
* Any codecs you believe may be useful for decoding FLVs and MP4s from youtube (can be any really, needs to be detected by libav-tools)

#### Optional:

* espeak (only if enabling text to speech. It does not affect normal behaviour, and is only for when you get bored) - Thanks to [TimePath](https://github.com/TimePath) for the idea!

If I missed anything, shoot me an e-mail at andrew.silver0@gmail.com - *put [PikaDJ] at the start of the subject so I don't pass it off as spam!*

If you can't figure out exactly what I missed, just tell me what point you think PikaDJ gets to before something goes wrong.
Most error messages are silenced in the software, so it may be a bit difficult to debug if you don't know bash.
*If you do, just don't pipe stderr to /dev/null*

Installation:
-------------

1. Clone the repository to `~/.local/share/Steam/SteamApps/common/Team Fortress 2/` with

	```bash
	$ cd "~/.local/share/Steam/SteamApps/common/Team Fortress 2/"
	$ git clone https://github.com/Silvea12/PikaDJ.git
	```

	* You should have a file structure something like `~/.local/share/Steam/SteamApps/common/Team Fortress 2/PikaDJ/config.cfg` (this is just one file, there are more within the PikaDJ directory).
	* All file permissions should be correct by default. If the main file won't execute, run this in terminal:

	```bash
	$ cd "~/.local/share/Steam/SteamApps/common/Team Fortress 2/PikaDJ/"
	$ chmod a+x PikaDJ tf2* utils
	```

2. Add these lines to autoexec.cfg in `~/.local/share/Steam/SteamApps/common/Team Fortress 2/tf/cfg/`:

	```
	// These keybinds are easily modifiable, so feel free to change them to suit your needs. //
	// Their command needs to stay the same, but you can bind them to different keys, or even use aliases! //
	// Start keybinds for PikaDJ //
	bind KP_UPARROW "echo playMusic" // Play current song
	bind KP_DOWNARROW "echo stopMusic" // Stop current song
	bind KP_HOME "echo skipMusic" // Skip current song
	bind KP_PGDN "echo clearMusic" // Clear playlist
	bind KP_END "echo resetMic" // Reset your microphone manually on servers with sv_use_steam_voice 1 (in case anything goes wrong, and it doesn't reset manually)
	bind KP_PLUS "echo sendSongInfo" // Say the current song info - optional, but very useful
	// bind KP_DEL "echo sendHelp" // Say PikaDJ's command info - optional, uncomment to use
	bind = "exec stdin" // Bind to execute console commands given by PikaDJ
	alias micspamEnable "volume 1.0; voice_loopback 1; +voicerecord; alias micspamToggle micspamDisable" // Micspam enable command
	alias micspamDisable "volume 1.0; -voicerecord; voice_loopback 0; alias micspamToggle micspamEnable" // Micspam disable command
	alias micspamToggle micspamEnable // Toggle micspam (You can bind this alias to a key if you wish)
	// End keybinds for PikaDJ //
	```

3. Set your TF2 launch options to `-condebug`, or add `con_logfile console.log` to your autoexec.cfg file.
4. Profit!

Usage:
------

#### Running:

1. Start TF2
2. Run this in terminal:

	```bash
	$ cd ~/.local/share/Steam/SteamApps/common/Team Fortress 2/PikaDJ/
	$ ./PikaDJ
	```

3. Profit!

Steps 1/2 can be switched, step 3 needs to be run once TF2 is started.

#### In-Game Chat Commands:
* !pikayts [Song name] - Searches YouTube for the video by that name, and attempts to download the first result.
* !pikayt [YouTube URL] - Bypasses the search functionallity, and just downloads that URL. Search can take a URL too, but this is slightly faster.
* !pikaskip - Vote skips the currently playing song
* !pikainfo/!pikasong - Says the currently playing song (the same as the sendSongInfo keybind)
	* **Please Note:** *These can be used by ANYONE on the server, not just you. The keybinds are yours alone though, and they can override some of these (mainly skip).*

Configuration:
--------------

Edit `config.cfg` in the PikaDJ folder.
You don't need to restart PikaDJ after modifying the config, it is loaded dynamically!
Any errors in the file will be shown in PikaDJ's console, and those values will be set to their fallback defaults.
Any unset options will be set to their fallback defaults.

The only option that can be blank is bannedWords, to disable the filters.
Just leave it as `bannedWords=` to disable it.

Additional Notes:
-----------------

* All temporary files are stored in `/tmp/PikaDJ/`. The directory is created when PikaDJ starts, and is removed at the end of cleanup.
* All music requests are cached in `~/Music/youtubeReqests` as .wav files, and serves as a cache. These audio files are low quality, but not as low as is output to TF2. These are still stereo (usually), a higher bitrate, sample rate, etc. Feel free to clear all files within this when you are running low on disk space.
* The queue is stored in `~/Music/youtubeRequests/fixedName`, which is cleared every time the queue is cleared, or when the software either starts or exits. It stores a duplicate of files in the directory above, with non-printable characters removed from the filenames.
