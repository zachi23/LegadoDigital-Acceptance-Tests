# language: es

Característica: Configuración de permisos y reglas de acceso
  Como usuario titular de LegadoDigital
  Quiero configurar niveles de acceso y seleccionar información compartida
  Para controlar qué puede consultar cada beneficiario o persona de confianza

  @US20 @funcional @nivel_acceso
  Escenario: AT-US20-01 Asignación exitosa de nivel de acceso
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y tiene registrado al beneficiario "Ana Pérez"
    Y se encuentra en la sección "Beneficiarios"
    Cuando selecciona al beneficiario "Ana Pérez"
    Y elige la opción "Asignar nivel de acceso"
    Y selecciona el nivel "Parcial"
    Y presiona el botón "Guardar"
    Entonces el sistema asigna el nivel de acceso al beneficiario
    Y muestra el mensaje "Nivel de acceso actualizado correctamente"

  @US20 @funcional @validacion_beneficiario
  Escenario: AT-US20-02 Validación de beneficiario seleccionado
    Dado que el usuario titular se encuentra en la sección "Permisos"
    Cuando intenta asignar un nivel de acceso sin seleccionar un beneficiario
    Entonces el sistema no guarda la configuración
    Y muestra el mensaje "Debe seleccionar un beneficiario"

  @US20 @funcional @actualizacion
  Escenario: AT-US20-03 Actualización de nivel de acceso existente
    Dado que el beneficiario "Ana Pérez" tiene asignado el nivel de acceso "Parcial"
    Y el usuario titular se encuentra en la configuración de permisos
    Cuando cambia el nivel de acceso a "Completo"
    Y confirma la actualización
    Entonces el sistema actualiza el nivel de acceso del beneficiario
    Y registra el cambio en la configuración de permisos

  @US21 @funcional @informacion_compartida
  Escenario: AT-US21-01 Selección exitosa de información compartida
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y tiene registrado al beneficiario "Ana Pérez"
    Y tiene activos y documentos registrados en su cuenta
    Cuando selecciona la opción "Información compartida"
    Y marca el activo "Cuenta bancaria principal"
    Y marca el documento "Testamento digital"
    Y presiona el botón "Guardar"
    Entonces el sistema guarda la información compartida para el beneficiario
    Y muestra el mensaje "Información compartida actualizada correctamente"

  @US21 @funcional @sin_seleccion
  Escenario: AT-US21-02 Validación de información no seleccionada
    Dado que el usuario titular se encuentra en la sección "Información compartida"
    Y tiene seleccionado al beneficiario "Ana Pérez"
    Cuando intenta guardar la configuración sin seleccionar activos ni documentos
    Entonces el sistema muestra el mensaje "Debe seleccionar al menos un elemento para compartir"
    Y no actualiza la información compartida del beneficiario

  @US21 @funcional @acceso_limitado
  Escenario: AT-US21-03 Verificación de acceso limitado a información autorizada
    Dado que el usuario titular ha compartido únicamente el documento "Testamento digital" con el beneficiario "Ana Pérez"
    Cuando el beneficiario accede al flujo autorizado en una situación validada
    Entonces el sistema muestra únicamente el documento "Testamento digital"
    Y no muestra activos o documentos no autorizados por el usuario titular
