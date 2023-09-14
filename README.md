# notnike
Sadly the Nike+ servers are no more. This is meant as a drop-in replacement (self-hosted server + iOS5 client update)

Currently (version 0.1) you still need to set it up yourself.
Your settings (`/User/Library/Preferences/com.kjarex.notnike.plist`) should look something like this:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>syncHost</key>
  <string>https://nike.example.com</string>
  <key>landingPageHost</key>
  <string>https://nike.example.com</string>
</dict>
</plist>
```

Where `syncHost` is the address where your workouts get sent to, and `landingPageHost`is the address where you get sent to once you uploaded your workouts 😀
Acceptable uri schemes are unsuprisingly `http`and `https` 🙄

At some point you will be able to create or modify theese settings more comforatbly via GUI on your phone - just not yet.

There will be also a server application added to the repo soon. But if you want to go ahead, feel free to do so - just open a port, send your workouts, watch the requests coming in and answer them accordingly.

This is a private project, to give perfectly good devices new life, after they were sent to die by their creators. I do not hold any rights of either iOS, Nike or Nike+, which are the trademarks of someone else 🤷‍♂️
