-- Criação da package
CREATE OR REPLACE PACKAGE AUDIT_PKG AS
    PROCEDURE AUDIT_TB_USUARIO;
    PROCEDURE AUDIT_TB_INTERACOES;
END AUDIT_PKG;


-- Corpo da package
CREATE OR REPLACE PACKAGE BODY AUDIT_PKG AS
    PROCEDURE AUDIT_TB_USUARIO IS
        v_operacao VARCHAR2(10);
        v_dados_antes CLOB;
        v_dados_depois CLOB;
    BEGIN
        NULL; 
    END AUDIT_TB_USUARIO;

    PROCEDURE AUDIT_TB_INTERACOES IS
        v_operacao VARCHAR2(10);
        v_dados_antes CLOB;
        v_dados_depois CLOB;
    BEGIN
        NULL; 
    END AUDIT_TB_INTERACOES;
END AUDIT_PKG;

