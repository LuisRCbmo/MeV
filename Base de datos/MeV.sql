/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     26/6/2020 20:15:30                           */
/*==============================================================*/
/*==============================================================*/
/* Table: CLASS                                                 */
/*==============================================================*/
create table CLASS (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   COD_SCHE             VARCHAR(20)          not null,
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
/* Index: S_C_FK                                                */
/*==============================================================*/
create  index S_C_FK on CLASS (
COD_SCHE
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
/* Table: SCHEDULE                                              */
/*==============================================================*/
create table SCHEDULE (
   COD_SCHE             VARCHAR(20)          not null,
   constraint PK_SCHEDULE primary key (COD_SCHE)
);

/*==============================================================*/
/* Index: SCHEDULE_PK                                           */
/*==============================================================*/
create unique index SCHEDULE_PK on SCHEDULE (
COD_SCHE
);

/*==============================================================*/
/* Table: SCHEDULE_STUDENT                                      */
/*==============================================================*/
create table SCHEDULE_STUDENT (
   COD_SCHE             VARCHAR(20)          not null,
   CORREO               VARCHAR(60)          not null,
   constraint PK_SCHEDULE_STUDENT primary key (COD_SCHE, CORREO)
);

/*==============================================================*/
/* Index: SCHEDULE_STUDENT_PK                                   */
/*==============================================================*/
create unique index SCHEDULE_STUDENT_PK on SCHEDULE_STUDENT (
COD_SCHE,
CORREO
);

/*==============================================================*/
/* Index: SCHEDULE_STUDENT_FK                                   */
/*==============================================================*/
create  index SCHEDULE_STUDENT_FK on SCHEDULE_STUDENT (
COD_SCHE
);

/*==============================================================*/
/* Index: SCHEDULE_STUDENT2_FK                                  */
/*==============================================================*/
create  index SCHEDULE_STUDENT2_FK on SCHEDULE_STUDENT (
CORREO
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
/* Table: TEACHER                                               */
/*==============================================================*/
create table TEACHER (
   FULL_NAME            VARCHAR(50)          not null,
   COD_SCHE             VARCHAR(20)          not null,
   DEGREE               VARCHAR(10)          not null,
   constraint PK_TEACHER primary key (FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_PK                                            */
/*==============================================================*/
create unique index TEACHER_PK on TEACHER (
FULL_NAME
);

/*==============================================================*/
/* Index: S_T_FK                                                */
/*==============================================================*/
create  index S_T_FK on TEACHER (
COD_SCHE
);

/*==============================================================*/
/* Table: TEACHER_CLASS                                         */
/*==============================================================*/
create table TEACHER_CLASS (
   COD_CL               VARCHAR(4)           not null,
   FULL_NAME            VARCHAR(50)          not null,
   constraint PK_TEACHER_CLASS primary key (COD_CL, FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_CLASS_PK                                      */
/*==============================================================*/
create unique index TEACHER_CLASS_PK on TEACHER_CLASS (
COD_CL,
FULL_NAME
);

/*==============================================================*/
/* Index: TEACHER_CLASS_FK                                      */
/*==============================================================*/
create  index TEACHER_CLASS_FK on TEACHER_CLASS (
COD_CL
);

/*==============================================================*/
/* Index: TEACHER_CLASS2_FK                                     */
/*==============================================================*/
create  index TEACHER_CLASS2_FK on TEACHER_CLASS (
FULL_NAME
);

/*==============================================================*/
/* Table: TEACHER_TIME                                          */
/*==============================================================*/
create table TEACHER_TIME (
   COD_TI               INT4                 not null,
   FULL_NAME            VARCHAR(50)          not null,
   constraint PK_TEACHER_TIME primary key (COD_TI, FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_TIME_PK                                       */
/*==============================================================*/
create unique index TEACHER_TIME_PK on TEACHER_TIME (
COD_TI,
FULL_NAME
);

/*==============================================================*/
/* Index: TEACHER_TIME_FK                                       */
/*==============================================================*/
create  index TEACHER_TIME_FK on TEACHER_TIME (
COD_TI
);

/*==============================================================*/
/* Index: TEACHER_TIME2_FK                                      */
/*==============================================================*/
create  index TEACHER_TIME2_FK on TEACHER_TIME (
FULL_NAME
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

alter table CLASS
   add constraint FK_CLASS_SCHEDULE__SCHEDULE foreign key (COD_SCHE)
      references SCHEDULE (COD_SCHE)
      on delete restrict on update restrict;

alter table DAY_CLASS
   add constraint FK_DAY_CLAS_DAY_CLASS_DAY foreign key (DAY)
      references DAY (DAY)
      on delete restrict on update restrict;

alter table DAY_CLASS
   add constraint FK_DAY_CLAS_DAY_CLASS_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table SCHEDULE_STUDENT
   add constraint FK_SCHEDULE_SCHEDULE__SCHEDULE foreign key (COD_SCHE)
      references SCHEDULE (COD_SCHE)
      on delete restrict on update restrict;

alter table SCHEDULE_STUDENT
   add constraint FK_SCHEDULE_SCHEDULE__STUDENT foreign key (CORREO)
      references STUDENT (CORREO)
      on delete restrict on update restrict;

alter table TEACHER
   add constraint FK_TEACHER_SCHEDULE__SCHEDULE foreign key (COD_SCHE)
      references SCHEDULE (COD_SCHE)
      on delete restrict on update restrict;

alter table TEACHER_CLASS
   add constraint FK_TEACHER__TEACHER_C_CLASSROO foreign key (COD_CL)
      references CLASSROOM (COD_CL)
      on delete restrict on update restrict;

alter table TEACHER_CLASS
   add constraint FK_TEACHER__TEACHER_C_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

alter table TEACHER_TIME
   add constraint FK_TEACHER__TEACHER_T_TIME_OF foreign key (COD_TI)
      references TIME_OF (COD_TI)
      on delete restrict on update restrict;

alter table TEACHER_TIME
   add constraint FK_TEACHER__TEACHER_T_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

