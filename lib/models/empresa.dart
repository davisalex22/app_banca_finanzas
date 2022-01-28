import 'dart:convert';

class Empresa {
  Empresa({
    this.empCalculosVentasActivos,
    this.empCalculosVentasEmpleados,
    this.empCobMercadoInternacional,
    this.empCobMercadoLocal,
    this.empCobMercadoRegional,
    this.empComentarioEjecutivo,
    this.empEstLegalNoRegistrada,
    this.empEstLegalPersonaFisica,
    this.empEstLegalPersonaMoral,
    this.empEstatusFiscal,
    this.empTamNumEmpAdministrativos,
    this.empTamNumEmpComentarios,
    this.empTamNumEmpOperativos,
    this.empTamNumEmpOtros,
    this.empTamNumEmpTotal,
    this.empValActivosBienes,
    this.empValActivosOtros,
    this.empValActivosTerreno,
    this.empVentasDiarias,
    this.empVentasMensuales,
    this.empVentasSemanales,
    this.empVisionCortoPlazo,
    this.empVisionLargoPlazo,
    this.empresaAniosAntiguedad,
    this.empresaAniosInicio,
    this.empresaDireccion,
    this.empresaDomicilioFiscal,
    this.empresaNombre,
    this.empresaRfc,
    this.empresaDuenio,
    this.empresaTelefono,
    this.id,
  });

  String? empCalculosVentasActivos;
  String? empCalculosVentasEmpleados;
  String? empCobMercadoInternacional;
  String? empCobMercadoLocal;
  String? empCobMercadoRegional;
  String? empComentarioEjecutivo;
  String? empEstLegalNoRegistrada;
  String? empEstLegalPersonaFisica;
  String? empEstLegalPersonaMoral;
  String? empEstatusFiscal;
  String? empTamNumEmpAdministrativos;
  String? empTamNumEmpComentarios;
  String? empTamNumEmpOperativos;
  String? empTamNumEmpOtros;
  String? empTamNumEmpTotal;
  String? empValActivosBienes;
  String? empValActivosOtros;
  String? empValActivosTerreno;
  String? empVentasDiarias;
  String? empVentasMensuales;
  String? empVentasSemanales;
  String? empVisionCortoPlazo;
  String? empVisionLargoPlazo;
  String? empresaAniosInicio;
  String? empresaAniosAntiguedad;
  String? empresaDireccion;
  String? empresaDomicilioFiscal;
  String? empresaNombre;
  String? empresaRfc;
  String? empresaDuenio;
  String? empresaTelefono;
  String? id;

  factory Empresa.fromJson(String str) => Empresa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Empresa.fromMap(Map<String, dynamic> json) => Empresa(
        empCalculosVentasActivos: json["emp_calculos_ventasActivos"].toString(),
        empCalculosVentasEmpleados:
            json["emp_calculos_ventasEmpleados"].toString(),
        empCobMercadoInternacional: json["emp_cobMercado_internacional"],
        empCobMercadoLocal: json["emp_cobMercado_local"],
        empCobMercadoRegional: json["emp_cobMercado_regional"],
        empComentarioEjecutivo: json["emp_comentarioEjecutivo"],
        empEstLegalNoRegistrada: json["emp_estLegal_noRegistrada"],
        empEstLegalPersonaFisica: json["emp_estLegal_personaFisica"],
        empEstLegalPersonaMoral: json["emp_estLegal_personaMoral"],
        empEstatusFiscal: json["emp_estatusFiscal"],
        empTamNumEmpAdministrativos:
            json["emp_tam_numEmp_administrativos"].toString(),
        empTamNumEmpComentarios: json["emp_tam_numEmp_comentarios"],
        empTamNumEmpOperativos: json["emp_tam_numEmp_operativos"].toString(),
        empTamNumEmpOtros: json["emp_tam_numEmp_otros"].toString(),
        empTamNumEmpTotal: json["emp_tam_numEmp_total"].toString(),
        empValActivosBienes: json["emp_valActivos_bienes"].toString(),
        empValActivosOtros: json["emp_valActivos_otros"].toString(),
        empValActivosTerreno: json["emp_valActivos_terreno"].toString(),
        empVentasDiarias: json["emp_ventas_diarias"].toString(),
        empVentasMensuales: json["emp_ventas_mensuales"].toString(),
        empVentasSemanales: json["emp_ventas_semanales"].toString(),
        empVisionCortoPlazo: json["emp_vision_cortoPlazo"],
        empVisionLargoPlazo: json["emp_vision_largoPlazo"],
        empresaAniosAntiguedad: json["empresa_aniosAntiguedad"].toString(),
        empresaAniosInicio: json["empresa_aniosInicio"].toString(),
        empresaDireccion: json["empresa_direccion"],
        empresaDomicilioFiscal: json["empresa_domicilioFiscal"],
        empresaNombre: json["empresa_nombre"],
        empresaRfc: json["empresa_rfc"],
        empresaTelefono: json["empresa_telefono"],
        empresaDuenio: json["empresa_duenio"],
      );

  Map<String, dynamic> toMap() => {
        "emp_calculos_ventasActivos": empCalculosVentasActivos,
        "emp_calculos_ventasEmpleados": empCalculosVentasEmpleados,
        "emp_cobMercado_internacional": empCobMercadoInternacional,
        "emp_cobMercado_local": empCobMercadoLocal,
        "emp_cobMercado_regional": empCobMercadoRegional,
        "emp_comentarioEjecutivo": empComentarioEjecutivo,
        "emp_estLegal_noRegistrada": empEstLegalNoRegistrada,
        "emp_estLegal_personaFisica": empEstLegalPersonaFisica,
        "emp_estLegal_personaMoral": empEstLegalPersonaMoral,
        "emp_estatusFiscal": empEstatusFiscal,
        "emp_tam_numEmp_administrativos": empTamNumEmpAdministrativos,
        "emp_tam_numEmp_comentarios": empTamNumEmpComentarios,
        "emp_tam_numEmp_operativos": empTamNumEmpOperativos,
        "emp_tam_numEmp_otros": empTamNumEmpOtros,
        "emp_tam_numEmp_total": empTamNumEmpTotal,
        "emp_valActivos_bienes": empValActivosBienes,
        "emp_valActivos_otros": empValActivosOtros,
        "emp_valActivos_terreno": empValActivosTerreno,
        "emp_ventas_diarias": empVentasDiarias,
        "emp_ventas_mensuales": empVentasMensuales,
        "emp_ventas_semanales": empVentasSemanales,
        "emp_vision_cortoPlazo": empVisionCortoPlazo,
        "emp_vision_largoPlazo": empVisionLargoPlazo,
        "empresa_aniosAntiguedad": empresaAniosAntiguedad,
        "empresa_aniosInicio": empresaAniosInicio,
        "empresa_direccion": empresaDireccion,
        "empresa_domicilioFiscal": empresaDomicilioFiscal,
        "empresa_nombre": empresaNombre,
        "empresa_rfc": empresaRfc,
        "empresa_telefono": empresaTelefono,
        "empresa_duenio": empresaDuenio,
      };

  Empresa copy() => Empresa(
        empCalculosVentasActivos: empCalculosVentasActivos,
        empCalculosVentasEmpleados: empCalculosVentasEmpleados,
        empCobMercadoInternacional: empCobMercadoInternacional,
        empCobMercadoLocal: empCobMercadoLocal,
        empCobMercadoRegional: empCobMercadoRegional,
        empComentarioEjecutivo: empComentarioEjecutivo,
        empEstLegalNoRegistrada: empEstLegalNoRegistrada,
        empEstLegalPersonaFisica: empEstLegalPersonaFisica,
        empEstLegalPersonaMoral: empEstLegalPersonaMoral,
        empEstatusFiscal: empEstatusFiscal,
        empTamNumEmpAdministrativos: empTamNumEmpAdministrativos,
        empTamNumEmpComentarios: empTamNumEmpComentarios,
        empTamNumEmpOperativos: empTamNumEmpOperativos,
        empTamNumEmpOtros: empTamNumEmpOtros,
        empTamNumEmpTotal: empTamNumEmpTotal,
        empValActivosBienes: empValActivosBienes,
        empValActivosOtros: empValActivosOtros,
        empValActivosTerreno: empValActivosTerreno,
        empVentasDiarias: empVentasDiarias,
        empVentasMensuales: empVentasMensuales,
        empVentasSemanales: empVentasSemanales,
        empVisionCortoPlazo: empVisionCortoPlazo,
        empVisionLargoPlazo: empVisionLargoPlazo,
        empresaAniosInicio: empresaAniosInicio,
        empresaAniosAntiguedad: empresaAniosAntiguedad,
        empresaDireccion: empresaDireccion,
        empresaDomicilioFiscal: empresaDomicilioFiscal,
        empresaNombre: empresaNombre,
        empresaRfc: empresaRfc,
        empresaDuenio: empresaDuenio,
        empresaTelefono: empresaTelefono,
        id: id,
      );
}
