#define number 257
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {int a_number;} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
