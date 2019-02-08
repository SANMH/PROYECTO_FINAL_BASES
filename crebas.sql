/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     08/02/2019 1:13:25                           */
/*==============================================================*/


if exists (select 1
            from  sysindexes
           where  id    = object_id('A_DATOS_FALLECIDA_O_')
            and   name  = 'RELATIONSHIP_12_FK'
            and   indid > 0
            and   indid < 255)
   drop index A_DATOS_FALLECIDA_O_.RELATIONSHIP_12_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('A_DATOS_FALLECIDA_O_')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index A_DATOS_FALLECIDA_O_.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('A_DATOS_FALLECIDA_O_')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index A_DATOS_FALLECIDA_O_.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('A_DATOS_FALLECIDA_O_')
            and   type = 'U')
   drop table A_DATOS_FALLECIDA_O_
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('B_CERT_MED_DEF')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index B_CERT_MED_DEF.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('B_CERT_MED_DEF')
            and   type = 'U')
   drop table B_CERT_MED_DEF
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANTON')
            and   name  = 'RELATIONSHIP_15_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANTON.RELATIONSHIP_15_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANTON')
            and   type = 'U')
   drop table CANTON
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('C_MUERTES_SIN_CERT_MED')
            and   name  = 'TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index C_MUERTES_SIN_CERT_MED.TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('C_MUERTES_SIN_CERT_MED')
            and   type = 'U')
   drop table C_MUERTES_SIN_CERT_MED
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('D_DATOS_INSCRIPCION_DEFUNCION')
            and   name  = 'HAY_FK'
            and   indid > 0
            and   indid < 255)
   drop index D_DATOS_INSCRIPCION_DEFUNCION.HAY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('D_DATOS_INSCRIPCION_DEFUNCION')
            and   type = 'U')
   drop table D_DATOS_INSCRIPCION_DEFUNCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EDAD_AL_FALLECER')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index EDAD_AL_FALLECER.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EDAD_AL_FALLECER')
            and   type = 'U')
   drop table EDAD_AL_FALLECER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTADO_CIVIL')
            and   type = 'U')
   drop table ESTADO_CIVIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FORMULARIO')
            and   type = 'U')
   drop table FORMULARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOCALIDAD')
            and   type = 'U')
   drop table LOCALIDAD
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARROQUIA')
            and   name  = 'RELATIONSHIP_14_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARROQUIA.RELATIONSHIP_14_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARROQUIA')
            and   type = 'U')
   drop table PARROQUIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROV')
            and   name  = 'RELATIONSHIP_13_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROV.RELATIONSHIP_13_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROV')
            and   type = 'U')
   drop table PROV
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RESIDENCIA')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index RESIDENCIA.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RESIDENCIA')
            and   type = 'U')
   drop table RESIDENCIA
go

/*==============================================================*/
/* Table: A_DATOS_FALLECIDA_O_                                  */
/*==============================================================*/
create table A_DATOS_FALLECIDA_O_ (
   ID_FALL              int                  not null
      constraint CKC_ID_FALL_A_DATOS_ check (ID_FALL between 1 and 1000),
   NOM_FALL             varchar(200)         not null,
   APELL_FALL           varchar(200)         not null,
   CED_FALL             varchar(200)         not null,
   FECHANACI_FALL       datetime             not null,
   FECHAFALL_FALL       datetime             not null,
   NACION_FALL          varchar(200)         not null,
   ETNIA_FALL           varchar(200)         not null,
   ID_FORM              int                  null
      constraint CKC_ID_FORM_A_DATOS_ check (ID_FORM is null or (ID_FORM between 1 and 1000)),
   ID_ESTADO            int                  null,
   ID_RESIDENCIA        int                  null,
   INSTRU_FALL          varchar(200)         not null,
   constraint PK_A_DATOS_FALLECIDA_O_ primary key nonclustered (ID_FALL)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on A_DATOS_FALLECIDA_O_ (
ID_FORM ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on A_DATOS_FALLECIDA_O_ (
ID_ESTADO ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on A_DATOS_FALLECIDA_O_ (
ID_RESIDENCIA ASC
)
go

/*==============================================================*/
/* Table: B_CERT_MED_DEF                                        */
/*==============================================================*/
create table B_CERT_MED_DEF (
   ID_CERT              int                  not null,
   ID_FORM              int                  null
      constraint CKC_ID_FORM_B_CERT_M check (ID_FORM is null or (ID_FORM between 1 and 1000)),
   DESCRI_CERT          varchar(500)         not null,
   MORT_MAT_CERT        varchar(200)         not null,
   MUERTACCOVIOLEN_CERT varchar(200)         not null,
   AUTOP_CERT           varchar(200)         not null,
   LUGARHECHO_CERT      varchar(200)         not null,
   constraint PK_B_CERT_MED_DEF primary key nonclustered (ID_CERT)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on B_CERT_MED_DEF (
ID_FORM ASC
)
go

/*==============================================================*/
/* Table: CANTON                                                */
/*==============================================================*/
create table CANTON (
   ID_CANTON            int                  not null,
   ID_LOCAL             int                  null,
   NOM_CANTON           varchar(200)         not null,
   constraint PK_CANTON primary key nonclustered (ID_CANTON)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on CANTON (
ID_LOCAL ASC
)
go

/*==============================================================*/
/* Table: C_MUERTES_SIN_CERT_MED                                */
/*==============================================================*/
create table C_MUERTES_SIN_CERT_MED (
   SINTOM_MED           varchar(500)         not null,
   TEST_MED             varchar(500)         not null,
   ID_MED               int                  not null,
   ID_FORM              int                  null
      constraint CKC_ID_FORM_C_MUERTE check (ID_FORM is null or (ID_FORM between 1 and 1000)),
   constraint PK_C_MUERTES_SIN_CERT_MED primary key nonclustered (ID_MED)
)
go

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on C_MUERTES_SIN_CERT_MED (
ID_FORM ASC
)
go

/*==============================================================*/
/* Table: D_DATOS_INSCRIPCION_DEFUNCION                         */
/*==============================================================*/
create table D_DATOS_INSCRIPCION_DEFUNCION (
   CERT_INSC            varchar(200)         not null,
   QUIENCERT_INS        varchar(500)         not null,
   RELFALL_INS          varchar(200)         not null,
   DATOSQUIEN_INS       varchar(500)         not null,
   ID_INS               int                  not null,
   ID_FORM              int                  null
      constraint CKC_ID_FORM_D_DATOS_ check (ID_FORM is null or (ID_FORM between 1 and 1000)),
   constraint PK_D_DATOS_INSCRIPCION_DEFUNCI primary key nonclustered (ID_INS)
)
go

/*==============================================================*/
/* Index: HAY_FK                                                */
/*==============================================================*/
create index HAY_FK on D_DATOS_INSCRIPCION_DEFUNCION (
ID_FORM ASC
)
go

/*==============================================================*/
/* Table: EDAD_AL_FALLECER                                      */
/*==============================================================*/
create table EDAD_AL_FALLECER (
   ID_EDAD              int                  not null,
   ID_FALL              int                  not null,
   HORAS_FALL           int                  not null,
   DIAS_FALL            int                  not null,
   MESES_FALL           int                  not null,
   EDAD_FALL            int                  not null,
   constraint PK_EDAD_AL_FALLECER primary key nonclustered (ID_EDAD)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on EDAD_AL_FALLECER (
ID_FALL ASC
)
go

/*==============================================================*/
/* Table: ESTADO_CIVIL                                          */
/*==============================================================*/
create table ESTADO_CIVIL (
   ID_ESTADO            int                  not null,
   DESC_ESTADO          char(10)             not null,
   constraint PK_ESTADO_CIVIL primary key nonclustered (ID_ESTADO)
)
go

/*==============================================================*/
/* Table: FORMULARIO                                            */
/*==============================================================*/
create table FORMULARIO (
   ID_FORM              int                  not null
      constraint CKC_ID_FORM_FORMULAR check (ID_FORM between 1 and 1000),
   OF_REG_CIV           varchar(200)         not null,
   PROV_FORM            varchar(200)         not null,
   CANT_FORM            varchar(200)         not null,
   PARR_URB_RUR_FORM    varchar(200)         not null,
   FECH_INS_FORM        datetime             not null,
   ACTA_INS_FORM        datetime             not null,
   constraint PK_FORMULARIO primary key nonclustered (ID_FORM)
)
go

/*==============================================================*/
/* Table: LOCALIDAD                                             */
/*==============================================================*/
create table LOCALIDAD (
   ID_LOCAL             int                  not null,
   NOM_LOCAL            varchar(200)         not null,
   constraint PK_LOCALIDAD primary key nonclustered (ID_LOCAL)
)
go

/*==============================================================*/
/* Table: PARROQUIA                                             */
/*==============================================================*/
create table PARROQUIA (
   ID_PARR              int                  not null,
   ID_LOCAL             int                  null,
   NOM_PARR             varchar(200)         not null,
   constraint PK_PARROQUIA primary key nonclustered (ID_PARR)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_14_FK on PARROQUIA (
ID_LOCAL ASC
)
go

/*==============================================================*/
/* Table: PROV                                                  */
/*==============================================================*/
create table PROV (
   ID_PROV              int                  not null,
   ID_CANTON            int                  null,
   NOM_PROV             varchar(200)         not null,
   constraint PK_PROV primary key nonclustered (ID_PROV)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on PROV (
ID_CANTON ASC
)
go

/*==============================================================*/
/* Table: RESIDENCIA                                            */
/*==============================================================*/
create table RESIDENCIA (
   ID_RESIDENCIA        int                  not null,
   ID_PROV              int                  null,
   DIRDOM_RESI          char(200)            not null,
   constraint PK_RESIDENCIA primary key nonclustered (ID_RESIDENCIA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on RESIDENCIA (
ID_PROV ASC
)
go

