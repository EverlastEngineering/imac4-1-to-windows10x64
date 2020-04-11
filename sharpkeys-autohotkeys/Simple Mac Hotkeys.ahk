;Make Command Tab do the work of alt-tab 
LCtrl & Tab:: AltTab

;Make Command Space open the start menu (to simulate the workflow of Spotlight quick launch)
^Space::Send ^{Esc}

;Close a program or window with Command - Q. not perfect but my brain didn't notice. :)
^q::Send !{F4}

;Long left click to get right click action (for one button mice!)
LButton::
  ;Time required in milliseconds to trigger a right click (1000 = 1 second)
  HoldTimeRequired := 1000
  ClickStart := A_TickCount
  MouseGetPos, xStart, yStart
  while(A_Tickcount-ClickStart < HoldTimeRequired && GetKeyState("LButton", "p"))
  {
    MouseGetPos, x, y
    if (xStart != x || yStart != y)
    {
      ;Mouse moved, click down and wait for physical LButton release to simulate "click and drag"
      SendEvent, {Blind}{LButton down}
      KeyWait, LButton
      SendEvent, {Blind}{LButton up}
      return
    }
  }
  if (A_Tickcount-ClickStart >= HoldTimeRequired)
  {
    ;Long left click, so send RButton
    SendEvent, {Blind}{Rbutton}
  }
  else
  {
    ;Short left click, so send LButton
    SendEvent, {Blind}{LButton}
  }
return
