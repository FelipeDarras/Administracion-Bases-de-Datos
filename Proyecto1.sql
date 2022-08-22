
CREATE SCHEMA IF NOT EXISTS `mibase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mibase` ;

-- TABLA MATERIA
CREATE TABLE IF NOT EXISTS `mibase`.`materia` (
  `idMateria` INT NOT NULL AUTO_INCREMENT,
  `Materia` VARCHAR(30) NOT NULL,
  `Eliminado` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  UNIQUE INDEX `Materia` (`Materia` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA ASIGNATURA
CREATE TABLE IF NOT EXISTS `mibase`.`asignatura` (
  `IdAsignatura` INT NOT NULL AUTO_INCREMENT,
  `Asignatura` VARCHAR(30) NULL DEFAULT NULL,
  `MateriaAsignatura` INT NOT NULL,
  `Eliminado` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`IdAsignatura`),
  INDEX `MateriaAsignatura` (`MateriaAsignatura` ASC) VISIBLE,
  CONSTRAINT `asignatura_ibfk_1`
    FOREIGN KEY (`MateriaAsignatura`)
    REFERENCES `mibase`.`materia` (`idMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA DOCENTE
CREATE TABLE IF NOT EXISTS `mibase`.`docente` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Documento` VARCHAR(45) NULL DEFAULT NULL,
  `FNac` DATE NULL DEFAULT NULL,
  `Edad` INT NULL DEFAULT NULL,
  `Grado` INT NULL DEFAULT NULL,
  `Fingreso` DATE NULL DEFAULT NULL,
  `Eliminado` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mibase`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mibase`.`curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(30) NOT NULL,
  `AsignaturaCurso` INT NOT NULL,
  `Docente` INT NULL DEFAULT NULL,
  `Puntaje` INT NULL DEFAULT NULL,
  `Edicion` INT NULL DEFAULT NULL,
  `Anno` INT NULL DEFAULT NULL,
  `Eliminado` TINYINT NULL DEFAULT NULL,
  `Estado` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `AsignaturaCurso` (`AsignaturaCurso` ASC) VISIBLE,
  INDEX `Docente` (`Docente` ASC) VISIBLE,
  CONSTRAINT `curso_ibfk_1`
    FOREIGN KEY (`AsignaturaCurso`)
    REFERENCES `mibase`.`asignatura` (`IdAsignatura`),
  CONSTRAINT `curso_ibfk_2`
    FOREIGN KEY (`Docente`)
    REFERENCES `mibase`.`docente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA ESTUDIANTE
CREATE TABLE IF NOT EXISTS `mibase`.`estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  `Documento` VARCHAR(15) NULL DEFAULT NULL,
  `Nombre` VARCHAR(30) NULL DEFAULT NULL,
  `Apellido` VARCHAR(30) NULL DEFAULT NULL,
  `FechaNacimiento` DATE NULL DEFAULT NULL,
  `Edad` SMALLINT NULL DEFAULT NULL,
  `FechaIngreso` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA EXAMEN
CREATE TABLE IF NOT EXISTS `mibase`.`examen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Curso` INT NOT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Eliminado` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `ExamenCurso_idx` (`Curso` ASC) VISIBLE,
  CONSTRAINT `ExamenCurso`
    FOREIGN KEY (`Curso`)
    REFERENCES `mibase`.`curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA INSCRIPCIONES
CREATE TABLE IF NOT EXISTS `mibase`.`inscripciones` (
  `idInscripcionesCurso` INT NOT NULL AUTO_INCREMENT,
  `EstudianteInscrito` INT NOT NULL,
  `CursoInscrito` INT NOT NULL,
  PRIMARY KEY (`idInscripcionesCurso`),
  INDEX `EstudianteInscrito` (`EstudianteInscrito` ASC) VISIBLE,
  INDEX `CursoInscrito` (`CursoInscrito` ASC) VISIBLE,
  CONSTRAINT `inscripciones_ibfk_1`
    FOREIGN KEY (`EstudianteInscrito`)
    REFERENCES `mibase`.`estudiante` (`idEstudiante`),
  CONSTRAINT `inscripciones_ibfk_2`
    FOREIGN KEY (`CursoInscrito`)
    REFERENCES `mibase`.`curso` (`idCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- TABLA RENDICIONEXAMEN
CREATE TABLE IF NOT EXISTS `mibase`.`RendicionExamen` (
  `idRendicionExamen` INT NOT NULL AUTO_INCREMENT,
  `Examen` INT NOT NULL,
  `Inscripcion` INT NOT NULL,
  `Nota` TINYINT NULL,
  PRIMARY KEY (`idRendicionExamen`),
  INDEX `Inscripcion_idx` (`Inscripcion` ASC) VISIBLE,
  INDEX `Examen_idx` (`Examen` ASC) VISIBLE,
  CONSTRAINT `Inscripcion`
    FOREIGN KEY (`Inscripcion`)
    REFERENCES `mibase`.`inscripciones` (`idInscripcionesCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Examen`
    FOREIGN KEY (`Examen`)
    REFERENCES `mibase`.`examen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

