# Prolog Conflict Detection Engine

## Team Members:

- **Akhil**, **Sahithi**, **Sandyana**, **Hara Gopal**

## Getting Started with B-Prolog

This project uses **B-Prolog** for conflict detection in Prolog rules. Follow the installation steps based on your operating system to get started.

### How to Install B-Prolog

B-Prolog can be installed on **Windows**, **Linux**, and **Mac** systems. Choose the appropriate installation guide based on your OS.

### Windows Installation:

1. **Download**: Download the `bp8_win.zip` file and save it in the `C:\` directory.
2. **Extract**: Use WinZip or JAR in JSDK to extract the contents of the ZIP file.
3. **Run B-Prolog**: Navigate to the B-Prolog directory and launch `bp.exe`.
4. **Set Environment Variable**: Add `C:\BProlog` to your system's environment `PATH` to run B-Prolog from any directory.

### Linux Installation:

1. **Download**: Download the `bp8_linux.tar.gz` file and place it in your home directory.
2. **Extract**: Use the following command to extract the files:
   ```bash
   gunzip bp8_linux.tar.gz | tar xfv -
   ```
3. **Run B-Prolog**: Navigate to the B-Prolog directory and run the `bp` command to start the engine.
4. **Set Shell Alias**: Add the following alias to your shell configuration file (`.cshrc`, `.bashrc`, or `.kshrc` depending on your shell) for easier startup:
   ```bash
   alias bp="$HOME/BProlog/bp"
   ```

### Mac Installation:

- Follow the same steps as for **Linux** to install B-Prolog on macOS.

## Usage

Once B-Prolog is installed, follow these steps to use the conflict detection engine:

1. **Start B-Prolog**: Launch B-Prolog by running the `bp` command in the directory where your code file is saved.
2. **Load the Rule File**: Load the rule file into B-Prolog using the following command:
   ```prolog
   ?- [rules_conflict].
   ```
3. **Check for Conflicting Rules**: To detect any conflicting rules, enter the following command:
   ```prolog
   ?- rules_cmp_conflicts.
   ```
   B-Prolog will output any conflicts between rules, such as:
   ```
   1 and 2 rules are conflicting.
   ```
4. **Exit B-Prolog**: To exit the B-Prolog session, type:
   ```prolog
   ?- halt.
   ```

## Example Output

Upon running the commands, you should see output similar to the following:

```
B-Prolog Version 8.1, All rights reserved, (C) Afany Software 1994-2014.
| ?-
| ?- [rules_conflict].
consulting::rules_conflict.pl

yes
| ?- rules_cmp_conflicts.
1 and 2 rules are conflicting.

yes
| ?- halt.
```
