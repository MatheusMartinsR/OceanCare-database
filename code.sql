CREATE TABLE tb_usuario (
    id_usuario    NUMBER(5) NOT NULL,
    id_recompensa NUMBER(5) NOT NULL,
    id_missao     NUMBER(5) NOT NULL,
    email_usuario VARCHAR2(100) NOT NULL,
    senha_usuario VARCHAR2(100) NOT NULL,
    cnpj_usuario  VARCHAR2(14),
    cpf_usuario   VARCHAR2(11) NOT NULL
);

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( id_usuario );


CREATE TABLE tb_recompensas (
    id_recompensa        NUMBER(5) NOT NULL,
    nome_recompensa      VARCHAR2(100) NOT NULL,
    descricao_recompensa VARCHAR2(100) NOT NULL,
    tipo_recompensa      VARCHAR2(100) NOT NULL,
    status_recompensa    VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_recompensas ADD CONSTRAINT tb_recompensas_pk PRIMARY KEY ( id_recompensa );

CREATE TABLE tb_evento (
    id_evento        NUMBER(5) NOT NULL,
    id_usuario       NUMBER(5) NOT NULL,
    nome_evento      VARCHAR2(100) NOT NULL,
    descricao_evento VARCHAR2(100) NOT NULL,
    data_evento      DATE NOT NULL,
    local_evento     VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_evento ADD CONSTRAINT tb_evento_pk PRIMARY KEY ( id_evento );

CREATE TABLE tb_estatistica (
    id_estatistica        NUMBER(5) NOT NULL,
    id_evento             NUMBER(5) NOT NULL,
    descricao_estatistica VARCHAR2(100) NOT NULL,
    data_coleta_estat     DATE NOT NULL,
    fonte_estatistica     VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX tb_estatistica__idx ON
    tb_estatistica (
        id_evento
    ASC );

ALTER TABLE tb_estatistica ADD CONSTRAINT tb_estatistica_pk PRIMARY KEY ( id_estatistica );

CREATE TABLE tb_conteudo_edu (
    id_conteudo        NUMBER(5) NOT NULL,
    id_usuario         NUMBER(5) NOT NULL,
    titulo_conteudo    VARCHAR2(100) NOT NULL,
    descricao_conteudo VARCHAR2(100) NOT NULL,
    url_conteudo       VARCHAR2(100)
);

ALTER TABLE tb_conteudo_edu ADD CONSTRAINT tb_conteudo_edu_pk PRIMARY KEY ( id_conteudo );


CREATE TABLE tb_missoes (
    id_missao        NUMBER(5) NOT NULL,
    descricao_missao VARCHAR2(100) NOT NULL,
    tipo_missao      VARCHAR2(100) NOT NULL,
    objetivo_missao  VARCHAR2(100) NOT NULL,
    progresso_missao VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_missoes ADD CONSTRAINT tb_missoes_pk PRIMARY KEY ( id_missao );

CREATE TABLE tb_ranking (
    id_ranking        NUMBER(5) NOT NULL,
    id_usuario        NUMBER(5) NOT NULL,
    posicao_ranking   VARCHAR2(100) NOT NULL,
    pontuacao_ranking VARCHAR2(100) NOT NULL,
    dt_atualizacao    DATE NOT NULL
);

ALTER TABLE tb_ranking ADD CONSTRAINT tb_ranking_pk PRIMARY KEY ( id_ranking );

CREATE TABLE tb_participacao_evento (
    id_participacao          NUMBER(5) NOT NULL,
    id_evento                NUMBER(5) NOT NULL,
    data_participacao        DATE NOT NULL,
    comentarios_participacao VARCHAR2(100) NOT NULL,
    pontos_participacao      VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_participacao_evento ADD CONSTRAINT tb_participacao_evento_pk PRIMARY KEY ( id_participacao );


CREATE TABLE tb_relatorios_poluicao (
    id_relatorio          NUMBER(5) NOT NULL,
    id_usuario            NUMBER(5) NOT NULL,
    data_relatorio        DATE NOT NULL,
    localizacao_relatorio VARCHAR2(100) NOT NULL,
    tipo_poluente         VARCHAR2(100) NOT NULL,
    descricao_incidente   VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_relatorios_poluicao ADD CONSTRAINT tb_relatorios_poluicao_pk PRIMARY KEY ( id_relatorio );


ALTER TABLE tb_estatistica
    ADD CONSTRAINT fk_evento_estatistica FOREIGN KEY ( id_evento )
        REFERENCES tb_evento ( id_evento );

ALTER TABLE tb_participacao_evento
    ADD CONSTRAINT fk_evento_participacao FOREIGN KEY ( id_evento )
        REFERENCES tb_evento ( id_evento );

ALTER TABLE tb_usuario
    ADD CONSTRAINT fk_missao_usuario FOREIGN KEY ( id_missao )
        REFERENCES tb_missoes ( id_missao );

ALTER TABLE tb_usuario
    ADD CONSTRAINT "FK_RECOMPENSA_USUARIO " FOREIGN KEY ( id_recompensa )
        REFERENCES tb_recompensas ( id_recompensa );

ALTER TABLE tb_conteudo_edu
    ADD CONSTRAINT fk_usuario_conteudo FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_evento
    ADD CONSTRAINT fk_usuario_evento FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_ranking
    ADD CONSTRAINT fk_usuario_ranking FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_relatorios_poluicao
    ADD CONSTRAINT fk_usuario_relatorio FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );


DROP TABLE tb_conteudo_edu CASCADE CONSTRAINTS;

DROP TABLE tb_estatistica CASCADE CONSTRAINTS;

DROP TABLE tb_evento CASCADE CONSTRAINTS;

DROP TABLE tb_missoes CASCADE CONSTRAINTS;

DROP TABLE tb_participacao_evento CASCADE CONSTRAINTS;

DROP TABLE tb_ranking CASCADE CONSTRAINTS;

DROP TABLE tb_recompensas CASCADE CONSTRAINTS;

DROP TABLE tb_relatorios_poluicao CASCADE CONSTRAINTS;

DROP TABLE tb_usuario CASCADE CONSTRAINTS;
