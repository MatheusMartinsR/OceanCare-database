-- PACKAGES


-- Criação do package specification
CREATE OR REPLACE PACKAGE AUDIT_PKG AS
    PROCEDURE AUDIT_TB_USUARIO;
    PROCEDURE AUDIT_TB_INTERACOES;
END AUDIT_PKG;


-- Criação do package body
CREATE OR REPLACE PACKAGE BODY AUDIT_PKG AS

    PROCEDURE AUDIT_TB_USUARIO IS
        v_operacao VARCHAR2(10);
        v_dados_antes CLOB;
        v_dados_depois CLOB;
    BEGIN
        IF INSERTING THEN
            v_operacao := 'INSERT';
            v_dados_depois := 'ID_USUARIO=' || :NEW.ID_USUARIO || ', ID_PERFIL=' || :NEW.ID_PERFIL || 
                              ', ID_REGIAO=' || :NEW.ID_REGIAO || ', EMAIL_USUARIO=' || :NEW.EMAIL_USUARIO || 
                              ', CNPJ_USUARIO=' || :NEW.CNPJ_USUARIO || ', CPF_USUARIO=' || :NEW.CPF_USUARIO;
        ELSIF UPDATING THEN
            v_operacao := 'UPDATE';
            v_dados_antes := 'ID_USUARIO=' || :OLD.ID_USUARIO || ', ID_PERFIL=' || :OLD.ID_PERFIL || 
                             ', ID_REGIAO=' || :OLD.ID_REGIAO || ', EMAIL_USUARIO=' || :OLD.EMAIL_USUARIO || 
                             ', CNPJ_USUARIO=' || :OLD.CNPJ_USUARIO || ', CPF_USUARIO=' || :OLD.CPF_USUARIO;
            v_dados_depois := 'ID_USUARIO=' || :NEW.ID_USUARIO || ', ID_PERFIL=' || :NEW.ID_PERFIL || 
                              ', ID_REGIAO=' || :NEW.ID_REGIAO || ', EMAIL_USUARIO=' || :NEW.EMAIL_USUARIO || 
                              ', CNPJ_USUARIO=' || :NEW.CNPJ_USUARIO || ', CPF_USUARIO=' || :NEW.CPF_USUARIO;
        ELSIF DELETING THEN
            v_operacao := 'DELETE';
            v_dados_antes := 'ID_USUARIO=' || :OLD.ID_USUARIO || ', ID_PERFIL=' || :OLD.ID_PERFIL || 
                             ', ID_REGIAO=' || :OLD.ID_REGIAO || ', EMAIL_USUARIO=' || :OLD.EMAIL_USUARIO || 
                             ', CNPJ_USUARIO=' || :OLD.CNPJ_USUARIO || ', CPF_USUARIO=' || :OLD.CPF_USUARIO;
        END IF;
     
        INSERT INTO TB_AUDITORIA (ID_AUDITORIA, TABELA, OPERACAO, USUARIO, DATA_HORA, DADOS_ANTES, DADOS_DEPOIS)
        VALUES (SEQ_AUDITORIA.NEXTVAL, 'TB_USUARIO', v_operacao, USER, SYSTIMESTAMP, v_dados_antes, v_dados_depois);
    END AUDIT_TB_USUARIO;

    PROCEDURE AUDIT_TB_INTERACOES IS
        v_operacao VARCHAR2(10);
        v_dados_antes CLOB;
        v_dados_depois CLOB;
    BEGIN
        IF INSERTING THEN
            v_operacao := 'INSERT';
            v_dados_depois := 'ID_INTERACOES=' || :NEW.ID_INTERACOES || ', ID_USUARIO=' || :NEW.ID_USUARIO || 
                              ', ID_EVENTO=' || :NEW.ID_EVENTO || ', ID_TP_INTERACAO=' || :NEW.ID_TP_INTERACO || 
                              ', ID_INCIDENTES=' || :NEW.ID_INCIDENTES || ', INTERACOES=' || :NEW.INTERACOES;
        ELSIF UPDATING THEN
            v_operacao := 'UPDATE';
            v_dados_antes := 'ID_INTERACOES=' || :OLD.ID_INTERACOES || ', ID_USUARIO=' || :OLD.ID_USUARIO || 
                             ', ID_EVENTO=' || :OLD.ID_EVENTO || ', ID_TP_INTERACO=' || :OLD.ID_TP_INTERACO || 
                             ', ID_INCIDENTES=' || :OLD.ID_INCIDENTES || ', INTERACOES=' || :OLD.INTERACOES;
            v_dados_depois := 'ID_INTERACOES=' || :NEW.ID_INTERACOES || ', ID_USUARIO=' || :NEW.ID_USUARIO || 
                              ', ID_EVENTO=' || :NEW.ID_EVENTO || ', ID_TP_INTERACOES=' || :NEW.ID_TP_INTERACO || 
                              ', ID_INCIDENTES=' || :NEW.ID_INCIDENTES || ', INTERACOES=' || :NEW.INTERACOES;
        ELSIF DELETING THEN
            v_operacao := 'DELETE';
            v_dados_antes := 'ID_INTERACOES=' || :OLD.ID_INTERACOES || ', ID_USUARIO=' || :OLD.ID_USUARIO || 
                             ', ID_EVENTO=' || :OLD.ID_EVENTO || ', ID_TP_INTERACO=' || :OLD.ID_TP_INTERACO || 
                             ', ID_INCIDENTES=' || :OLD.ID_INCIDENTES || ', INTERACOES=' || :OLD.INTERACOES;
        END IF;
     
        INSERT INTO TB_AUDITORIA (ID_AUDITORIA, TABELA, OPERACAO, USUARIO, DATA_HORA, DADOS_ANTES, DADOS_DEPOIS)
        VALUES (SEQ_AUDITORIA.NEXTVAL, 'TB_INTERACOES', v_operacao, USER, SYSTIMESTAMP, v_dados_antes, v_dados_depois);
    END AUDIT_TB_INTERACOES;

END AUDIT_PKG;
