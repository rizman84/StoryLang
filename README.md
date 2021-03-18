# StoryLang
A program run in the command line that parses and allows the user to play story files.

An example story file:
```
The bells sing with joy overhead. The returning army is victorious!
>Dance
  You danced so much that you became utterly exhausted! Time to go home.
  >Go home
    :11
>Sing
  You sang so much that you became utterly exhausted! Time to go home.
  >Go home
    :11
>Go home and eat dinner
  A soldier approaches you and asks you what you think you're doing.
  >Show dominance: "I'm obviously going somewhere."
    The soldier appears a little flustered that you would be so rude, but you quickly walk away before he can say anything. You fall asleep, satisfied. END
  >Show friendliness: "I'm exhausted, I was planning on heading home just about now. How was the fight?"
    You chat a while with the soldier and then head home and fall asleep. END
  >Ignore him
    The soldier shrugs and goes about his day. You head home and fall asleep, satisfied. END
```

The parser reads out a section of text for you, and then gives you a list of options (preceded by an arrow in the story file) to choose from, but only if they have the same amount of spacing before them (the spaces are counted by two). 
If the section it is supposed to read out is a colon followed by a number (":123"), then it jumps to that line in the file.
If there are no options to be selected, it ends the game.
Something to note is that it copies the entire file to memory before playing it, so you can't change a file mid-game.
