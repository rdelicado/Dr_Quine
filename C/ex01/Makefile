CC = gcc
FLAGS = -Wall -Wextra -Werror
NAME = Collen
SRC = Collen.c
OBJ = $(SRC:.c=.o)
all: $(NAME)
$(NAME): $(OBJ)
	$(CC) $(FLAGS) -o $(NAME) $(OBJ)
%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@
clean:
	rm -f $(OBJ)
	rm -f tmp_Collen
	rm -f $(NAME)
fclean: clean
	rm -f $(NAME)
re: fclean all
exec:
	./$(NAME) > tmp_Collen
	diff tmp_Collen Collen.c
.PHONY: all clean fclean re

cp:
	./$(NAME) > tmp_Collen

di:
	diff tmp_Collen Collen.c
