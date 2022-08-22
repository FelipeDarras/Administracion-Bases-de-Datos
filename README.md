# Administracion-Bases-de-Datos
Proyectos de curso realizado en Udemy. DBA en MySQL y SQLite

## Proyecto 1
Objetivo
Entender el uso de las sentencias SQL presentadas hasta ahora en el curso y poder aplicarlas con éxito en un caso real, tanto en MySQL como en SQLite, a través del uso de la consola de comandos. También se busca que el/la estudiante vaya interiorizando la forma de estructurar tablas y el modelo mental que se debe manejar para este trabajo.

Lo que debes realizar:
En el curso trabajamos con una primera estructura de tablas relacionadas entre sí, siendo en concreto 5.

Tu tarea es pasar del modelo anterior al que sigue, el cual modifica la estructura de las tablas ya existentes y agrega 3 tablas nuevas.
En concreto, lo que has de realizar paso a paso es lo siguiente:

- Agregar la columna Eliminado de tipo TINYINT a la tabla Materias.

- Ídem anterior para la tabla Asignaturas.

- Agregar la columna Docente de tipo entero a la tabla Cursos, siendo clave foránea hacia la tabla Docentes.

- Agregar también a la tabla Cursos las columnas Puntaje, Edicion, Anno (significa año pero SQL no admite la letra ñ), Eliminado y Estado. Este último figura en el diagrama como tipo enumerado (ENUM), pero tú decláralo como un tipo texto.

- Agregar a la tabla Estudiantes el campo Eliminado de tipo TINYINT o entero.

- Crear la tabla Docentes tal como se muestra en el diagrama. El campo Documento debe declararse como único y no puede ser nulo.

- Crear la tabla RendicionesExamen con los campos que se muestran en el diagrama. La columna Examen es clave foránea hacia la tabla Examenes, y la columna Inscripcion es clave foránea hacia la tabla Inscripciones.

- Crear la tabla Examenes tal como se muestra. La columna Curso es clave foránea a la tabla Cursos.

En la lista anterior no está especificado el orden en que debes hacer estas tareas, así que tendrás que tener en cuenta qué sentencias SQL ejecutar primero para lograr crear la estructura anterior.

Entrega del proyecto
Este proyecto es obligatorio y debe ser entregado ya que será evaluado por un docente. Lo que debes entregar son dos archivos de texto plano, creados con cualquier editor básico, como puede ser el Bloc de Notas o cualquiera que te guste. En un archivo guardarás las sentencias a ejecutar en MySQL para crear la estructura anterior a partir de la original, y en otro guardarás las sentencias SQLite para lograr lo mismo. Al primer archivo lo llamarás EstructuraMySQL.txt y al segundo lo llamarás EstructuraSQLite.txt; también puedes usar la extensión .sql para guardar los archivos.

Enviarás esos dos archivos al correo electrónico bedelia@kaedusoft.edu.uy para que sean corregidos.
