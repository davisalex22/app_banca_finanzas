import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_banca_finanzas/models/models.dart';
import 'package:app_banca_finanzas/screens/screens.dart';
import 'package:app_banca_finanzas/services/services.dart';
import 'package:app_banca_finanzas/widgets/widgets.dart';

class InfoEmpresaScreen extends StatelessWidget {
  const InfoEmpresaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empresasService = Provider.of<EmpresasService>(context);
    final value = empresasService.selectedEmpresa;

    if (empresasService.isLoading) return const HomeScreen();
    var valor = true;
    //print(value.empCalculosVentasActivos?.isEmpty);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [],
            )),
        body: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
            child: Column(children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 40, bottom: 30),
                          child: Column(children: [
                            Text('${value.empresaNombre}',
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 25,
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  //icon: Icon(Icons.add, size: 18),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registroEmpresa');
                                  },
                                  child: const Text('EDITAR'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    empresasService.deleteEmpresa(value);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('ELIMINAR'),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Section("General"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Subtitle("Teléfono"),
                                              Subtitle("Dirección"),
                                              Subtitle("R.F.C")
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Info(value.empresaTelefono),
                                              Info(value.empresaDireccion),
                                              Info(value.empresaRfc),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Subtitle("Domicilio fiscal"),
                                              Subtitle("Antiguedad"),
                                              //Subtitle("Año de inicio"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Info(
                                                  value.empresaDomicilioFiscal),
                                              Info(
                                                  value.empresaAniosAntiguedad),
                                            ],
                                          ),
                                          Section("Estado legal"),
                                          //
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Subtitle("Persona fisica"),
                                              Subtitle("Persona moral"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Info(value
                                                  .empEstLegalPersonaFisica),
                                              Info(value
                                                  .empEstLegalPersonaMoral),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Subtitle("Persona no registrada"),
                                              Subtitle("Estado fiscal"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Info(value
                                                  .empEstLegalNoRegistrada),
                                              Info(value.empEstatusFiscal),
                                            ],
                                          ),

                                          //
                                          Section("Tamaño"),
                                          Title("Empleados"),
                                          Subtitle("Operativos"),
                                          Info(value.empTamNumEmpOperativos),
                                          Subtitle("Administrativos"),
                                          Info(value
                                              .empTamNumEmpAdministrativos),
                                          Subtitle("Otros"),
                                          Info(value.empTamNumEmpOtros),
                                          Subtitle("Total"),
                                          Info(value.empTamNumEmpTotal),
                                          Subtitle("Comentario"),
                                          Info(value.empTamNumEmpComentarios),
                                          //
                                          Title("Ventas"),
                                          Subtitle("Diarias"),
                                          Info(value.empVentasDiarias),
                                          Subtitle("Semanales"),
                                          Info(value.empVentasSemanales),
                                          Subtitle("Mensuales"),
                                          Info(value.empVentasMensuales),
                                          //
                                          Title("Activos"),
                                          Subtitle("Terreno"),

                                          Info(value.empValActivosTerreno),
                                          Subtitle("Bienes"),
                                          Info(value.empValActivosBienes),
                                          Subtitle("Otros"),
                                          Info(value.empValActivosOtros),

                                          //Info(value.empresaAniosInicio),

                                          Title("Cálculos"),
                                          Subtitle("Ventas/empleados"),
                                          Info(
                                              value.empCalculosVentasEmpleados),
                                          Subtitle("Ventas/activo"),
                                          Info(value.empCalculosVentasActivos),
                                          Section("Cobertura de mercado"),

                                          Subtitle("Local"),

                                          Info(value.empCobMercadoLocal),
                                          Subtitle("Regional"),
                                          Info(value.empCobMercadoRegional),
                                          Subtitle("Internacional"),
                                          Info(
                                              value.empCobMercadoInternacional),
                                          //
                                          Section("Vision"),
                                          Subtitle("Corto Plazo"),
                                          Info(value.empVisionCortoPlazo),
                                          Subtitle("Largo plazo"),
                                          Info(value.empVisionLargoPlazo),
                                          Title("Comentario de antecedentes"),
                                          Info(value.empComentarioEjecutivo),
                                        ])))),
                      ],
                    )),
              )
            ])));
  }
}

Widget Title(str) => Text('$str',
    style: const TextStyle(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold));

Widget Section(str) => Text('$str',
    style: const TextStyle(
        fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold));

Widget Subtitle(str) => Text('$str',
    style: const TextStyle(
        fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold));

Widget Info(str) =>
    Text('$str', style: const TextStyle(fontSize: 15.0, color: Colors.black));
