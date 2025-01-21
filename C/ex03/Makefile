CC = gcc
FLAGS = -Wall -Wextra -Werror
NAME = Sully
SRC = Sully.c
OBJ_DIR = obj
OBJ = $(OBJ_DIR)/$(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(FLAGS) -o $(NAME) $(OBJ)

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)
	rm -f Sully_*.c
	rm -f Sully_*
	rm -f $(NAME)

fclean: clean
	rm -rf $(OBJ_DIR)
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re