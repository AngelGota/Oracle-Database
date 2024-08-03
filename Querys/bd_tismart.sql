-- Prueba técnica Nª1 - Angelo Smith Gomez Tapia
-- Creacion de tablas 
CREATE TABLE Gerente (
    idGerente NUMBER PRIMARY KEY,
    nombreGerente VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Condicion (
    idCondicion NUMBER PRIMARY KEY,
    descripcionCondicion VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Provincia (
    idProvincia NUMBER PRIMARY KEY,
    nombreProvincia VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Distrito (
    idDistrito NUMBER PRIMARY KEY,
    idProvincia NUMBER NOT NULL,
    nombreDistrito VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL,
    CONSTRAINT fk_provincia FOREIGN KEY (idProvincia) REFERENCES Provincia(idProvincia)
);

CREATE TABLE Sede (
    idSede NUMBER PRIMARY KEY,
    nombreSede VARCHAR2(50) NOT NULL,
    fechaRegistro DATE NOT NULL
);

CREATE TABLE Hospital (
    idHospital NUMBER PRIMARY KEY,
    idDistrito NUMBER NOT NULL,
    nombreHospital VARCHAR2(100) NOT NULL,
    antiguedad NUMBER,
    area NUMBER(38,2),
    idSede NUMBER NOT NULL,
    idGerente NUMBER NOT NULL,
    idCondicion NUMBER NOT NULL,
    fechaRegistro DATE,
    CONSTRAINT fk_distrito FOREIGN KEY (idDistrito) REFERENCES Distrito(idDistrito),
    CONSTRAINT fk_sede FOREIGN KEY (idSede) REFERENCES Sede(idSede),
    CONSTRAINT fk_gerente FOREIGN KEY (idGerente) REFERENCES Gerente(idGerente),
    CONSTRAINT fk_condicion FOREIGN KEY (idCondicion) REFERENCES Condicion(idCondicion)
);

-- Triggers
CREATE OR REPLACE TRIGGER trg_gerente_fechaRegistro
BEFORE INSERT ON Gerente
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_condicion_fechaRegistro
BEFORE INSERT ON Condicion
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_provincia_fechaRegistro
BEFORE INSERT ON Provincia
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_distrito_fechaRegistro
BEFORE INSERT ON Distrito
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_sede_fechaRegistro
BEFORE INSERT ON Sede
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_hospital_fechaRegistro
BEFORE INSERT ON Hospital
FOR EACH ROW
BEGIN
    :NEW.fechaRegistro := SYSDATE;
END;
/

-- Insercion de datos
INSERT INTO Gerente (idGerente, nombreGerente) VALUES (1, 'Angelo Gomez');
INSERT INTO Gerente (idGerente, nombreGerente) VALUES (2, 'Alfredo Perez');
INSERT INTO Gerente (idGerente, nombreGerente) VALUES (3, 'Rosalia Martinez');
INSERT INTO Gerente (idGerente, nombreGerente) VALUES (4, 'Benjamin Sanchez');
INSERT INTO Gerente (idGerente, nombreGerente) VALUES (5, 'William Cabrera');

INSERT INTO Condicion (idCondicion, descripcionCondicion) VALUES (1, 'Operativo');
INSERT INTO Condicion (idCondicion, descripcionCondicion) VALUES (2, 'No operativo');
INSERT INTO Condicion (idCondicion, descripcionCondicion) VALUES (3, 'En mantenimiento');

INSERT INTO Provincia (idProvincia, nombreProvincia) VALUES (1, 'Lima');
INSERT INTO Provincia (idProvincia, nombreProvincia) VALUES (2, 'Chiclayo');
INSERT INTO Provincia (idProvincia, nombreProvincia) VALUES (3, 'Trujillo');
INSERT INTO Provincia (idProvincia, nombreProvincia) VALUES (4, 'Ica');
INSERT INTO Provincia (idProvincia, nombreProvincia) VALUES (5, 'Cuzco');

INSERT INTO Distrito (idDistrito, idProvincia, nombreDistrito) VALUES (1, 1, 'Miraflores');
INSERT INTO Distrito (idDistrito, idProvincia, nombreDistrito) VALUES (2, 2, 'Santa Victoria');
INSERT INTO Distrito (idDistrito, idProvincia, nombreDistrito) VALUES (3, 3, 'Victor Larco Herrera');
INSERT INTO Distrito (idDistrito, idProvincia, nombreDistrito) VALUES (4, 4, 'Ica');
INSERT INTO Distrito (idDistrito, idProvincia, nombreDistrito) VALUES (5, 5, 'Cuzco');

INSERT INTO Sede (idSede, nombreSede) VALUES (1, 'SDS LIMA');
INSERT INTO Sede (idSede, nombreSede) VALUES (2, 'SDS CHICLAYO');
INSERT INTO Sede (idSede, nombreSede) VALUES (3, 'SDS TRUJILLO');
INSERT INTO Sede (idSede, nombreSede) VALUES (4, 'SDS ICA');
INSERT INTO Sede (idSede, nombreSede) VALUES (5, 'SDS CUZCO');

select * from Gerente;
select * from Hospital;
select * from Condicion;
select * from Provincia;
select * from Distrito;
select * from Sede;

commit;


