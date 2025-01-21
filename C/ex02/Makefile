CC = gcc
FLAGS = -Wall -Wextra -Werror
NAME = Grace
SRC = Grace.c
OBJ = $(SRC:.c=.o)
all: $(NAME)
$(NAME): $(OBJ)
	$(CC) $(FLAGS) -o $(NAME) $(OBJ)
%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@
clean:
	rm -f $(OBJ)
	rm -f tmp_Grace
	rm -f $(NAME)
	rm -f Grace_kid.c
fclean: clean
	rm -f $(NAME)
re: fclean all
exec:
	./$(NAME) > tmp_Grace
	diff tmp_Grace Grace.c
.PHONY: all clean fclean re

di:
	diff Grace_kid.c Grace.c
