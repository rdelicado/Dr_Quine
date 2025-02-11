ASM_FLAGS = -f elf64
GCC_FLAGS = -nostartfiles -no-pie
LD = ld
LD_FLAGS = -o
NAME = Collen
SRC = Collen.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(OBJ) -o $(NAME) $(GCC_FLAGS)

$(OBJ): $(SRC)
	nasm $(ASM_FLAGS) $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f tmp_Collen
	rm -f $(NAME)

fclean: clean
	rm -f $(NAME)
	rm -f tmp_Collen

re: fclean all

.PHONY: all clean fclean re

diff:
	./$(NAME) > tmp_Collen
	diff tmp_Collen Collen.s

cp:
	./$(NAME) > tmp_Collen

di:
	diff tmp_Collen Collen.c