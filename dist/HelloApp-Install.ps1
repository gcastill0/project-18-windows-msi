# Inputs
$Uri  = "https://github.com/gcastill0/project-18-windows-msi/releases/latest/download/HelloApp.msi"
$Dst  = "C:\Users\Administrator\Desktop\HelloApp.msi"
$Log  = "C:\Users\Administrator\Desktop\HelloApp-install.log"

# Optional MSI properties (ALL CAPS = public)
$Props = @(
  'ALLUSERS=1'                                   # per-machine
  'INSTALLDIR="C:\Program Files\HelloApp"'       # custom path
  'ADDLOCAL=Main'                                # feature selection
  'REBOOT=ReallySuppress'                        # suppress reboot
)

$PropsStr = $Props -join ' '

# Fetch and install
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $Uri -OutFile $Dst
Start-Process msiexec.exe -ArgumentList "/i `"$Dst`" /qn /norestart /L*v `"$Log`" $PropsStr" -Wait -NoNewWindow
