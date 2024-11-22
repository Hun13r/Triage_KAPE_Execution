<#
#################################################################################################
# Script Name:     Scheduled Task for KAPE Execution
# Author:          Hun13r
# Email:           HunterEco2000@gmail.com
# Version:         1.0
# Description:     This script automates the execution of the SANS Triage process using KAPE 
#                  (Kroll Artifact Parser and Extractor). It validates the paths, creates a 
#                  scheduled task, and executes KAPE with pre-defined arguments to capture a 
#                  forensic triage image. The task runs with SYSTEM privileges and starts 
#                  immediately after registration for a stealthy and efficient operation.
# Usage:           Run this script with Administrator privileges.
# Notes:           Ensure the KAPE tools are located in the specified folder structure:
#                  "I:\Tools - Live Acquisition\KAPE\KAPE\kape.exe".
#################################################################################################
# Pre-requisites:
# - Administrator Privileges
# - PowerShell 5.1 or later
# - KAPE tools present in the specified folder structure
#################################################################################################
# DISCLAIMER:
# This script is provided "as-is" without warranty of any kind. Use it at your own risk.
#################################################################################################
#>



# Define Task Variables
$taskName = "Run KAPE Command"
$kapePath = "I:\Tools - Live Acquisition\KAPE\KAPE\kape.exe"
$kapeArguments = "--tsource C: --tdest I:\GKape_Hun13r --target !SANS_Triage --vhdx Hun13r_Triage --zv false --gui"
$description = "Run KAPE Command Task"

# Check for Administrator Privileges
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# Validate the KAPE executable path
if (-Not (Test-Path $kapePath)) {
    Write-Error "Error: The KAPE executable was not found at: $kapePath"
    exit 1
}

# Create the Action for the Task
$action = New-ScheduledTaskAction -Execute $kapePath -Argument $kapeArguments

# Create a Trigger to run the task once
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)

# Create the Principal to run with SYSTEM privileges
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register the Task
try {
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal -Description $description -Force
    Write-Host "Task '$taskName' has been successfully created."
} catch {
    Write-Error "Failed to register the task: $_"
    exit 1
}

# Start the Task Immediately
try {
    Start-ScheduledTask -TaskName $taskName
    Write-Host "Task '$taskName' has been successfully started."
} catch {
    Write-Error "Failed to start the task: $_"
    exit 1
}
