import 'dart:convert';

class SubsistemaProduccion {
  SubsistemaProduccion({
    this.prodCalEstandar,
    this.prodCalMejoras,
    this.prodCalTecnologia,
    this.prodCometarioProduccion,
    this.prodLugAmbAlimentos,
    this.prodLugAmbColores,
    this.prodLugAmbLockers,
    this.prodLugAmbLuz,
    this.prodLugAmbRuido,
    this.prodLugAmbSanitarias,
    this.prodLugAmbSegBotiquin,
    this.prodLugAmbSegSeguridad,
    this.prodLugAmbSegTelefono,
    this.prodLugAmbTemperatura,
    this.prodLugAmbVentilacion,
    this.prodLugDisLinea,
    this.prodLugDisPuesto,
    this.prodLugDisTaller,
    this.prodLugEdificio,
    this.prodLugEspacio,
    this.prodMaqAdecuado,
    this.prodMaqSuficiente,
    this.prodMaqMantenimiento,
    this.prodMatCalidadAtributos,
    this.prodMatCalidadDisponibilidad,
    this.prodMatCalidadEntregas,
    this.prodMatCalidadEstandarizacion,
    this.prodMatCalidadPrecio,
    this.prodMatCalidadTrabajabilidad,
    this.prodMatCantidadCompras,
    this.prodMatCantidadInventarios,
    this.prodProcCostosFijos,
    this.prodProcCostosVariables,
    this.prodProcDesperdicios,
    this.prodProcDispositivos,
    this.prodProcEmbarques,
    this.prodProcMateriales,
    this.prodProcNormas,
    this.prodProcOcios,
    this.prodProcProcesos,
    this.prodRepCalidadMateriales,
    this.prodRepComputarizado,
    this.prodRepCostosMateriales,
    this.prodRepDesperdicios,
    this.prodRepInventarios,
    this.prodRepLirico,
    this.prodRepManual,
    this.prodRepOrganizacional,
    this.prodRepPersonal,
    this.prodRepRechazados,
    this.prodUbiClientes,
    this.prodUbiEconomico,
    this.prodUbiManoObra,
    this.prodUbiMateriaPrima,
    this.prodUbiMedioAmbiente,
    this.id,
  });

  String? prodCalEstandar;
  String? prodCalMejoras;
  String? prodCalTecnologia;
  String? prodCometarioProduccion;
  String? prodLugAmbAlimentos;
  String? prodLugAmbColores;
  String? prodLugAmbLockers;
  String? prodLugAmbLuz;
  String? prodLugAmbRuido;
  String? prodLugAmbSanitarias;
  String? prodLugAmbSegBotiquin;
  String? prodLugAmbSegSeguridad;
  String? prodLugAmbSegTelefono;
  String? prodLugAmbTemperatura;
  String? prodLugAmbVentilacion;
  String? prodLugDisLinea;
  String? prodLugDisPuesto;
  String? prodLugDisTaller;
  String? prodLugEdificio;
  String? prodLugEspacio;
  String? prodMaqAdecuado;
  String? prodMaqSuficiente;
  String? prodMaqMantenimiento;
  String? prodMatCalidadAtributos;
  String? prodMatCalidadDisponibilidad;
  String? prodMatCalidadEntregas;
  String? prodMatCalidadEstandarizacion;
  String? prodMatCalidadPrecio;
  String? prodMatCalidadTrabajabilidad;
  String? prodMatCantidadCompras;
  String? prodMatCantidadInventarios;
  String? prodProcCostosFijos;
  String? prodProcCostosVariables;
  String? prodProcDesperdicios;
  String? prodProcDispositivos;
  String? prodProcEmbarques;
  String? prodProcMateriales;
  String? prodProcNormas;
  String? prodProcOcios;
  String? prodProcProcesos;
  String? prodRepCalidadMateriales;
  String? prodRepComputarizado;
  String? prodRepCostosMateriales;
  String? prodRepDesperdicios;
  String? prodRepInventarios;
  String? prodRepLirico;
  String? prodRepManual;
  String? prodRepOrganizacional;
  String? prodRepPersonal;
  String? prodRepRechazados;
  String? prodUbiClientes;
  String? prodUbiEconomico;
  String? prodUbiManoObra;
  String? prodUbiMateriaPrima;
  String? prodUbiMedioAmbiente;
  String? id;

  factory SubsistemaProduccion.fromJson(String str) =>
      SubsistemaProduccion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubsistemaProduccion.fromMap(Map<String, dynamic> json) =>
      SubsistemaProduccion(
        prodCalEstandar: json["prod_cal_estandar"],
        prodCalMejoras: json["prod_cal_mejoras"],
        prodCalTecnologia: json["prod_cal_tecnologia"],
        prodCometarioProduccion: json["prod_cometarioProduccion"],
        prodLugAmbAlimentos: json["prod_lug_amb_alimentos"],
        prodLugAmbColores: json["prod_lug_amb_colores"],
        prodLugAmbLockers: json["prod_lug_amb_lockers"],
        prodLugAmbLuz: json["prod_lug_amb_luz"],
        prodLugAmbRuido: json["prod_lug_amb_ruido"],
        prodLugAmbSanitarias: json["prod_lug_amb_sanitarias"],
        prodLugAmbSegBotiquin: json["prod_lug_amb_seg_botiquin"],
        prodLugAmbSegSeguridad: json["prod_lug_amb_seg_seguridad"],
        prodLugAmbSegTelefono: json["prod_lug_amb_seg_telefono"],
        prodLugAmbTemperatura: json["prod_lug_amb_temperatura"],
        prodLugAmbVentilacion: json["prod_lug_amb_ventilacion"],
        prodLugDisLinea: json["prod_lug_dis_linea"],
        prodLugDisPuesto: json["prod_lug_dis_puesto"],
        prodLugDisTaller: json["prod_lug_dis_taller"],
        prodLugEdificio: json["prod_lug_edificio"],
        prodLugEspacio: json["prod_lug_espacio"],
        prodMaqAdecuado: json["prod_maq_adecuado"],
        prodMaqSuficiente: json["prod_maq_suficiente"],
        prodMaqMantenimiento: json["prod_maq_mantenimiento"],
        prodMatCalidadAtributos: json["prod_mat_calidadAtributos"],
        prodMatCalidadDisponibilidad: json["prod_mat_calidadDisponibilidad"],
        prodMatCalidadEntregas: json["prod_mat_calidadEntregas"],
        prodMatCalidadEstandarizacion: json["prod_mat_calidadEstandarizacion"],
        prodMatCalidadPrecio: json["prod_mat_calidadPrecio"],
        prodMatCalidadTrabajabilidad: json["prod_mat_calidadTrabajabilidad"],
        prodMatCantidadCompras: json["prod_mat_cantidadCompras"],
        prodMatCantidadInventarios: json["prod_mat_cantidadInventarios"],
        prodProcCostosFijos: json["prod_proc_costosFijos"],
        prodProcCostosVariables: json["prod_proc_costosVariables"],
        prodProcDesperdicios: json["prod_proc_desperdicios"],
        prodProcDispositivos: json["prod_proc_dispositivos"],
        prodProcEmbarques: json["prod_proc_embarques"],
        prodProcMateriales: json["prod_proc_materiales"],
        prodProcNormas: json["prod_proc_normas"],
        prodProcOcios: json["prod_proc_ocios"],
        prodProcProcesos: json["prod_proc_procesos"],
        prodRepCalidadMateriales: json["prod_rep_calidadMateriales"],
        prodRepComputarizado: json["prod_rep_computarizado"],
        prodRepCostosMateriales: json["prod_rep_costosMateriales"],
        prodRepDesperdicios: json["prod_rep_desperdicios"],
        prodRepInventarios: json["prod_rep_inventarios"],
        prodRepLirico: json["prod_rep_lirico"],
        prodRepManual: json["prod_rep_manual"],
        prodRepOrganizacional: json["prod_rep_organizacional"],
        prodRepPersonal: json["prod_rep_personal"],
        prodRepRechazados: json["prod_rep_rechazados"],
        prodUbiClientes: json["prod_ubi_clientes"],
        prodUbiEconomico: json["prod_ubi_economico"],
        prodUbiManoObra: json["prod_ubi_manoObra"],
        prodUbiMateriaPrima: json["prod_ubi_materiaPrima"],
        prodUbiMedioAmbiente: json["prod_ubi_medioAmbiente"],
      );

  Map<String, dynamic> toMap() => {
        "prod_cal_estandar": prodCalEstandar,
        "prod_cal_mejoras": prodCalMejoras,
        "prod_cal_tecnologia": prodCalTecnologia,
        "prod_cometarioProduccion": prodCometarioProduccion,
        "prod_lug_amb_alimentos": prodLugAmbAlimentos,
        "prod_lug_amb_colores": prodLugAmbColores,
        "prod_lug_amb_lockers": prodLugAmbLockers,
        "prod_lug_amb_luz": prodLugAmbLuz,
        "prod_lug_amb_ruido": prodLugAmbRuido,
        "prod_lug_amb_sanitarias": prodLugAmbSanitarias,
        "prod_lug_amb_seg_botiquin": prodLugAmbSegBotiquin,
        "prod_lug_amb_seg_seguridad": prodLugAmbSegSeguridad,
        "prod_lug_amb_seg_telefono": prodLugAmbSegTelefono,
        "prod_lug_amb_temperatura": prodLugAmbTemperatura,
        "prod_lug_amb_ventilacion": prodLugAmbVentilacion,
        "prod_lug_dis_linea": prodLugDisLinea,
        "prod_lug_dis_puesto": prodLugDisPuesto,
        "prod_lug_dis_taller": prodLugDisTaller,
        "prod_lug_edificio": prodLugEdificio,
        "prod_lug_espacio": prodLugEspacio,
        "prod_maq_adecuado": prodMaqAdecuado,
        "prod_maq_suficiente": prodMaqSuficiente,
        "prod_maq_mantenimiento": prodMaqMantenimiento,
        "prod_mat_calidadAtributos": prodMatCalidadAtributos,
        "prod_mat_calidadDisponibilidad": prodMatCalidadDisponibilidad,
        "prod_mat_calidadEntregas": prodMatCalidadEntregas,
        "prod_mat_calidadEstandarizacion": prodMatCalidadEstandarizacion,
        "prod_mat_calidadPrecio": prodMatCalidadPrecio,
        "prod_mat_calidadTrabajabilidad": prodMatCalidadTrabajabilidad,
        "prod_mat_cantidadCompras": prodMatCantidadCompras,
        "prod_mat_cantidadInventarios": prodMatCantidadInventarios,
        "prod_proc_costosFijos": prodProcCostosFijos,
        "prod_proc_costosVariables": prodProcCostosVariables,
        "prod_proc_desperdicios": prodProcDesperdicios,
        "prod_proc_dispositivos": prodProcDispositivos,
        "prod_proc_embarques": prodProcEmbarques,
        "prod_proc_materiales": prodProcMateriales,
        "prod_proc_normas": prodProcNormas,
        "prod_proc_ocios": prodProcOcios,
        "prod_proc_procesos": prodProcProcesos,
        "prod_rep_calidadMateriales": prodRepCalidadMateriales,
        "prod_rep_computarizado": prodRepComputarizado,
        "prod_rep_costosMateriales": prodRepCostosMateriales,
        "prod_rep_desperdicios": prodRepDesperdicios,
        "prod_rep_inventarios": prodRepInventarios,
        "prod_rep_lirico": prodRepLirico,
        "prod_rep_manual": prodRepManual,
        "prod_rep_organizacional": prodRepOrganizacional,
        "prod_rep_personal": prodRepPersonal,
        "prod_rep_rechazados": prodRepRechazados,
        "prod_ubi_clientes": prodUbiClientes,
        "prod_ubi_economico": prodUbiEconomico,
        "prod_ubi_manoObra": prodUbiManoObra,
        "prod_ubi_materiaPrima": prodUbiMateriaPrima,
        "prod_ubi_medioAmbiente": prodUbiMedioAmbiente,
      };
  SubsistemaProduccion copy() => SubsistemaProduccion(
        prodCalEstandar: prodCalEstandar,
        prodCalMejoras: prodCalMejoras,
        prodCalTecnologia: prodCalTecnologia,
        prodCometarioProduccion: prodCometarioProduccion,
        prodLugAmbAlimentos: prodLugAmbAlimentos,
        prodLugAmbColores: prodLugAmbColores,
        prodLugAmbLockers: prodLugAmbLockers,
        prodLugAmbLuz: prodLugAmbLuz,
        prodLugAmbRuido: prodLugAmbRuido,
        prodLugAmbSanitarias: prodLugAmbSanitarias,
        prodLugAmbSegBotiquin: prodLugAmbSegBotiquin,
        prodLugAmbSegSeguridad: prodLugAmbSegSeguridad,
        prodLugAmbSegTelefono: prodLugAmbSegTelefono,
        prodLugAmbTemperatura: prodLugAmbTemperatura,
        prodLugAmbVentilacion: prodLugAmbVentilacion,
        prodLugDisLinea: prodLugDisLinea,
        prodLugDisPuesto: prodLugDisPuesto,
        prodLugDisTaller: prodLugDisTaller,
        prodLugEdificio: prodLugEdificio,
        prodLugEspacio: prodLugEspacio,
        prodMaqAdecuado: prodMaqAdecuado,
        prodMaqSuficiente: prodMaqSuficiente,
        prodMaqMantenimiento: prodMaqMantenimiento,
        prodMatCalidadAtributos: prodMatCalidadAtributos,
        prodMatCalidadDisponibilidad: prodMatCalidadDisponibilidad,
        prodMatCalidadEntregas: prodMatCalidadEntregas,
        prodMatCalidadEstandarizacion: prodMatCalidadEstandarizacion,
        prodMatCalidadPrecio: prodMatCalidadPrecio,
        prodMatCalidadTrabajabilidad: prodMatCalidadTrabajabilidad,
        prodMatCantidadCompras: prodMatCantidadCompras,
        prodMatCantidadInventarios: prodMatCantidadInventarios,
        prodProcCostosFijos: prodProcCostosFijos,
        prodProcCostosVariables: prodProcCostosVariables,
        prodProcDesperdicios: prodProcDesperdicios,
        prodProcDispositivos: prodProcDispositivos,
        prodProcEmbarques: prodProcEmbarques,
        prodProcMateriales: prodProcMateriales,
        prodProcNormas: prodProcNormas,
        prodProcOcios: prodProcOcios,
        prodProcProcesos: prodProcProcesos,
        prodRepCalidadMateriales: prodRepCalidadMateriales,
        prodRepComputarizado: prodRepComputarizado,
        prodRepCostosMateriales: prodRepCostosMateriales,
        prodRepDesperdicios: prodRepDesperdicios,
        prodRepInventarios: prodRepInventarios,
        prodRepLirico: prodRepLirico,
        prodRepManual: prodRepManual,
        prodRepOrganizacional: prodRepOrganizacional,
        prodRepPersonal: prodRepPersonal,
        prodRepRechazados: prodRepRechazados,
        prodUbiClientes: prodUbiClientes,
        prodUbiEconomico: prodUbiEconomico,
        prodUbiManoObra: prodUbiManoObra,
        prodUbiMateriaPrima: prodUbiMateriaPrima,
        prodUbiMedioAmbiente: prodUbiMedioAmbiente,
        id: id,
      );
}
