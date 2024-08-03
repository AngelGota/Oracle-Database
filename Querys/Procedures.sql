-- Prueba técnica Nª1 - Angelo Smith Gomez Tapia
-- Procedures: PackageHospital y BodyProcedures
-- Creacion de paquete para proceduresHospital
CREATE OR REPLACE PACKAGE pkg_hospital AS
    -- Procedimiento para insertar
    PROCEDURE sp_hospital_insertar (
        p_idHospital IN NUMBER,
        p_idDistrito IN NUMBER,
        p_nombreHospital IN VARCHAR2,
        p_antiguedad IN NUMBER,
        p_area IN NUMBER,
        p_idSede IN NUMBER,
        p_idGerente IN NUMBER,
        p_idCondicion IN NUMBER
    );
    
    -- Procedimiento para actualizar
    PROCEDURE sp_hospital_actualizar (
        p_idHospital IN NUMBER,
        p_idDistrito IN NUMBER,
        p_nombreHospital IN VARCHAR2,
        p_antiguedad IN NUMBER,
        p_area IN NUMBER,
        p_idSede IN NUMBER,
        p_idGerente IN NUMBER,
        p_idCondicion IN NUMBER
    );

    -- Procedimiento para listar hospitales por ID
    PROCEDURE sp_hospital_listar_por_id (
        p_idHospital IN NUMBER,
        p_cursor OUT SYS_REFCURSOR
    );
    
    -- Procedimiento para listar todos los hospitales
    PROCEDURE sp_hospital_listar_todos (
        p_cursor OUT SYS_REFCURSOR
    );
    
    -- Procedimiento para listar hospitales por sede
    PROCEDURE sp_hospital_listar_por_sede (
        p_idSede IN NUMBER,
        p_cursor OUT SYS_REFCURSOR
    );
    
END pkg_hospital;
/

-- Creacion de body para proceduresHospital
CREATE OR REPLACE PACKAGE BODY pkg_hospital AS

    -- SP: Inserciones ****
    PROCEDURE sp_hospital_insertar (
        p_idHospital IN NUMBER,
        p_idDistrito IN NUMBER,
        p_nombreHospital IN VARCHAR2,
        p_antiguedad IN NUMBER,
        p_area IN NUMBER,
        p_idSede IN NUMBER,
        p_idGerente IN NUMBER,
        p_idCondicion IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Hospital (
            idHospital,
            idDistrito,
            nombreHospital,
            antiguedad,
            area,
            idSede,
            idGerente,
            idCondicion            
        ) VALUES (
            p_idHospital,
            p_idDistrito,
            p_nombreHospital,
            p_antiguedad,
            p_area,
            p_idSede,
            p_idGerente,
            p_idCondicion
        );
    END sp_hospital_insertar;

    -- SP: Actualizacion ****
    PROCEDURE sp_hospital_actualizar (
        p_idHospital IN NUMBER,
        p_idDistrito IN NUMBER,
        p_nombreHospital IN VARCHAR2,
        p_antiguedad IN NUMBER,
        p_area IN NUMBER,
        p_idSede IN NUMBER,
        p_idGerente IN NUMBER,
        p_idCondicion IN NUMBER
    ) IS
    BEGIN
        UPDATE Hospital
        SET
            idDistrito = p_idDistrito,
            nombreHospital = p_nombreHospital,
            antiguedad = p_antiguedad,
            area = p_area,
            idSede = p_idSede,
            idGerente = p_idGerente,
            idCondicion = p_idCondicion
        WHERE idHospital = p_idHospital;
    END sp_hospital_actualizar;

    -- SP: Eliminacion ****
    PROCEDURE sp_hospital_eliminar (
        p_idHospital IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Hospital
        WHERE idHospital = p_idHospital;
    END sp_hospital_eliminar;

    -- SP: Listar por ID ****
    PROCEDURE sp_hospital_listar_por_id (
        p_idHospital IN NUMBER,
        p_cursor OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_cursor FOR
        SELECT * FROM Hospital
        WHERE idHospital = p_idHospital;
    END sp_hospital_listar_por_id;

    -- SP: Listar todos ****
    PROCEDURE sp_hospital_listar_todos (
        p_cursor OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_cursor FOR
        SELECT * FROM Hospital;
    END sp_hospital_listar_todos;

    -- SP: Listar por sede ****
    PROCEDURE sp_hospital_listar_por_sede (
        p_idSede IN NUMBER,
        p_cursor OUT SYS_REFCURSOR
    ) IS
    BEGIN
        OPEN p_cursor FOR
        SELECT * FROM Hospital
        WHERE idSede = p_idSede;
    END sp_hospital_listar_por_sede;

END pkg_hospital;
/

commit;