;Make Command Tab do the work of alt-tab 
LCtrl & Tab:: AltTab

;Make Command Space open the start menu (to simulate the workflow of Spotlight quick launch)
^Space::Send ^{Esc}

;Close a program or window with Command - Q. not perfect but my brain didn't notice. :)
^q::Send !{F4}