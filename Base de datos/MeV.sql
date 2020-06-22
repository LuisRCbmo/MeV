/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     21/6/2020 20:01:47                           */
/*==============================================================*/

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
create table AULA (
   AULA                 VARCHAR(4)           not null,
   UBICACION            VARCHAR(100)         not null,
   constraint PK_AULA primary key (AULA)
);

/*==============================================================*/
/* Index: AULA_PK                                               */
/*==============================================================*/
create unique index AULA_PK on AULA (
AULA
);

/*==============================================================*/
/* Table: DOCENCIA                                              */
/*==============================================================*/
create table DOCENCIA (
   DOCENTE              VARCHAR(40)          not null,
   GRADO                VARCHAR(10)          null,
   constraint PK_DOCENCIA primary key (DOCENTE)
);

/*==============================================================*/
/* Index: DOCENCIA_PK                                           */
/*==============================================================*/
create unique index DOCENCIA_PK on DOCENCIA (
DOCENTE
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   CORREO               VARCHAR(25)          not null,
   COD_HM               VARCHAR(20)          not null,
   CONTRASENA           VARCHAR(20)          not null,
   constraint PK_ESTUDIANTE primary key (CORREO)
);

/*==============================================================*/
/* Index: ESTUDIANTE_PK                                         */
/*==============================================================*/
create unique index ESTUDIANTE_PK on ESTUDIANTE (
CORREO
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   COD_H                SERIAL               not null,
   HORA_INI             TIME                 not null,
   HORA_FIN             TIME                 not null,
   constraint PK_HORARIO primary key (COD_H)
);

/*==============================================================*/
/* Index: HORARIO_PK                                            */
/*==============================================================*/
create unique index HORARIO_PK on HORARIO (
COD_H
);

/*==============================================================*/
/* Table: HORARIO_MAT                                           */
/*==============================================================*/
create table HORARIO_MAT (
   COD_HM               VARCHAR(20)          not null,
   COD_H                INT4                 not null,
   AULA                 VARCHAR(4)           not null,
   CODIGO_MAT           INT4                 not null,
   GRUPO                INT4                 not null,
   DIA                  VARCHAR(10)          not null,
   constraint PK_HORARIO_MAT primary key (COD_HM)
);

/*==============================================================*/
/* Index: HORARIO_MAT_PK                                        */
/*==============================================================*/
create unique index HORARIO_MAT_PK on HORARIO_MAT (
COD_HM
);

/*==============================================================*/
/* Table: MATERIA                                               */
/*==============================================================*/
create table MATERIA (
   CODIGO_MAT           SERIAL               not null,
   GRUPO                INT4                 not null,
   DOCENTE              VARCHAR(40)          not null,
   COD_S                VARCHAR(1)           not null,
   NOMBRE_MAT           VARCHAR(30)          not null,
   constraint PK_MATERIA primary key (CODIGO_MAT, GRUPO)
);

/*==============================================================*/
/* Index: MATERIA_PK                                            */
/*==============================================================*/
create unique index MATERIA_PK on MATERIA (
CODIGO_MAT,
GRUPO
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on MATERIA (
COD_S
);

/*==============================================================*/
/* Table: SEMESTRE                                              */
/*==============================================================*/
create table SEMESTRE (
   COD_S                VARCHAR(1)           not null,
   constraint PK_SEMESTRE primary key (COD_S)
);

/*==============================================================*/
/* Index: SEMESTRE_PK                                           */
/*==============================================================*/
create unique index SEMESTRE_PK on SEMESTRE (
COD_S
);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_RELATIONS_HORARIO_ foreign key (COD_HM)
      references HORARIO_MAT (COD_HM)
      on delete restrict on update restrict;

alter table HORARIO_MAT
   add constraint FK_HORARIO__RELATIONS_MATERIA foreign key (CODIGO_MAT, GRUPO)
      references MATERIA (CODIGO_MAT, GRUPO)
      on delete restrict on update restrict;

alter table HORARIO_MAT
   add constraint FK_HORARIO__RELATIONS_AULA foreign key (AULA)
      references AULA (AULA)
      on delete restrict on update restrict;

alter table HORARIO_MAT
   add constraint FK_HORARIO__RELATIONS_HORARIO foreign key (COD_H)
      references HORARIO (COD_H)
      on delete restrict on update restrict;

alter table MATERIA
   add constraint FK_MATERIA_RELATIONS_DOCENCIA foreign key (DOCENTE)
      references DOCENCIA (DOCENTE)
      on delete restrict on update restrict;

alter table MATERIA
   add constraint FK_MATERIA_RELATIONS_SEMESTRE foreign key (COD_S)
      references SEMESTRE (COD_S)
      on delete restrict on update restrict;

