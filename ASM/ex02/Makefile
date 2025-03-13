ASM_FLAGS = -f elf64
GCC_FLAGS = -nostartfiles -no-pie -e _start

NAME = Grace
SRC = Grace.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(GCC_FLAGS) -o $(NAME) $(OBJ)

$(OBJ): $(SRC)
	nasm $(ASM_FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f tmp_Grace

fclean: clean
	rm -f $(NAME)
	rm -f Grace_kid.s

re: fclean all

.PHONY: all clean fclean re