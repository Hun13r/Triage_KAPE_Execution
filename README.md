# Scheduled Task for KAPE Execution

![PowerShell](https://img.shields.io/badge/PowerShell-7.1-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/Version-1.0-brightgreen)

## Overview

This PowerShell script automates the execution of the [Kroll Artifact Parser and Extractor (KAPE)](https://www.kroll.com/en/services/cyber-risk/data-collection-analysis/kape) tool. The script validates required paths, creates a scheduled task, and executes a pre-defined KAPE command with elevated privileges. It is designed to run discreetly in the background, enabling rapid forensic triage with minimal disruption to the system.


### Purpose

The primary aim of this script is to **automate the SANS Triage image process** and run stealthily in the background. By leveraging this script, forensic investigators can:
- Quickly obtain a forensic triage image with minimal user interaction.
- Seamlessly execute the triage process in the background with minimal noticeability.
- Speed up the collection of critical forensic artifacts when logged into the system with administrator rights.

This solution is ideal for scenarios where rapid triage and minimal disruption to the system are critical.

### Key Features:
- **Dynamic Drive Detection**: Automatically locates the drive containing the KAPE tools, eliminating the need for hardcoding drive letters.
- **Stealth Operation**: Runs the task seamlessly in the background to minimize noticeability and avoid interfering with the system's normal operation.
- **System Privileges**: Creates a scheduled task that runs under the SYSTEM account with the highest privileges.
- **Customisable Arguments**: Supports user-defined arguments for KAPE command execution.
- **Error Handling**: Includes robust validation to ensure all prerequisites are met before proceeding.
- **Professional Logging**: Clear and actionable feedback for errors and successful task creation/execution.

---

## Usage

### Pre-requisites:
1. **Administrator Privileges**: The script must be run with elevated permissions.
2. **PowerShell 5.1 or Later**: Ensure you are using the correct PowerShell version.
3. **KAPE Tools**: The tools must be located within the following folder structure:
4. **Windows Task Scheduler Enabled**: Required for creating and managing scheduled tasks.

### Execution Steps:
1. Clone the repository or download the script.
2. Run the script in PowerShell with elevated privileges.
3. The script will:
- Dynamically locate the drive containing the KAPE tools.
- Validate the presence of `kape.exe` in the expected folder.
- Create and register a scheduled task with the specified arguments.
- Start the task immediately after successful registration.

---

## Example Command

The script uses the following KAPE arguments by default:

```plaintext
--tsource C: --tdest [Drive]:\GKape_Hun13r --target !SANS_Triage --vhdx Hun13r_Triage --zv false --gui
