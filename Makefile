# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/17 15:15:24 by eguelin           #+#    #+#              #
#    Updated: 2023/02/15 19:14:18 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Standard
OUT_DIR	= build/
SRC_DIR	= src/
INC_DIR	= include/
NAME	= ...
CC		= cc
CFLAGS	= -Wall -Werror -Wextra -I $(INC_DIR)
RM		= rm -rf
ARC		= ar rcs

#Colors
BLACK	= \033[0;30m
RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
PURPLE	= \033[0;35m
CYAN	= \033[0;36m
WHITE	= \033[0;37m

#Sentence
COMP_MSG		= "$(GREEN)Compilation $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"
CLEAN_MSG		= "$(RED)Cleaning $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"
FULL_CLEAN_MSG	= "$(PURPLE)Full cleaning $(NAME) $(WHITE)done on $(YELLOW)$(shell date +'%Y-%m-%d %H:%M:%S')$(WHITE)"

#Sources
..._DIR = .../
FILES_... = ...
FILES_ALL = $(addprefix $(..._DIR), $(FILES_...))

INC_FILES	= ...

OBJS		= $(addprefix $(OUT_DIR), $(addsuffix .o, $(FILES_ALL)))
HEADERS		= $(addprefix $(INC_DIR), $(addsuffix .h, $(INC_FILES)))

#Rules
.PHONY: all
all: $(NAME)

$(NAME): $(OUT_DIR) $(OBJS)
	@norminette | awk '$$NF!="OK!" {print "\033[0;31m" $$0 "\033[0m"}'
	@$(ARC) $(NAME) $(OBJS)
	@echo $(COMP_MSG)

$(OUT_DIR)%.o : $(SRC_DIR)%.c $(HEADERS) Makefile
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@$(RM) $(OUT_DIR)
	@echo $(CLEAN_MSG)

.PHONY: fclean
fclean: clean
	@$(RM) $(NAME)
	@echo $(FULL_CLEAN_MSG)

.PHONY: re
re: fclean all

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

