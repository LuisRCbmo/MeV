/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     27/6/2020 14:02:47                           */
/*==============================================================*/
/*==============================================================*/
/* Table: CLASS                                                 */
/*==============================================================*/
create table CLASS (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   COD_SE               VARCHAR(1)           not null,
   NAME                 VARCHAR(30)          not null,
   constraint PK_CLASS primary key (COD_CLS, "GROUP")
);

/*==============================================================*/
/* Index: CLASS_PK                                              */
/*==============================================================*/
create unique index CLASS_PK on CLASS (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: HAVE_A_FK                                             */
/*==============================================================*/
create  index HAVE_A_FK on CLASS (
COD_SE
);

/*==============================================================*/
/* Table: CLASSROOM                                             */
/*==============================================================*/
create table CLASSROOM (
   COD_CL               VARCHAR(4)           not null,
   UBICATION            VARCHAR(100)         not null,
   constraint PK_CLASSROOM primary key (COD_CL)
);

/*==============================================================*/
/* Index: CLASSROOM_PK                                          */
/*==============================================================*/
create unique index CLASSROOM_PK on CLASSROOM (
COD_CL
);

/*==============================================================*/
/* Table: DAY                                                   */
/*==============================================================*/
create table DAY (
   DAY                  VARCHAR(2)           not null,
   constraint PK_DAY primary key (DAY)
);

/*==============================================================*/
/* Index: DAY_PK                                                */
/*==============================================================*/
create unique index DAY_PK on DAY (
DAY
);

/*==============================================================*/
/* Table: DAY_CLASS                                             */
/*==============================================================*/
create table DAY_CLASS (
   DAY                  VARCHAR(2)           not null,
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   constraint PK_DAY_CLASS primary key (DAY, COD_CLS, "GROUP")
);

/*==============================================================*/
/* Index: DAY_CLASS_PK                                          */
/*==============================================================*/
create unique index DAY_CLASS_PK on DAY_CLASS (
DAY,
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: DAY_CLASS_FK                                          */
/*==============================================================*/
create  index DAY_CLASS_FK on DAY_CLASS (
DAY
);

/*==============================================================*/
/* Index: DAY_CLASS2_FK                                         */
/*==============================================================*/
create  index DAY_CLASS2_FK on DAY_CLASS (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Table: SEMESTER                                              */
/*==============================================================*/
create table SEMESTER (
   COD_SE               VARCHAR(1)           not null,
   constraint PK_SEMESTER primary key (COD_SE)
);

/*==============================================================*/
/* Index: SEMESTER_PK                                           */
/*==============================================================*/
create unique index SEMESTER_PK on SEMESTER (
COD_SE
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT (
   CORREO               VARCHAR(60)          not null,
   PASSWORD             VARCHAR(20)          not null,
   constraint PK_STUDENT primary key (CORREO)
);

/*==============================================================*/
/* Index: STUDENT_PK                                            */
/*==============================================================*/
create unique index STUDENT_PK on STUDENT (
CORREO
);

/*==============================================================*/
/* Table: STUDENT_CLASS                                         */
/*==============================================================*/
create table STUDENT_CLASS (
   CORREO               VARCHAR(60)          not null,
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   constraint PK_STUDENT_CLASS primary key (CORREO, COD_CLS, "GROUP")
);

/*==============================================================*/
/* Index: STUDENT_CLASS_PK                                      */
/*==============================================================*/
create unique index STUDENT_CLASS_PK on STUDENT_CLASS (
CORREO,
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: STUDENT_CLASS_FK                                      */
/*==============================================================*/
create  index STUDENT_CLASS_FK on STUDENT_CLASS (
CORREO
);

/*==============================================================*/
/* Index: STUDENT_CLASS2_FK                                     */
/*==============================================================*/
create  index STUDENT_CLASS2_FK on STUDENT_CLASS (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Table: TEACHER                                               */
/*==============================================================*/
create table TEACHER (
   FULL_NAME            VARCHAR(50)          not null,
   DEGREES              VARCHAR(10)          not null,
   constraint PK_TEACHER primary key (FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_PK                                            */
/*==============================================================*/
create unique index TEACHER_PK on TEACHER (
FULL_NAME
);

/*==============================================================*/
/* Table: TEACHER_CLASS                                         */
/*==============================================================*/
create table TEACHER_CLASS (
   FULL_NAME            VARCHAR(50)          not null,
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   constraint PK_TEACHER_CLASS primary key (FULL_NAME, COD_CLS, "GROUP")
);

/*==============================================================*/
/* Table: TEACHER_CLASSROOM                                     */
/*==============================================================*/
create table TEACHER_CLASSROOM (
   COD_CL               VARCHAR(4)           not null,
   FULL_NAME            VARCHAR(50)          not null,
   constraint PK_TEACHER_CLASSROOM primary key (COD_CL, FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_CLASS_PK                                      */
/*==============================================================*/
create unique index TEACHER_CLASS_PK on TEACHER_CLASSROOM (
COD_CL,
FULL_NAME
);

/*==============================================================*/
/* Index: TEACHER_CLASS_FK                                      */
/*==============================================================*/
create  index TEACHER_CLASS_FK on TEACHER_CLASSROOM (
COD_CL
);

/*==============================================================*/
/* Index: TEACHER_CLASS2_FK                                     */
/*==============================================================*/
create  index TEACHER_CLASS2_FK on TEACHER_CLASSROOM (
FULL_NAME
);

/*==============================================================*/
/* Table: TIME_CLASS                                            */
/*==============================================================*/
create table TIME_CLASS (
   COD_TI               INT4                 not null,
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   constraint PK_TIME_CLASS primary key (COD_TI, COD_CLS, "GROUP")
);

/*==============================================================*/
/* Index: TEACHER_TIME_PK                                       */
/*==============================================================*/
create unique index TEACHER_TIME_PK on TIME_CLASS (
COD_TI,
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: TEACHER_TIME_FK                                       */
/*==============================================================*/
create  index TEACHER_TIME_FK on TIME_CLASS (
COD_TI
);

/*==============================================================*/
/* Index: TEACHER_TIME2_FK                                      */
/*==============================================================*/
create  index TEACHER_TIME2_FK on TIME_CLASS (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Table: TIME_OF                                               */
/*==============================================================*/
create table TIME_OF (
   COD_TI               INT4                 not null,
   STARTS               TIME                 not null,
   "END"                TIME                 not null,
   constraint PK_TIME primary key (COD_TI)
);

/*==============================================================*/
/* Index: TIME_OF_PK                                            */
/*==============================================================*/
create unique index TIME_OF_PK on TIME_OF (
COD_TI
);

alter table CLASS
   add constraint FK_CLASS_RELATIONS_SEMESTER foreign key (COD_SE)
      references SEMESTER (COD_SE)
      on delete restrict on update restrict;

alter table DAY_CLASS
   add constraint FK_DAY_CLAS_DAY_CLASS_DAY foreign key (DAY)
      references DAY (DAY)
      on delete restrict on update restrict;

alter table DAY_CLASS
   add constraint FK_DAY_CLAS_DAY_CLASS_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_STUDENT foreign key (CORREO)
      references STUDENT (CORREO)
      on delete restrict on update restrict;

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table TEACHER_CLASS
   add constraint FK_TEACHER__REFERENCE_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

alter table TEACHER_CLASS
   add constraint FK_TEACHER__REFERENCE_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table TEACHER_CLASSROOM
   add constraint FK_TEACHER__TEACHER_C_CLASSROO foreign key (COD_CL)
      references CLASSROOM (COD_CL)
      on delete restrict on update restrict;

alter table TEACHER_CLASSROOM
   add constraint FK_TEACHER__TEACHER_C_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

alter table TIME_CLASS
   add constraint FK_TIME_CLA_TIME_CLAS_TIME_OF foreign key (COD_TI)
      references TIME_OF (COD_TI)
      on delete restrict on update restrict;

alter table TIME_CLASS
   add constraint FK_TIME_CLA_TIME_CLAS_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

