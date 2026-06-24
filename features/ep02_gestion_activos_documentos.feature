# language: es

Característica: Gestión de activos y documentos digitales
  Como usuario titular de LegadoDigital 
  Quiero registrar activos digitales y cargar documentos importantes
  Para mantener mi información digital organizada y resguardada en un solo lugar

  @US06 @funcional @activo_digital
  Escenario: AT-US06-01 Registro exitoso de activo digital
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y se encuentra en la sección "Activos digitales"
    Cuando selecciona la opción "Registrar activo"
    Y completa el nombre "Cuenta bancaria principal"
    Y selecciona la categoría "Cuenta financiera"
    Y registra una descripción válida del activo digital
    Y presiona el botón "Guardar"
    Entonces el sistema registra el activo digital correctamente
    Y muestra el mensaje "Activo digital registrado correctamente"
    Y el activo aparece en la lista de activos digitales del usuario titular

  @US06 @funcional @validacion
  Escenario: AT-US06-02 Validación de datos obligatorios en el registro de activo
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y se encuentra en el formulario de registro de activo digital
    Cuando intenta guardar el activo sin completar el nombre
    Entonces el sistema no registra el activo digital
    Y muestra el mensaje "El nombre del activo es obligatorio" 

  @US06 @funcional @duplicado
  Escenario: AT-US06-03 Registro de activo digital duplicado
    Dado que el usuario titular ya tiene registrado un activo llamado "Cuenta bancaria principal"
    Y se encuentra en la sección "Activos digitales"
    Cuando intenta registrar otro activo con el mismo nombre y categoría  
    Entonces el sistema solicita confirmar si desea registrar un activo similar 
    Y no duplica el activo sin confirmación del usuario titular.

  @US10 @funcional @documento
  Escenario: AT-US10-01 Carga exitosa de documento importante
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y se encuentra en la sección "Documentos importantes"
    Cuando selecciona la opción "Cargar documento"
    Y adjunta el archivo "testamento.pdf"
    Y ingresa el título "Testamento digital"
    Y selecciona la categoría "Documento legal"
    Y presiona el botón "Guardar"
    Entonces el sistema carga el documento correctamente
    Y muestra el mensaje "Documento cargado correctamente"
    Y el documento aparece en el repositorio del usuario titular

  @US10 @funcional @formato
  Escenario: AT-US10-02 Validación de formato de documento permitido
    Dado que el usuario titular se encuentra en el formulario de carga de documentos
    Cuando adjunta un archivo con formato no permitido
    Entonces el sistema no permite cargar el documento
    Y muestra el mensaje "Formato de archivo no permitido"

  @US10 @funcional @archivo_obligatorio
  Escenario: AT-US10-03 Validación de archivo obligatorio
    Dado que el usuario titular se encuentra en el formulario de carga de documentos
    Cuando intenta guardar el registro sin adjuntar un archivo
    Entonces el sistema no registra el documento
    Y muestra el mensaje "Debe adjuntar un documento para continuar"
