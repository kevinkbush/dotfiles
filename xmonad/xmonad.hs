import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import System.IO

-- yes, these are functions; just very simple ones
-- that accept no input and return static values
myTerminal    = "xfce4-terminal"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 2
myManageHook = composeAll
     [className =? "Gimp" --> doFloat]
myLayout = avoidStruts $ 
  tiled ||| Mirror tiled ||| Full
    where  
      -- default tiling algorithm partitions the screen into two panes
      tiled = spacing 5 $ Tall nmaster delta ratio

      -- The default number of windows in the master pane  
      nmaster = 1  

      -- Default proportion of screen occupied by master pane
      ratio = 2/3  
   
      -- Percent of screen to increment by when resizing panes  
      delta = 5/100  



main = do
   xmproc <- spawnPipe "/usr/bin/xmobar /home/kbush/.xmobarrc"
   trayproc <- spawnPipe "killall trayer; trayer  --edge top --align center --SetDockType true --SetPartialStrut true  --expand true --widthtype request --transparent true --tint 0 --alpha 0 --height 16 --distance 0 --padding 0"
   xmonad $ defaultConfig
     { terminal    = myTerminal
     , modMask     = myModMask
     , borderWidth = myBorderWidth
     , normalBorderColor  = "grey"
     , focusedBorderColor = "#6EADF1"
     , manageHook  = manageDocks <+> myManageHook <+> manageHook defaultConfig
     , layoutHook  = myLayout
     , logHook     = dynamicLogWithPP xmobarPP  
             { ppOutput = hPutStrLn xmproc  
             , ppTitle = xmobarColor "#6EADF1" "" . shorten 80 
             }  
     } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xlock -mode blank")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_b), sendMessage ToggleStruts) 
        ]


