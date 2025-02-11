ASM_FLAGS = -f elf64
GCC_FLAGS = -nostartfiles -no-pie
LD = ld
LD_FLAGS = -o 

NAME = Grace
SRC = Grace.s
OBJ = $(SRC:.c=.o)

all: $(NAME)
$(NAME): $(OBJ)
	$(CC) $(FLAGS) -o $(NAME) $(OBJ)
%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@
clean:
	rm -f $(OBJ)
	rm -f tmp_Grace

fclean: clean
	rm -f $(NAME)
	rm -f Grace_kid.s

re: fclean all

diff:
	./$(NAME) > tmp_Grace
	diff tmp_Grace Grace.s

cp:
	./$(NAME) > tmp_Grace

di:
	diff tmp_Grace Grace.s
