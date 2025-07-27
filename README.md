# 🔄 Dr_Quine

[![42 School](https://img.shields.io/badge/42-School-000000?style=flat&logo=42&logoColor=white)](https://42.fr/)
[![Self-Replication](https://img.shields.io/badge/Self_Replication-Quines-purple.svg)](https://en.wikipedia.org/wiki/Quine_(computing))
[![Languages](https://img.shields.io/badge/Languages-C%2BASM%2BBash-blue.svg)](https://en.wikipedia.org/wiki/Programming_language)
[![Recursion](https://img.shields.io/badge/Recursion-Self_Modifying-orange.svg)](https://en.wikipedia.org/wiki/Self-modifying_code)
[![Meta Programming](https://img.shields.io/badge/Meta_Programming-Code_Generation-green.svg)](https://en.wikipedia.org/wiki/Metaprogramming)

## 📋 Description

**Dr_Quine** is a fascinating exploration into the world of self-replicating programs, named after philosopher Willard Van Orman Quine. This project delves deep into meta-programming concepts, demonstrating how programs can generate exact copies of themselves without external input. The project spans multiple programming languages (C, Assembly, and Bash) and showcases three distinct self-replication paradigms.

This is one of the most intellectually challenging projects in the 42 curriculum, requiring deep understanding of program structure, string manipulation, and the philosophical concept of self-reference in computing.

### Project Objectives

- **Self-replication mastery**: Understanding how programs can reproduce themselves
- **Meta-programming**: Advanced techniques for code generation and introspection
- **Multi-language implementation**: C, x86_64 Assembly, and Bash implementations
- **String escaping**: Complex character handling and formatting
- **Recursive programming**: Self-modifying and self-executing code patterns
- **Code philosophy**: Exploring the boundaries between data and instructions

## 🧬 Quine Theory

### What is a Quine?

A **quine** is a computer program that produces a copy of its own source code as its complete output. Named after philosopher Willard Van Orman Quine, who worked on self-reference and quoted self-reference in language and logic.

### The Quine Paradox

```
"Quines are the programming equivalent of the sentence:
'This sentence contains five words' - a statement that refers to itself."
```

### Core Principles

1. **No external input**: Cannot read its own source file
2. **Exact reproduction**: Output must match source code character-for-character
3. **Self-contained**: All information needed must be embedded within the program
4. **Non-trivial**: Empty programs or single-character programs don't count

## 🏗️ Project Structure

```
Dr_Quine/
├── README.md                       # Project documentation
├── C/                             # C language implementations
│   ├── ex01/                      # Colleen - Basic quine
│   │   ├── Collen.c              # Self-replicating C program
│   │   └── Makefile              # Build configuration
│   ├── ex02/                      # Grace - File-writing quine
│   │   ├── Grace.c               # Creates Grace_kid.c
│   │   └── Makefile              # Build configuration
│   └── ex03/                      # Sully - Self-decrementing quine
│       ├── Sully.c               # Recursive self-modification
│       └── Makefile              # Build configuration
├── ASM/                           # x86_64 Assembly implementations
│   ├── ex01/                      # Colleen in Assembly
│   │   ├── Collen.s              # Assembly quine
│   │   └── Makefile              # Build configuration
│   ├── ex02/                      # Grace in Assembly
│   │   ├── Grace.s               # Assembly file writer
│   │   └── Makefile              # Build configuration
│   └── ex03/                      # Sully in Assembly
│       ├── Sully.s               # Assembly recursive program
│       └── Makefile              # Build configuration
└── Bash/                          # Bash script implementations
    ├── Colleen.sh                # Basic bash quine
    ├── Grace.sh                  # File-writing bash script
    └── Sully.sh                  # Self-decrementing bash script
```

## 🚀 Compilation & Usage

### C Implementations

```bash
# Compile Colleen (Basic Quine)
cd C/ex01
make
./Collen

# Compile Grace (File Writer)
cd C/ex02
make
./Grace
# Creates Grace_kid.c with identical source

# Compile Sully (Self-Decrementing)
cd C/ex03
make
./Sully
# Creates Sully_4.c, Sully_3.c, ..., Sully_0.c and executes them
```

### Assembly Implementations

```bash
# Compile Colleen (Assembly)
cd ASM/ex01
make
./Collen

# Compile Grace (Assembly)
cd ASM/ex02
make
./Grace
# Creates Grace_kid.s

# Compile Sully (Assembly)
cd ASM/ex03
make
./Sully
# Creates and executes Sully_N.s files
```

### Bash Implementations

```bash
# Run Colleen (Bash)
chmod +x Bash/Colleen.sh
./Bash/Colleen.sh

# Run Grace (Bash)
chmod +x Bash/Grace.sh
./Bash/Grace.sh
# Creates Grace_kid.sh

# Run Sully (Bash)
chmod +x Bash/Sully.sh
./Bash/Sully.sh
# Creates and executes Sully_N.sh files
```

## 📚 Detailed Implementations

### Ex01: Colleen - The Basic Quine

**Purpose**: A program that outputs its own source code exactly.

#### C Implementation Strategy

```c
#include <stdio.h>

void print(char *code)
{
    printf(code, 10, 34, code);
}

/*
    This program will print its own source when executed.
*/
int main() 
{
    /*
        Code string that holds the program's DNA
    */
    char *code = "#include <stdio.h>%1$c%1$cvoid print(char *code)%1$c{%1$c    printf(code, 10, 34, code);%1$c}%1$c%1$c/*%1$c    This program will print its own source when executed.%1$c*/%1$cint main() %1$c{%1$c    /*%1$c        Code string that holds the program's DNA%1$c    */%1$c    char *code = %2$c%3$s%2$c;%1$c%1$c    print(code);%1$c    return 0;%1$c}";

    print(code);
    return 0;
}
```

**Key Techniques**:
- **Format specifiers**: `%1$c` (newline), `%2$c` (quote), `%3$s` (string)
- **Self-contained data**: The entire program encoded as a string
- **Parameter substitution**: Using printf's positional parameters
- **Character encoding**: ASCII 10 (newline) and 34 (double quote)

### Ex02: Grace - The File-Writing Quine

**Purpose**: A program that creates a file containing its own source code.

#### C Implementation Strategy

```c
#include <stdio.h>

#define CODE "#include <stdio.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$c#define GRACE FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); fprintf(f, CODE, 10, 34, CODE); fclose(f); return (0);%1$c%1$c#define RUN /* This macro runs the program */ int main() { GRACE }%1$c%1$cRUN"

#define GRACE FILE *f = fopen("Grace_kid.c", "w"); fprintf(f, CODE, 10, 34, CODE); fclose(f); return (0);

#define RUN /* This macro runs the program */ int main() { GRACE }

RUN
```

**Key Techniques**:
- **Macro definitions**: Using `#define` for code organization
- **File operations**: Creating and writing to `Grace_kid.c`
- **Self-reference**: The macro contains the instructions to recreate itself
- **Nested encoding**: Multiple levels of string representation

### Ex03: Sully - The Self-Decrementing Quine

**Purpose**: A program that creates modified versions of itself with a decrementing counter.

#### C Implementation Strategy

```c
#include <stdio.h>
#include <stdlib.h>

#define CODE "/* C code template with placeholder for counter */"

/* this program runs itself until num = 0 */
int main()
{
    char filename[20];
    char cmd[100];
    int num = 5;  // Starting counter value
    
    if (num <= 0) return (0);
    num--;  // Decrement counter
    
    // Create filename
    snprintf(filename, sizeof(filename), "Sully_%d.c", num);
    
    // Write source code with new counter value
    FILE *f = fopen(filename, "w");
    fprintf(f, CODE, 10, 34, CODE, num);
    fclose(f);
    
    // Compile the new file
    snprintf(cmd, sizeof(cmd), "gcc -Wall -Wextra -Werror -o Sully_%d %s", num, filename);
    system(cmd);
    
    // Execute the new program
    snprintf(cmd, sizeof(cmd), "./Sully_%d", num);
    system(cmd);
    
    return (0);
}
```

**Key Techniques**:
- **Counter manipulation**: Embedding and modifying a numeric value
- **Dynamic compilation**: Using `system()` to compile generated code
- **Recursive execution**: Each generated program executes the next
- **Termination condition**: Stops when counter reaches 0

## 🔧 Technical Deep Dive

### String Escaping Mastery

The biggest challenge in quines is properly escaping special characters:

```c
// Character mapping for C quines
%1$c = '\n' (newline, ASCII 10)
%2$c = '"'  (double quote, ASCII 34)  
%3$s = the code string itself

// Example transformation
printf(format, 10, 34, format);
// Becomes
printf("Hello %1$c World %2$c", '\n', '"');
```

### Assembly Challenges

Assembly quines require manual memory management and system calls:

```assembly
section .data
    ; Self-contained string representation
    code: db "section .data...", 0
    code_len equ $ - code

section .text
    global _start

_start:
    ; Print the code using write syscall
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, code       ; string address
    mov rdx, code_len   ; string length
    syscall
    
    ; Exit program
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; exit status
    syscall
```

### Bash Script Techniques

Bash quines leverage the script's ability to read itself:

```bash
#!/bin/bash

# Method 1: Direct self-reading
cat "$0"

# Method 2: Embedded code string
CODE='#!/bin/bash\necho "$CODE"'
echo -e "$CODE"

# Method 3: Here-document
cat << 'EOF'
#!/bin/bash
cat << 'EOF'
[recursive structure]
EOF
EOF
```

## 🧪 Testing & Validation

### Quine Verification

```bash
# Test Colleen
./Collen > output.c
diff Collen.c output.c
# Should show no differences

# Test Grace
./Grace
diff Grace.c Grace_kid.c
# Should show no differences

# Test Sully recursive chain
./Sully
# Should create: Sully_4.c, Sully_3.c, Sully_2.c, Sully_1.c, Sully_0.c
# And execute each in sequence
```

### Automated Testing Script

```bash
#!/bin/bash

test_quine() {
    local prog=$1
    local expected_output=$2
    
    echo "Testing $prog..."
    
    # Run program and capture output
    output=$(./$prog)
    
    # Compare with expected
    if [ "$output" = "$expected_output" ]; then
        echo "✅ $prog: PASS"
    else
        echo "❌ $prog: FAIL"
        echo "Expected: $expected_output"
        echo "Got: $output"
    fi
}

# Test all quines
test_quine "Collen" "$(cat Collen.c)"
```

### Character-by-Character Analysis

```bash
# Verify exact byte-for-byte reproduction
xxd Collen.c > original.hex
./Collen | xxd > output.hex
diff original.hex output.hex
```

## 🎯 Key Learning Outcomes

### Meta-Programming Mastery
- **Self-reference**: Understanding how programs can refer to themselves
- **Code generation**: Dynamic creation of source code
- **String manipulation**: Advanced formatting and escaping techniques
- **Program introspection**: Analyzing program structure from within

### Language-Specific Techniques
- **C**: Printf formatting, macro definitions, file I/O
- **Assembly**: System calls, memory management, string handling
- **Bash**: Script self-reading, text processing, command substitution

### Philosophical Understanding
- **Gödel's incompleteness**: Self-reference in formal systems
- **Recursion theory**: Programs that modify themselves
- **Information theory**: Self-describing systems
- **Computational philosophy**: The nature of code and data

## 🚨 Common Challenges & Solutions

### Challenge 1: Character Escaping

```c
// Problem: How to include quotes in a string that defines itself?
char *code = "char *code = \"???\";";  // ❌ Infinite recursion

// Solution: Use printf format specifiers
char *code = "char *code = %2$c%3$s%2$c;";  // ✅ Self-referential
printf(code, 10, 34, code);
```

### Challenge 2: Assembly String Handling

```assembly
; Problem: Assembly doesn't have printf
; Solution: Manual string manipulation and system calls

build_string:
    ; Manually construct the output string
    ; Insert newlines (10) and quotes (34) at correct positions
    ; Use write syscall to output
```

### Challenge 3: Bash Self-Reference

```bash
# Problem: How to avoid infinite loops in self-reading scripts?
# Solution: Use conditional logic and external files

if [ ! -f "output_generated" ]; then
    cat "$0" > output
    touch output_generated
fi
```

### Challenge 4: Sully Counter Management

```c
// Problem: How to embed a modifiable counter?
int num = 5;  // This value must be in the string template

// Solution: Use format specifiers for numeric substitution
char *template = "int num = %4$d;";  // %4$d will be replaced with counter
fprintf(f, template, 10, 34, template, new_counter_value);
```

## 🔬 Advanced Concepts

### Quine Variants

#### 1. Multi-Language Quines
Programs that output themselves in different languages:

```c
// C program that outputs equivalent Python code
#include <stdio.h>
int main() {
    printf("print('Hello from Python')\n");
    return 0;
}
```

#### 2. Ouroboros Quines
Circular chains where A generates B, B generates C, and C generates A:

```
Sully.c → Sully_4.c → Sully_3.c → ... → Sully_0.c
```

#### 3. Radiation-Hardened Quines
Programs that still work even when a few characters are changed:

```c
// Still functions with minor modifications
char *code = "/* Resilient quine code */";
```

### Mathematical Foundations

#### Kleene's Recursion Theorem
Every quine is an application of Kleene's recursion theorem, which states that for any computable function, there exists a program that computes that function when given its own code as input.

#### Fixed-Point Theory
Quines represent fixed points in the space of programs:
```
f(program) = program_output
For quines: f(Q) = Q
```

### Practical Applications

#### 1. Virus Research
Understanding self-replicating code helps in:
- Analyzing malware propagation
- Developing detection algorithms
- Creating immune system models

#### 2. Genetic Programming
Quines inspire:
- Self-modifying algorithms
- Evolutionary programming
- Adaptive systems

#### 3. Code Obfuscation
Techniques from quines used in:
- Software protection
- Reverse engineering defense
- Intellectual property protection

## 📊 Complexity Analysis

### Code Size Comparison

| Language | Colleen | Grace | Sully | Complexity |
|----------|---------|--------|-------|------------|
| C | 25 lines | 8 lines | 35 lines | Medium |
| Assembly | 45 lines | 60 lines | 80 lines | High |
| Bash | 12 lines | 6 lines | 18 lines | Low |

### Performance Metrics

| Implementation | Execution Time | Memory Usage | File I/O |
|---------------|---------------|--------------|----------|
| Colleen | ~1ms | Minimal | None |
| Grace | ~5ms | Low | 1 write |
| Sully | ~500ms | Medium | N reads/writes |

## 🏆 Advanced Optimizations

### Minimizing Code Size

```c
// Ultra-compact quine (one of the shortest possible in C)
main(){char*s="main(){char*s=%c%s%c;printf(s,34,s,34);}";printf(s,34,s,34);}
```

### Optimizing Assembly Quines

```assembly
; Minimal assembly quine using only essential instructions
global _start
_start:
    mov rax,1
    mov rdi,1
    mov rsi,msg
    mov rdx,len
    syscall
    mov rax,60
    xor rdi,rdi
    syscall
msg: db "... (self-contained code) ..."
len equ $-msg
```

### Bash Golf Techniques

```bash
# Ultra-short bash quine
s='s=%c%s%c;printf "$s" 39 "$s" 39';printf "$s" 39 "$s" 39
```

## 👨‍💻 Author

**Rubén Delicado** - [@rdelicado](https://github.com/rdelicado)
- 📧 rdelicad@student.42malaga.com
- 🏫 42 Málaga
- 🧬 Meta-programming Enthusiast
- 📅 April 2025

## 📜 License

This project is part of the 42 School curriculum and follows academic guidelines for educational purposes.

## 🎓 42 School Integration

**Dr_Quine** is one of the most challenging projects in the 42 curriculum, bridging multiple programming paradigms:

- **Prerequisites**: Strong foundation in C, Assembly basics, shell scripting
- **Skills acquired**: Meta-programming, self-reference, advanced string manipulation
- **Follow-up projects**: Advanced algorithm projects, system programming
- **Career preparation**: Compiler design, meta-compilation, software security

### Learning Progression
1. **Week 1**: Understanding quine theory and basic implementations
2. **Week 2**: Mastering string escaping and format specifiers
3. **Week 3**: Assembly implementations and system call usage
4. **Week 4**: Advanced features and optimization techniques

### Evaluation Criteria
- **Exact reproduction**: Programs must output identical source code
- **No external input**: Cannot read own source file
- **Multi-language mastery**: Implementations in C, Assembly, and Bash
- **Code quality**: Clean, efficient, and well-documented implementations
- **Understanding**: Deep comprehension of self-reference concepts

## 📖 Additional Resources

### Academic Papers
- [Quines and Self-Reference in Computer Science](https://www.cs.cmu.edu/~tom7/quine.html)
- [The Art of Self-Replicating Programs](http://www.nyx.net/~gthompso/quine.htm)
- [Kleene's Recursion Theorem Applications](https://en.wikipedia.org/wiki/Kleene%27s_recursion_theorem)

### Quine Collections
- [The Quine Page](http://www.nyx.net/~gthompso/quine.htm)
- [Quines in Various Languages](https://github.com/mame/quine-relay)
- [Self-Printing Programs](http://rosettacode.org/wiki/Quine)

### Philosophy and Theory
- [Gödel, Escher, Bach](https://en.wikipedia.org/wiki/G%C3%B6del,_Escher,_Bach)
- [Strange Loops](https://en.wikipedia.org/wiki/Strange_loop)
- [Self-Reference in Logic](https://plato.stanford.edu/entries/self-reference/)

### Programming Language Specifications
- [C Standard (ISO/IEC 9899)](https://en.wikipedia.org/wiki/C_(programming_language))
- [x86_64 Assembly Reference](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
- [Bash Manual](https://www.gnu.org/software/bash/manual/)

## 🔮 Future Explorations

### Advanced Quine Projects
- [ ] **Polyglot Quines**: Programs valid in multiple languages simultaneously
- [ ] **Quine Relay**: Chain of programs where each outputs the next in a different language
- [ ] **Probabilistic Quines**: Programs with randomized self-replication
- [ ] **Compressed Quines**: Self-extracting programs that decompress themselves

### Research Applications
- [ ] **Viral Analysis**: Study self-replicating malware patterns
- [ ] **Genetic Algorithms**: Evolution-inspired programming techniques
- [ ] **Compiler Theory**: Self-hosting compiler design
- [ ] **Formal Verification**: Proving quine correctness mathematically

---

<div align="center">

*"A program that prints itself is the computational equivalent of a mirror looking at itself."*

**Dr_Quine** teaches us that the boundary between program and data is fluid, and that with sufficient cleverness, any program can achieve self-awareness. In mastering quines, we master the art of computational introspection.

</div>