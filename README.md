# Arithmetic Calculator

This program is a simple arithmetic calculator written in x86-64 Assembly. It prompts the user for two integers and an arithmetic operation (`+`, `-`, `*`, `/`), then computes and displays the result.

## Features
- Accepts two integer inputs from the user.
- Supports addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- Handles division by zero with an error message.
- Loops back to allow multiple calculations.

## Requirements
- A Linux system with an x86-64 processor.
- `gcc` and `nasm` installed.

## Compilation and Execution
1. Compile with GCC:
   ```sh
   gcc calculator.s -o calculator -no-pie
   ```
2. Run the program:
   ```sh
   ./calculator
   ```

## Usage
1. The program prompts for the first integer.
2. It then prompts for the second integer.
3. The user inputs an arithmetic operation (`+`, `-`, `*`, `/`).
4. The result is displayed.
5. If an invalid operation is entered, the program displays an error message, and the program ask for a new operation.
6. If division by zero is attempted, an error message is displayed, and the program restarts.

## Example Run
```
Please enter the first number: 10
Please enter the second number: 5
Please enter the arithmetic operation: +
The result is: 15
```

## Notes
- The program uses `scanf` and `printf` for input and output.
- The stack is used to store input values and the operation character.
- The `div` operation correctly checks for division by zero.
- The program loops back in case of errors.


