-- DUAS PROCEDURES DE CONSULTA

-- DUAS PROCEDURES DE CONSULTA
CREATE OR REPLACE PROCEDURE RELATORIO_INTERACOES_USUARIO_EVENTO IS
    CURSOR cur_interacoes IS
        SELECT 
            u.ID_USUARIO,
            u.EMAIL_USUARIO,
            e.NOME_EVENTO,
            COUNT(i.ID_INTERACOES) AS TOTAL_INTERACOES
        FROM 
            TB_USUARIO u
            JOIN TB_INTERACOES i ON u.ID_USUARIO = i.ID_USUARIO
            JOIN TB_EVENTO e ON i.ID_EVENTO = e.ID_EVENTO
        GROUP BY 
            u.ID_USUARIO,
            u.EMAIL_USUARIO,
            e.NOME_EVENTO
        ORDER BY 
            u.ID_USUARIO, 
            e.NOME_EVENTO;
BEGIN
    FOR rec IN cur_interacoes LOOP
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || rec.EMAIL_USUARIO || ' - Evento: ' || rec.NOME_EVENTO || ' - Total de Interações: ' || rec.TOTAL_INTERACOES);
    END LOOP;
END;


CREATE OR REPLACE PROCEDURE RELATORIO_PONTOS_TIPO_INTERACAO IS
    CURSOR cur_pontos IS
        SELECT 
            ti.DESCRICAO_TIPO,
            SUM(CAST(ti.PONTOS AS NUMBER)) AS TOTAL_PONTOS
        FROM 
            TB_TIPO_INTERACAO ti
            JOIN TB_INTERACOES i ON ti.ID_TP_INTERACAO = i.ID_TP_INTERACAO
        GROUP BY 
            ti.DESCRICAO_TIPO
        ORDER BY 
            TOTAL_PONTOS DESC;
BEGIN
    FOR rec IN cur_pontos LOOP
        DBMS_OUTPUT.PUT_LINE('Tipo de Interação: ' || rec.DESCRICAO_TIPO || ' - Total de Pontos: ' || rec.TOTAL_PONTOS);
    END LOOP;
END;
