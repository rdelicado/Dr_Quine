# This program will print its own source code when executed
def print_code(code):
    print(code, end='')

def main():
    # Code string that holds the program's DNA
    code = "# This program will print its own source code when executed\ndef print_code(code):\n    print(code, end='')\n\ndef main():\n    # Code string that holds the program's DNA\n    code = %r\n\n    print_code(code %% code)\n\nmain()"

    print_code(code % code)

main()