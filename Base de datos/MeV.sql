/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     25/6/2020 19:29:16                           */
/*==============================================================*/
create table CLASS (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   COD_SCH              VARCHAR(20)          not null,
   COD_SE               CHAR(10)             not null,
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
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on CLASS (
COD_SCH
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on CLASS (
COD_SE
);

/*==============================================================*/
/* Table: CLASSROOM                                             */
/*==============================================================*/
create table CLASSROOM (
   COD_CL               VARCHAR(4)           not null,
   COD_SCH              VARCHAR(20)          not null,
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
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on CLASSROOM (
COD_SCH
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
/* Table: FOLLOW                                                */
/*==============================================================*/
create table FOLLOW (
   COD_SCH              VARCHAR(20)          not null,
   DAY                  VARCHAR(2)           not null,
   constraint PK_RELATIONSHIP_7 primary key (COD_SCH, DAY)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_7_PK on FOLLOW (
COD_SCH,
DAY
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on FOLLOW (
COD_SCH
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on FOLLOW (
DAY
);

/*==============================================================*/
/* Table: HAVE_A                                                */
/*==============================================================*/
create table HAVE_A (
   CORREO               VARCHAR(60)          not null,
   COD_SCH              VARCHAR(20)          not null,
   constraint PK_RELATIONSHIP_1 primary key (CORREO, COD_SCH)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_1_PK on HAVE_A (
CORREO,
COD_SCH
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on HAVE_A (
CORREO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on HAVE_A (
COD_SCH
);

/*==============================================================*/
/* Table: "IS"                                                  */
/*==============================================================*/
create table "IS" (
   COD_SCH              VARCHAR(20)          not null,
   COD_TI               CHAR(10)             not null,
   constraint PK_RELATIONSHIP_3 primary key (COD_SCH, COD_TI)
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_3_PK on "IS" (
COD_SCH,
COD_TI
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on "IS" (
COD_SCH
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on "IS" (
COD_TI
);

/*==============================================================*/
/* Table: SCHEDULE                                              */
/*==============================================================*/
create table SCHEDULE (
   COD_SCH              VARCHAR(20)          not null,
   constraint PK_SCHEDULE primary key (COD_SCH)
);

/*==============================================================*/
/* Index: SCHEDULE_PK                                           */
/*==============================================================*/
create unique index SCHEDULE_PK on SCHEDULE (
COD_SCH
);

/*==============================================================*/
/* Table: SEMESTER                                              */
/*==============================================================*/
create table SEMESTER (
   COD_SE               CHAR(10)             not null,
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
/* Table: TEACH                                                 */
/*==============================================================*/
create table TEACH (
   COD_CLS              VARCHAR(30)          not null,
   "GROUP"              INT4                 not null,
   FULL_NAME            CHAR(10)             not null,
   constraint PK_RELATIONSHIP_5 primary key (COD_CLS, "GROUP", FULL_NAME)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_5_PK on TEACH (
COD_CLS,
"GROUP",
FULL_NAME
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on TEACH (
COD_CLS,
"GROUP"
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on TEACH (
FULL_NAME
);

/*==============================================================*/
/* Table: TEACHER                                               */
/*==============================================================*/
create table TEACHER (
   FULL_NAME            CHAR(10)             not null,
   DEGREE               CHAR(10)             not null,
   constraint PK_TEACHER primary key (FULL_NAME)
);

/*==============================================================*/
/* Index: TEACHER_PK                                            */
/*==============================================================*/
create unique index TEACHER_PK on TEACHER (
FULL_NAME
);

/*==============================================================*/
/* Table: "TIME"                                                */
/*==============================================================*/
create table "TIME" (
   COD_TI               CHAR(10)             not null,
   START                CHAR(10)             not null,
   "END"                CHAR(10)             not null,
   constraint PK_TIME primary key (COD_TI)
);

/*==============================================================*/
/* Index: TIME_PK                                               */
/*==============================================================*/
create unique index TIME_PK on "TIME" (
COD_TI
);

alter table CLASS
   add constraint FK_CLASS_RELATIONS_SEMESTER foreign key (COD_SE)
      references SEMESTER (COD_SE)
      on delete restrict on update restrict;

alter table CLASS
   add constraint FK_CLASS_RELATIONS_SCHEDULE foreign key (COD_SCH)
      references SCHEDULE (COD_SCH)
      on delete restrict on update restrict;

alter table CLASSROOM
   add constraint FK_CLASSROO_RELATIONS_SCHEDULE foreign key (COD_SCH)
      references SCHEDULE (COD_SCH)
      on delete restrict on update restrict;

alter table FOLLOW
   add constraint FK_RELATION_RELATIONS_SCHEDULE foreign key (COD_SCH)
      references SCHEDULE (COD_SCH)
      on delete restrict on update restrict;

alter table FOLLOW
   add constraint FK_RELATION_RELATIONS_DAY foreign key (DAY)
      references DAY (DAY)
      on delete restrict on update restrict;

alter table HAVE_A
   add constraint FK_RELATION_RELATIONS_STUDENT foreign key (CORREO)
      references STUDENT (CORREO)
      on delete restrict on update restrict;

alter table HAVE_A
   add constraint FK_RELATION_RELATIONS_SCHEDULE foreign key (COD_SCH)
      references SCHEDULE (COD_SCH)
      on delete restrict on update restrict;

alter table "IS"
   add constraint FK_RELATION_RELATIONS_SCHEDULE foreign key (COD_SCH)
      references SCHEDULE (COD_SCH)
      on delete restrict on update restrict;

alter table "IS"
   add constraint FK_RELATION_RELATIONS_TIME foreign key (COD_TI)
      references "TIME" (COD_TI)
      on delete restrict on update restrict;

alter table TEACH
   add constraint FK_RELATION_RELATIONS_CLASS foreign key (COD_CLS, "GROUP")
      references CLASS (COD_CLS, "GROUP")
      on delete restrict on update restrict;

alter table TEACH
   add constraint FK_RELATION_RELATIONS_TEACHER foreign key (FULL_NAME)
      references TEACHER (FULL_NAME)
      on delete restrict on update restrict;

