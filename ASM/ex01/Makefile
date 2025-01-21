ASM = nasm
ASM_FLAGS = -f elf64
LD = ld
LD_FLAGS = -o
NAME = Collen
SRC = Collen.s
OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LD_FLAGS) $(NAME) $(OBJ)

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

clean:
	rm -f $(OBJ)
	rm -f tmp_Collen
	rm -f $(NAME)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

exec:
	./$(NAME) > tmp_Collen
	diff tmp_Collen Collen.c

cp:
	./$(NAME) > tmp_Collen

di:
	diff tmp_Collen Collen.c