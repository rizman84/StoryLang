-- Turn a string into a table
function totable(str)
  t = {}
  str:gsub(".", function(c) table.insert(t, c) end)
  return t
end

-- Get the number of tabs (two spaces) in a table of strings
function getTabs(tablestr)
  tabcount = 0

  -- Lua passes tables by reference, so create a clone of it to work on
  newtable = {}
  for i,v in ipairs(tablestr) do
    table.insert(newtable, v)
  end

  -- Remove and count the tabs
  while newtable[1] == " " and newtable[2] == " " do
    table.remove(newtable, 1)
    table.remove(newtable, 1)
    tabcount = tabcount + 1
  end
  return tabcount, newtable
end

-- Request the name of the game file and then load it
os.execute("ls game-files")
print("Which game would you like to play?")
gameFileName = "game-files/" .. io.read()
fileContent = {}
for line in io.lines(gameFileName) do
  fileContent[#fileContent + 1] = totable(line)
end


-- Play the file
curlineNum = 1
while true do
  print("")

  -- Get the tab level and the content of the line at curlineNum
  curtabs, curline = getTabs(fileContent[curlineNum])

  -- If the content of the line is the same as ":x", then skip the rest and go to line x
  if curline[1] == ":" then 
    curlineNum = tonumber(table.concat(curline, "", 2))
    goto continue
  end
  
  -- Go through the game and find the corresponding actions for a line
  actions = {}
  for i = curlineNum + 1, #fileContent do
    -- Get the line content and tab level of the current line
    tabs, line = getTabs(fileContent[i])
    if tabs < curtabs then -- If it is at a lower level of tabs then exit
      break 
    elseif tabs == curtabs then -- If it has the same number of tabs
      if line[1] == ">" then
        actions[#actions + 1] = {i, line, false, false}
      elseif line[1] == "<" then
        actions[#actions + 1] = {i, line, true, false}
      else
        curline[#curline + 1] = "\n"
        for i, v in ipairs(line) do
          curline[#curline + 1] = v
        end
      end
    end
    ::continue1::
  end

  -- Print the current line
  print(table.concat(curline))

  -- Give the player a short amount of time to read based on the length of the given content
  charcount = 0
  for i, v in ipairs(curline) do
    if v ~= " " then charcount = charcount + 1 end
  end
  

  -- If there is nothing left to the game then exit
  if actions[1] == nil or actions[1][2] == "" then
    break
  end

  -- Print the actions
  for i, v in ipairs(actions) do
    print(i .. ". " .. string.sub(table.concat(v[2]), 2))
  end
  
  -- Request the player to select an option and then go to it
  selectedAction = 0
  repeat
    selectedAction = io.read("*n")
  until selectedAction > 0 and selectedAction <= #actions
  curlineNum = actions[selectedAction][1] + 1


  ::continue::
end
