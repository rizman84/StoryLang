### Small Changes:
 - [ ] When a \[...\] appears in a file, the user presses enter to continue. Useful for breaking up large passages into readable paragraphs or sections.
 - [ ] Current solution for jumping to another line is just colon-line_number (e.g. ":123"). Would be easier if there were named "headers" that the parser jumped to.
 - [ ] Paragraphs are very icky to work with, because there's either a bunch of returns that make editing a nightmare, or the words are broken up like this:
 ```
     Jim had no idea wha 
     t to do in this sit
     uation"
 ```
 - [ ] Environment values, such as if a certain option has been selected in the past, or something was picked up or used

### Potential Large Changes:
 - A system for fighting would be **awesome** (and painfully difficult to implement). I was thinking something like a "fight_scene," where the player and opponent(s) have their own attacks and defense values and everything 
 - To add on to environment values (essentially variables), objects that can be picked up and have their own combat values and IDs
 - A limb system similar to dwarf fortress would also be interesting——not one that could be implemented with environment variables, but a more intelligent system that feels at least sort of logical
