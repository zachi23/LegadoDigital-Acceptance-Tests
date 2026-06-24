# language: es

Característica: Seguridad y trazabilidad de la información
  Como usuario titular de LegadoDigital
  Quiero contar con mecanismos de seguridad y trazabilidad
  Para proteger mi información sensible y controlar los accesos a mi cuenta

  @US45 @no_funcional @seguridad @dos_pasos
  Escenario: AT-US45-01 Activación exitosa de autenticación en dos pasos
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y se encuentra en la sección "Seguridad"
    Cuando activa la opción "Autenticación en dos pasos"
    Y ingresa un código de verificación válido
    Y confirma la activación
    Entonces el sistema activa la autenticación en dos pasos
    Y muestra el mensaje "Autenticación en dos pasos activada correctamente"

  @US45 @no_funcional @seguridad @codigo_incorrecto
  Escenario: AT-US45-02 Validación de código incorrecto en autenticación en dos pasos
    Dado que el usuario titular se encuentra activando la autenticación en dos pasos
    Cuando ingresa un código de verificación incorrecto
    Entonces el sistema no activa la autenticación en dos pasos
    Y muestra el mensaje "Código de verificación incorrecto"

  @US46 @no_funcional @seguridad @dispositivo_nuevo
  Escenario: AT-US46-01 Validación de inicio en dispositivo nuevo
    Dado que el usuario titular intenta iniciar sesión desde un dispositivo no reconocido
    Cuando ingresa sus credenciales correctamente
    Entonces el sistema solicita una validación adicional
    Y permite el acceso solo si el usuario completa la validación solicitada

  @US46 @no_funcional @seguridad @validacion_fallida
  Escenario: AT-US46-02 Bloqueo temporal por validación fallida en dispositivo nuevo
    Dado que el usuario titular intenta iniciar sesión desde un dispositivo no reconocido
    Y el sistema solicita una validación adicional
    Cuando el usuario falla la validación tres veces consecutivas
    Entonces el sistema bloquea temporalmente el acceso desde ese dispositivo
    Y muestra el mensaje "Acceso bloqueado temporalmente por seguridad"

  @US47 @no_funcional @trazabilidad @historial
  Escenario: AT-US47-01 Visualización del historial de accesos
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y existen accesos registrados en su cuenta
    Cuando ingresa a la sección "Historial de accesos"
    Entonces el sistema muestra la lista de accesos registrados
    Y cada registro incluye fecha, hora, dispositivo y ubicación aproximada

  @US47 @no_funcional @trazabilidad @historial_vacio
  Escenario: AT-US47-02 Historial de accesos vacío
    Dado que el usuario titular ha iniciado sesión en LegadoDigital
    Y no existen accesos registrados anteriormente
    Cuando ingresa a la sección "Historial de accesos"
    Entonces el sistema muestra el mensaje "No existen accesos registrados"

  @US48 @no_funcional @cifrado
  Escenario: AT-US48-01 Verificación de información sensible cifrada
    Dado que el usuario titular registra información sensible en LegadoDigital
    Cuando el sistema almacena la información
    Entonces la información debe guardarse cifrada
    Y no debe almacenarse en texto plano dentro del repositorio de datos

  @US48 @no_funcional @cifrado @texto_plano
  Escenario: AT-US48-02 Restricción de visualización de información sensible en texto plano
    Dado que existe información sensible almacenada en la cuenta del usuario titular
    Cuando un usuario no autorizado intenta acceder directamente a dicha información
    Entonces el sistema no muestra la información en texto plano
    Y deniega el acceso no autorizado
