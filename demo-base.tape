Set FontSize 16
Set FontFamily "JetBrains Mono"
Set Width 800
Set Height 600
Set WindowBar Colorful
Set WindowBarSize 40
Set Margin 20
Set BorderRadius 10
Set TypingSpeed 0.1
Set PlaybackSpeed 0.5 # Make output 2 times slower

# Setup
Hide
Type "make quiet-run"
Enter
Sleep 500ms

# Recording...
Show
Sleep 1s
Type "1"    # Select Vanilla
Enter

Sleep 1s
Type "2"    # 2 Scoops
Enter
Sleep 1s
Type "y"    # Another?
Enter
Sleep 1s
Type "3"    # Select Strawberry
Enter
Sleep 1s
Type "1"    # 1 Scoops
Enter
Sleep 1s
Type "n"    # Another?
Enter
Sleep 5s