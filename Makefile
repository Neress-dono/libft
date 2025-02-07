LST_SRCS	=	ft_isalpha.c	ft_memcpy.c 	ft_strlcat.c	ft_strtrim.c	\
         		ft_isascii.c	ft_memmove.c	ft_strlcpy.c	ft_substr.c		\
          		ft_atoi.c		ft_isdigit.c	ft_memset.c 	ft_strlen.c		\
         		ft_tolower.c	ft_bzero.c		ft_isprint.c	ft_strchr.c		\
          		ft_strncmp.c	ft_toupper.c	ft_calloc.c		ft_memchr.c		\
          		ft_strdup.c		ft_strnstr.c	ft_isalnum.c	ft_memcmp.c		\
          		ft_strjoin.c	ft_strrchr.c	ft_split.c		ft_itoa.c		\
          		ft_strmapi.c	ft_striteri.c	ft_putchar_fd.c	ft_putstr_fd.c	\
				ft_putendl_fd.c	ft_putnbr_fd.c
LST_BONUS	= 	ft_lstnew.c		ft_lstadd_front.c	ft_lstsize.c	ft_lstlast.c	\
				ft_lstadd_back.c	ft_lstdelone.c	ft_lstclear.c	ft_lstiter.c	\
				ft_lstmap.c
LST_OBJS	=	${LST_SRCS:.c=.o}
LST_BOBJS	=	${LST_BONUS:.c=.o}
SRCS		=	$(addprefix sources/,${LST_SRCS})
BONUS		=	$(addprefix sources/,${LST_BONUS})
OBJS		=	$(addprefix .objects/,${LST_OBJS})
BOBJS		=	$(addprefix .objects/,${LST_BOBJS})
CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
NAME		= 	libft.a
HEADER		=	libft.h

.objects/%.o: sources/%.c $(HEADER)
	mkdir -p .objects
	${CC} ${CFLAGS} -I . -c $< -o $@

${NAME} : $(OBJS)
	ar rc ${NAME} ${OBJS}
	ranlib ${NAME}

.object/bonus: ${NAME} ${BOBJS}
	ar rc ${NAME} ${OBJS} ${BOBJS}
	ranlib ${NAME}

all: ${NAME}

clean :
	rm -rf .objects

fclean :	clean
	rm -f ${NAME}

re :		fclean all