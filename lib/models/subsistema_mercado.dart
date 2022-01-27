import 'dart:convert';

class SubsistemaMercado {
  SubsistemaMercado({
    this.merClienteDecisor,
    this.merClienteRecursos,
    this.merClienteUsuario,
    this.merComentariosMercado,
    this.merComercializacionImEmblema,
    this.merComercializacionImLogotipo,
    this.merComercializacionSisExpectativa,
    this.merComercializacionSisMasivos,
    this.merComercializacionSisPersonales,
    this.merComercializacionVenAdministra,
    this.merComercializacionVenCuotas,
    this.merComercializacionVenEntrenamiento,
    this.merComercializacionVenEquipo,
    this.merComercializacionVenPlan,
    this.merComercializacionVenPresupuestos,
    this.merComercializacionVenRentabilidad,
    this.merComercializacionVenReportes,
    this.merComercializacionVenTerritorio,
    this.merComercializacionVenVendedores,
    this.merCompetenciaIdentificador,
    this.merCompetenciaEvCalidad,
    this.merCompetenciaEvCantidad,
    this.merCompetenciaEvPrecio,
    this.merCompetenciaMenFuerzas,
    this.merCompetenciasMenDebilidades,
    this.merExpectativaCanalOferente1,
    this.merExpectativaCanalOferente2,
    this.merExpectativaCanalOferente3,
    this.merExpectativaCompranCalidad,
    this.merExpectativaCompranPrecio,
    this.merExpectativaCompranServicio,
    this.merExpectativaFijaCompetencia,
    this.merExpectativaFijaCosto,
    this.merExpectativaFijaLirico,
    this.merExpectativaFijaMercado,
    this.merPoliticaNuevos,
    this.merPoliticaRentabilidad,
    this.merReportesCanal,
    this.merReportesClientes,
    this.merReportesCompetencia,
    this.merReportesComputarizado,
    this.merReportesLirico,
    this.merReportesManual,
    this.merReportesOrganizacional,
    this.merReportesPersonal,
    this.merReportesPrecio,
    this.merReportesProducto,
    this.merReportesSistemas,
    this.merSegmentoCliente,
    this.merSegmentoDistribucion,
    this.merSegmentoMagnitud,
    this.merSegmentoPotenActual,
    this.merSegmentoPotenTendencia,
    this.merSegmentoTenFuentes,
    this.merSegmentoTenIndicadores,
    this.id,
  });

  String? merClienteDecisor;
  String? merClienteRecursos;
  String? merClienteUsuario;
  String? merComentariosMercado;
  String? merComercializacionImEmblema;
  String? merComercializacionImLogotipo;
  String? merComercializacionSisExpectativa;
  String? merComercializacionSisMasivos;
  String? merComercializacionSisPersonales;
  String? merComercializacionVenAdministra;
  String? merComercializacionVenCuotas;
  String? merComercializacionVenEntrenamiento;
  String? merComercializacionVenEquipo;
  String? merComercializacionVenPlan;
  String? merComercializacionVenPresupuestos;
  String? merComercializacionVenRentabilidad;
  String? merComercializacionVenReportes;
  String? merComercializacionVenTerritorio;
  String? merComercializacionVenVendedores;
  String? merCompetenciaIdentificador;
  String? merCompetenciaEvCalidad;
  String? merCompetenciaEvCantidad;
  String? merCompetenciaEvPrecio;
  String? merCompetenciaMenFuerzas;
  String? merCompetenciasMenDebilidades;
  String? merExpectativaCanalOferente1;
  String? merExpectativaCanalOferente2;
  String? merExpectativaCanalOferente3;
  String? merExpectativaCompranCalidad;
  String? merExpectativaCompranPrecio;
  String? merExpectativaCompranServicio;
  String? merExpectativaFijaCompetencia;
  String? merExpectativaFijaCosto;
  String? merExpectativaFijaLirico;
  String? merExpectativaFijaMercado;
  String? merPoliticaNuevos;
  String? merPoliticaRentabilidad;
  String? merReportesCanal;
  String? merReportesClientes;
  String? merReportesCompetencia;
  String? merReportesComputarizado;
  String? merReportesLirico;
  String? merReportesManual;
  String? merReportesOrganizacional;
  String? merReportesPersonal;
  String? merReportesPrecio;
  String? merReportesProducto;
  String? merReportesSistemas;
  String? merSegmentoCliente;
  String? merSegmentoDistribucion;
  String? merSegmentoMagnitud;
  String? merSegmentoPotenActual;
  String? merSegmentoPotenTendencia;
  String? merSegmentoTenFuentes;
  String? merSegmentoTenIndicadores;
  String? id;

  factory SubsistemaMercado.fromJson(String str) =>
      SubsistemaMercado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubsistemaMercado.fromMap(Map<String, dynamic> json) =>
      SubsistemaMercado(
        merClienteDecisor: json["mer_clienteDecisor"],
        merClienteRecursos: json["mer_clienteRecursos"],
        merClienteUsuario: json["mer_clienteUsuario"],
        merComentariosMercado: json["mer_comentariosMercado"],
        merComercializacionImEmblema: json["mer_comercializacion_imEmblema"],
        merComercializacionImLogotipo: json["mer_comercializacion_imLogotipo"],
        merComercializacionSisExpectativa:
            json["mer_comercializacion_sisExpectativa"],
        merComercializacionSisMasivos: json["mer_comercializacion_sisMasivos"],
        merComercializacionSisPersonales:
            json["mer_comercializacion_sisPersonales"],
        merComercializacionVenAdministra:
            json["mer_comercializacion_venAdministra"],
        merComercializacionVenCuotas: json["mer_comercializacion_venCuotas"],
        merComercializacionVenEntrenamiento:
            json["mer_comercializacion_venEntrenamiento"],
        merComercializacionVenEquipo: json["mer_comercializacion_venEquipo"],
        merComercializacionVenPlan: json["mer_comercializacion_venPlan"],
        merComercializacionVenPresupuestos:
            json["mer_comercializacion_venPresupuestos"],
        merComercializacionVenRentabilidad:
            json["mer_comercializacion_venRentabilidad"],
        merComercializacionVenReportes:
            json["mer_comercializacion_venReportes"],
        merComercializacionVenTerritorio:
            json["mer_comercializacion_venTerritorio"],
        merComercializacionVenVendedores:
            json["mer_comercializacion_venVendedores"],
        merCompetenciaIdentificador: json["mer_competenciaIdentificador"],
        merCompetenciaEvCalidad: json["mer_competencia_evCalidad"],
        merCompetenciaEvCantidad: json["mer_competencia_evCantidad"],
        merCompetenciaEvPrecio: json["mer_competencia_evPrecio"],
        merCompetenciaMenFuerzas: json["mer_competencia_menFuerzas"],
        merCompetenciasMenDebilidades: json["mer_competencias_menDebilidades"],
        merExpectativaCanalOferente1: json["mer_expectativa_canalOferente1"],
        merExpectativaCanalOferente2: json["mer_expectativa_canalOferente2"],
        merExpectativaCanalOferente3: json["mer_expectativa_canalOferente3"],
        merExpectativaCompranCalidad: json["mer_expectativa_compranCalidad"],
        merExpectativaCompranPrecio: json["mer_expectativa_compranPrecio"],
        merExpectativaCompranServicio: json["mer_expectativa_compranServicio"],
        merExpectativaFijaCompetencia: json["mer_expectativa_fijaCompetencia"],
        merExpectativaFijaCosto: json["mer_expectativa_fijaCosto"],
        merExpectativaFijaLirico: json["mer_expectativa_fijaLirico"],
        merExpectativaFijaMercado: json["mer_expectativa_fijaMercado"],
        merPoliticaNuevos: json["mer_politicaNuevos"],
        merPoliticaRentabilidad: json["mer_politicaRentabilidad"],
        merReportesCanal: json["mer_reportes_canal"],
        merReportesClientes: json["mer_reportes_clientes"],
        merReportesCompetencia: json["mer_reportes_competencia"],
        merReportesComputarizado: json["mer_reportes_computarizado"],
        merReportesLirico: json["mer_reportes_lirico"],
        merReportesManual: json["mer_reportes_manual"],
        merReportesOrganizacional: json["mer_reportes_organizacional"],
        merReportesPersonal: json["mer_reportes_personal"],
        merReportesPrecio: json["mer_reportes_precio"],
        merReportesProducto: json["mer_reportes_producto"],
        merReportesSistemas: json["mer_reportes_sistemas"],
        merSegmentoCliente: json["mer_segmentoCliente"],
        merSegmentoDistribucion: json["mer_segmentoDistribucion"],
        merSegmentoMagnitud: json["mer_segmentoMagnitud"],
        merSegmentoPotenActual: json["mer_segmento_potenActual"],
        merSegmentoPotenTendencia: json["mer_segmento_potenTendencia"],
        merSegmentoTenFuentes: json["mer_segmento_tenFuentes"],
        merSegmentoTenIndicadores: json["mer_segmento_tenIndicadores"],
      );

  Map<String, dynamic> toMap() => {
        "mer_clienteDecisor": merClienteDecisor,
        "mer_clienteRecursos": merClienteRecursos,
        "mer_clienteUsuario": merClienteUsuario,
        "mer_comentariosMercado": merComentariosMercado,
        "mer_comercializacion_imEmblema": merComercializacionImEmblema,
        "mer_comercializacion_imLogotipo": merComercializacionImLogotipo,
        "mer_comercializacion_sisExpectativa":
            merComercializacionSisExpectativa,
        "mer_comercializacion_sisMasivos": merComercializacionSisMasivos,
        "mer_comercializacion_sisPersonales": merComercializacionSisPersonales,
        "mer_comercializacion_venAdministra": merComercializacionVenAdministra,
        "mer_comercializacion_venCuotas": merComercializacionVenCuotas,
        "mer_comercializacion_venEntrenamiento":
            merComercializacionVenEntrenamiento,
        "mer_comercializacion_venEquipo": merComercializacionVenEquipo,
        "mer_comercializacion_venPlan": merComercializacionVenPlan,
        "mer_comercializacion_venPresupuestos":
            merComercializacionVenPresupuestos,
        "mer_comercializacion_venRentabilidad":
            merComercializacionVenRentabilidad,
        "mer_comercializacion_venReportes": merComercializacionVenReportes,
        "mer_comercializacion_venTerritorio": merComercializacionVenTerritorio,
        "mer_comercializacion_venVendedores": merComercializacionVenVendedores,
        "mer_competenciaIdentificador": merCompetenciaIdentificador,
        "mer_competencia_evCalidad": merCompetenciaEvCalidad,
        "mer_competencia_evCantidad": merCompetenciaEvCantidad,
        "mer_competencia_evPrecio": merCompetenciaEvPrecio,
        "mer_competencia_menFuerzas": merCompetenciaMenFuerzas,
        "mer_competencias_menDebilidades": merCompetenciasMenDebilidades,
        "mer_expectativa_canalOferente1": merExpectativaCanalOferente1,
        "mer_expectativa_canalOferente2": merExpectativaCanalOferente2,
        "mer_expectativa_canalOferente3": merExpectativaCanalOferente3,
        "mer_expectativa_compranCalidad": merExpectativaCompranCalidad,
        "mer_expectativa_compranPrecio": merExpectativaCompranPrecio,
        "mer_expectativa_compranServicio": merExpectativaCompranServicio,
        "mer_expectativa_fijaCompetencia": merExpectativaFijaCompetencia,
        "mer_expectativa_fijaCosto": merExpectativaFijaCosto,
        "mer_expectativa_fijaLirico": merExpectativaFijaLirico,
        "mer_expectativa_fijaMercado": merExpectativaFijaMercado,
        "mer_politicaNuevos": merPoliticaNuevos,
        "mer_politicaRentabilidad": merPoliticaRentabilidad,
        "mer_reportes_canal": merReportesCanal,
        "mer_reportes_clientes": merReportesClientes,
        "mer_reportes_competencia": merReportesCompetencia,
        "mer_reportes_computarizado": merReportesComputarizado,
        "mer_reportes_lirico": merReportesLirico,
        "mer_reportes_manual": merReportesManual,
        "mer_reportes_organizacional": merReportesOrganizacional,
        "mer_reportes_personal": merReportesPersonal,
        "mer_reportes_precio": merReportesPrecio,
        "mer_reportes_producto": merReportesProducto,
        "mer_reportes_sistemas": merReportesSistemas,
        "mer_segmentoCliente": merSegmentoCliente,
        "mer_segmentoDistribucion": merSegmentoDistribucion,
        "mer_segmentoMagnitud": merSegmentoMagnitud,
        "mer_segmento_potenActual": merSegmentoPotenActual,
        "mer_segmento_potenTendencia": merSegmentoPotenTendencia,
        "mer_segmento_tenFuentes": merSegmentoTenFuentes,
        "mer_segmento_tenIndicadores": merSegmentoTenIndicadores,
      };

  SubsistemaMercado copy() => SubsistemaMercado(
        merClienteDecisor: merClienteDecisor,
        merClienteRecursos: merClienteRecursos,
        merClienteUsuario: merClienteUsuario,
        merComentariosMercado: merComentariosMercado,
        merComercializacionImEmblema: merComercializacionImEmblema,
        merComercializacionImLogotipo: merComercializacionImLogotipo,
        merComercializacionSisExpectativa: merComercializacionSisExpectativa,
        merComercializacionSisMasivos: merComercializacionSisMasivos,
        merComercializacionSisPersonales: merComercializacionSisPersonales,
        merComercializacionVenAdministra: merComercializacionVenAdministra,
        merComercializacionVenCuotas: merComercializacionVenCuotas,
        merComercializacionVenEntrenamiento:
            merComercializacionVenEntrenamiento,
        merComercializacionVenEquipo: merComercializacionVenEquipo,
        merComercializacionVenPlan: merComercializacionVenPlan,
        merComercializacionVenPresupuestos: merComercializacionVenPresupuestos,
        merComercializacionVenRentabilidad: merComercializacionVenRentabilidad,
        merComercializacionVenReportes: merComercializacionVenReportes,
        merComercializacionVenTerritorio: merComercializacionVenTerritorio,
        merComercializacionVenVendedores: merComercializacionVenVendedores,
        merCompetenciaIdentificador: merCompetenciaIdentificador,
        merCompetenciaEvCalidad: merCompetenciaEvCalidad,
        merCompetenciaEvCantidad: merCompetenciaEvCantidad,
        merCompetenciaEvPrecio: merCompetenciaEvPrecio,
        merCompetenciaMenFuerzas: merCompetenciaMenFuerzas,
        merCompetenciasMenDebilidades: merCompetenciasMenDebilidades,
        merExpectativaCanalOferente1: merExpectativaCanalOferente1,
        merExpectativaCanalOferente2: merExpectativaCanalOferente2,
        merExpectativaCanalOferente3: merExpectativaCanalOferente3,
        merExpectativaCompranCalidad: merExpectativaCompranCalidad,
        merExpectativaCompranPrecio: merExpectativaCompranPrecio,
        merExpectativaCompranServicio: merExpectativaCompranServicio,
        merExpectativaFijaCompetencia: merExpectativaFijaCompetencia,
        merExpectativaFijaCosto: merExpectativaFijaCosto,
        merExpectativaFijaLirico: merExpectativaFijaLirico,
        merExpectativaFijaMercado: merExpectativaFijaMercado,
        merPoliticaNuevos: merPoliticaNuevos,
        merPoliticaRentabilidad: merPoliticaRentabilidad,
        merReportesCanal: merReportesCanal,
        merReportesClientes: merReportesClientes,
        merReportesCompetencia: merReportesCompetencia,
        merReportesComputarizado: merReportesComputarizado,
        merReportesLirico: merReportesLirico,
        merReportesManual: merReportesManual,
        merReportesOrganizacional: merReportesOrganizacional,
        merReportesPersonal: merReportesPersonal,
        merReportesPrecio: merReportesPrecio,
        merReportesProducto: merReportesProducto,
        merReportesSistemas: merReportesSistemas,
        merSegmentoCliente: merSegmentoCliente,
        merSegmentoDistribucion: merSegmentoDistribucion,
        merSegmentoMagnitud: merSegmentoMagnitud,
        merSegmentoPotenActual: merSegmentoPotenActual,
        merSegmentoPotenTendencia: merSegmentoPotenTendencia,
        merSegmentoTenFuentes: merSegmentoTenFuentes,
        merSegmentoTenIndicadores: merSegmentoTenIndicadores,
        id: id,
      );
}
