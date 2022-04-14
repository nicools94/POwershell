$ErrorActionPreference= 'silentlycontinue'
$date_header = Get-Date -Format ddMMyy
$mail_send = [int]0
$outfile = "C:\_$($env:USERNAME)_$($env:COMPUTERNAME)_$($date_header).log"
$host1 = "azueubc91"

Get-Date -Format "dd.MM.yy HH:mm:ss" | Out-File $outfile -Append
echo "Starting script..." | Out-File $outfile -Append

        do
        {
        
        # HOST1
        $fails = Get-Content C:\_$($env:USERNAME)_$($env:COMPUTERNAME)_$($date_header).log | Select-String -Pattern 'Lost' | Measure-Object –Line 
        #clear
        Write-Output "Packets lost today:"
        Write-Output $fails
        Test-Connection $host1 -Count 4 #| out-null
        if ([int]$? -eq 0)
            {
            
            $date = Get-Date -Format "HH:mm:ss"
            #echo "########################################################" | Out-File $outfile -Append
            echo "$date Lost connection to $host1" | Out-File $outfile -Append
            
           Write-Output $mail_send
            if ([int]$mail_send -eq 0)
                {
                
                Send-MailMessage -From 'monitoring@ilomar.com' -To 'nicolas.cools@ilomar.com' -Subject 'Business Central connection broke!' -SmtpServer 'ilomar-com.mail.protection.outlook.com'
                $mail_send = $mail_send + 1
                Write-Output $mail_send
                }
            }

        
        }
        while ($asd = 1)
