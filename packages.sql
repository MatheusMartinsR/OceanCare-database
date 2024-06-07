-- Criação do cabeçalho do pacote
CREATE OR REPLACE PACKAGE MANAGE_PKG AS
    PROCEDURE MANAGE_TB_TIPO_INTERACAO (
        p_operacao VARCHAR2,
        p_id_tip_interacao NUMBER,
        p_id_incidente NUMBER,
        p_descricao VARCHAR2,
        p_pontuacao NUMBER
    );

    PROCEDURE MANAGE_TB_USUARIO (
        p_operacao VARCHAR2,
        p_id_usuario NUMBER,
        p_id_perfil NUMBER,
        p_id_regiao NUMBER,
        p_email VARCHAR2,
        p_senha VARCHAR2,
        p_data_criacao DATE,
        p_cpf VARCHAR2
    );

    PROCEDURE MANAGE_TB_INTERACOES (
        p_operacao VARCHAR2,
        p_id_interacao NUMBER,
        p_id_usuario NUMBER,
        p_id_tip_interacao NUMBER,
        p_id_incidente NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_INCIDENTES_POLUICAO (
        p_operacao VARCHAR2,
        p_id_incidente NUMBER,
        p_id_usuario NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_TIPOS_INCIDENTE (
        p_operacao VARCHAR2,
        p_id_tipo_incidente NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_RECOMPENSA (
        p_operacao VARCHAR2,
        p_id_recompensa NUMBER,
        p_id_usuario NUMBER,
        p_descricao VARCHAR2,
        p_pontuacao NUMBER
    );

    PROCEDURE MANAGE_TB_TIPO_RECOMPENSA (
        p_operacao VARCHAR2,
        p_id_tip_recompensa NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_PERFIL (
        p_operacao VARCHAR2,
        p_id_perfil NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_EVENTO (
        p_operacao VARCHAR2,
        p_id_evento NUMBER,
        p_descricao VARCHAR2,
        p_data_evento DATE,
        p_localizacao VARCHAR2
    );

    PROCEDURE MANAGE_TB_REGIAO (
        p_operacao VARCHAR2,
        p_id_regiao NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_ESTADO (
        p_operacao VARCHAR2,
        p_id_estado NUMBER,
        p_descricao VARCHAR2
    );

    PROCEDURE MANAGE_TB_TIPO_EVENTO (
        p_operacao VARCHAR2,
        p_id_tip_evento NUMBER,
        p_descricao VARCHAR2
    );
END MANAGE_PKG;


-- Criação do corpo do pacote
CREATE OR REPLACE PACKAGE BODY MANAGE_PKG AS
    PROCEDURE MANAGE_TB_TIPO_INTERACAO (
        p_operacao VARCHAR2,
        p_id_tip_interacao NUMBER,
        p_id_incidente NUMBER,
        p_descricao VARCHAR2,
        p_pontuacao NUMBER
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_TIPO_INTERACAO;

    PROCEDURE MANAGE_TB_USUARIO (
        p_operacao VARCHAR2,
        p_id_usuario NUMBER,
        p_id_perfil NUMBER,
        p_id_regiao NUMBER,
        p_email VARCHAR2,
        p_senha VARCHAR2,
        p_data_criacao DATE,
        p_cpf VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_USUARIO;

    PROCEDURE MANAGE_TB_INTERACOES (
        p_operacao VARCHAR2,
        p_id_interacao NUMBER,
        p_id_usuario NUMBER,
        p_id_tip_interacao NUMBER,
        p_id_incidente NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_INTERACOES;

    PROCEDURE MANAGE_TB_INCIDENTES_POLUICAO (
        p_operacao VARCHAR2,
        p_id_incidente NUMBER,
        p_id_usuario NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_INCIDENTES_POLUICAO;

    PROCEDURE MANAGE_TB_TIPOS_INCIDENTE (
        p_operacao VARCHAR2,
        p_id_tipo_incidente NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_TIPOS_INCIDENTE;

    PROCEDURE MANAGE_TB_RECOMPENSA (
        p_operacao VARCHAR2,
        p_id_recompensa NUMBER,
        p_id_usuario NUMBER,
        p_descricao VARCHAR2,
        p_pontuacao NUMBER
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_RECOMPENSA;

    PROCEDURE MANAGE_TB_TIPO_RECOMPENSA (
        p_operacao VARCHAR2,
        p_id_tip_recompensa NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_TIPO_RECOMPENSA;

    PROCEDURE MANAGE_TB_PERFIL (
        p_operacao VARCHAR2,
        p_id_perfil NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_PERFIL;

    PROCEDURE MANAGE_TB_EVENTO (
        p_operacao VARCHAR2,
        p_id_evento NUMBER,
        p_descricao VARCHAR2,
        p_data_evento DATE,
        p_localizacao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_EVENTO;

    PROCEDURE MANAGE_TB_REGIAO (
        p_operacao VARCHAR2,
        p_id_regiao NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_REGIAO;

    PROCEDURE MANAGE_TB_ESTADO (
        p_operacao VARCHAR2,
        p_id_estado NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_ESTADO;

    PROCEDURE MANAGE_TB_TIPO_EVENTO (
        p_operacao VARCHAR2,
        p_id_tip_evento NUMBER,
        p_descricao VARCHAR2
    ) IS
    BEGIN
        NULL;
    END MANAGE_TB_TIPO_EVENTO;
END MANAGE_PKG;
