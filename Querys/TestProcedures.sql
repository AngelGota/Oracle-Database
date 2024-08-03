-- Procedures:Function tests
-- SP TEST: Inserciones **** Passed
BEGIN
    pkg_hospital.sp_hospital_insertar(
        p_idHospital => 4,
        p_idDistrito => 1,
        p_nombreHospital => 'Hospital Central',
        p_antiguedad => 10,
        p_area => 1500,
        p_idSede => 1,
        p_idGerente => 1,
        p_idCondicion => 1
    );
END;
/

-- SP TEST: Actualizacion **** Passed
BEGIN
    pkg_hospital.sp_hospital_actualizar(
        p_idHospital => 2,
        p_idDistrito => 4,
        p_nombreHospital => 'Hospital de Trujillo',
        p_antiguedad => 30,
        p_area => 1600,
        p_idSede => 1,
        p_idGerente => 1,
        p_idCondicion => 1
    );
END;
/

-- SP TEST: Eliminacion **** Passed
BEGIN
    pkg_hospital.sp_hospital_eliminar(
        p_idHospital => 1
    );
END;
/

-- SP TEST: Listar todos **** 
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_record Hospital%ROWTYPE;
BEGIN
    pkg_hospital.sp_hospital_listar_todos(p_cursor => v_cursor);

    LOOP
        FETCH v_cursor INTO v_record;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_record.idHospital || ' | ' || v_record.idDistrito || ' | ' || v_record.nombreHospital || ' | ' || v_record.antiguedad || ' | ' || v_record.area || ' | ' || v_record.idSede || ' | ' || v_record.idGerente || ' | ' || v_record.idCondicion);
    END LOOP;

    CLOSE v_cursor;
END;
/

-- SP TEST: Listar por ID **** 
DECLARE
    v_cursor SYS_REFCURSOR;
    v_record Hospital%ROWTYPE;
BEGIN
    pkg_hospital.sp_hospital_listar_por_id(
        p_idHospital => 2,
        p_cursor => v_cursor
    );

    LOOP
        FETCH v_cursor INTO v_record;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_record.idHospital || ' | ' || v_record.idDistrito || ' | ' || v_record.nombreHospital || ' | ' || v_record.antiguedad || ' | ' || v_record.area || ' | ' || v_record.idSede || ' | ' || v_record.idGerente || ' | ' || v_record.idCondicion);
    END LOOP;

    CLOSE v_cursor;
END;
/

-- SP TEST: Listar por Sede **** 
DECLARE
    v_cursor SYS_REFCURSOR;
    v_record Hospital%ROWTYPE;
BEGIN
    pkg_hospital.sp_hospital_listar_por_sede(
        p_idSede => 2,
        p_cursor => v_cursor
    );

    LOOP
        FETCH v_cursor INTO v_record;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_record.idHospital || ' | ' || v_record.idDistrito || ' | ' || v_record.nombreHospital || ' | ' || v_record.antiguedad || ' | ' || v_record.area || ' | ' || v_record.idSede || ' | ' || v_record.idGerente || ' | ' || v_record.idCondicion);
    END LOOP;

    CLOSE v_cursor;
END;
/

commit;

