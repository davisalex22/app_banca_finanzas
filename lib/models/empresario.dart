import 'dart:convert';

class Empresario {
  Empresario({
    this.emprAdmTiempoAnio,
    this.emprAdmTiempoComentario,
    this.emprAdmTiempoDia,
    this.emprAdmTiempoMes,
    this.emprAdmTiempoSemana,
    this.emprCuniadosEdad,
    this.emprCuniadosLugarHermanos,
    this.emprCuniadosNombre,
    this.emprCuniadosOcupacion,
    this.emprFilosofiaComentario,
    this.emprFilosofiaHobbies,
    this.emprHermanosEdad,
    this.emprHermanosLugarHermanos,
    this.emprHermanosNombres,
    this.emprHermanosOcupacion,
    this.emprMatrimonioHEdad,
    this.emprMatrimonioHEscolaridad,
    this.emprMatrimonioHEstadoCivil,
    this.emprMatrimonioHEstadoSalud,
    this.emprMatrimonioHNumeroHijos,
    this.emprMatrimonioHOcupacion,
    this.emprMatrimonioAniosCasado,
    this.emprMatrimonioSituacionAfectiva,
    this.emprMetasAfectivas,
    this.emprMetasComentario,
    this.emprMetasFisicas,
    this.emprMetasProfesionales,
    this.emprPadresComentario,
    this.emprPadresEdad,
    this.emprPadresEscolaridad,
    this.emprPadresEstadoSalud,
    this.emprPadresLugar,
    this.emprPadresNombres,
    this.emprPadresOcupacion,
    this.emprPadresOriginarios,
    this.emprPadresViven,
    this.emprParejaComentario,
    this.emprParejaEscolaridad,
    this.emprParejaEstadoSalud,
    this.emprParejaLugar,
    this.emprParejaNombre,
    this.emprParejaOcupacion,
    this.emprParejaOriginaria,
    this.emprParejaEdad,
    this.emprParejaVive,
    this.emprSuegrosComentario,
    this.emprSuegrosEdad,
    this.emprSuegrosEscolaridad,
    this.emprSuegrosEstadoSalud,
    this.emprSuegrosLugar,
    this.emprSuegrosNombre,
    this.emprSuegrosOcupacion,
    this.emprSuegrosOriginarios,
    this.emprSuegrosViven,
    this.empresarioComentario,
    this.empresarioComentarioEjecutivo,
    this.empresarioDireccion,
    this.empresarioEdad,
    this.empresarioEscolaridad,
    this.empresarioEstadoCivil,
    this.empresarioEstadoSalud,
    this.empresarioLugar,
    this.empresarioNombre,
    this.empresarioOcupacion,
    this.empresarioOriginario,
    this.empresarioTelefono,
    this.empresaDuenio,
    this.id,
  });

  String? emprAdmTiempoAnio;
  String? emprAdmTiempoComentario;
  String? emprAdmTiempoDia;
  String? emprAdmTiempoMes;
  String? emprAdmTiempoSemana;
  String? emprCuniadosEdad;
  String? emprCuniadosLugarHermanos;
  String? emprCuniadosNombre;
  String? emprCuniadosOcupacion;
  String? emprFilosofiaComentario;
  String? emprFilosofiaHobbies;
  String? emprHermanosEdad;
  String? emprHermanosLugarHermanos;
  String? emprHermanosNombres;
  String? emprHermanosOcupacion;
  String? emprMatrimonioHEdad;
  String? emprMatrimonioHEscolaridad;
  String? emprMatrimonioHEstadoCivil;
  String? emprMatrimonioHEstadoSalud;
  String? emprMatrimonioHNumeroHijos;
  String? emprMatrimonioHOcupacion;
  String? emprMatrimonioAniosCasado;
  String? emprMatrimonioSituacionAfectiva;
  String? emprMetasAfectivas;
  String? emprMetasComentario;
  String? emprMetasFisicas;
  String? emprMetasProfesionales;
  String? emprPadresComentario;
  String? emprPadresEdad;
  String? emprPadresEscolaridad;
  String? emprPadresEstadoSalud;
  String? emprPadresLugar;
  String? emprPadresNombres;
  String? emprPadresOcupacion;
  String? emprPadresOriginarios;
  String? emprPadresViven;
  String? emprParejaComentario;
  String? emprParejaEscolaridad;
  String? emprParejaEstadoSalud;
  String? emprParejaLugar;
  String? emprParejaNombre;
  String? emprParejaOcupacion;
  String? emprParejaEdad;
  String? emprParejaOriginaria;
  String? emprParejaVive;
  String? emprSuegrosComentario;
  String? emprSuegrosEdad;
  String? emprSuegrosEscolaridad;
  String? emprSuegrosEstadoSalud;
  String? emprSuegrosLugar;
  String? emprSuegrosNombre;
  String? emprSuegrosOcupacion;
  String? emprSuegrosOriginarios;
  String? emprSuegrosViven;
  String? empresarioComentario;
  String? empresarioComentarioEjecutivo;
  String? empresarioDireccion;
  String? empresarioEdad;
  String? empresarioEscolaridad;
  String? empresarioEstadoCivil;
  String? empresarioEstadoSalud;
  String? empresarioLugar;
  String? empresarioNombre;
  String? empresarioOcupacion;
  String? empresarioOriginario;
  String? empresarioTelefono;
  String? empresaDuenio;
  String? id;

  factory Empresario.fromJson(String str) =>
      Empresario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Empresario.fromMap(Map<String, dynamic> json) => Empresario(
        emprAdmTiempoAnio: json["empr_admTiempo_anio"],
        emprAdmTiempoComentario: json["empr_admTiempo_comentario"],
        emprAdmTiempoDia: json["empr_admTiempo_dia"],
        emprAdmTiempoMes: json["empr_admTiempo_mes"],
        emprAdmTiempoSemana: json["empr_admTiempo_semana"],
        emprCuniadosEdad: json["empr_cuniados_edad"],
        emprCuniadosLugarHermanos: json["empr_cuniados_lugarHermanos"],
        emprCuniadosNombre: json["empr_cuniados_nombre"],
        emprCuniadosOcupacion: json["empr_cuniados_ocupacion"],
        emprFilosofiaComentario: json["empr_filosofia_comentario"],
        emprFilosofiaHobbies: json["empr_filosofia_hobbies"],
        emprHermanosEdad: json["empr_hermanos_edad"],
        emprHermanosLugarHermanos: json["empr_hermanos_lugarHermanos"],
        emprHermanosNombres: json["empr_hermanos_nombres"],
        emprHermanosOcupacion: json["empr_hermanos_ocupacion"],
        emprMatrimonioHEdad: json["empr_matrimonioH_edad"],
        emprMatrimonioHEscolaridad: json["empr_matrimonioH_escolaridad"],
        emprMatrimonioHEstadoCivil: json["empr_matrimonioH_estadoCivil"],
        emprMatrimonioHEstadoSalud: json["empr_matrimonioH_estadoSalud"],
        emprMatrimonioHNumeroHijos:
            json["empr_matrimonioH_numeroHijos"].toString(),
        emprMatrimonioHOcupacion: json["empr_matrimonioH_ocupacion"],
        emprMatrimonioAniosCasado:
            json["empr_matrimonio_aniosCasado"].toString(),
        emprMatrimonioSituacionAfectiva:
            json["empr_matrimonio_situacionAfectiva"],
        emprMetasAfectivas: json["empr_metas_afectivas"],
        emprMetasComentario: json["empr_metas_comentario"],
        emprMetasFisicas: json["empr_metas_fisicas"],
        emprMetasProfesionales: json["empr_metas_profesionales"],
        emprPadresComentario: json["empr_padres_comentario"],
        emprPadresEdad: json["empr_padres_edad"],
        emprPadresEscolaridad: json["empr_padres_escolaridad"],
        emprPadresEstadoSalud: json["empr_padres_estadoSalud"],
        emprPadresLugar: json["empr_padres_lugar"],
        emprPadresNombres: json["empr_padres_nombres"],
        emprPadresOcupacion: json["empr_padres_ocupacion"],
        emprPadresOriginarios: json["empr_padres_originarios"],
        emprPadresViven: json["empr_padres_viven"],
        emprParejaComentario: json["empr_pareja_comentario"],
        emprParejaEscolaridad: json["empr_pareja_escolaridad"],
        emprParejaEstadoSalud: json["empr_pareja_estadoSalud"],
        emprParejaLugar: json["empr_pareja_lugar"],
        emprParejaNombre: json["empr_pareja_nombre"],
        emprParejaOcupacion: json["empr_pareja_ocupacion"],
        emprParejaOriginaria: json["empr_pareja_originaria"],
        emprParejaEdad: json["empr_pareja_edad"].toString(),
        emprParejaVive: json["empr_pareja_vive"],
        emprSuegrosComentario: json["empr_suegros_comentario"],
        emprSuegrosEdad: json["empr_suegros_edad"],
        emprSuegrosEscolaridad: json["empr_suegros_escolaridad"],
        emprSuegrosEstadoSalud: json["empr_suegros_estadoSalud"],
        emprSuegrosLugar: json["empr_suegros_lugar"],
        emprSuegrosNombre: json["empr_suegros_nombre"],
        emprSuegrosOcupacion: json["empr_suegros_ocupacion"],
        emprSuegrosOriginarios: json["empr_suegros_originarios"],
        emprSuegrosViven: json["empr_suegros_viven"],
        empresarioComentario: json["empresario_comentario"],
        empresarioComentarioEjecutivo: json["empresario_comentarioEjecutivo"],
        empresarioDireccion: json["empresario_direccion"],
        empresarioEdad: json["empresario_edad"],
        empresarioEscolaridad: json["empresario_escolaridad"],
        empresarioEstadoCivil: json["empresario_estadoCivil"],
        empresarioEstadoSalud: json["empresario_estadoSalud"],
        empresarioLugar: json["empresario_lugar"],
        empresarioNombre: json["empresario_nombre"],
        empresarioOcupacion: json["empresario_ocupacion"],
        empresarioOriginario: json["empresario_originario"],
        empresarioTelefono: json["empresario_telefono"],
        empresaDuenio: json["empresa_duenio"],
      );

  Map<String, dynamic> toMap() => {
        "empr_admTiempo_anio": emprAdmTiempoAnio,
        "empr_admTiempo_comentario": emprAdmTiempoComentario,
        "empr_admTiempo_dia": emprAdmTiempoDia,
        "empr_admTiempo_mes": emprAdmTiempoMes,
        "empr_admTiempo_semana": emprAdmTiempoSemana,
        "empr_cuniados_edad": emprCuniadosEdad,
        "empr_cuniados_lugarHermanos": emprCuniadosLugarHermanos,
        "empr_cuniados_nombre": emprCuniadosNombre,
        "empr_cuniados_ocupacion": emprCuniadosOcupacion,
        "empr_filosofia_comentario": emprFilosofiaComentario,
        "empr_filosofia_hobbies": emprFilosofiaHobbies,
        "empr_hermanos_edad": emprHermanosEdad,
        "empr_hermanos_lugarHermanos": emprHermanosLugarHermanos,
        "empr_hermanos_nombres": emprHermanosNombres,
        "empr_hermanos_ocupacion": emprHermanosOcupacion,
        "empr_matrimonioH_edad": emprMatrimonioHEdad,
        "empr_matrimonioH_escolaridad": emprMatrimonioHEscolaridad,
        "empr_matrimonioH_estadoCivil": emprMatrimonioHEstadoCivil,
        "empr_matrimonioH_estadoSalud": emprMatrimonioHEstadoSalud,
        "empr_matrimonioH_numeroHijos": emprMatrimonioHNumeroHijos,
        "empr_matrimonioH_ocupacion": emprMatrimonioHOcupacion,
        "empr_matrimonio_aniosCasado": emprMatrimonioAniosCasado,
        "empr_matrimonio_situacionAfectiva": emprMatrimonioSituacionAfectiva,
        "empr_metas_afectivas": emprMetasAfectivas,
        "empr_metas_comentario": emprMetasComentario,
        "empr_metas_fisicas": emprMetasFisicas,
        "empr_metas_profesionales": emprMetasProfesionales,
        "empr_padres_comentario": emprPadresComentario,
        "empr_padres_edad": emprPadresEdad,
        "empr_padres_escolaridad": emprPadresEscolaridad,
        "empr_padres_estadoSalud": emprPadresEstadoSalud,
        "empr_padres_lugar": emprPadresLugar,
        "empr_padres_nombres": emprPadresNombres,
        "empr_padres_ocupacion": emprPadresOcupacion,
        "empr_padres_originarios": emprPadresOriginarios,
        "empr_padres_viven": emprPadresViven,
        "empr_pareja_comentario": emprParejaComentario,
        "empr_pareja_escolaridad": emprParejaEscolaridad,
        "empr_pareja_estadoSalud": emprParejaEstadoSalud,
        "empr_pareja_lugar": emprParejaLugar,
        "empr_pareja_nombre": emprParejaNombre,
        "empr_pareja_ocupacion": emprParejaOcupacion,
        "empr_pareja_originaria": emprParejaOriginaria,
        "empr_pareja_vive": emprParejaVive,
        "empr_pareja_edad": emprParejaEdad,
        "empr_suegros_comentario": emprSuegrosComentario,
        "empr_suegros_edad": emprSuegrosEdad,
        "empr_suegros_escolaridad": emprSuegrosEscolaridad,
        "empr_suegros_estadoSalud": emprSuegrosEstadoSalud,
        "empr_suegros_lugar": emprSuegrosLugar,
        "empr_suegros_nombre": emprSuegrosNombre,
        "empr_suegros_ocupacion": emprSuegrosOcupacion,
        "empr_suegros_originarios": emprSuegrosOriginarios,
        "empr_suegros_viven": emprSuegrosViven,
        "empresario_comentario": empresarioComentario,
        "empresario_comentarioEjecutivo": empresarioComentarioEjecutivo,
        "empresario_direccion": empresarioDireccion,
        "empresario_edad": empresarioEdad,
        "empresario_escolaridad": empresarioEscolaridad,
        "empresario_estadoCivil": empresarioEstadoCivil,
        "empresario_estadoSalud": empresarioEstadoSalud,
        "empresario_lugar": empresarioLugar,
        "empresario_nombre": empresarioNombre,
        "empresario_ocupacion": empresarioOcupacion,
        "empresario_originario": empresarioOriginario,
        "empresario_telefono": empresarioTelefono,
        "empresa_duenio": empresaDuenio,
      };

  Empresario copy() => Empresario(
        emprAdmTiempoAnio: emprAdmTiempoAnio,
        emprAdmTiempoComentario: emprAdmTiempoComentario,
        emprAdmTiempoDia: emprAdmTiempoDia,
        emprAdmTiempoMes: emprAdmTiempoMes,
        emprAdmTiempoSemana: emprAdmTiempoSemana,
        emprCuniadosEdad: emprCuniadosEdad,
        emprCuniadosLugarHermanos: emprCuniadosLugarHermanos,
        emprCuniadosNombre: emprCuniadosNombre,
        emprCuniadosOcupacion: emprCuniadosOcupacion,
        emprFilosofiaComentario: emprFilosofiaComentario,
        emprFilosofiaHobbies: emprFilosofiaHobbies,
        emprHermanosEdad: emprHermanosEdad,
        emprHermanosLugarHermanos: emprHermanosLugarHermanos,
        emprHermanosNombres: emprHermanosNombres,
        emprHermanosOcupacion: emprHermanosOcupacion,
        emprMatrimonioHEdad: emprMatrimonioHEdad,
        emprMatrimonioHEscolaridad: emprMatrimonioHEscolaridad,
        emprMatrimonioHEstadoCivil: emprMatrimonioHEstadoCivil,
        emprMatrimonioHEstadoSalud: emprMatrimonioHEstadoSalud,
        emprMatrimonioHNumeroHijos: emprMatrimonioHNumeroHijos,
        emprMatrimonioHOcupacion: emprMatrimonioHOcupacion,
        emprMatrimonioAniosCasado: emprMatrimonioAniosCasado,
        emprMatrimonioSituacionAfectiva: emprMatrimonioSituacionAfectiva,
        emprMetasAfectivas: emprMetasAfectivas,
        emprMetasComentario: emprMetasComentario,
        emprMetasFisicas: emprMetasFisicas,
        emprMetasProfesionales: emprMetasProfesionales,
        emprPadresComentario: emprPadresComentario,
        emprPadresEdad: emprPadresEdad,
        emprPadresEscolaridad: emprPadresEscolaridad,
        emprPadresEstadoSalud: emprPadresEstadoSalud,
        emprPadresLugar: emprPadresLugar,
        emprPadresNombres: emprPadresNombres,
        emprPadresOcupacion: emprPadresOcupacion,
        emprPadresOriginarios: emprPadresOriginarios,
        emprPadresViven: emprPadresViven,
        emprParejaComentario: emprParejaComentario,
        emprParejaEscolaridad: emprParejaEscolaridad,
        emprParejaEstadoSalud: emprParejaEstadoSalud,
        emprParejaLugar: emprParejaLugar,
        emprParejaNombre: emprParejaNombre,
        emprParejaOcupacion: emprParejaOcupacion,
        emprParejaOriginaria: emprParejaOriginaria,
        emprParejaEdad: emprParejaEdad,
        emprParejaVive: emprParejaVive,
        emprSuegrosComentario: emprSuegrosComentario,
        emprSuegrosEdad: emprSuegrosEdad,
        emprSuegrosEscolaridad: emprSuegrosEscolaridad,
        emprSuegrosEstadoSalud: emprSuegrosEstadoSalud,
        emprSuegrosLugar: emprSuegrosLugar,
        emprSuegrosNombre: emprSuegrosNombre,
        emprSuegrosOcupacion: emprSuegrosOcupacion,
        emprSuegrosOriginarios: emprSuegrosOriginarios,
        emprSuegrosViven: emprSuegrosViven,
        empresarioComentario: empresarioComentario,
        empresarioComentarioEjecutivo: empresarioComentarioEjecutivo,
        empresarioDireccion: empresarioDireccion,
        empresarioEdad: empresarioEdad,
        empresarioEscolaridad: empresarioEscolaridad,
        empresarioEstadoCivil: empresarioEstadoCivil,
        empresarioEstadoSalud: empresarioEstadoSalud,
        empresarioLugar: empresarioLugar,
        empresarioNombre: empresarioNombre,
        empresarioOcupacion: empresarioOcupacion,
        empresarioOriginario: empresarioOriginario,
        empresarioTelefono: empresarioTelefono,
        empresaDuenio: empresaDuenio,
        id: id,
      );
}
