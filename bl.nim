import strutils, os

proc main(filename: string) =
  var memory: array[100, char]
  for i in 0..99:
    memory[i] = '\0'  # Initialize the memory to 0
  var counter_ptr = 0
  var comment = false

  let fileContent = readFile(filename)
  for c in fileContent:
    if c == '\0':
      break

    if c == ';':
      comment = not comment
    elif not comment:
      case c
      of '[':
        if counter_ptr >= 0 and counter_ptr < 100:
          memory[counter_ptr] = char(ord(memory[counter_ptr]) + 1)  # Increment the value at the current memory cell
        else:
          echo "Error: counter_ptr out of bounds"
      of ']':
        if counter_ptr >= 0 and counter_ptr < 100:
          memory[counter_ptr] = char(ord(memory[counter_ptr]) - 1)  # Decrement the value at the current memory cell
        else:
          echo "Error: counter_ptr out of bounds"
      of '*':
        if counter_ptr >= 0 and counter_ptr < 100:
          memory[counter_ptr] = char(ord(memory[counter_ptr]) * 2) # Multiply the value at the current memory cell by 2
        else:
          echo "Error: counter_ptr out of bounds"
      of ',':
        if counter_ptr >= 0 and counter_ptr < 100:
          memory[counter_ptr] = char(ord(memory[counter_ptr]) * 3) # Multiply the value at the current memory cell by 3
        else:
          echo "Error: counter_ptr out of bounds"
      of '(':
        if counter_ptr < 99:
          inc(counter_ptr)  # Move the pointer to the right
        else:
          echo "Error: counter_ptr out of bounds"
      of ')':
        if counter_ptr > 0:
          dec(counter_ptr)  # Move the pointer to the left
        else:
          echo "Error: counter_ptr out of bounds"
      of '.':
        if counter_ptr >= 0 and counter_ptr < 100:
          stdout.write(memory[counter_ptr])  # Output the value at the current memory cell
        else:
          echo "Error: counter_ptr out of bounds"
      of '%':
        for i in 0..99:
          memory[i] = '\0' # Clear the memory
      of '#':
        if counter_ptr >= 0 and counter_ptr < 100:
          memory[counter_ptr] = '\0'  # Reset the value at the current memory cell
        else:
          echo "Error: counter_ptr out of bounds"
      of '@':
        if counter_ptr >= 0 and counter_ptr < 100:
          echo ord(memory[counter_ptr])  # Output the integer value of the current memory cell
        else:
          echo "Error: counter_ptr out of bounds"
      of '/':
        echo ""  # Print a newline
      of '&':
        stdout.write(" ")  # Print a space
      else:
        # Handle any other characters
        discard

when isMainModule:
  if paramCount() == 1:
    let filename = paramStr(1)
    main(filename)
  else:
    echo "Usage: ", paramStr(0), " <filename>.bl"