Add-Type -AssemblyName PresentationFramework
$A = "jardsit.com"
$wait = 6
For ($i=0; $i -ge -1; $i++) {
    $x = 0
    $A | Foreach {
    try
    {
        $_ + " - x"+ $x
        $Response = Invoke-WebRequest -Uri $_ -ErrorAction Stop
        # This will only execute if the Invoke-WebRequest is successful.
        $StatusCode = $Response.StatusCode
    }
    catch
    {
            $StatusCode = $_.Exception.Response.StatusCode.value__
            $StatusCode = $Response.StatusCode
            [System.Windows.MessageBox]::Show($_)
    }
    $StatusCode
    $x = $x+1
    }
    for ($i = 1; $i -le $wait; $i++ )
    {
    Write-Progress -Activity "Sleeping... " -Status "$i" -PercentComplete -1;
    Start-Sleep -s 1
    }


}
