ifeq ($(shell uname), Darwin)
    ASM_FLAGS = -f macho64
    GCC_FLAGS = 
else
    ASM_FLAGS = -f elf64
    GCC_FLAGS = -nostartfiles -no-pie
endif

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

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

diff:
	./$(NAME) > tmp_Collen
	diff tmp_Collen Collen.s

cp:
	./$(NAME) > tmp_Collen

di:
	diff tmp_Collen Collen.s