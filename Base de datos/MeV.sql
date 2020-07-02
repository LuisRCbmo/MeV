/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2/7/2020 13:00:45                            */
/*==============================================================*/
/*==============================================================*/
/* Table: CLASS                                                 */
/*==============================================================*/
create table CLASS (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   NAME                 VARCHAR(30)          not null,
   SEMESTER             VARCHAR(1)           not null,
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
/* Table: SCHEDULE                                              */
/*==============================================================*/
create table SCHEDULE (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   DAY                  VARCHAR(2)           not null,
   FULL_NAME            VARCHAR(50)          not null,
   COD_TI               INT4                 not null,
   COD_CL               VARCHAR(4)           not null
);

/*==============================================================*/
/* Index: SCHEDULE_PK                                           */
/*==============================================================*/
create  index SCHEDULE_PK on SCHEDULE (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: SCHEDULE2_FK                                          */
/*==============================================================*/
create  index SCHEDULE2_FK on SCHEDULE (
DAY
);

/*==============================================================*/
/* Table: STUDENT                                               */
/*==============================================================*/
create table STUDENT (
   CORREO               VARCHAR(60)          not null,
   PASSWORD             VBIN3200             not null,
   "USER"               VARCHAR(30)          not null,
   constraint PK_STUDENT primary key ("USER", CORREO)
);

/*==============================================================*/
/* Index: STUDENT_PK                                            */
/*==============================================================*/
/*==============================================================*/
/* Table: STUDENT_CLASS                                         */
/*==============================================================*/
create table STUDENT_CLASS (
   "USER"               VARCHAR(30)          not null,
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null
);

/*==============================================================*/
/* Index: STUDENT_CLASS_PK                                      */
/*==============================================================*/
create unique index STUDENT_CLASS_PK on STUDENT_CLASS (
"USER"
);

/*==============================================================*/
/* Index: STUDENT_CLASS_FK                                      */
/*==============================================================*/
create  index STUDENT_CLASS_FK on STUDENT_CLASS (
"USER"
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

alter table SCHEDULE
   add constraint FK_SCHEDULE_REFERENCE_TIME_OF foreign key (COD_TI)
      references TIME_OF (COD_TI)
      on delete restrict on update restrict;

alter table SCHEDULE
   add constraint FK_SCHEDULE_REFERENCE_CLASSROO foreign key (COD_CL)
      references CLASSROOM (COD_CL)
      on delete restrict on update restrict;

alter table SCHEDULE
   add constraint FK_SCHEDULE_REFERENCE_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

alter table SCHEDULE
   add constraint FK_SCHEDULE_SCHEDULE_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table SCHEDULE
   add constraint FK_SCHEDULE_SCHEDULE2_DAY foreign key (DAY)
      references DAY (DAY)
      on delete restrict on update restrict;

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_STUDENT foreign key ("USER", "USER")
      references STUDENT ("USER", CORREO)
      on delete restrict on update restrict;

alter table STUDENT_CLASS
   add constraint FK_STUDENT__STUDENT_C_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

