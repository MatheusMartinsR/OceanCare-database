CREATE TABLE TB_USUARIO
  (
    ID_USUARIO    NUMBER (5) NOT NULL ,
    ID_PERFIL     NUMBER (5) NOT NULL ,
    ID_REGIAO     NUMBER (5) NOT NULL ,
    EMAIL_USUARIO VARCHAR2 (100) NOT NULL ,
    SENHA_EMAIL   VARCHAR2 (100) NOT NULL ,
    CNPJ_USUARIO  VARCHAR2 (14) NOT NULL ,
    CPF_USUARIO   VARCHAR2 (11) NOT NULL
  ) ;
CREATE UNIQUE INDEX TB_USUARIO__IDX ON TB_USUARIO
  (
    ID_REGIAO ASC
  )
  ;
ALTER TABLE TB_USUARIO ADD CONSTRAINT TB_USUARIO_PK PRIMARY KEY ( ID_USUARIO ) ;

CREATE TABLE TB_INTERACOES
  (
    ID_INTERACOES   NUMBER (5) NOT NULL ,
    ID_USUARIO      NUMBER (5) NOT NULL ,
    ID_EVENTO       NUMBER (5) NOT NULL ,
    ID_TP_INTERACAO NUMBER (5) NOT NULL ,
    ID_INCIDENTES   NUMBER (5) NOT NULL ,
    INTERACOES      VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_INTERACOES ADD CONSTRAINT TB_INTERACOES_PK PRIMARY KEY ( ID_INTERACOES ) ;

CREATE TABLE TB_INCIDENTES_POLUICAO
  (
    ID_INCIDENTES   NUMBER (5) NOT NULL ,
    ID_TP_INCIDENTE NUMBER (5) NOT NULL ,
    INCIDENTES      VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_INCIDENTES_POLUICAO ADD CONSTRAINT TB_INCIDENTES_POLUICAO_PK PRIMARY KEY ( ID_INCIDENTES ) ;

CREATE TABLE TB_TIPOS_INCIDENTE
  (
    ID_TP_INCIDENTE NUMBER (5) NOT NULL ,
    TIPO_INCIDENTE  VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_TIPOS_INCIDENTE ADD CONSTRAINT TB_TIPOS_INCIDENTE_PK PRIMARY KEY ( ID_TP_INCIDENTE ) ;



CREATE TABLE TB_TIPO_INTERACAO
  (
    ID_TP_INTERACAO NUMBER (5) NOT NULL ,
    ID_RECOMPENSA   NUMBER (5) NOT NULL ,
    DESCRICAO_TIPO  VARCHAR2 (100) NOT NULL ,
    PONTOS          VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_TIPO_INTERACAO ADD CONSTRAINT TB_TIPO_INTERACAO_PK PRIMARY KEY ( ID_TP_INTERACAO ) ;

CREATE TABLE TB_RECOMPENSA
  (
    ID_RECOMPENSA        NUMBER (5) NOT NULL ,
    ID_TP_RECOMPENSA     NUMBER (5) NOT NULL ,
    DESCRICAO_RECOMPENSA VARCHAR2 (100) NOT NULL ,
    QTD_PONTOS           VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_RECOMPENSA ADD CONSTRAINT TB_RECOMPENSA_PK PRIMARY KEY ( ID_RECOMPENSA ) ;


CREATE TABLE TB_TIPO_RECOMPENSA
  (
    ID_TP_RECOMPENSA NUMBER (5) NOT NULL ,
    TIPO_RECOMPENSA  VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_TIPO_RECOMPENSA ADD CONSTRAINT TB_TIPO_RECOMPENSA_PK PRIMARY KEY ( ID_TP_RECOMPENSA ) ;

CREATE TABLE TB_PERFIL
  (
    ID_PERFIL        NUMBER (5) NOT NULL ,
    DESCRICAO_PERFIL VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_PERFIL ADD CONSTRAINT TB_PERFIL_PK PRIMARY KEY ( ID_PERFIL ) ;

CREATE TABLE TB_REGIAO
  (
    ID_REGIAO NUMBER (5) NOT NULL ,
    ID_ESTADO NUMBER (5) NOT NULL ,
    REGIAO    VARCHAR2 (100) NOT NULL
  ) ;
CREATE UNIQUE INDEX TB_REGIAO__IDX ON TB_REGIAO
  (
    ID_ESTADO ASC
  )
  ;
ALTER TABLE TB_REGIAO ADD CONSTRAINT TB_REGIAO_PK PRIMARY KEY ( ID_REGIAO ) ;



CREATE TABLE TB_ESTADO
  (
    ID_ESTADO NUMBER (5) NOT NULL ,
    ESTADO    VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_ESTADO ADD CONSTRAINT TB_ESTADO_PK PRIMARY KEY ( ID_ESTADO ) ;

CREATE TABLE TB_EVENTO
  (
    ID_EVENTO      NUMBER (5) NOT NULL ,
    ID_TIPO_EVENTO NUMBER (5) NOT NULL ,
    NOME_EVENTO    VARCHAR2 (100) NOT NULL ,
    DATA_EVENTO    DATE NOT NULL ,
    LOCAL_EVENTO   VARCHAR2 (100) NOT NULL
  ) ;
ALTER TABLE TB_EVENTO ADD CONSTRAINT TB_EVENTO_PK PRIMARY KEY ( ID_EVENTO ) ;

CREATE TABLE TB_TIPO_EVENTO
  (
    ID_TIPO_EVENTO NUMBER (5) NOT NULL ,
    ID_REGIAO      NUMBER (5) NOT NULL ,
    TIPO_EVENTO    VARCHAR2 (100) NOT NULL
  ) ;
CREATE UNIQUE INDEX TB_TIPO_EVENTO__IDX ON TB_TIPO_EVENTO
  (
    ID_REGIAO ASC
  )
  ;
ALTER TABLE TB_TIPO_EVENTO ADD CONSTRAINT TB_TIPO_EVENTO_PK PRIMARY KEY ( ID_TIPO_EVENTO ) ;


ALTER TABLE TB_REGIAO ADD CONSTRAINT FK_ESTADO_REGIAO FOREIGN KEY ( ID_ESTADO ) REFERENCES TB_ESTADO ( ID_ESTADO ) ;

ALTER TABLE TB_INTERACOES ADD CONSTRAINT FK_EVENTO_INTE FOREIGN KEY ( ID_EVENTO ) REFERENCES TB_EVENTO ( ID_EVENTO ) ;

ALTER TABLE TB_INTERACOES ADD CONSTRAINT FK_INCI_INTE FOREIGN KEY ( ID_INCIDENTES ) REFERENCES TB_INCIDENTES_POLUICAO ( ID_INCIDENTES ) ;

ALTER TABLE TB_USUARIO ADD CONSTRAINT FK_PERFIL_USUARIO FOREIGN KEY ( ID_PERFIL ) REFERENCES TB_PERFIL ( ID_PERFIL ) ;

ALTER TABLE TB_TIPO_INTERACAO ADD CONSTRAINT FK_RECOMPENSA_TP FOREIGN KEY ( ID_RECOMPENSA ) REFERENCES TB_RECOMPENSA ( ID_RECOMPENSA ) ;

ALTER TABLE TB_TIPO_EVENTO ADD CONSTRAINT FK_REGIAO_TP_EV FOREIGN KEY ( ID_REGIAO ) REFERENCES TB_REGIAO ( ID_REGIAO ) ;

ALTER TABLE TB_USUARIO ADD CONSTRAINT "FK_REGIAO_USUARIO " FOREIGN KEY ( ID_REGIAO ) REFERENCES TB_REGIAO ( ID_REGIAO ) ;

ALTER TABLE TB_EVENTO ADD CONSTRAINT FK_TP_EVENTO FOREIGN KEY ( ID_TIPO_EVENTO ) REFERENCES TB_TIPO_EVENTO ( ID_TIPO_EVENTO ) ;

ALTER TABLE TB_INCIDENTES_POLUICAO ADD CONSTRAINT FK_TP_INCI FOREIGN KEY ( ID_TP_INCIDENTE ) REFERENCES TB_TIPOS_INCIDENTE ( ID_TP_INCIDENTE ) ;

ALTER TABLE TB_INTERACOES ADD CONSTRAINT FK_TP_INTE FOREIGN KEY ( ID_TP_INTERACAO ) REFERENCES TB_TIPO_INTERACAO ( ID_TP_INTERACAO ) ;

ALTER TABLE TB_RECOMPENSA ADD CONSTRAINT "FK_TP_RECOMPENSA " FOREIGN KEY ( ID_TP_RECOMPENSA ) REFERENCES TB_TIPO_RECOMPENSA ( ID_TP_RECOMPENSA ) ;

ALTER TABLE TB_INTERACOES ADD CONSTRAINT FK_USUARIO_INTE FOREIGN KEY ( ID_USUARIO ) REFERENCES TB_USUARIO ( ID_USUARIO ) ;



DROP TABLE TB_ESTADO CASCADE CONSTRAINTS ;

DROP TABLE TB_EVENTO CASCADE CONSTRAINTS ;

DROP TABLE TB_INCIDENTES_POLUICAO CASCADE CONSTRAINTS ;

DROP TABLE TB_INTERACOES CASCADE CONSTRAINTS ;

DROP TABLE TB_PERFIL CASCADE CONSTRAINTS ;

DROP TABLE TB_RECOMPENSA CASCADE CONSTRAINTS ;

DROP TABLE TB_REGIAO CASCADE CONSTRAINTS ;

DROP TABLE TB_TIPOS_INCIDENTE CASCADE CONSTRAINTS ;

DROP TABLE TB_TIPO_EVENTO CASCADE CONSTRAINTS ;

DROP TABLE TB_TIPO_INTERACAO CASCADE CONSTRAINTS ;

DROP TABLE TB_TIPO_RECOMPENSA CASCADE CONSTRAINTS ;

DROP TABLE TB_USUARIO CASCADE CONSTRAINTS ;
