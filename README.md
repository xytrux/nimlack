# Nimlack

Nimlack is a simple interpreter written in Nim. It processes a custom language with specific commands to manipulate memory and control flow.

## Features

- Increment and decrement memory cells
- Move the memory pointer left and right
- Output the value of memory cells
- Clear memory and reset memory cells
- Handle comments

## Commands

- `[` : Increment the value at the current memory cell
- `]` : Decrement the value at the current memory cell
- `*` : Multiply the value at the current memory cell by 2
- `,` : Multiply the value at the current memory cell by 3
- `(` : Move the pointer to the right
- `)` : Move the pointer to the left
- `.` : Output the value at the current memory cell
- `%` : Clear the memory
- `#` : Reset the value at the current memory cell
- `@` : Output the integer value of the current memory cell
- `/` : Print a newline
- `&` : Print a space
- `;` : Toggle comment mode

## Usage

To run the interpreter, use the following command:

```sh
nim c -r bl.nim <filename>.bl