<# This theme was tested using DejaVuSansMono font <https://github.com/powerline/fonts> #>
function global:prompt {
	$realCommandStatus = $?
        $realLASTEXITCODE = $LASTEXITCODE
	$lambda = [char]0x03BB
	$forwardArrow = [char]0x27A5
	$brach = [char]0xE0A0
	$ok =[char]0x2714
	$no =[char]0x2718 
	 
if ( $realCommandStatus -eq $True ) {
      $EXIT="Yellow"
    } else {
      $EXIT="Red"
    }      
     
    
    $CurrentDirectory = Split-Path -leaf -path (Get-Location)

    Write-Host "$lambda $env:USERNAME" -ForegroundColor Cyan -NoNewline
 
    Write-Host " $forwardArrow $CurrentDirectory" -ForegroundColor Green -NoNewLine
        

    if(Get-GitStatus){
        Write-Host " $forwardArrow " -ForegroundColor Yellow -NoNewline
	$gitList = (Get-GitStatus)
	$statusWork = $gitList.HasWorking
	$brachGit = $gitList.Branch
	Write-Host "$brach $brachGit" -ForegroundColor DarkCyan -NoNewline	
	if(!$statusWork){
	Write-Host " $ok" -ForegroundColor Green -NoNewline	
	}else{
	Write-Host " $no" -ForegroundColor Red -NoNewline	
	}
	

    }



    Write-Host " $forwardArrow" -ForegroundColor Yellow -NoNewline
    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
    
}

$global:PSColor = @{
    File = @{
        Default    = @{ Color = 'White' }
        Directory  = @{ Color = 'Green'}
        Reparse    = @{ Color = 'Magenta'}
        Hidden     = @{ Color = 'DarkGray'; Pattern = '^\.' }
        Code       = @{ Color = 'Magenta'; Pattern = '\.(java|c|cpp|cs|js|css|html|Dockerfile|gradle|
            pp|packergitignore|gitattributes|go|)$' }
        Executable = @{ Color = 'Green'; Pattern = '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg|sh|fsx|)$' }
        Text       = @{ Color = 'Cyan'; Pattern = '\.(txt|cfg|conf|ini|csv|log|config|
            xml|yml|md|markdown|properties|json|todo)$' }
        Compressed = @{ Color = 'Yellow'; Pattern = '\.(zip|tar|gz|rar|jar|war)$' }
    }
    Service = @{
        Default = @{ Color = 'White' }
        Running = @{ Color = 'DarkGreen' }
        Stopped = @{ Color = 'DarkRed' }
    }
    Match = @{
        Default    = @{ Color = 'White' }
        Path       = @{ Color = 'Green'}
        LineNumber = @{ Color = 'Yellow' }
        Line       = @{ Color = 'White' }
    }
}
