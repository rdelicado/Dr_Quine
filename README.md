# Dr_Quine

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/rdelicad/Dr_Quine)

## What is a Quine?

A **quine** is a program that, when executed, outputs its own source code. The concept of a quine comes from the study of self-reference in computer science and logic. The term "quine" is inspired by philosopher Willard Van Orman Quine, whose work on language and reference influenced this idea. Quines have long been used as curiosities and programming challenges to demonstrate self-reproducing code.

## Project Overview

This project contains implementations of quines in multiple programming languages. Each implementation is designed to meet specific requirements:

- **C Implementations**
  - **Collen.c** (located in `C/ex01`):  
    This program defines a `main` function and an additional function. It includes two comments – one inside `main` and one outside – and outputs its own source code.
  - **Grace.c** (located in `C/ex02`):  
    This version uses exactly three `#define` macros (with a single comment included in one macro) and does not explicitly declare a `main` outside the macro. Instead, it runs by calling the macro `RUN` which eventually prints its source code to a file.
  - **Compilation & Execution:**  
    Each C implementation includes its own Makefile. Simply navigate to the corresponding folder (for example, `C/ex01` or `C/ex02`) and run `make` to compile. Then execute the resulting binary to see the quine in action.

- **Assembly (ASM) Implementations**
  - The ASM folder contains quine implementations in assembly language.  
  - **Compilation:**  
    Each assembly project includes a Makefile with instructions on how to compile the code.

- **Bash Implementations**
  - The Bash folder contains shellscripts such as `Grace.sh` and `Sully.sh` that simulate the behavior of a quine (and, for Sully, self-replication with a decrementing counter).  
  - **Execution:**  
    These scripts do not use Makefiles. To run them, ensure they are executable (e.g., using `chmod +x Grace.sh`) and run them directly from the terminal (e.g., `./Grace.sh`).

## How to Run the Programs

### C Implementations

1. Navigate to the desired folder:
   ```bash
   cd C/ex01
   ```
2. Compile using the provided Makefile:
   ```bash
   make
   ```
3. Run the executable:
   ```bash
   ./Collen
   ```
4. (For the second program, follow a similar process in `C/ex02`.)

### Assembly Implementations

1. Navigate to the ASM folder:
   ```bash
   cd ASM
   ```
2. Run the Makefile to compile:
   ```bash
   make
   ```
3. Execute the binary:
   ```bash
   ./<executable_name>
   ```

### Bash Implementations

1. Make sure the script is executable:
   ```bash
   chmod +x Grace.sh
   chmod +x Sully.sh
   ```
2. Run the script directly:
   ```bash
   ./Grace.sh
   ./Sully.sh
   ```

---

This project explores the concept of self-reproducing code across different languages and paradigms. Enjoy examining the code and the ingenuity behind each quine implementation!
