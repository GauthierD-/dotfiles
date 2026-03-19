# On Linux sp must be installed (apt get install sp)
# artist=$(sp metadata | grep "artist" | cut -d '|' -f2)
# title=$(sp metadata | grep "title" | cut -d '|' -f2)

# On MacOs `shpotify` (no typo here) must be installed (brew install shpotify)
artist=$(spotify status artist) 
title=$(spotify status track)

 if [[ -n $artist || -n $title ]]
 then
   echo "♫ $artist - $title"
 else
   echo ""
 fi
