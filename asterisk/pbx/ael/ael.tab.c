/* A Bison parser, made by GNU Bison 2.1a.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.1a"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Using locations.  */
#define YYLSP_NEEDED 1

/* Substitute the variable and function names.  */
#define yyparse ael_yyparse
#define yylex   ael_yylex
#define yyerror ael_yyerror
#define yylval  ael_yylval
#define yychar  ael_yychar
#define yydebug ael_yydebug
#define yynerrs ael_yynerrs
#define yylloc ael_yylloc

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     KW_CONTEXT = 258,
     LC = 259,
     RC = 260,
     LP = 261,
     RP = 262,
     SEMI = 263,
     EQ = 264,
     COMMA = 265,
     COLON = 266,
     AMPER = 267,
     BAR = 268,
     AT = 269,
     KW_MACRO = 270,
     KW_GLOBALS = 271,
     KW_IGNOREPAT = 272,
     KW_SWITCH = 273,
     KW_IF = 274,
     KW_IFTIME = 275,
     KW_ELSE = 276,
     KW_RANDOM = 277,
     KW_ABSTRACT = 278,
     KW_EXTEND = 279,
     EXTENMARK = 280,
     KW_GOTO = 281,
     KW_JUMP = 282,
     KW_RETURN = 283,
     KW_BREAK = 284,
     KW_CONTINUE = 285,
     KW_REGEXTEN = 286,
     KW_HINT = 287,
     KW_FOR = 288,
     KW_WHILE = 289,
     KW_CASE = 290,
     KW_PATTERN = 291,
     KW_DEFAULT = 292,
     KW_CATCH = 293,
     KW_SWITCHES = 294,
     KW_ESWITCHES = 295,
     KW_INCLUDES = 296,
     word = 297
   };
#endif
/* Tokens.  */
#define KW_CONTEXT 258
#define LC 259
#define RC 260
#define LP 261
#define RP 262
#define SEMI 263
#define EQ 264
#define COMMA 265
#define COLON 266
#define AMPER 267
#define BAR 268
#define AT 269
#define KW_MACRO 270
#define KW_GLOBALS 271
#define KW_IGNOREPAT 272
#define KW_SWITCH 273
#define KW_IF 274
#define KW_IFTIME 275
#define KW_ELSE 276
#define KW_RANDOM 277
#define KW_ABSTRACT 278
#define KW_EXTEND 279
#define EXTENMARK 280
#define KW_GOTO 281
#define KW_JUMP 282
#define KW_RETURN 283
#define KW_BREAK 284
#define KW_CONTINUE 285
#define KW_REGEXTEN 286
#define KW_HINT 287
#define KW_FOR 288
#define KW_WHILE 289
#define KW_CASE 290
#define KW_PATTERN 291
#define KW_DEFAULT 292
#define KW_CATCH 293
#define KW_SWITCHES 294
#define KW_ESWITCHES 295
#define KW_INCLUDES 296
#define word 297




/* Copy the first part of user declarations.  */
#line 1 "ael.y"

/*
 * Asterisk -- An open source telephony toolkit.
 *
 * Copyright (C) 2006, Digium, Inc.
 *
 * Steve Murphy <murf@parsetree.com>
 *
 * See http://www.asterisk.org for more information about
 * the Asterisk project. Please do not directly contact
 * any of the maintainers of this project for assistance;
 * the project provides a web site, mailing lists and IRC
 * channels for your use.
 *
 * This program is free software, distributed under the terms of
 * the GNU General Public License Version 2. See the LICENSE file
 * at the top of the source tree.
 */
/*! \file
 *
 * \brief Bison Grammar description of AEL2.
 *
 */

#include "asterisk.h"

#if !defined(STANDALONE_AEL)
ASTERISK_FILE_VERSION(__FILE__,"$Revision$")
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asterisk/logger.h"
#include "asterisk/ael_structs.h"

static pval * linku1(pval *head, pval *tail);
static void set_dads(pval *dad, pval *child_list);
void reset_parencount(yyscan_t yyscanner);
void reset_semicount(yyscan_t yyscanner);
void reset_argcount(yyscan_t yyscanner );

#define YYLEX_PARAM ((struct parse_io *)parseio)->scanner
#define YYERROR_VERBOSE 1

extern char *my_file;
#ifdef AAL_ARGCHECK
int ael_is_funcname(char *name);
#endif
static char *ael_token_subst(const char *mess);



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 54 "ael.y"
{
	int	intval;		/* integer value, typically flags */
	char	*str;		/* strings */
	struct pval *pval;	/* full objects */
}
/* Line 198 of yacc.c.  */
#line 236 "ael.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


/* Copy the second part of user declarations.  */
#line 60 "ael.y"

	/* declaring these AFTER the union makes things a lot simpler! */
void yyerror(YYLTYPE *locp, struct parse_io *parseio, char const *s);
int ael_yylex (YYSTYPE * yylval_param, YYLTYPE * yylloc_param , void * yyscanner);

/* create a new object with start-end marker */
static pval *npval(pvaltype type, int first_line, int last_line,
	int first_column, int last_column);

/* create a new object with start-end marker, simplified interface.
 * Must be declared here because YYLTYPE is not known before
 */
static pval *npval2(pvaltype type, YYLTYPE *first, YYLTYPE *last);

/* another frontend for npval, this time for a string */
static pval *nword(char *string, YYLTYPE *pos);

/* update end position of an object, return the object */
static pval *update_last(pval *, YYLTYPE *);


/* Line 221 of yacc.c.  */
#line 281 "ael.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  ifdef __cplusplus
extern "C" {
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifdef __cplusplus
}
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
    YYLTYPE yyls;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  17
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   311

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  54
/* YYNRULES -- Number of rules.  */
#define YYNRULES  137
/* YYNRULES -- Number of states.  */
#define YYNSTATES  276

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   297

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    13,    15,    17,    19,
      21,    23,    25,    32,    34,    35,    37,    40,    43,    52,
      57,    58,    61,    64,    65,    71,    72,    74,    78,    81,
      82,    85,    88,    90,    92,    94,    96,    98,   100,   103,
     105,   110,   114,   119,   127,   136,   137,   140,   143,   149,
     151,   159,   160,   165,   168,   171,   176,   178,   181,   183,
     186,   190,   194,   196,   199,   203,   205,   208,   212,   218,
     222,   224,   228,   232,   235,   236,   237,   238,   251,   255,
     257,   261,   264,   267,   268,   274,   277,   280,   283,   287,
     289,   292,   293,   295,   299,   303,   309,   315,   321,   327,
     328,   331,   334,   339,   340,   346,   350,   351,   355,   359,
     362,   364,   365,   367,   368,   372,   373,   376,   381,   385,
     390,   391,   394,   396,   398,   404,   409,   414,   415,   419,
     425,   428,   430,   434,   437,   441,   444,   449
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      44,     0,    -1,    45,    -1,    46,    -1,    45,    46,    -1,
      45,     1,    -1,    48,    -1,    50,    -1,    51,    -1,     8,
      -1,    42,    -1,    37,    -1,    49,     3,    47,     4,    56,
       5,    -1,    23,    -1,    -1,    24,    -1,    24,    23,    -1,
      23,    24,    -1,    15,    42,     6,    55,     7,     4,    89,
       5,    -1,    16,     4,    52,     5,    -1,    -1,    53,    52,
      -1,     1,    52,    -1,    -1,    42,     9,    54,    42,     8,
      -1,    -1,    42,    -1,    55,    10,    42,    -1,    55,     1,
      -1,    -1,    57,    56,    -1,     1,    56,    -1,    59,    -1,
      96,    -1,    91,    -1,    92,    -1,    58,    -1,    53,    -1,
      42,     1,    -1,     8,    -1,    17,    25,    42,     8,    -1,
      42,    25,    71,    -1,    31,    42,    25,    71,    -1,    32,
       6,    67,     7,    42,    25,    71,    -1,    31,    32,     6,
      67,     7,    42,    25,    71,    -1,    -1,    71,    60,    -1,
       1,    60,    -1,    68,    11,    68,    11,    68,    -1,    42,
      -1,    61,    13,    68,    13,    68,    13,    68,    -1,    -1,
       6,    64,    66,     7,    -1,    19,    63,    -1,    22,    63,
      -1,    20,     6,    62,     7,    -1,    42,    -1,    42,    42,
      -1,    42,    -1,    67,    42,    -1,    67,    11,    42,    -1,
      67,    12,    42,    -1,    42,    -1,    42,    42,    -1,    42,
      42,    42,    -1,    42,    -1,    42,    42,    -1,    69,    11,
      42,    -1,    18,    63,     4,    87,     5,    -1,     4,    60,
       5,    -1,    53,    -1,    26,    77,     8,    -1,    27,    79,
       8,    -1,    42,    11,    -1,    -1,    -1,    -1,    33,     6,
      72,    42,     8,    73,    42,     8,    74,    42,     7,    71,
      -1,    34,    63,    71,    -1,    70,    -1,    12,    80,     8,
      -1,    84,     8,    -1,    42,     8,    -1,    -1,    84,     9,
      75,    42,     8,    -1,    29,     8,    -1,    28,     8,    -1,
      30,     8,    -1,    65,    71,    76,    -1,     8,    -1,    21,
      71,    -1,    -1,    69,    -1,    69,    13,    69,    -1,    69,
      10,    69,    -1,    69,    13,    69,    13,    69,    -1,    69,
      10,    69,    10,    69,    -1,    37,    13,    69,    13,    69,
      -1,    37,    10,    69,    10,    69,    -1,    -1,    10,    42,
      -1,    69,    78,    -1,    69,    78,    14,    47,    -1,    -1,
      42,     6,    81,    86,     7,    -1,    42,     6,     7,    -1,
      -1,    42,     6,    83,    -1,    82,    86,     7,    -1,    82,
       7,    -1,    42,    -1,    -1,    66,    -1,    -1,    86,    10,
      85,    -1,    -1,    88,    87,    -1,    35,    42,    11,    60,
      -1,    37,    11,    60,    -1,    36,    42,    11,    60,    -1,
      -1,    90,    89,    -1,    71,    -1,    96,    -1,    38,    42,
       4,    60,     5,    -1,    39,     4,    93,     5,    -1,    40,
       4,    93,     5,    -1,    -1,    42,     8,    93,    -1,    42,
      14,    42,     8,    93,    -1,     1,    93,    -1,    47,    -1,
      47,    13,    62,    -1,    94,     8,    -1,    95,    94,     8,
      -1,    95,     1,    -1,    41,     4,    95,     5,    -1,    41,
       4,     5,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   185,   185,   188,   189,   190,   193,   194,   195,   196,
     199,   200,   203,   212,   213,   214,   215,   216,   219,   225,
     231,   232,   233,   236,   236,   243,   244,   245,   246,   249,
     250,   251,   254,   255,   256,   257,   258,   259,   260,   261,
     264,   269,   273,   278,   283,   293,   294,   295,   301,   306,
     310,   318,   318,   322,   325,   328,   339,   340,   347,   348,
     352,   356,   362,   363,   368,   376,   377,   381,   387,   396,
     399,   400,   403,   406,   409,   410,   411,   409,   417,   421,
     422,   423,   424,   427,   427,   460,   461,   462,   463,   467,
     470,   471,   474,   475,   478,   481,   485,   489,   493,   499,
     500,   504,   507,   513,   513,   518,   526,   526,   537,   544,
     547,   548,   551,   552,   555,   558,   559,   562,   566,   570,
     576,   577,   580,   581,   582,   588,   593,   598,   599,   600,
     602,   605,   606,   613,   614,   615,   618,   621
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "KW_CONTEXT", "LC", "RC", "LP", "RP",
  "SEMI", "EQ", "COMMA", "COLON", "AMPER", "BAR", "AT", "KW_MACRO",
  "KW_GLOBALS", "KW_IGNOREPAT", "KW_SWITCH", "KW_IF", "KW_IFTIME",
  "KW_ELSE", "KW_RANDOM", "KW_ABSTRACT", "KW_EXTEND", "EXTENMARK",
  "KW_GOTO", "KW_JUMP", "KW_RETURN", "KW_BREAK", "KW_CONTINUE",
  "KW_REGEXTEN", "KW_HINT", "KW_FOR", "KW_WHILE", "KW_CASE", "KW_PATTERN",
  "KW_DEFAULT", "KW_CATCH", "KW_SWITCHES", "KW_ESWITCHES", "KW_INCLUDES",
  "word", "$accept", "file", "objects", "object", "context_name",
  "context", "opt_abstract", "macro", "globals", "global_statements",
  "assignment", "@1", "arglist", "elements", "element", "ignorepat",
  "extension", "statements", "timerange", "timespec", "test_expr", "@2",
  "if_like_head", "word_list", "hint_word", "word3_list", "goto_word",
  "switch_statement", "statement", "@3", "@4", "@5", "@6", "opt_else",
  "target", "opt_pri", "jumptarget", "macro_call", "@7",
  "application_call_head", "@8", "application_call", "opt_word",
  "eval_arglist", "case_statements", "case_statement", "macro_statements",
  "macro_statement", "switches", "eswitches", "switchlist",
  "included_entry", "includeslist", "includes", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    43,    44,    45,    45,    45,    46,    46,    46,    46,
      47,    47,    48,    49,    49,    49,    49,    49,    50,    51,
      52,    52,    52,    54,    53,    55,    55,    55,    55,    56,
      56,    56,    57,    57,    57,    57,    57,    57,    57,    57,
      58,    59,    59,    59,    59,    60,    60,    60,    61,    61,
      62,    64,    63,    65,    65,    65,    66,    66,    67,    67,
      67,    67,    68,    68,    68,    69,    69,    69,    70,    71,
      71,    71,    71,    71,    72,    73,    74,    71,    71,    71,
      71,    71,    71,    75,    71,    71,    71,    71,    71,    71,
      76,    76,    77,    77,    77,    77,    77,    77,    77,    78,
      78,    79,    79,    81,    80,    80,    83,    82,    84,    84,
      85,    85,    86,    86,    86,    87,    87,    88,    88,    88,
      89,    89,    90,    90,    90,    91,    92,    93,    93,    93,
      93,    94,    94,    95,    95,    95,    96,    96
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     2,     1,     1,     1,     1,
       1,     1,     6,     1,     0,     1,     2,     2,     8,     4,
       0,     2,     2,     0,     5,     0,     1,     3,     2,     0,
       2,     2,     1,     1,     1,     1,     1,     1,     2,     1,
       4,     3,     4,     7,     8,     0,     2,     2,     5,     1,
       7,     0,     4,     2,     2,     4,     1,     2,     1,     2,
       3,     3,     1,     2,     3,     1,     2,     3,     5,     3,
       1,     3,     3,     2,     0,     0,     0,    12,     3,     1,
       3,     2,     2,     0,     5,     2,     2,     2,     3,     1,
       2,     0,     1,     3,     3,     5,     5,     5,     5,     0,
       2,     2,     4,     0,     5,     3,     0,     3,     3,     2,
       1,     0,     1,     0,     3,     0,     2,     4,     3,     4,
       0,     2,     1,     1,     5,     4,     4,     0,     3,     5,
       2,     1,     3,     2,     3,     2,     4,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
      14,     9,     0,     0,    13,    15,     0,     0,     3,     6,
       0,     7,     8,     0,     0,    17,    16,     1,     5,     4,
       0,    25,     0,     0,     0,     0,    11,    10,     0,    26,
       0,    22,    23,    19,    21,     0,    28,     0,     0,     0,
       0,    39,     0,     0,     0,     0,     0,     0,     0,    37,
       0,     0,    36,    32,    34,    35,    33,   120,    27,     0,
      31,     0,     0,     0,     0,     0,     0,     0,    38,     0,
      12,    30,     0,    89,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    70,     0,
      79,   122,   113,     0,     0,   120,   123,    24,     0,     0,
       0,    58,     0,     0,     0,     0,     0,   137,   131,     0,
       0,    41,     0,     0,     0,     0,     0,    51,     0,    53,
       0,    54,     0,    65,    92,     0,    99,     0,    86,    85,
      87,    74,     0,     0,   106,    82,    73,    91,   109,    56,
     112,     0,    81,    83,    18,   121,    40,     0,    42,     0,
       0,     0,    59,   130,     0,     0,   125,   126,     0,   133,
     135,   136,     0,    47,    69,    46,   103,    80,     0,   115,
      49,     0,     0,     0,     0,     0,    66,     0,     0,     0,
      71,     0,   101,    72,     0,    78,     0,   107,     0,    88,
      57,   108,   111,     0,     0,     0,    60,    61,   128,     0,
     132,   134,   105,   113,     0,     0,     0,     0,     0,   115,
      63,     0,    55,     0,     0,     0,    94,    67,    93,   100,
       0,     0,     0,    90,   110,   114,     0,     0,     0,     0,
       0,    52,     0,     0,     0,    68,   116,    64,    62,     0,
       0,     0,     0,     0,     0,   102,    75,   124,    84,     0,
      43,   129,   104,     0,     0,   118,     0,     0,    98,    97,
      96,    95,     0,    44,   117,   119,     0,    48,     0,     0,
      76,    50,     0,     0,     0,    77
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,   108,     9,    10,    11,    12,    24,
      88,    39,    30,    50,    51,    52,    53,   113,   171,   172,
     118,   168,    89,   140,   102,   173,   124,    90,   114,   184,
     262,   272,   193,   189,   125,   182,   127,   116,   203,    92,
     187,    93,   225,   141,   208,   209,    94,    95,    54,    55,
     105,   109,   110,    56
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -206
static const yytype_int16 yypact[] =
{
      65,  -206,     2,    64,    -1,    70,    84,   231,  -206,  -206,
     108,  -206,  -206,   120,    13,  -206,  -206,  -206,  -206,  -206,
      29,    88,    13,   130,   163,    13,  -206,  -206,   165,  -206,
      75,  -206,  -206,  -206,  -206,     8,  -206,   171,   134,   136,
       8,  -206,   154,   -22,   178,   182,   186,   189,    61,  -206,
     200,     8,  -206,  -206,  -206,  -206,  -206,   169,  -206,   198,
    -206,   152,   203,   187,   177,    14,    14,    23,  -206,   196,
    -206,  -206,   128,  -206,   179,   207,   207,   214,   207,    58,
     185,   220,   225,   227,   230,   207,   195,   174,  -206,   196,
    -206,  -206,    17,    94,   235,   169,  -206,  -206,   233,   177,
     196,  -206,    19,    14,    55,   237,   238,  -206,   232,   236,
      16,  -206,    86,   243,    86,   244,   241,  -206,   247,  -206,
     210,  -206,    97,   211,    24,   248,   107,   249,  -206,  -206,
    -206,  -206,   196,   254,  -206,  -206,  -206,   239,  -206,   217,
    -206,   117,  -206,  -206,  -206,  -206,  -206,    67,  -206,   219,
     221,   222,  -206,  -206,    14,   223,  -206,  -206,   210,  -206,
    -206,  -206,   258,  -206,  -206,  -206,   255,  -206,   226,   106,
       0,   256,   260,   259,   185,   185,  -206,   185,   229,   185,
    -206,   234,   261,  -206,   240,  -206,   128,  -206,   196,  -206,
    -206,  -206,   242,   245,   246,   252,  -206,  -206,  -206,   264,
    -206,  -206,  -206,   226,   266,   250,   251,   263,   273,   106,
     253,   257,  -206,   257,   142,   138,   149,  -206,   161,  -206,
      29,   271,   275,  -206,  -206,  -206,   277,   265,   196,    14,
     127,  -206,   270,   272,    86,  -206,  -206,  -206,   262,   276,
     280,   185,   185,   185,   185,  -206,  -206,  -206,  -206,   196,
    -206,  -206,  -206,    86,    86,  -206,   257,   257,   283,   283,
     283,   283,   267,  -206,  -206,  -206,   284,  -206,   278,   257,
    -206,  -206,   268,   289,   196,  -206
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -206,  -206,  -206,   291,   -19,  -206,  -206,  -206,  -206,   113,
      32,  -206,  -206,   -18,  -206,  -206,  -206,  -109,  -206,   143,
     -49,  -206,  -206,   132,   204,  -205,   -78,  -206,   -57,  -206,
    -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,
    -206,  -206,  -206,    99,    96,  -206,   212,  -206,  -206,  -206,
     -62,   201,  -206,   -50
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -128
static const yytype_int16 yytable[] =
{
      91,    28,   126,   163,   106,   165,   239,    96,   240,    40,
      62,   -62,   111,   -29,    22,   103,    41,   160,   -20,  -127,
      63,   161,    60,    15,   138,    42,   149,   119,   107,   121,
     150,   151,   137,    71,   177,   178,   132,   179,    91,    43,
      44,   153,   210,   148,    13,    96,    25,    45,    46,    47,
      48,   266,   267,    26,    25,    23,   104,    25,    27,   139,
      26,   152,    68,   154,   271,    27,    26,    49,    14,   155,
      32,    27,    49,     1,   194,   185,    36,   222,   150,   151,
       2,     3,    37,    49,    17,    38,    69,   112,     4,     5,
      72,   -45,   198,    16,    73,   122,   214,   215,    74,   216,
     123,   218,   142,   143,    75,    76,    77,   174,    78,   152,
     175,    20,    79,    80,    81,    82,    83,   181,   178,    84,
      85,   -45,   -45,   -45,   191,   255,    21,   192,    87,   112,
      29,   223,    72,   -45,   252,    31,    73,   192,    34,    32,
      74,   205,   206,   207,   264,   265,    75,    76,    77,   178,
      78,   242,   241,   178,    79,    80,    81,    82,    83,   243,
     178,    84,    85,   258,   259,   260,   261,   251,    33,    35,
      87,   250,   178,    72,   244,    57,    58,    73,    59,    61,
     134,    74,   135,    32,    64,   136,    65,    75,    76,    77,
      66,    78,   263,    67,    98,    79,    80,    81,    82,    83,
      72,   245,    84,    85,    73,    70,    97,    86,    74,    99,
      47,    87,   100,   117,    75,    76,    77,   275,    78,   101,
     120,   115,    79,    80,    81,    82,    83,   123,   128,    84,
      85,    -2,    18,   129,   -14,   130,   131,   133,    87,     1,
     144,   146,   156,   157,   159,   158,     2,     3,   164,   167,
     166,   169,   170,   176,     4,     5,   180,   183,   186,   190,
     188,   195,   202,   196,   197,   199,   201,   212,   139,   211,
     213,   217,   229,   231,   234,   220,   219,   228,   235,   246,
     247,   253,   221,   254,   224,   248,   270,   226,   227,   256,
     249,   257,   232,   233,   178,   237,   274,   269,    19,   238,
     204,   200,   230,   147,   210,   236,     0,   145,     0,   268,
     273,   162
};

static const yytype_int16 yycheck[] =
{
      57,    20,    80,   112,    66,   114,   211,    57,   213,     1,
      32,    11,    69,     5,     1,     1,     8,     1,     5,     5,
      42,     5,    40,    24,     7,    17,     7,    76,     5,    78,
      11,    12,    89,    51,    10,    11,    85,    13,    95,    31,
      32,   103,    42,   100,    42,    95,    14,    39,    40,    41,
      42,   256,   257,    37,    22,    42,    42,    25,    42,    42,
      37,    42,     1,     8,   269,    42,    37,    35,     4,    14,
       9,    42,    40,     8,     7,   132,     1,   186,    11,    12,
      15,    16,     7,    51,     0,    10,    25,     1,    23,    24,
       4,     5,   154,    23,     8,    37,   174,   175,    12,   177,
      42,   179,     8,     9,    18,    19,    20,    10,    22,    42,
      13,     3,    26,    27,    28,    29,    30,    10,    11,    33,
      34,    35,    36,    37,     7,   234,     6,    10,    42,     1,
      42,   188,     4,     5,     7,    22,     8,    10,    25,     9,
      12,    35,    36,    37,   253,   254,    18,    19,    20,    11,
      22,    13,    10,    11,    26,    27,    28,    29,    30,    10,
      11,    33,    34,   241,   242,   243,   244,   229,     5,     4,
      42,   228,    11,     4,    13,     4,    42,     8,    42,    25,
       6,    12,     8,     9,     6,    11,     4,    18,    19,    20,
       4,    22,   249,     4,    42,    26,    27,    28,    29,    30,
       4,   220,    33,    34,     8,     5,     8,    38,    12,     6,
      41,    42,    25,     6,    18,    19,    20,   274,    22,    42,
       6,    42,    26,    27,    28,    29,    30,    42,     8,    33,
      34,     0,     1,     8,     3,     8,     6,    42,    42,     8,
       5,     8,     5,     5,     8,    13,    15,    16,     5,     8,
       6,     4,    42,    42,    23,    24,     8,     8,     4,    42,
      21,    42,     7,    42,    42,    42,     8,     7,    42,    13,
      11,    42,     8,     7,    11,    14,    42,    25,     5,     8,
       5,    11,    42,    11,    42,     8,     8,    42,    42,    13,
      25,    11,    42,    42,    11,    42,     7,    13,     7,    42,
     168,   158,   203,    99,    42,   209,    -1,    95,    -1,    42,
      42,   110
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     8,    15,    16,    23,    24,    44,    45,    46,    48,
      49,    50,    51,    42,     4,    24,    23,     0,     1,    46,
       3,     6,     1,    42,    52,    53,    37,    42,    47,    42,
      55,    52,     9,     5,    52,     4,     1,     7,    10,    54,
       1,     8,    17,    31,    32,    39,    40,    41,    42,    53,
      56,    57,    58,    59,    91,    92,    96,     4,    42,    42,
      56,    25,    32,    42,     6,     4,     4,     4,     1,    25,
       5,    56,     4,     8,    12,    18,    19,    20,    22,    26,
      27,    28,    29,    30,    33,    34,    38,    42,    53,    65,
      70,    71,    82,    84,    89,    90,    96,     8,    42,     6,
      25,    42,    67,     1,    42,    93,    93,     5,    47,    94,
      95,    71,     1,    60,    71,    42,    80,     6,    63,    63,
       6,    63,    37,    42,    69,    77,    69,    79,     8,     8,
       8,     6,    63,    42,     6,     8,    11,    71,     7,    42,
      66,    86,     8,     9,     5,    89,     8,    67,    71,     7,
      11,    12,    42,    93,     8,    14,     5,     5,    13,     8,
       1,     5,    94,    60,     5,    60,     6,     8,    64,     4,
      42,    61,    62,    68,    10,    13,    42,    10,    11,    13,
       8,    10,    78,     8,    72,    71,     4,    83,    21,    76,
      42,     7,    10,    75,     7,    42,    42,    42,    93,    42,
      62,     8,     7,    81,    66,    35,    36,    37,    87,    88,
      42,    13,     7,    11,    69,    69,    69,    42,    69,    42,
      14,    42,    60,    71,    42,    85,    42,    42,    25,     8,
      86,     7,    42,    42,    11,     5,    87,    42,    42,    68,
      68,    10,    13,    10,    13,    47,     8,     5,     8,    25,
      71,    93,     7,    11,    11,    60,    13,    11,    69,    69,
      69,    69,    73,    71,    60,    60,    68,    68,    42,    13,
       8,    68,    74,    42,     7,    71
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (&yylloc, parseio, YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, &yylloc, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval, &yylloc)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location, parseio); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, const YYSTYPE * const yyvaluep, const YYLTYPE * const yylocationp, struct parse_io *parseio)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, parseio)
    FILE *yyoutput;
    int yytype;
    const YYSTYPE * const yyvaluep;
    const YYLTYPE * const yylocationp;
    struct parse_io *parseio;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
  YYUSE (parseio);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, const YYSTYPE * const yyvaluep, const YYLTYPE * const yylocationp, struct parse_io *parseio)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp, parseio)
    FILE *yyoutput;
    int yytype;
    const YYSTYPE * const yyvaluep;
    const YYLTYPE * const yylocationp;
    struct parse_io *parseio;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, parseio);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule, struct parse_io *parseio)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule, parseio)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
    struct parse_io *parseio;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       , parseio);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule, parseio); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      size_t yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn < YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp, struct parse_io *parseio)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp, parseio)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
    struct parse_io *parseio;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  YYUSE (parseio);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {
      case 42: /* "word" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1443 "ael.tab.c"
	break;
      case 45: /* "objects" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1451 "ael.tab.c"
	break;
      case 46: /* "object" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1459 "ael.tab.c"
	break;
      case 47: /* "context_name" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1464 "ael.tab.c"
	break;
      case 48: /* "context" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1472 "ael.tab.c"
	break;
      case 50: /* "macro" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1480 "ael.tab.c"
	break;
      case 51: /* "globals" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1488 "ael.tab.c"
	break;
      case 52: /* "global_statements" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1496 "ael.tab.c"
	break;
      case 53: /* "assignment" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1504 "ael.tab.c"
	break;
      case 55: /* "arglist" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1512 "ael.tab.c"
	break;
      case 56: /* "elements" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1520 "ael.tab.c"
	break;
      case 57: /* "element" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1528 "ael.tab.c"
	break;
      case 58: /* "ignorepat" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1536 "ael.tab.c"
	break;
      case 59: /* "extension" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1544 "ael.tab.c"
	break;
      case 60: /* "statements" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1552 "ael.tab.c"
	break;
      case 61: /* "timerange" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1557 "ael.tab.c"
	break;
      case 62: /* "timespec" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1565 "ael.tab.c"
	break;
      case 63: /* "test_expr" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1570 "ael.tab.c"
	break;
      case 65: /* "if_like_head" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1578 "ael.tab.c"
	break;
      case 66: /* "word_list" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1583 "ael.tab.c"
	break;
      case 68: /* "word3_list" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1588 "ael.tab.c"
	break;
      case 69: /* "goto_word" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1593 "ael.tab.c"
	break;
      case 70: /* "switch_statement" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1601 "ael.tab.c"
	break;
      case 71: /* "statement" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1609 "ael.tab.c"
	break;
      case 76: /* "opt_else" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1617 "ael.tab.c"
	break;
      case 77: /* "target" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1625 "ael.tab.c"
	break;
      case 78: /* "opt_pri" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1630 "ael.tab.c"
	break;
      case 79: /* "jumptarget" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1638 "ael.tab.c"
	break;
      case 80: /* "macro_call" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1646 "ael.tab.c"
	break;
      case 82: /* "application_call_head" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1654 "ael.tab.c"
	break;
      case 84: /* "application_call" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1662 "ael.tab.c"
	break;
      case 85: /* "opt_word" */
#line 177 "ael.y"
	{ free((yyvaluep->str));};
#line 1667 "ael.tab.c"
	break;
      case 86: /* "eval_arglist" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1675 "ael.tab.c"
	break;
      case 87: /* "case_statements" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1683 "ael.tab.c"
	break;
      case 88: /* "case_statement" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1691 "ael.tab.c"
	break;
      case 89: /* "macro_statements" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1699 "ael.tab.c"
	break;
      case 90: /* "macro_statement" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1707 "ael.tab.c"
	break;
      case 91: /* "switches" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1715 "ael.tab.c"
	break;
      case 92: /* "eswitches" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1723 "ael.tab.c"
	break;
      case 93: /* "switchlist" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1731 "ael.tab.c"
	break;
      case 94: /* "included_entry" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1739 "ael.tab.c"
	break;
      case 95: /* "includeslist" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1747 "ael.tab.c"
	break;
      case 96: /* "includes" */
#line 164 "ael.y"
	{
		destroy_pval((yyvaluep->pval));
		prev_word=0;
	};
#line 1755 "ael.tab.c"
	break;

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (struct parse_io *parseio);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */






/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (struct parse_io *parseio)
#else
int
yyparse (parseio)
    struct parse_io *parseio;
#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;
/* Location data for the look-ahead symbol.  */
YYLTYPE yylloc;

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;

  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[2];

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;
#if YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 0;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
	YYSTACK_RELOCATE (yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 185 "ael.y"
    { (yyval.pval) = parseio->pval = (yyvsp[(1) - (1)].pval); ;}
    break;

  case 3:
#line 188 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 4:
#line 189 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 5:
#line 190 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (2)].pval);;}
    break;

  case 6:
#line 193 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 7:
#line 194 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 8:
#line 195 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 9:
#line 196 "ael.y"
    {(yyval.pval)=0;/* allow older docs to be read */;}
    break;

  case 10:
#line 199 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str); ;}
    break;

  case 11:
#line 200 "ael.y"
    { (yyval.str) = strdup("default"); ;}
    break;

  case 12:
#line 203 "ael.y"
    {
		(yyval.pval) = npval2(PV_CONTEXT, &(yylsp[(1) - (6)]), &(yylsp[(6) - (6)]));
		(yyval.pval)->u1.str = (yyvsp[(3) - (6)].str);
		(yyval.pval)->u2.statements = (yyvsp[(5) - (6)].pval);
		set_dads((yyval.pval),(yyvsp[(5) - (6)].pval));
		(yyval.pval)->u3.abstract = (yyvsp[(1) - (6)].intval);;}
    break;

  case 13:
#line 212 "ael.y"
    { (yyval.intval) = 1; ;}
    break;

  case 14:
#line 213 "ael.y"
    { (yyval.intval) = 0; ;}
    break;

  case 15:
#line 214 "ael.y"
    { (yyval.intval) = 2; ;}
    break;

  case 16:
#line 215 "ael.y"
    { (yyval.intval)=3; ;}
    break;

  case 17:
#line 216 "ael.y"
    { (yyval.intval)=3; ;}
    break;

  case 18:
#line 219 "ael.y"
    {
		(yyval.pval) = npval2(PV_MACRO, &(yylsp[(1) - (8)]), &(yylsp[(8) - (8)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (8)].str); (yyval.pval)->u2.arglist = (yyvsp[(4) - (8)].pval); (yyval.pval)->u3.macro_statements = (yyvsp[(7) - (8)].pval);
        set_dads((yyval.pval),(yyvsp[(7) - (8)].pval));;}
    break;

  case 19:
#line 225 "ael.y"
    {
		(yyval.pval) = npval2(PV_GLOBALS, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)]));
		(yyval.pval)->u1.statements = (yyvsp[(3) - (4)].pval);
        set_dads((yyval.pval),(yyvsp[(3) - (4)].pval));;}
    break;

  case 20:
#line 231 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 21:
#line 232 "ael.y"
    {(yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 22:
#line 233 "ael.y"
    {(yyval.pval)=(yyvsp[(2) - (2)].pval);;}
    break;

  case 23:
#line 236 "ael.y"
    { reset_semicount(parseio->scanner); ;}
    break;

  case 24:
#line 236 "ael.y"
    {
		(yyval.pval) = npval2(PV_VARDEC, &(yylsp[(1) - (5)]), &(yylsp[(5) - (5)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (5)].str);
		(yyval.pval)->u2.val = (yyvsp[(4) - (5)].str); ;}
    break;

  case 25:
#line 243 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 26:
#line 244 "ael.y"
    { (yyval.pval) = nword((yyvsp[(1) - (1)].str), &(yylsp[(1) - (1)])); ;}
    break;

  case 27:
#line 245 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (3)].pval), nword((yyvsp[(3) - (3)].str), &(yylsp[(3) - (3)]))); ;}
    break;

  case 28:
#line 246 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (2)].pval);;}
    break;

  case 29:
#line 249 "ael.y"
    {(yyval.pval)=0;;}
    break;

  case 30:
#line 250 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 31:
#line 251 "ael.y"
    { (yyval.pval)=(yyvsp[(2) - (2)].pval);;}
    break;

  case 32:
#line 254 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 33:
#line 255 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 34:
#line 256 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 35:
#line 257 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 36:
#line 258 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 37:
#line 259 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 38:
#line 260 "ael.y"
    {free((yyvsp[(1) - (2)].str)); (yyval.pval)=0;;}
    break;

  case 39:
#line 261 "ael.y"
    {(yyval.pval)=0;/* allow older docs to be read */;}
    break;

  case 40:
#line 264 "ael.y"
    {
		(yyval.pval) = npval2(PV_IGNOREPAT, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)]));
		(yyval.pval)->u1.str = (yyvsp[(3) - (4)].str);;}
    break;

  case 41:
#line 269 "ael.y"
    {
		(yyval.pval) = npval2(PV_EXTENSION, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (3)].str);
		(yyval.pval)->u2.statements = (yyvsp[(3) - (3)].pval); set_dads((yyval.pval),(yyvsp[(3) - (3)].pval));;}
    break;

  case 42:
#line 273 "ael.y"
    {
		(yyval.pval) = npval2(PV_EXTENSION, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (4)].str);
		(yyval.pval)->u2.statements = (yyvsp[(4) - (4)].pval); set_dads((yyval.pval),(yyvsp[(4) - (4)].pval));
		(yyval.pval)->u4.regexten=1;;}
    break;

  case 43:
#line 278 "ael.y"
    {
		(yyval.pval) = npval2(PV_EXTENSION, &(yylsp[(1) - (7)]), &(yylsp[(7) - (7)]));
		(yyval.pval)->u1.str = (yyvsp[(5) - (7)].str);
		(yyval.pval)->u2.statements = (yyvsp[(7) - (7)].pval); set_dads((yyval.pval),(yyvsp[(7) - (7)].pval));
		(yyval.pval)->u3.hints = (yyvsp[(3) - (7)].str);;}
    break;

  case 44:
#line 283 "ael.y"
    {
		(yyval.pval) = npval2(PV_EXTENSION, &(yylsp[(1) - (8)]), &(yylsp[(8) - (8)]));
		(yyval.pval)->u1.str = (yyvsp[(6) - (8)].str);
		(yyval.pval)->u2.statements = (yyvsp[(8) - (8)].pval); set_dads((yyval.pval),(yyvsp[(8) - (8)].pval));
		(yyval.pval)->u4.regexten=1;
		(yyval.pval)->u3.hints = (yyvsp[(4) - (8)].str);;}
    break;

  case 45:
#line 293 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 46:
#line 294 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 47:
#line 295 "ael.y"
    {(yyval.pval)=(yyvsp[(2) - (2)].pval);;}
    break;

  case 48:
#line 301 "ael.y"
    {
		asprintf(&(yyval.str), "%s:%s:%s", (yyvsp[(1) - (5)].str), (yyvsp[(3) - (5)].str), (yyvsp[(5) - (5)].str));
		free((yyvsp[(1) - (5)].str));
		free((yyvsp[(3) - (5)].str));
		free((yyvsp[(5) - (5)].str)); ;}
    break;

  case 49:
#line 306 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str); ;}
    break;

  case 50:
#line 310 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (7)].str), &(yylsp[(1) - (7)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (7)].str), &(yylsp[(3) - (7)]));
		(yyval.pval)->next->next = nword((yyvsp[(5) - (7)].str), &(yylsp[(5) - (7)]));
		(yyval.pval)->next->next->next = nword((yyvsp[(7) - (7)].str), &(yylsp[(7) - (7)])); ;}
    break;

  case 51:
#line 318 "ael.y"
    { reset_parencount(parseio->scanner); ;}
    break;

  case 52:
#line 318 "ael.y"
    { (yyval.str) = (yyvsp[(3) - (4)].str); ;}
    break;

  case 53:
#line 322 "ael.y"
    {
		(yyval.pval)= npval2(PV_IF, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (2)].str); ;}
    break;

  case 54:
#line 325 "ael.y"
    {
		(yyval.pval) = npval2(PV_RANDOM, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)]));
		(yyval.pval)->u1.str=(yyvsp[(2) - (2)].str);;}
    break;

  case 55:
#line 328 "ael.y"
    {
		(yyval.pval) = npval2(PV_IFTIME, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)]));
		(yyval.pval)->u1.list = (yyvsp[(3) - (4)].pval);
		prev_word = 0; ;}
    break;

  case 56:
#line 339 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str);;}
    break;

  case 57:
#line 340 "ael.y"
    {
		asprintf(&((yyval.str)), "%s%s", (yyvsp[(1) - (2)].str), (yyvsp[(2) - (2)].str));
		free((yyvsp[(1) - (2)].str));
		free((yyvsp[(2) - (2)].str));
		prev_word = (yyval.str);;}
    break;

  case 58:
#line 347 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str); ;}
    break;

  case 59:
#line 348 "ael.y"
    {
		asprintf(&((yyval.str)), "%s %s", (yyvsp[(1) - (2)].str), (yyvsp[(2) - (2)].str));
		free((yyvsp[(1) - (2)].str));
		free((yyvsp[(2) - (2)].str)); ;}
    break;

  case 60:
#line 352 "ael.y"
    {
		asprintf(&((yyval.str)), "%s:%s", (yyvsp[(1) - (3)].str), (yyvsp[(3) - (3)].str));
		free((yyvsp[(1) - (3)].str));
		free((yyvsp[(3) - (3)].str)); ;}
    break;

  case 61:
#line 356 "ael.y"
    {  /* there are often '&' in hints */
		asprintf(&((yyval.str)), "%s&%s", (yyvsp[(1) - (3)].str), (yyvsp[(3) - (3)].str));
		free((yyvsp[(1) - (3)].str));
		free((yyvsp[(3) - (3)].str));;}
    break;

  case 62:
#line 362 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str);;}
    break;

  case 63:
#line 363 "ael.y"
    {
		asprintf(&((yyval.str)), "%s%s", (yyvsp[(1) - (2)].str), (yyvsp[(2) - (2)].str));
		free((yyvsp[(1) - (2)].str));
		free((yyvsp[(2) - (2)].str));
		prev_word = (yyval.str);;}
    break;

  case 64:
#line 368 "ael.y"
    {
		asprintf(&((yyval.str)), "%s%s%s", (yyvsp[(1) - (3)].str), (yyvsp[(2) - (3)].str), (yyvsp[(3) - (3)].str));
		free((yyvsp[(1) - (3)].str));
		free((yyvsp[(2) - (3)].str));
		free((yyvsp[(3) - (3)].str));
		prev_word=(yyval.str);;}
    break;

  case 65:
#line 376 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str);;}
    break;

  case 66:
#line 377 "ael.y"
    {
		asprintf(&((yyval.str)), "%s%s", (yyvsp[(1) - (2)].str), (yyvsp[(2) - (2)].str));
		free((yyvsp[(1) - (2)].str));
		free((yyvsp[(2) - (2)].str));;}
    break;

  case 67:
#line 381 "ael.y"
    {
		asprintf(&((yyval.str)), "%s:%s", (yyvsp[(1) - (3)].str), (yyvsp[(3) - (3)].str));
		free((yyvsp[(1) - (3)].str));
		free((yyvsp[(3) - (3)].str));;}
    break;

  case 68:
#line 387 "ael.y"
    {
		(yyval.pval) = npval2(PV_SWITCH, &(yylsp[(1) - (5)]), &(yylsp[(5) - (5)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (5)].str);
		(yyval.pval)->u2.statements = (yyvsp[(4) - (5)].pval); set_dads((yyval.pval),(yyvsp[(4) - (5)].pval));;}
    break;

  case 69:
#line 396 "ael.y"
    {
		(yyval.pval) = npval2(PV_STATEMENTBLOCK, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.list = (yyvsp[(2) - (3)].pval); set_dads((yyval.pval),(yyvsp[(2) - (3)].pval));;}
    break;

  case 70:
#line 399 "ael.y"
    { (yyval.pval) = (yyvsp[(1) - (1)].pval); ;}
    break;

  case 71:
#line 400 "ael.y"
    {
		(yyval.pval) = npval2(PV_GOTO, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.list = (yyvsp[(2) - (3)].pval);;}
    break;

  case 72:
#line 403 "ael.y"
    {
		(yyval.pval) = npval2(PV_GOTO, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.list = (yyvsp[(2) - (3)].pval);;}
    break;

  case 73:
#line 406 "ael.y"
    {
		(yyval.pval) = npval2(PV_LABEL, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (2)].str); ;}
    break;

  case 74:
#line 409 "ael.y"
    {reset_semicount(parseio->scanner);;}
    break;

  case 75:
#line 410 "ael.y"
    {reset_semicount(parseio->scanner);;}
    break;

  case 76:
#line 411 "ael.y"
    {reset_parencount(parseio->scanner);;}
    break;

  case 77:
#line 411 "ael.y"
    { /* XXX word_list maybe ? */
		(yyval.pval) = npval2(PV_FOR, &(yylsp[(1) - (12)]), &(yylsp[(12) - (12)]));
		(yyval.pval)->u1.for_init = (yyvsp[(4) - (12)].str);
		(yyval.pval)->u2.for_test=(yyvsp[(7) - (12)].str);
		(yyval.pval)->u3.for_inc = (yyvsp[(10) - (12)].str);
		(yyval.pval)->u4.for_statements = (yyvsp[(12) - (12)].pval); set_dads((yyval.pval),(yyvsp[(12) - (12)].pval));;}
    break;

  case 78:
#line 417 "ael.y"
    {
		(yyval.pval) = npval2(PV_WHILE, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (3)].str);
		(yyval.pval)->u2.statements = (yyvsp[(3) - (3)].pval); set_dads((yyval.pval),(yyvsp[(3) - (3)].pval));;}
    break;

  case 79:
#line 421 "ael.y"
    { (yyval.pval) = (yyvsp[(1) - (1)].pval); ;}
    break;

  case 80:
#line 422 "ael.y"
    { (yyval.pval) = update_last((yyvsp[(2) - (3)].pval), &(yylsp[(2) - (3)])); ;}
    break;

  case 81:
#line 423 "ael.y"
    { (yyval.pval) = update_last((yyvsp[(1) - (2)].pval), &(yylsp[(2) - (2)])); ;}
    break;

  case 82:
#line 424 "ael.y"
    {
		(yyval.pval)= npval2(PV_APPLICATION_CALL, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (2)].str);;}
    break;

  case 83:
#line 427 "ael.y"
    {reset_semicount(parseio->scanner);;}
    break;

  case 84:
#line 427 "ael.y"
    {
		char *bufx;
		int tot=0;
		pval *pptr;
		(yyval.pval) = npval2(PV_VARDEC, &(yylsp[(1) - (5)]), &(yylsp[(5) - (5)]));
		(yyval.pval)->u2.val=(yyvsp[(4) - (5)].str);
		/* rebuild the original string-- this is not an app call, it's an unwrapped vardec, with a func call on the LHS */
		/* string to big to fit in the buffer? */
		tot+=strlen((yyvsp[(1) - (5)].pval)->u1.str);
		for(pptr=(yyvsp[(1) - (5)].pval)->u2.arglist;pptr;pptr=pptr->next) {
			tot+=strlen(pptr->u1.str);
			tot++; /* for a sep like a comma */
		}
		tot+=4; /* for safety */
		bufx = calloc(1, tot);
		strcpy(bufx,(yyvsp[(1) - (5)].pval)->u1.str);
		strcat(bufx,"(");
		/* XXX need to advance the pointer or the loop is very inefficient */
		for (pptr=(yyvsp[(1) - (5)].pval)->u2.arglist;pptr;pptr=pptr->next) {
			if ( pptr != (yyvsp[(1) - (5)].pval)->u2.arglist )
				strcat(bufx,",");
			strcat(bufx,pptr->u1.str);
		}
		strcat(bufx,")");
#ifdef AAL_ARGCHECK
		if ( !ael_is_funcname((yyvsp[(1) - (5)].pval)->u1.str) )
			ast_log(LOG_WARNING, "==== File: %s, Line %d, Cols: %d-%d: Function call? The name %s is not in my internal list of function names\n",
				my_file, (yylsp[(1) - (5)]).first_line, (yylsp[(1) - (5)]).first_column, (yylsp[(1) - (5)]).last_column, (yyvsp[(1) - (5)].pval)->u1.str);
#endif
		(yyval.pval)->u1.str = bufx;
		destroy_pval((yyvsp[(1) - (5)].pval)); /* the app call it is not, get rid of that chain */
		prev_word = 0;
	;}
    break;

  case 85:
#line 460 "ael.y"
    { (yyval.pval) = npval2(PV_BREAK, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)])); ;}
    break;

  case 86:
#line 461 "ael.y"
    { (yyval.pval) = npval2(PV_RETURN, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)])); ;}
    break;

  case 87:
#line 462 "ael.y"
    { (yyval.pval) = npval2(PV_CONTINUE, &(yylsp[(1) - (2)]), &(yylsp[(2) - (2)])); ;}
    break;

  case 88:
#line 463 "ael.y"
    {
		(yyval.pval) = update_last((yyvsp[(1) - (3)].pval), &(yylsp[(2) - (3)]));
		(yyval.pval)->u2.statements = (yyvsp[(2) - (3)].pval); set_dads((yyval.pval),(yyvsp[(2) - (3)].pval));
		(yyval.pval)->u3.else_statements = (yyvsp[(3) - (3)].pval);set_dads((yyval.pval),(yyvsp[(3) - (3)].pval));;}
    break;

  case 89:
#line 467 "ael.y"
    { (yyval.pval)=0; ;}
    break;

  case 90:
#line 470 "ael.y"
    { (yyval.pval) = (yyvsp[(2) - (2)].pval); ;}
    break;

  case 91:
#line 471 "ael.y"
    { (yyval.pval) = NULL ; ;}
    break;

  case 92:
#line 474 "ael.y"
    { (yyval.pval) = nword((yyvsp[(1) - (1)].str), &(yylsp[(1) - (1)])); ;}
    break;

  case 93:
#line 475 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (3)].str), &(yylsp[(1) - (3)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (3)].str), &(yylsp[(3) - (3)])); ;}
    break;

  case 94:
#line 478 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (3)].str), &(yylsp[(1) - (3)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (3)].str), &(yylsp[(3) - (3)])); ;}
    break;

  case 95:
#line 481 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (5)].str), &(yylsp[(1) - (5)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (5)].str), &(yylsp[(3) - (5)]));
		(yyval.pval)->next->next = nword((yyvsp[(5) - (5)].str), &(yylsp[(5) - (5)])); ;}
    break;

  case 96:
#line 485 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (5)].str), &(yylsp[(1) - (5)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (5)].str), &(yylsp[(3) - (5)]));
		(yyval.pval)->next->next = nword((yyvsp[(5) - (5)].str), &(yylsp[(5) - (5)])); ;}
    break;

  case 97:
#line 489 "ael.y"
    {
		(yyval.pval) = nword(strdup("default"), &(yylsp[(1) - (5)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (5)].str), &(yylsp[(3) - (5)]));
		(yyval.pval)->next->next = nword((yyvsp[(5) - (5)].str), &(yylsp[(5) - (5)])); ;}
    break;

  case 98:
#line 493 "ael.y"
    {
		(yyval.pval) = nword(strdup("default"), &(yylsp[(1) - (5)]));
		(yyval.pval)->next = nword((yyvsp[(3) - (5)].str), &(yylsp[(3) - (5)]));
		(yyval.pval)->next->next = nword((yyvsp[(5) - (5)].str), &(yylsp[(5) - (5)])); ;}
    break;

  case 99:
#line 499 "ael.y"
    { (yyval.str) = strdup("1"); ;}
    break;

  case 100:
#line 500 "ael.y"
    { (yyval.str) = (yyvsp[(2) - (2)].str); ;}
    break;

  case 101:
#line 504 "ael.y"
    {			/* ext[, pri] default 1 */
		(yyval.pval) = nword((yyvsp[(1) - (2)].str), &(yylsp[(1) - (2)]));
		(yyval.pval)->next = nword((yyvsp[(2) - (2)].str), &(yylsp[(2) - (2)])); ;}
    break;

  case 102:
#line 507 "ael.y"
    {	/* context, ext, pri */
		(yyval.pval) = nword((yyvsp[(4) - (4)].str), &(yylsp[(4) - (4)]));
		(yyval.pval)->next = nword((yyvsp[(1) - (4)].str), &(yylsp[(1) - (4)]));
		(yyval.pval)->next->next = nword((yyvsp[(2) - (4)].str), &(yylsp[(2) - (4)])); ;}
    break;

  case 103:
#line 513 "ael.y"
    {reset_argcount(parseio->scanner);;}
    break;

  case 104:
#line 513 "ael.y"
    {
		/* XXX original code had @2 but i think we need @5 */
		(yyval.pval) = npval2(PV_MACRO_CALL, &(yylsp[(1) - (5)]), &(yylsp[(5) - (5)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (5)].str);
		(yyval.pval)->u2.arglist = (yyvsp[(4) - (5)].pval);;}
    break;

  case 105:
#line 518 "ael.y"
    {
		(yyval.pval)= npval2(PV_MACRO_CALL, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.str = (yyvsp[(1) - (3)].str); ;}
    break;

  case 106:
#line 526 "ael.y"
    {reset_argcount(parseio->scanner);;}
    break;

  case 107:
#line 526 "ael.y"
    {
		if (strcasecmp((yyvsp[(1) - (3)].str),"goto") == 0) {
			(yyval.pval) = npval2(PV_GOTO, &(yylsp[(1) - (3)]), &(yylsp[(2) - (3)]));
			free((yyvsp[(1) - (3)].str)); /* won't be using this */
			ast_log(LOG_WARNING, "==== File: %s, Line %d, Cols: %d-%d: Suggestion: Use the goto statement instead of the Goto() application call in AEL.\n", my_file, (yylsp[(1) - (3)]).first_line, (yylsp[(1) - (3)]).first_column, (yylsp[(1) - (3)]).last_column );
		} else {
			(yyval.pval)= npval2(PV_APPLICATION_CALL, &(yylsp[(1) - (3)]), &(yylsp[(2) - (3)]));
			(yyval.pval)->u1.str = (yyvsp[(1) - (3)].str);
		} ;}
    break;

  case 108:
#line 537 "ael.y"
    {
		(yyval.pval) = update_last((yyvsp[(1) - (3)].pval), &(yylsp[(3) - (3)]));
 		if( (yyval.pval)->type == PV_GOTO )
			(yyval.pval)->u1.list = (yyvsp[(2) - (3)].pval);
	 	else
			(yyval.pval)->u2.arglist = (yyvsp[(2) - (3)].pval);
	;}
    break;

  case 109:
#line 544 "ael.y"
    { (yyval.pval) = update_last((yyvsp[(1) - (2)].pval), &(yylsp[(2) - (2)])); ;}
    break;

  case 110:
#line 547 "ael.y"
    { (yyval.str) = (yyvsp[(1) - (1)].str) ;}
    break;

  case 111:
#line 548 "ael.y"
    { (yyval.str) = strdup(""); ;}
    break;

  case 112:
#line 551 "ael.y"
    { (yyval.pval) = nword((yyvsp[(1) - (1)].str), &(yylsp[(1) - (1)])); ;}
    break;

  case 113:
#line 552 "ael.y"
    {
		(yyval.pval)= npval(PV_WORD,0/*@1.first_line*/,0/*@1.last_line*/,0/* @1.first_column*/, 0/*@1.last_column*/);
		(yyval.pval)->u1.str = strdup(""); ;}
    break;

  case 114:
#line 555 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (3)].pval), nword((yyvsp[(3) - (3)].str), &(yylsp[(3) - (3)]))); ;}
    break;

  case 115:
#line 558 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 116:
#line 559 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 117:
#line 562 "ael.y"
    {
		(yyval.pval) = npval2(PV_CASE, &(yylsp[(1) - (4)]), &(yylsp[(3) - (4)])); /* XXX 3 or 4 ? */
		(yyval.pval)->u1.str = (yyvsp[(2) - (4)].str);
		(yyval.pval)->u2.statements = (yyvsp[(4) - (4)].pval); set_dads((yyval.pval),(yyvsp[(4) - (4)].pval));;}
    break;

  case 118:
#line 566 "ael.y"
    {
		(yyval.pval) = npval2(PV_DEFAULT, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));
		(yyval.pval)->u1.str = NULL;
		(yyval.pval)->u2.statements = (yyvsp[(3) - (3)].pval);set_dads((yyval.pval),(yyvsp[(3) - (3)].pval));;}
    break;

  case 119:
#line 570 "ael.y"
    {
		(yyval.pval) = npval2(PV_PATTERN, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)])); /* XXX@3 or @4 ? */
		(yyval.pval)->u1.str = (yyvsp[(2) - (4)].str);
		(yyval.pval)->u2.statements = (yyvsp[(4) - (4)].pval);set_dads((yyval.pval),(yyvsp[(4) - (4)].pval));;}
    break;

  case 120:
#line 576 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 121:
#line 577 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (2)].pval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 122:
#line 580 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 123:
#line 581 "ael.y"
    { (yyval.pval)=(yyvsp[(1) - (1)].pval);;}
    break;

  case 124:
#line 582 "ael.y"
    {
		(yyval.pval) = npval2(PV_CATCH, &(yylsp[(1) - (5)]), &(yylsp[(5) - (5)]));
		(yyval.pval)->u1.str = (yyvsp[(2) - (5)].str);
		(yyval.pval)->u2.statements = (yyvsp[(4) - (5)].pval); set_dads((yyval.pval),(yyvsp[(4) - (5)].pval));;}
    break;

  case 125:
#line 588 "ael.y"
    {
		(yyval.pval) = npval2(PV_SWITCHES, &(yylsp[(1) - (4)]), &(yylsp[(2) - (4)]));
		(yyval.pval)->u1.list = (yyvsp[(3) - (4)].pval); set_dads((yyval.pval),(yyvsp[(3) - (4)].pval));;}
    break;

  case 126:
#line 593 "ael.y"
    {
		(yyval.pval) = npval2(PV_ESWITCHES, &(yylsp[(1) - (4)]), &(yylsp[(2) - (4)]));
		(yyval.pval)->u1.list = (yyvsp[(3) - (4)].pval); set_dads((yyval.pval),(yyvsp[(3) - (4)].pval));;}
    break;

  case 127:
#line 598 "ael.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 128:
#line 599 "ael.y"
    { (yyval.pval) = linku1(nword((yyvsp[(1) - (3)].str), &(yylsp[(1) - (3)])), (yyvsp[(3) - (3)].pval)); ;}
    break;

  case 129:
#line 600 "ael.y"
    { char *x; asprintf(&x,"%s@%s", (yyvsp[(1) - (5)].str),(yyvsp[(3) - (5)].str)); free((yyvsp[(1) - (5)].str)); free((yyvsp[(3) - (5)].str));
									  (yyval.pval) = linku1(nword(x, &(yylsp[(1) - (5)])), (yyvsp[(5) - (5)].pval));;}
    break;

  case 130:
#line 602 "ael.y"
    {(yyval.pval)=(yyvsp[(2) - (2)].pval);;}
    break;

  case 131:
#line 605 "ael.y"
    { (yyval.pval) = nword((yyvsp[(1) - (1)].str), &(yylsp[(1) - (1)])); ;}
    break;

  case 132:
#line 606 "ael.y"
    {
		(yyval.pval) = nword((yyvsp[(1) - (3)].str), &(yylsp[(1) - (3)]));
		(yyval.pval)->u2.arglist = (yyvsp[(3) - (3)].pval);
		prev_word=0; /* XXX sure ? */ ;}
    break;

  case 133:
#line 613 "ael.y"
    { (yyval.pval) = (yyvsp[(1) - (2)].pval); ;}
    break;

  case 134:
#line 614 "ael.y"
    { (yyval.pval) = linku1((yyvsp[(1) - (3)].pval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 135:
#line 615 "ael.y"
    {(yyval.pval)=(yyvsp[(1) - (2)].pval);;}
    break;

  case 136:
#line 618 "ael.y"
    {
		(yyval.pval) = npval2(PV_INCLUDES, &(yylsp[(1) - (4)]), &(yylsp[(4) - (4)]));
		(yyval.pval)->u1.list = (yyvsp[(3) - (4)].pval);set_dads((yyval.pval),(yyvsp[(3) - (4)].pval));;}
    break;

  case 137:
#line 621 "ael.y"
    {
		(yyval.pval) = npval2(PV_INCLUDES, &(yylsp[(1) - (3)]), &(yylsp[(3) - (3)]));;}
    break;


/* Line 1270 of yacc.c.  */
#line 2956 "ael.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (&yylloc, parseio, YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (&yylloc, parseio, yymsg);
	  }
	else
	  {
	    yyerror (&yylloc, parseio, YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc, parseio);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp, parseio);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the look-ahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (&yylloc, parseio, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc, parseio);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp, parseio);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}


#line 626 "ael.y"


static char *token_equivs1[] =
{
	"AMPER",
	"AT",
	"BAR",
	"COLON",
	"COMMA",
	"EQ",
	"EXTENMARK",
	"KW_BREAK",
	"KW_CASE",
	"KW_CATCH",
	"KW_CONTEXT",
	"KW_CONTINUE",
	"KW_DEFAULT",
	"KW_ELSE",
	"KW_ESWITCHES",
	"KW_FOR",
	"KW_GLOBALS",
	"KW_GOTO",
	"KW_HINT",
	"KW_IFTIME",
	"KW_IF",
	"KW_IGNOREPAT",
	"KW_INCLUDES"
	"KW_JUMP",
	"KW_MACRO",
	"KW_PATTERN",
	"KW_REGEXTEN",
	"KW_RETURN",
	"KW_SWITCHES",
	"KW_SWITCH",
	"KW_WHILE",
	"LC",
	"LP",
	"RC",
	"RP",
	"SEMI",
};

static char *token_equivs2[] =
{
	"&",
	"@",
	"|",
	":",
	",",
	"=",
	"=>",
	"break",
	"case",
	"catch",
	"context",
	"continue",
	"default",
	"else",
	"eswitches",
	"for",
	"globals",
	"goto",
	"hint",
	"ifTime",
	"if",
	"ignorepat",
	"includes"
	"jump",
	"macro",
	"pattern",
	"regexten",
	"return",
	"switches",
	"switch",
	"while",
	"{",
	"(",
	"}",
	")",
	";",
};


static char *ael_token_subst(const char *mess)
{
	/* calc a length, malloc, fill, and return; yyerror had better free it! */
	int len=0,i;
	const char *p;
	char *res, *s,*t;
	int token_equivs_entries = sizeof(token_equivs1)/sizeof(char*);

	for (p=mess; *p; p++) {
		for (i=0; i<token_equivs_entries; i++) {
			if ( strncmp(p,token_equivs1[i],strlen(token_equivs1[i])) == 0 )
			{
				len+=strlen(token_equivs2[i])+2;
				p += strlen(token_equivs1[i])-1;
				break;
			}
		}
		len++;
	}
	res = calloc(1, len+1);
	res[0] = 0;
	s = res;
	for (p=mess; *p;) {
		int found = 0;
		for (i=0; i<token_equivs_entries; i++) {
			if ( strncmp(p,token_equivs1[i],strlen(token_equivs1[i])) == 0 ) {
				*s++ = '\'';
				for (t=token_equivs2[i]; *t;) {
					*s++ = *t++;
				}
				*s++ = '\'';
				p += strlen(token_equivs1[i]);
				found = 1;
				break;
			}
		}
		if( !found )
			*s++ = *p++;
	}
	*s++ = 0;
	return res;
}

void yyerror(YYLTYPE *locp, struct parse_io *parseio,  char const *s)
{
	char *s2 = ael_token_subst(s);
	if (locp->first_line == locp->last_line) {
		ast_log(LOG_ERROR, "==== File: %s, Line %d, Cols: %d-%d: Error: %s\n", my_file, locp->first_line, locp->first_column, locp->last_column, s2);
	} else {
		ast_log(LOG_ERROR, "==== File: %s, Line %d Col %d  to Line %d Col %d: Error: %s\n", my_file, locp->first_line, locp->first_column, locp->last_line, locp->last_column, s2);
	}
	free(s2);
	parseio->syntax_error_count++;
}

static struct pval *npval(pvaltype type, int first_line, int last_line,
	int first_column, int last_column)
{
	pval *z = calloc(1, sizeof(struct pval));
	z->type = type;
	z->startline = first_line;
	z->endline = last_line;
	z->startcol = first_column;
	z->endcol = last_column;
	z->filename = strdup(my_file);
	return z;
}

static struct pval *npval2(pvaltype type, YYLTYPE *first, YYLTYPE *last)
{
	return npval(type, first->first_line, last->last_line,
			first->first_column, last->last_column);
}

static struct pval *update_last(pval *obj, YYLTYPE *last)
{
	obj->endline = last->last_line;
	obj->endcol = last->last_column;
	return obj;
}

/* frontend for npval to create a PV_WORD string from the given token */
static pval *nword(char *string, YYLTYPE *pos)
{
	pval *p = npval2(PV_WORD, pos, pos);
	if (p)
		p->u1.str = string;
	return p;
}

/* append second element to the list in the first one */
static pval * linku1(pval *head, pval *tail)
{
	if (!head)
		return tail;
	if (tail) {
		if (!head->next) {
			head->next = tail;
		} else {
			head->u1_last->next = tail;
		}
		head->u1_last = tail;
		tail->prev = head; /* the dad link only points to containers */
	}
	return head;
}

/* this routine adds a dad ptr to each element in the list */
static void set_dads(struct pval *dad, struct pval *child_list)
{
	struct pval *t;
	
	for(t=child_list;t;t=t->next)  /* simple stuff */
		t->dad = dad;
}


