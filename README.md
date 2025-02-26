# 📜 Disclaimer  

This script is designed to **automate the execution of KAPE (Kroll Artifact Parser and Extractor)** as a scheduled task, running discreetly in the background for forensic triage purposes.  

## ⚠️ Important Notes  

- This script is **independently developed** to automate the scheduling and execution of KAPE.  
- **All credit for KAPE** goes to **Eric Zimmerman**, the original creator of this powerful forensic tool.  
- KAPE is **maintained and distributed by Kroll**. More details can be found at:  
  📌 **[KAPE Official Repository](https://github.com/EricZimmerman/KapeFiles)**  

By using this script, you acknowledge that **KAPE is a third-party tool** and that this project merely facilitates its execution through automation.  

---

# 🚀 Scheduled Task for KAPE Execution  

![PowerShell](https://img.shields.io/badge/PowerShell-7.1-blue)  
![License](https://img.shields.io/badge/License-MIT-green)  
![Version](https://img.shields.io/badge/Version-1.0-brightgreen)  

## 🔍 Overview  

This PowerShell script automates the execution of the [**Kroll Artifact Parser and Extractor (KAPE)**](https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape#form716). The script validates required paths, creates a scheduled task, and executes a pre-defined KAPE command with elevated privileges.  

It is **designed to run discreetly in the background**, enabling rapid forensic triage with minimal disruption to the system.  

---

## 🎯 Purpose  

The primary aim of this script is to **automate the SANS Triage image process** and execute it stealthily in the background.  

By leveraging this script, forensic investigators can:  
- ✅ Obtain a forensic triage image with **minimal user interaction**.  
- ✅ Seamlessly execute the triage process in the background with **low visibility**.  
- ✅ Speed up the collection of **critical forensic artifacts** while logged in as an administrator.  

This solution is ideal for **scenarios requiring rapid triage and minimal system disruption**.  

---

## 🔑 Key Features  

✔️ **Dynamic Drive Detection** – Automatically locates the drive containing the KAPE tools, eliminating the need for hardcoded paths.  
✔️ **Stealth Operation** – Runs discreetly in the background to avoid disrupting system activity.  
✔️ **System Privileges** – Creates a scheduled task running under the **SYSTEM account** with the highest privileges.  
✔️ **Customisable Arguments** – Supports user-defined arguments for **flexible KAPE command execution**.  
✔️ **Error Handling** – Implements robust validation to ensure all prerequisites are met before execution.  
✔️ **Professional Logging** – Provides clear and actionable feedback for errors and successful execution.  

---

## ⚙️ Usage  

### 📌 Pre-requisites  

1. **Administrator Privileges** – The script requires elevated permissions to run.  
2. **PowerShell 5.1 or Later** – Ensure compatibility with the required PowerShell version.  
3. **KAPE Tools** – KAPE must be available in the expected folder structure.  
4. **Windows Task Scheduler Enabled** – Required for creating and managing scheduled tasks.  

---

### 🛠️ Execution Steps  

1. Clone the repository or download the script.  
2. Run the script in PowerShell with **elevated privileges**.  
3. The script will:  
   - 🔹 Locate the drive containing the KAPE tools.  
   - 🔹 Validate the presence of `kape.exe` in the expected folder.  
   - 🔹 Create and register a **scheduled task** with predefined arguments.  
   - 🔹 Start the task immediately after **successful registration**.  

---

## 💻 Example Command  

The script uses the following KAPE arguments by default:  

```plaintext
--tsource C: --tdest [Drive]:\GKape_Hun13r --target !SANS_Triage --vhdx Hun13r_Triage --zv false --gui
