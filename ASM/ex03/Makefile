ASM_FLAGS = -f elf64
GCC_FLAGS = -nostartfiles -no-pie -e _start

NAME = Sully
SRC = Sully.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(GCC_FLAGS) -o $(NAME) $(OBJ)

$(OBJ): $(SRC)
	nasm $(ASM_FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f Sully_*.s
	rm -f Sully_*

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

diff:
	diff Sully.s Sully_0.s