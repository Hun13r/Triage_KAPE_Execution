# Scheduled Task for KAPE Execution

![PowerShell](https://img.shields.io/badge/PowerShell-7.1-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/Version-1.0-brightgreen)

## Overview

This PowerShell script is designed to dynamically locate the drive containing the [Kroll Artifact Parser and Extractor (KAPE)](https://www.kroll.com/en/services/cyber-risk/data-collection-analysis/kape) tools, validate the required paths, and create a scheduled task to execute a pre-defined KAPE command. It ensures the task runs with elevated privileges and starts immediately after registration.

### Key Features:
- **Dynamic Drive Detection**: Automatically locates the drive containing the KAPE tools, eliminating the need for hardcoding drive letters.
- **System Privileges**: Creates a scheduled task that runs under the SYSTEM account with the highest privileges.
- **Customisable Arguments**: Supports user-defined arguments for KAPE command execution.
- **Error Handling**: Includes robust validation to ensure all prerequisites are met before proceeding.
- **Professional Logging**: Clear and actionable feedback for errors and successful task creation/execution.

---

## Table of Contents

1. [Usage](#usage)
2. [Pre-requisites](#pre-requisites)
3. [Example Command](#example-command)
4. [Script](#script)
5. [Sample Output](#sample-output)
6. [Disclaimer](#disclaimer)
7. [Contributing](#contributing)
8. [License](#license)

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
