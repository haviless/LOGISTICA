Unit LOGDM1;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : LOGDM1
// FORMULARIO               : DMLOG
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : El módulo de datos contiene los ClientaDataSet y los
//                            DataSource que se usan en el módulo para interactuar
//                            con los datos de la Base de Datos.
//                            también contiene las funcionalidades genéricas que
//                            pueden ser invocadas desde cualquier formulario
//                            del módulo

// ACTUALIZACIONES:
// SAR666                      Recupera el número maximo de orden de compra
// HPC_201106_LOG 01/09/2011   Se modifica la ruta de los RTMs debido a la unificación
//                             de todos los módulos del Oasis
// HPC_201202_LOG 13/04/2012:  Se implementó las funciones DMLOG.fg_ValidaDatosProveedor y
//                             DMLOG.fg_validaContactosProv para verificar si el proveedor
//                             tiene todos los datos completados
// HPC_201206_LOG 07/05/2012:  Se implementó la fg_FiltraTablaOtorgadosque verifica si el usuario
//                             tiene asignado los accesos correspondientes en la tabla TGE014
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201210_LOG 03/07/2012:  Se el registro de Solicitudes de Cotización, proformas y
//                             generación del Cuadro Comparativo
// HPC_201301_LOG 15/04/2013:  Funcion para verificar el tipo de inventario.
// HPC_201402_LOG 29/05/2014   Funcion generica que cambia un numero string en valor
// HPC_201601_LOG 22/09/2016   Añade Control de Acceso por Grupo de Usuario
//                             Asigna grupo de usuario a variable para controlar acceso a opciones
// HPC_201701_LOG            : Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
// HPC_201803_LOG              Se implementa debido a la solicitud de Orden de Pago
// HPC_201804_LOG              Se implementa debido a cambios en Recibo de Servicios

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBClient, MConnect, Wwdatsrc, wwclient, DBTables, Wwquery, Db,
   IniFiles, RecError, Variants, Mant, Math, SConnect,
   winsock;

Type
   TDMLOG = Class(TDataModule)
      dsArti: TwwDataSource;
      cdsCCost: TwwClientDataSet;
      dsCCost: TwwDataSource;
      cdsCIA: TwwClientDataSet;
      dsCIA: TwwDataSource;
      cdsGArti: TwwClientDataSet;
      dsGArti: TwwDataSource;
      dsReqs: TwwDataSource;
      cdsUMed: TwwClientDataSet;
      dsUMed: TwwDataSource;
      cdsUsers: TwwClientDataSet;
      dsUsers: TwwDataSource;
      cdsTMoneda: TwwClientDataSet;
      dsTMoneda: TwwDataSource;
      cdsSQL: TwwClientDataSet;
      dsSQL: TwwDataSource;
      cdsSolCot: TwwClientDataSet;
      dsSolCot: TwwDataSource;
      cdsLEntrega: TwwClientDataSet;
      dsLEntrega: TwwDataSource;
      dsFPago: TwwDataSource;
      cdsTSolCot: TwwClientDataSet;
      dsTSolCot: TwwDataSource;
      cdsRqsArtX: TwwClientDataSet;
      dsRqsArtX: TwwDataSource;
      cdsDSCxDRQS: TwwClientDataSet;
      dsDSCxDRQS: TwwDataSource;
      cdsTRqs: TwwClientDataSet;
      dsTRqs: TwwDataSource;
      cdsArtPendX: TwwClientDataSet;
      dsArtPendX: TwwDataSource;
      cdsQry: TwwClientDataSet;
      dsQry: TwwDataSource;
      cdsFPago: TwwClientDataSet;
      cdsMedCom: TwwClientDataSet;
      dsMedCom: TwwDataSource;
      cdsSCxProv: TwwClientDataSet;
      dsSCxProv: TwwDataSource;
      cdsSolxCIA: TwwClientDataSet;
      dsSolxCIA: TwwDataSource;
      cdsOrdComp: TwwClientDataSet;
      dsOrdComp: TwwDataSource;
      cdsDOrdComp: TwwClientDataSet;
      dsDOrdComp: TwwDataSource;
      cdsProfxCIA: TwwClientDataSet;
      dsProfxCIA: TwwDataSource;
      cdsDProfxCIA: TwwClientDataSet;
      dsDProfxCIA: TwwDataSource;
      cdsPxAxR: TwwClientDataSet;
      dsPxAxR: TwwDataSource;
      cdsFAB: TwwClientDataSet;
      dsFAB: TwwDataSource;
      dsEARTI: TwwDataSource;
      cdsClnArti: TwwClientDataSet;
      dsClnArti: TwwDataSource;
      dsQARTI: TwwDataSource;
      cdsNIS: TwwClientDataSet;
      dsNIS: TwwDataSource;
      cdsALM: TwwClientDataSet;
      dsALM: TwwDataSource;
      cdsTDOC: TwwClientDataSet;
      dsTDOC: TwwDataSource;
      cdsTRAN: TwwClientDataSet;
      dsTRAN: TwwDataSource;
      cdsSTK: TwwClientDataSet;
      dsSTK: TwwDataSource;
      cdsCNS: TwwClientDataSet;
      dsCNS: TwwDataSource;
      cdsEUNMED: TwwClientDataSet;
      dsEUNMED: TwwDataSource;
      cdsNIA: TwwClientDataSet;
      dsNIA: TwwDataSource;
      cdsTDNISA: TwwClientDataSet;
      dsTDNISA: TwwDataSource;
      cdsOCNIA: TwwClientDataSet;
      dsOCNIA: TwwDataSource;
      cdsLKTRAN: TwwClientDataSet;
      dsLKTRAN: TwwDataSource;
      cdsPRIO: TwwClientDataSet;
      dsPRIO: TwwDataSource;
      dsAPNIS: TwwDataSource;
      cdsAPNIS: TwwClientDataSet;
      cdsQARTI: TwwClientDataSet;
      cdsArti: TwwClientDataSet;
      cdsEARTI: TwwClientDataSet;
      cdsReqs: TwwClientDataSet;
      cdsLOC: TwwClientDataSet;
      dsLOC: TwwDataSource;
      cdsKDXTemp: TwwClientDataSet;
      dsKDXTemp: TwwDataSource;
      cdsObra: TwwClientDataSet;
      dsObra: TwwDataSource;
      cdsUsuarios: TwwClientDataSet;
      cdsMGrupo: TwwClientDataSet;
      cdsGrupos: TwwClientDataSet;
      cdsAcceso: TwwClientDataSet;
      dsUsuarios: TwwDataSource;
      dsMGrupo: TwwDataSource;
      dsGrupos: TwwDataSource;
      dsAcceso: TwwDataSource;
      cdsProforma: TwwClientDataSet;
      dsProforma: TwwDataSource;
      cdsTASAS: TwwClientDataSet;
      dsTASAS: TwwDataSource;
      cdsTIPCAM: TwwClientDataSet;
      dsTIPCAM: TwwDataSource;
      dsDReqs: TwwDataSource;
      cdsDReqs: TwwClientDataSet;
      cdsDSolCot: TwwClientDataSet;
      dsDSolCot: TwwDataSource;
      cdsDProforma: TwwClientDataSet;
      dsDProforma: TwwDataSource;
      cdsMovCxP: TwwClientDataSet;
      dsMovCxP: TwwDataSource;
      cdsDetCxP: TwwClientDataSet;
      dsDetCxP: TwwDataSource;
      cdsComprador: TwwClientDataSet;
      dsComprador: TwwDataSource;
      cdsKDX: TwwClientDataSet;
      dsKDX: TwwDataSource;
      cdsProv: TwwClientDataSet;
      dsProv: TwwDataSource;
      cdsArtPend: TwwClientDataSet;
      dsArtPend: TwwDataSource;
      cdsRqsArt: TwwClientDataSet;
      dsRqsArt: TwwDataSource;
      cdsGrab: TwwClientDataSet;
      cdsEval: TwwClientDataSet;
      dsEval: TwwDataSource;
      cdsConCom: TwwClientDataSet;
      dsConCom: TwwDataSource;
      cdsTotEval: TwwClientDataSet;
      dsTotEval: TwwDataSource;
      cdsMotivos: TwwClientDataSet;
      dsMotivos: TwwDataSource;
      cdsEvalRep: TwwClientDataSet;
      dsEvalRep: TwwDataSource;
      cdsFAM: TwwClientDataSet;
      dsFAM: TwwDataSource;
      cdsSUBFAM: TwwClientDataSet;
      dsSUBFAM: TwwDataSource;
      cdsTINID: TwwClientDataSet;
      dsTINID: TwwDataSource;
      cdsPCUENTA: TwwClientDataSet;
      dsPCUENTA: TwwDataSource;
      cdsParaRepo: TwwClientDataSet;
      dsParaRepo: TwwDataSource;
      cdsTipSol: TwwClientDataSet;
      dsTipSol: TwwDataSource;
      cdsCondComercial: TwwClientDataSet;
      dsCondComercial: TwwDataSource;
      cdsSerPend: TwwClientDataSet;
      dsSerPend: TwwDataSource;
      cdsPais: TwwClientDataSet;
      dsPais: TwwDataSource;
      cdsDpto: TwwClientDataSet;
      dsDpto: TwwDataSource;
      cdsProvinc: TwwClientDataSet;
      dsProvinc: TwwDataSource;
      cdsDistrito: TwwClientDataSet;
      dsDistrito: TwwDataSource;
      cdsSecEco: TwwClientDataSet;
      dsSecEco: TwwDataSource;
      cdsGiro: TwwClientDataSet;
      dsGiro: TwwDataSource;
      cdsClasif: TwwClientDataSet;
      dsClasif: TwwDataSource;
      cdsClAux: TwwClientDataSet;
      dsClAux: TwwDataSource;
      cdsTipProv: TwwClientDataSet;
      dsTipProv: TwwDataSource;
      cdsReporte: TwwClientDataSet;
      dsReporte: TwwDataSource;
      cdsMTipProv: TwwClientDataSet;
      dsMTipProv: TwwDataSource;
      cdsFAsig: TwwClientDataSet;
      dsFAsig: TwwDataSource;
      cdsArtPendXTot: TwwClientDataSet;
      dsArtPendXTot: TwwDataSource;
      cdsRqsArtXTot: TwwClientDataSet;
      dsRqsArtXTot: TwwDataSource;
      cdsConsumo: TwwClientDataSet;
      dsConsumo: TwwDataSource;
      cdsDODCxDRQS: TwwClientDataSet;
      dsDODCxDRQS: TwwDataSource;
      cdsDetMov: TwwClientDataSet;
      dsDetMov: TwwDataSource;
      cdsLOG: TwwClientDataSet;
      cdsPeriodo: TwwClientDataSet;
      dsPeriodo: TwwDataSource;
      cdsTipPre: TwwClientDataSet;
      cdsParPre: TwwClientDataSet;
      cdsCabPre: TwwClientDataSet;
      cdsDetPre: TwwClientDataSet;
      dsParPre: TwwDataSource;
      dsCabPre: TwwDataSource;
      dsTipPre: TwwDataSource;
      dsDetPre: TwwDataSource;
      cdsNivelPresu: TwwClientDataSet;
      dsNivelPresu: TwwDataSource;
      cdsProfxEval: TwwClientDataSet;
      dsProfxEval: TwwDataSource;
      cdsValEva: TwwClientDataSet;
      dsValEva: TwwDataSource;
      cdsEvalResul: TwwClientDataSet;
      dsEvalResul: TwwDataSource;
      dsLOG: TwwDataSource;
      cdsRegEval: TwwClientDataSet;
      dsRegEval: TwwDataSource;
      cdsReqAut: TwwClientDataSet;
      dsReqAut: TwwDataSource;
      cdsPedUsu: TwwClientDataSet;
      dsPedUsu: TwwDataSource;
      cdsDPedUsu: TwwClientDataSet;
      dsDPedUsu: TwwDataSource;
      cdsTipPer: TwwClientDataSet;
      dsTipPer: TwwDataSource;
      dsNegociacion: TwwDataSource;
      cdsNegociacion: TwwClientDataSet;
      cdsResultSet: TwwClientDataSet;
      cdsDeltaSet: TwwClientDataSet;
      dsDeltaSet: TwwDataSource;
      cdsDHojaT: TwwClientDataSet;
      dsDHojaT: TwwDataSource;
      cdsMovFac: TwwClientDataSet;
      dsMovFac: TwwDataSource;
      dsDetFac: TwwDataSource;
      cdsDetFac: TwwClientDataSet;
      cdsHojaT: TwwClientDataSet;
      dsHojaT: TwwDataSource;
      cdsCComer: TwwClientDataSet;
      cdsQry1: TwwClientDataSet;
      cdsSolu: TwwClientDataSet;
      dsSolu: TwwDataSource;
      cdsQry3: TwwClientDataSet;
      dsQry3: TwwDataSource;
      cdsTReg: TwwClientDataSet;
      cdsUltTGE: TwwClientDataSet;
      dsTLPrecio: TwwDataSource;
      cdsTLPrecio: TwwClientDataSet;
      dsDireccion: TwwDataSource;
      cdsDireccion: TwwClientDataSet;
      dsDscto: TwwDataSource;
      cdsDscto: TwwClientDataSet;
      cdsQry4: TwwClientDataSet;
      dsQry4: TwwDataSource;
      cdsQry6: TwwClientDataSet;
      dsQry6: TwwDataSource;
      cdsDRComp: TwwClientDataSet;
      dsVen: TwwDataSource;
      cdsVen: TwwClientDataSet;
      dsTVta: TwwDataSource;
      cdsTVta: TwwClientDataSet;
      cdsEmpresa: TwwClientDataSet;
      cdsTLista: TwwClientDataSet;
      dsClie: TwwDataSource;
      cdsClie: TwwClientDataSet;
      dsDiasGracia: TwwDataSource;
      cdsDiasGracia: TwwClientDataSet;
      cdsQry7: TwwClientDataSet;
      dsQry7: TwwDataSource;
      cdsQry2: TwwClientDataSet;
      cdsQry5: TwwClientDataSet;
      dsQry5: TwwDataSource;
      dsLPrecio: TwwDataSource;
      cdsLPrecio: TwwClientDataSet;
      cdsLinea: TwwClientDataSet;
      dsLinea: TwwDataSource;
      cdsTTran: TwwClientDataSet;
      cdsCanal: TwwClientDataSet;
      dsCanal: TwwDataSource;
      cdsRequDet: TwwClientDataSet;
      cdsRequCab: TwwClientDataSet;
      dsRequDet: TwwDataSource;
      dsRequCab: TwwDataSource;
      cdsListaTx: TwwClientDataSet;
      dsListaTx: TwwDataSource;
      cdsCCanje: TwwClientDataSet;
      dsCCanje: TwwDataSource;
      cdsPadre: TwwClientDataSet;
      cdsHijo: TwwClientDataSet;
      cdsNieto: TwwClientDataSet;
      cdsSobrino: TwwClientDataSet;
      dsPadre: TwwDataSource;
      dsHijo: TwwDataSource;
      dsNieto: TwwDataSource;
      dsSobrino: TwwDataSource;
      cdsLKAlm: TwwClientDataSet;
      dsLKAlm: TwwDataSource;
      cdsUser: TwwClientDataSet;
      dsUser: TwwDataSource;
      cdsQry10: TwwClientDataSet;
      cdsQry11: TwwClientDataSet;
      cdsQry12: TwwClientDataSet;
      dsQry10: TwwDataSource;
      dsQry11: TwwDataSource;
      dsQry12: TwwDataSource;
      cdsCC: TwwClientDataSet;
      dsCC: TwwDataSource;
      DCOM1: TSocketConnection;
      cdsAcceso1: TwwClientDataSet;
      dsAcceso1: TwwDataSource;
      dsTipoGarantia: TwwDataSource;
      cdsTipoGarantia: TwwClientDataSet;
      dsCuadroComparativo: TwwDataSource;
      cdsCuadroComparativo: TwwClientDataSet;
      cdsProformaLista: TwwClientDataSet;
      dsProformaLista: TwwDataSource;
      dsDoc2: TwwDataSource;
      cdsDoc2: TwwClientDataSet;
      cdsTReqOrdTrab: TwwClientDataSet;
      dsTReqOrdTrab: TwwDataSource;
      cdsComprador2: TwwClientDataSet;
      dsComprador2: TwwDataSource;
      cdsOrdTrabDet: TwwClientDataSet;
      dsOrdTrabDet: TwwDataSource;
      cdsCompradores: TwwClientDataSet;
      dsCompradores: TwwDataSource;
// Inicio HPC_201701_LOG
// Incluir sección cuenta bancaria del proveedor, CCI y Tipo de Moneda en Detalle de Solicitud de Orden Pago.
      cdsCtaBancaria: TwwClientDataSet;
      dsCtaBancaria: TwwDataSource;
      cdsQryRUC: TwwClientDataSet;
      dsQryRUC: TwwDataSource;
// Inicio HPC_201803_LOG
// Se implementa debido a la solicitud de Orden de Pago
      cdsCIAOP: TwwClientDataSet;
      dsCIAOP: TwwDataSource;
// Inicio HPC_201804_LOG
// Se actualiza el grid de movimientos de pagos
    cdsMovPag: TwwClientDataSet;
    dsMovPag: TwwDataSource;
// Fin HPC_201804_LOG
// Fin HPC_201803_LOG
// Fin HPC_201701_LOG
      Procedure cdsSolCotCIAIDChange(Sender: TField);
      Procedure cdsPxAxRCalcFields(DataSet: TDataSet);
      Procedure cdsRqsArtXCalcFields(DataSet: TDataSet);
      Procedure GrabaDatos(wCDS: TClientDataSet; wNomArch: String);
      Procedure DataModuleCreate(Sender: TObject);
      Procedure cdsReqsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; Var Action: TReconcileAction);
      Procedure Accesos;
      Procedure cdsDODCxDRQSReconcileError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind;
         Var Action: TReconcileAction);

   Private
    { Private declarations }
   Public

      cIP, wOfiId, widepc, ideconex, fechorcon: String;

      wFormatFecha,
         wReplacCeros,
         wRepFecServi,
         wRepHorServi,
         wRepFuncDate,
         wRepTrim,

      wUsuario, wModo, wGrupo, wAdmin, wModulo, wGrupoTmp, wObjetoDescr, wObjetoForma, wObjetoNombr, wObjetoDesPr,
         wCHEQUE, wTARJETA, wClaseAuxClie, wClaseAuxProv, wEFECTIVO, wTipoCambio: String;
      wVRN_CondP: String; // Condicion de Pedido a Asignar en la creacion un nuevo cliente

      wVtaLocal: String; // BuscaQry('dspUltTGE','FAC105','TVTAID','TVTAFLAG='+quotedstr('L'),'TVTAID'); Tipo de Venta Local
      wVtaProv: String; // BuscaQry('dspUltTGE','FAC105','TVTAID','TVTAFLAG='+quotedstr('P'),'TVTAID'); Tipo de Venta Provincia
      wTransVta: String; //Transaccion de
      wsLet: String; //Flag de id de Letra
      wsAnt: String; //Flag de Id Anticipo
      wsChe: String; //Flag de id Cheque
      wsNCre: String; //Flag de Id de Nota de credito
      wsClie: String; //Flag de Clase de Auxiliar de Cliente
      wOfid: String; //Flag de id de oficina
      wDepura: String;
      wTMonExt: String;
      wTMonLoc: String;
      wAreaSolu: String;
      wComponente: TControl;
      wAnchoPu: Integer;
      wAnchoArt: Integer;
      wAnchoProv: Integer;
      wNoPanel: Integer;
      wReqComp: String;
      wsLocalidad: String;

      wTipoAdicion: String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      sClose, wSRV: String;
      //Inicio HPC_201402_LOG
      wciaid, wNumordtra, wNumorddet: String;
      //Final  HPC_201402_LOG

    { Public declarations }
      Procedure AplicaDatos(wCDS: TClientDataSet; wNomArch: String);

      //procedure ControlTran;
      Procedure ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
      Procedure ExecSQL(Const cSQL: String);
      Function MaxArt(Const sCIA: String): String;
      Function MaxReqs(Const sCIA, sLOC, sALM: String): String;
      Function MaxReqA(Const sCIA, sLOC: String): String;
      Function MaxPedUsu(Const sCIA, sLOC, sCCO: String): String;
      Function MaxNisaSa(Const sCIA, sLOC, sTIN, sALM, sTDA: String): String;
      Function MaxNOTranReq(Const sCIA, sLOC: String): String;
      Function IsExistOTrab(Const sCIA, sLOC, sOTRA: String): Boolean;
      Function MaxSCC(Const sCIA: String): String;
      Function MaxProv(Const sCIA: String): String;
      Function MaxValue(Const sDetail: String; CD: TDataSet): String;
      Function MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
      Function StrZero(wNumero: String; wLargo: Integer): String;
      Function UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
      Function IsExistRqs(Const sCIA, sLOC, sALM, sRQS: String): Boolean;
      Function IsExistRqsM(Const sCIA, sLOC, sRQS: String): Boolean; // requisicion manual
      Function IsExistSol(Const sCIA, sSol: String): Boolean;
      Function MaxPROF(Const sCIA: String): String;
      Function IsExistProf(Const sCIA, sPRF, sPRFP: String): Boolean;
      Function DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;

      Procedure MultiOpen(Const CDS: Array Of TwwClientDataSet);
      Procedure MultiClose(Const CDS: Array Of TwwClientDataSet);
      Function MaxORD(Const sCIA: String): String;
      Function MaxORDAnio(xsCompania, xsAnio: String): String;
      Function IsExistORD(Const sCIA, sORD: String): Boolean;
      Function IsExistART(Const sCIA, sART: String): Boolean;
      Function IsExistNISA(Const sCIA, sALM, sTDA, sNISA: String): Boolean;
      Function MaxNIS(Const sCIA, sALM, sTDA: String): String;
      Function MaxNIA(Const sCIA, sALM, sTDA: String): String;

      Procedure dOpen;
      Procedure dClose;

      Function CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
      Function DesEncripta(wPalabra: String): String;
      Function Encripta(wPalabra: String): String;
      Procedure AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
      Procedure AccesosBotones(xxModulo, xxUsuario, xxForma: String);
      Procedure AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
      Function BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
      Procedure Filtracds(xxCds: TwwClientDataSet; xxSQL: String); //	Prov
      Function BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
      Procedure GrabaAuxConta(wCDST: TClientDataSet);
      Function OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
      Function RecuperarDatos(xTabla, xCampos, xWhere: String): Boolean;
      Function LogDec(xNumero: String; Digitos: Integer = 2): String;
      Function Factor(xUmed, xUmedEquiv: String): currency;
      Function CalcTipoCambio(sMoneda: String; dtFecha: tdatetime; sCampo: String): String;
      Procedure Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
      Procedure ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String);
      Procedure cdsPost(xxCds: TwwClientDataSet);
      Function BuscaFecha(PTable, PDescrip, PKey: String; PVal: TDateTime): Boolean;
      Function BuscaFacPed(PCia, PClie, PPedido, PClaux: String): Boolean;
      Function BuscaRegPrecio(PCia, PTLista, PArt: String): Boolean;
      Function AnoNumDoc(Flag, Num, Ano: String): String;
      Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo, xxOrden: String; xxWhere: String = '');
      Procedure fg_FiltraTablaOtorgados(wgCds: TwwClientDataSet; wgArchivo, wgCampo, wgOrden: String; wgWhere: String = '');
      Procedure DisminuyeForma(Sender: TObject);
      Procedure ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
      Function FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;

      Function ObtenerIpdeNetbios(Host: String): String;
      Function ComputerName: String;
      Function AccesosModulo: Boolean;
      Function fg_ValidaDatosProveedor(wgCodAuxiliar, wgCodProveedor: String; Var wgMensaje: String): Boolean;
      Function fg_ValidaContactosProv(wgCdsProveedor: TwwClientDataSet; Var wgMensaje: String): Boolean;
      Function fg_VerificaVersion(wgVersion: String): Boolean;
      Function VerificaTipInventario(vCIAID: String; vTINID: String): Boolean;
      Function Valores(Texto: String): double;
      Function wf_AccesoOpcion(wOpcion: String): Boolean;

   End;

Var
   DMLOG: TDMLOG;
   wActuaPresu: bool;
   wModo, xBorrar: String;
   SRV_E, SRV_D: String;
   SRV_V: String;
   wRptCia, wRutaRpt, wUrqCia, wNegCia, wExoVis, wFil_Ccos: String;
   Prm_RqsPedUsu: String;
   wConsumo, ErrorCount, wAnchoGuia: Integer;
   xPeriodo, xSQL: String; //** 15/062001- pjsv - para presupuesto
   xFec_Sis, xHor_Sis, wFormatHoras, wRepTimeServi, wRepFuncChar: String;

Function wPreUni: integer;

Function FRound(xReal: Double; xEnteros, xDecimal: Integer): Double;
Function DateS(): TDatetime; // devuelve fecha del servidor

Implementation

Uses LOG020;

{$R *.DFM}

Function DateS: TDatetime;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + DMLOG.wRepFecServi + ' FECHA  FROM TGE901 ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(sSQL);
   DMLOG.cdsQry.Open;
   Result := DMLOG.cdsQry.fieldbyname('FECHA').AsDateTime;
End;

Function wPreUni: integer;
Var
   wConta: Integer;
Begin
   wConta := 0;
   DMLOG.cdsDOrdComp.DisableControls;
   DMLOG.cdsDOrdComp.First;
   While Not DMLOG.cdsDOrdComp.Eof Do
   Begin
      If DMLOG.cdsDOrdComp.FieldByName('DODCPUN').AsFloat = 0.0 Then
         wConta := wConta + 1;
      DMLOG.cdsDOrdComp.Next;
   End;
   DMLOG.cdsDOrdComp.First;
   DMLOG.cdsDOrdComp.EnableControls;
   If wConta > 0 Then
      ShowMessage('Visado de Orden de Compra, Al menos uno de los Campos de Precio Unitario esta en Blanco ' + #13 +
         ' No se Puede Visar esta Orden de Compra ' + #13 + #13 +
         'Verifique !!! ');
   Result := wConta;
End;

Procedure TDMLOG.cdsPost(xxCds: TwwClientDataSet);
Var
   i: integer;
Begin
   For i := 0 To xxCds.Fields.Count - 1 Do
   Begin
      If xxCds.Fields[i].ClassType = TStringField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].Clear;
      End;

      If xxCds.Fields[i].ClassType = TMemoField Then
      Begin
         If xxCds.Fields[i].AsString = '' Then
            xxCds.Fields[i].AsString := '.';
      End;
   End;
End;

Procedure TDMLOG.AplicaDatos(wCDS: TClientDataSet; wNomArch: String);

Var
   Results, OwnerData: OleVariant;
Begin
   If (wCDS.ChangeCount > 0) Or (wCDS.Modified) Then
   Begin
      wCDS.CheckBrowseMode;
      Results := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName, wcds.Delta, -1, ErrorCount, OwnerData);
      cdsResultSet.Data := Results;
      wCDS.Reconcile(Results);
   End;
End;

//procedure TDMLOG.ControlTran;

Procedure TDMLOG.ControlTran(wControlError: Integer; wCDS: TClientDataSet; wNomArch: String);
Begin
// wControlError=1 errores en el SQL, entra a través del Except
// wControlError=9 para la grabación en línea
// wControlError=0 grabación a través de procesos batch, no actualiza físicamente
// wControlError=8 commit;
// DMLOG.ControlTran( 0, nil, '' ); para grabar todas los cds que han sido modificados
// DMLOG.ControlTran( 0, DMLOG.cdsGuia, 'GUIA');  graba sólo el cds especificado
 {
 DMLOG.ControlTran( 9, DMLOG.cdsProforma, 'PROFORMA');

 ErrorCount:=0;
 DMLOG.DCOM1.AppServer.IniciaTransaccion;

 DMLOG.ControlTran( 0, DMLOG.cdsProforma, 'PROFORMA' )

 Try

 Except
  DMLOG.ControlTran( 1, Nil, '');
 End;

 DMLOG.ControlTran( 8, Nil, '');
 }
   If wControlError = 1 Then
   Begin
      DMLOG.Dcom1.AppServer.RetornaTransaccion;
      ErrorCount := 1;
      ShowMessage('Avise a su Proveedor de Software...(1)');
      Application.Terminate;
      Abort;
   End;

   If wControlError = 9 Then
   Begin
      DCOM1.AppServer.IniciaTransaccion;
      ErrorCount := 0;
   End;

   If (wControlError = 0) Or (wControlError = 9) Then
   Begin
      If wNomArch <> '' Then
      Begin
         If ErrorCount = 0 Then
            DMLOG.AplicaDatos(wCDS, wNomArch);
      End
      Else
      Begin
         If ErrorCount = 0 Then //and ((cdsEvalResul.ChangeCount > 0) or (cdsEvalResul.Modified)) then
            AplicaDatos(cdsEvalResul, 'EVALUACION');
        //if (cdsReqs.ChangeCount > 0) or (cdsReqs.Modified) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsReqs, 'REQS');
        //if (cdsDReqs.ChangeCount > 0)  or (cdsDReqs.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDReqs, 'DREQS');
        //if (cdsDSCxDRQS.ChangeCount > 0)   or (cdsDSCxDRQS.Modified  ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDSCxDRQS, 'DSCXDRQS');
        //if (cdsDODCxDRQS.ChangeCount > 0)   or (cdsDODCxDRQS.Modified  ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDODCxDRQS, 'DODCXDRQS');
        //if (cdsSolCot.ChangeCount > 0)  or (cdsSolCot.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsSolCot, 'SOLCOT');
        //if (cdsDSolCot.ChangeCount > 0)  or (cdsDSolCot.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDSolCot, 'DSOLCOT');
        //if (cdsOrdComp.ChangeCount > 0) or (cdsOrdComp.Modified) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsOrdComp, 'ORDCOMP');
        //if (cdsDOrdComp.ChangeCount > 0)  or (cdsDOrdComp.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDOrdComp, 'DORDCOMP');
        //if (cdsMGrupo.ChangeCount > 0)  or (cdsMGrupo.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsMGrupo, 'MGRUPO');
        //if (cdsGrupos.ChangeCount > 0)   or (cdsGrupos.Modified  ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsGrupos, 'GRUPOS');
        //if (cdsUsuarios.ChangeCount > 0)  or (cdsUsuarios.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsUsuarios, 'USUARIOS');
        //if (cdsgrab.ChangeCount > 0)  or (cdsgrab.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsgrab, 'GRAB');
        //if (cdsPxAxR.ChangeCount > 0)  or (cdsPxAxR.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsPxAxR, 'DREQS');
        //if (cdsProforma.ChangeCount > 0)  or (cdsProforma.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsProforma, 'PROFORMA');
        //if (cdsDProforma.ChangeCount > 0)  or (cdsDProforma.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDProforma, 'DPROFORMA');
        //if (cdsArti.ChangeCount > 0)  or (cdsArti.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsArti, 'ARTI');
        //if (cdsEArti.ChangeCount > 0)  or (cdsEArti.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsEArti, 'EARTI');
        //if (cdsQArti.ChangeCount > 0)  or (cdsQArti.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsQArti, 'QARTI');
        //if (cdsSCxProv.ChangeCount > 0)  or (cdsSCxProv.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsSCxProv, 'SCXPROV');
        //if (cdsMTIPPROV.ChangeCount > 0)  or (cdsMTIPPROV.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsMTIPPROV, 'MTIPPROV');
        //if (cdsProv.ChangeCount > 0) or (cdsProv.Modified) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsProv, 'PROV');
        //if (cdsPedUsu.ChangeCount > 0)  or (cdsPedUsu.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsPedUsu, 'PEDUSU');
        //if (cdsDPedUsu.ChangeCount > 0)  or (cdsDPedUsu.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDPedUsu, 'DPEDUSU');
        //if (cdsMovfac.ChangeCount > 0)  or (cdsMovFac.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsMovFac, 'MOVFAC');
        //if (cdsDetFac.ChangeCount > 0)  or (cdsDetFac.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsDetFac, 'DETFAC');
        //if (cdsDetFac.ChangeCount > 0)  or (cdsDetFac.Modified ) then
         If ErrorCount = 0 Then
            AplicaDatos(cdsLPrecio, 'LPRECIO');

         If ErrorCount = 0 Then
            AplicaDatos(cdsPadre, 'PADRE');

         If ErrorCount = 0 Then
            AplicaDatos(cdsHijo, 'HIJO');

         If ErrorCount = 0 Then
            AplicaDatos(cdsNieto, 'NIETO');

         If ErrorCount = 0 Then
            AplicaDatos(cdsSobrino, 'SOBRINO');
      End;
   End;

   If wControlError = 9 Then
   Begin
      wControlError := 8;
   End;

   If wControlError = 8 Then
      If ErrorCount = 0 Then
         DCOM1.AppServer.GrabaTransaccion;

   If ErrorCount > 0 Then
   Begin
      DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Avise a su Proveedor de OASIS..');
      Application.Terminate;
      Abort;
   End;
End;

Procedure TDMLOG.DataModuleCreate(Sender: TObject);
Var
   ssql, xWhere, xSQL2: String;
   inifile: TIniFile;
   D, M, Y: WORD;
Begin
   Screen.Cursor := crHourGlass;
   DCOM1.Connected := False;

   If ParamStr(1) = '' Then
   Begin
      inifile := TIniFile.Create(ExtractFilePath(application.ExeName) + '\oaCfg.ini');
      DCOM1.Address := IniFile.ReadString('TCPIP', 'ADDRESS', '');
      wSRV := IniFile.ReadString('MOTOR', 'NAME', '');
   End;

   Try
      DCOM1.Connected := true;
   Except
     // por no realizar la conexion
      SHOWMESSAGE('ERROR de Conexión.');
      Exit;
   End;

   Try
      cIP := DMLOG.ObtenerIpdeNetbios(DMLOG.computerName);
   Except
      ShowMessage('ERROR de Conexión.');
      DCOM1.Connected := False;
      Exit;
   End;

   DecodeDate(Date, Y, M, D);
   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'LOG';
   FCtrlAcceso.wDCOM1 := DCOM1;
   Screen.Cursor := crHourGlass;

   FCtrlAcceso.ShowModal;

   If FCtrlAcceso.cAccesoSistema = 'S' Then
   Begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   End
   Else
   Begin
      DCOM1.Connected := False;
      FCtrlAcceso.free;
      sClose := '1';
      Exit;
   End;

   If Not AccesosModulo Then
   Begin
      DCOM1.Connected := False;
      Screen.Cursor := CrDefault;
   End
   Else
   Begin
      wModulo := 'LOG';
      xSQL2 := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, B.OBJETO, B.FORMA, C.GRUPOADM '
         + '      from TGE007 A, TGE001 B, TGE003 C '
         + '     where A.USERID=''' + wUsuario + ''' '
         + '       and A.GRUPOID=B.GRUPOID(+) and B.MODULOID=''' + wModulo + ''''
         + '       and A.GRUPOID=C.GRUPOID(+)';
      cdsUsuarios.Close;
      cdsUsuarios.DataRequest(xSQL2);
      cdsUsuarios.Open;

      wGrupo := cdsUsuarios.FieldByName('GRUPOID').AsString;

      cdsMGrupo.Open;
      cdsGrupos.Open;
      xSQL2 := 'Select * FROM TGE004 WHERE USERID=''' + wUsuario + ''' ORDER BY USERID, NTABLA, CODIGO';
      cdsAcceso.Close;
      cdsAcceso.DataRequest(xSQL2);
      cdsAcceso.Open;
      wVRN_CondP := '01'; //CONTRAENTREGAEFECTIVO
      wAnchoGuia := 7;
      xBorrar := '0';
      wsLocalidad := '01';

      wVtaLocal := BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG=' + quotedstr('L'), 'TVTAID');
      wVtaProv := BuscaQry('dspUltTGE', 'FAC105', 'TVTAID', 'TVTAFLAG=' + quotedstr('P'), 'TVTAID');

      sSQL := 'TMon_Loc=' + '''' + 'E' + '''';
      wTMonExt := displaydescrip('prvSQL', 'TGE103', 'TMonId', sSQL, 'TMonId');
      sSQL := 'TMon_Loc=' + '''' + 'L' + '''';
      wTMonLoc := displaydescrip('prvSQL', 'TGE103', 'TMonId', sSQL, 'TMonId');

   // Tipo de Servidor
      DisplayDescrip('prvSQL', 'OACONFIG_ANT', '*', '', 'SRV_DB');
      SRV_E := cdsQry.FieldByName('SRV_EQUIP').AsString;
      SRV_D := cdsQry.FieldByName('SRV_DB').AsString;
      SRV_V := cdsQry.FieldByName('SRV_VERS').AsString;
      wAnchoPu := cdsQry.FieldByName('DECPU_OC').AsInteger;
      wAnchoArt := cdsQry.FieldByName('NDIG_ARTIC').AsInteger;
      wAnchoProv := cdsQry.FieldByName('NDIG_PROV').AsInteger;
      wReqComp := cdsQry.FieldByName('RQSCOMP').AsString;
      wRptCia := cdsQry.FieldByName('RPTCIA').AsString;
      wUrqCia := cdsQry.FieldByName('URQCIA').AsString;
      wNegCia := cdsQry.FieldByName('NEGCIA').AsString;
      wExoVis := cdsQry.FieldByName('EXOVIS').AsString;
      wConsumo := cdsQry.FieldByName('RQSCONSUMO').AsInteger;

      If cdsQry.fieldbyname('SRV_PRESU').AsString = 'S' Then
         wActuaPresu := True
      Else
         wActuaPresu := False;

      wRutaRpt := 'RTMS\LOGSG\' + wRptCia;
      Prm_RqsPedUsu := 'S';

      // ****************************************************************************************************
      // Configuración Minima

      If Length(Trim(FloattoStr(Y))) < 4 Then
      Begin
         ShowMessage('Error, configure el Formato de Fecha de Windows, en el Panel de Control');
         Application.Terminate;
         Exit;
      End;

      If Length(Trim(wReqComp)) = 0 Then // Si usa va a seleccionar comprador en el visado
      Begin
         ShowMessage('Error, Falta Completar Data en oaCONFIG');
         Application.Terminate;
         Exit;
      End;

      If Length(Trim(wRptCia)) = 0 Then // Incoresa, Dema, JCP, Mibanco
      Begin
         ShowMessage('Error, Falta Completar Data en oaCONFIG');
         Application.Terminate;
         Exit;
      End;

      If Length(Trim(wUrqCia)) = 0 Then // S, N
      Begin
         ShowMessage('Error, Falta Completar Data en oaCONFIG');
         Application.Terminate;
         Exit;
      End;

     // Configuración Minima
     // ****************************************************************************************************

      DisplayDescrip('prvSQL', 'oaREGLAS', '*', 'VRN_MODULO=''LOG''', 'VRN_MODULO');
      wFil_Ccos := cdsQry.FieldByName('VRN_CCOSCIA').AsString;
      wTipoCambio := 'TCAM' + cdsQry.FieldByName('VRN_TCAM').AsString;

      // Conmprobación Base de Datos
      Try
         displaydescrip('prvSQL', 'USER_TAB_COLUMNS', 'TABLE_NAME', 'TABLE_NAME=''AAAXPRUEBA''', 'TABLE_NAME');
         If cdsQry.RecordCount > 0 Then
         Begin
            ShowMessage('Error, Usted Esta en Prueba Llame Urgente a Sistema');
         End;
      Except
      End;
     // Conmprobación Base de Datos

      wFormatFecha := 'DD/MM/YYYY';
      wFormatHoras := 'HH24:MI:SS';
      wReplacCeros := 'NVL';
      wRepFecServi := 'SYSDATE';
      wRepHorServi := 'SYSDATE';
      wRepFuncDate := 'TO_DATE(';
      wRepFuncChar := 'TO_CHAR(';
      wRepTrim := 'TRIM';
   End;
End;

Procedure TDMLOG.ExecSQL(Const cSQL: String);
Begin
   DCOM1.AppServer.EjecutaSQL(cSQL);
End;

Function TDMLOG.MaxValue(Const sDetail: String; CD: TDataSet): String;
Var
   iMx: LongInt;
   bmk: TBookMark;
   dsI, dsE: Boolean;
Begin
  // --------------------------- ADVERTENCIA !!!!!!!! --------------------------
  //  ESTO NO FUNCIONA EN EL CACHÉ
  // ---------------------------------------------------------------------------
  //  result := MaxSQL('LOG309','DRQSID',
  //                   'where CIAID='''+sCIA+''' and '+'RQSID = '''+sRqs+'''' );
  // ---------------------------------------------------------------------------
   iMx := 0;
   bmk := Nil;
   CD.DisableControls;
   dsI := (CD.State = dsInsert);
   dsE := (CD.State = dsEdit);
   If CD.RecordCount > 0 Then
   Begin
      If dsE Then bmk := CD.GetBookmark;
      If dsI Or dsE Then CD.Cancel;

      CD.First;
      While Not CD.Eof Do
      Begin
         If CD.FieldByName(sDetail).isNull Then
            iMx := 0
         Else
            If (CD.FieldByName(sDetail).AsInteger > iMx) And (CD.FieldByName(sDetail).AsInteger <> 999) Then
               iMx := CD.FieldByName(sDetail).AsInteger;
         CD.Next;
      End;
      If dsI Then
         CD.Insert
      Else
         If dsE Then
            CD.Edit;
      If dsE Then
      Begin
         CD.GotoBookmark(bmk);
         CD.FreeBookmark(bmk);
      End;
   End;
   CD.EnableControls;
   Result := IntToStr(iMx + 1);
End;

Function TDMLOG.MaxReqs(Const sCIA, sLOC, sALM: String): String;
Var
   sCND: String;
Begin
   sCND := 'CIAID=''' + sCIA + ''' AND ALMID=''' + sALM + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSID', sCND);
End;

Function TDMLOG.MaxArt(Const sCIA: String): String;
Var
   sART: String;
Begin
   sART := 'CIAID=''' + sCIA + '''';
   result := MaxSQL('TGE205', 'ARTID', sART);
End;

Function TDMLOG.MaxSQL(Const sTabla, sMxCampo, sCondicion: String): String;
Var
   xnum: integer;
   sSQL, sWhere: String;
Begin
//	DecodeDate(DateS, xDia, xMes, xAno);
   sWhere := 'WHERE ' + SMXCAMPO + ' not like (''%A%'') and ' + SMXCAMPO + ' not like (''%B%'') and ' + SMXCAMPO + ' not like (''%C%'') ' +
      'and ' + SMXCAMPO + ' not like (''%D%'') and ' + SMXCAMPO + ' not like (''%E%'') and ' + SMXCAMPO + ' not like (''%F%'') ' +
      'and ' + SMXCAMPO + ' not like (''%G%'') and ' + SMXCAMPO + ' not like (''%H%'') and ' + SMXCAMPO + ' not like (''%I%'') ' +
      'and ' + SMXCAMPO + ' not like (''%J%'') and ' + SMXCAMPO + ' not like (''%K%'') and ' + SMXCAMPO + ' not like (''%L%'') ' +
      'and ' + SMXCAMPO + ' not like (''%M%'') and ' + SMXCAMPO + ' not like (''%N%'') and ' + SMXCAMPO + ' not like (''%O%'') ' +
      'and ' + SMXCAMPO + ' not like (''%P%'') and ' + SMXCAMPO + ' not like (''%Q%'') and ' + SMXCAMPO + ' not like (''%R%'') ' +
      'and ' + SMXCAMPO + ' not like (''%S%'') and ' + SMXCAMPO + ' not like (''%T%'') and ' + SMXCAMPO + ' not like (''%U%'') ' +
      'and ' + SMXCAMPO + ' not like (''%V%'') and ' + SMXCAMPO + ' not like (''%W%'') and ' + SMXCAMPO + ' not like (''%X%'') ' +
      'and ' + SMXCAMPO + ' not like (''%Y%'') and ' + SMXCAMPO + ' not like (''%Z%'') ';
   sWhere := sWhere + 'and NVL(' + SMXCAMPO + ',''VACIO'') <> ''VACIO'' ';
   If Length(Trim(sCondicion)) > 0 Then
      sWhere := sWhere + 'and ' + sCondicion;

   sSQL := 'SELECT MAX(TO_NUMBER(' + SMXCAMPO + ')) AS X FROM ' + sTabla + ' ' + sWhere;

   cdsSql.Close;
   cdssql.DataRequest(sSQL);
   cdsSql.Open;
   If cdsSql.FieldByName('X').IsNull Then
      result := '1'
   Else
   Begin
      xnum := StrToInt(Trim(cdsSql.FieldByName('X').AsString));
      result := IntToStr(xnum + 1);
   End;
End;

// Funcion que devuelve ceros a la Izquierda.
Function TDMLOG.StrZero(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s, xTemp: String;
Begin
   s := '';
   For i := 1 To wLargo Do
      s := s + '0';
   s := s + trim(wNumero);
   xTemp := copy(s, length(s) - (wLargo - 1), wLargo);
   result := xTemp;
End;

Function TDMLOG.IsExistRqs(Const sCIA, sLOC, sALM, sRQS: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=''' + sCIA + ''' AND RQSID =''' + sRqs +
      ''' AND ALMID=''' + sALM + ''' AND LOCID=''' + sLOC + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG308', 'RQSID', sSQL, 'RQSID')) > 0;
End;

Function TDMLOG.IsExistSol(Const sCIA, sSol: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and SCCID =' + '''' + sSol + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG302', 'SCCID', sSQL, 'SCCID')) > 0;
End;

Function TDMLOG.IsExistProf(Const sCIA, sPRF, sPRFP: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and PROFID =' + '''' + sPRF + '''' + ' and PROFNPROV =' + '''' + sPRFP + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG312', 'PROFNPROV', sSQL, 'PROFNPROV')) > 0;
End;

Function TDMLOG.MaxSCC(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG302', 'SCCID', 'CIAID=' + '''' + sCIA + '''');
End;

Function TDMLOG.MaxProv(Const sCIA: String): String;
Begin
   result := MaxSQL('TGE201', 'PROV', '');
End;

Function TDMLOG.MaxPROF(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG312', 'PROFNPROV', 'PROV=' + '''' + sCIA + '''');
End;

Procedure TDMLOG.cdsSolCotCIAIDChange(Sender: TField);
Begin
   cdsSolCot.FieldByName('SCCID').AsString := StrZero(MaxSCC(cdsSolCot.FieldByName('CIAID').AsString), 8);
End;

Procedure TDMLOG.MultiOpen(Const CDS: Array Of TwwClientDataSet);
Var
   iX: Integer;
Begin
   For iX := 0 To High(CDS) Do
      If Not CDS[iX].Active Then
      Begin
         CDS[iX].Open;
      End;
End;

Function TDMLOG.DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT ' + wCampos + ' FROM ' + wTabla;
   If length(Trim(wWhere)) > 0 Then
      xSQL := xSQL + ' WHERE ' + wWhere;
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result := cdsQry.FieldByName(wResult).Asstring;
End;

Procedure TDMLOG.MultiClose(Const CDS: Array Of TwwClientDataSet);
Var
   iX: Integer;
Begin
   For iX := 0 To High(CDS) Do
      If CDS[iX].Active Then
      Begin
         CDS[iX].Close;
      End;
End;

Procedure TDMLOG.cdsPxAxRCalcFields(DataSet: TDataSet);
Begin
   cdsPxAxR.FieldByName('RXASALDOG').Value := cdsPxAxR.FieldByName('DRQSCNSG').Value - cdsPxAxR.FieldByName('DRQSCNAG').Value;
   cdsPxAxR.FieldByName('RXASALDOU').Value := cdsPxAxR.FieldByName('DRQSCNSU').Value - cdsPxAxR.FieldByName('DRQSCNAU').Value;
   If Dataset.State = dsinternalCalc Then
   Begin
      If DataSet.FieldByName('RQSFLAGUM').AsString = 'G' Then
      Begin
         Dataset.FieldByName('DRQSCNTS').AsCurrency := Dataset.FieldByName('DRQSCNSG').AsCurrency;
         Dataset.FieldByName('DRQSCNTA').AsCurrency := Dataset.FieldByName('DRQSCNAG').AsCurrency;
         Dataset.FieldByName('UNMID').AsString := Dataset.FieldByName('UNMIDG').AsString;
      End
      Else
      Begin
         Dataset.FieldByName('DRQSCNTS').AsCurrency := Dataset.FieldByName('DRQSCNSU').AsCurrency;
         Dataset.FieldByName('DRQSCNTA').AsCurrency := Dataset.FieldByName('DRQSCNAU').AsCurrency;
         Dataset.FieldByName('UNMID').AsString := Dataset.FieldByName('UNMIDU').AsString;
      End;
      Dataset.FieldByName('RXASALDO').AsCurrency := Dataset.FieldByName('DRQSCNTS').AsCurrency
         - Dataset.FieldByName('DRQSCNTA').AsCurrency;
   End;
End;

Procedure TDMLOG.cdsRqsArtXCalcFields(DataSet: TDataSet);
Begin
   cdsRqsArtX.FieldByName('RXASALDOG').asFloat := cdsRqsArt.FieldByName('DRQSCNSG').Value - cdsRqsArt.FieldByName('DRQSCNAG').Value;
   cdsRqsArtX.FieldByName('RXASALDOU').asFloat := cdsRqsArt.FieldByName('DRQSCNSU').Value - cdsRqsArt.FieldByName('DRQSCNAU').Value;
End;

Function TDMLOG.MaxORD(Const sCIA: String): String;
Begin
   result := MaxSQL('LOG304', 'ODCID', 'CIAID=' + '''' + sCIA + '''');
End;

Function TDMLOG.IsExistORD(Const sCIA, sORD: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' AND ODCID =' + '''' + sORD + '''';
   Result := Length(DisplayDescrip('prvTGE', 'LOG304', 'ODCID', sSQL, 'ODCID')) > 0;
End;

Function TDMLOG.IsExistART(Const sCIA, sART: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=' + '''' + sCIA + '''' + ' and ARTID =' + '''' + sART + '''';
   result := length(DisplayDescrip('prvTGE', 'TGE205', 'ARTID', sSQL, 'ARTID')) > 0;
End;

Function TDMLOG.IsExistNISA(Const sCIA, sALM, sTDA, sNISA: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=''' + sCIA + ''' and NISAID =''' + sNISA + ''' and TDAID=''' + sTDA + '''' +
      'and ALMID=''' + sALM + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG314', 'NISAID', sSQL, 'NISAID')) > 0;
End;

Function TDMLOG.MaxNIS(Const sCIA, sALM, sTDA: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA +
      ''' and ALMID=''' + sALM + ''' and NISATIP=''SALIDA''' +
      'and TDAID=''' + sTDA + '''');
End;

Function TDMLOG.MaxNIA(Const sCIA, sALM, sTDA: String): String;
Begin
   result := MaxSQL('LOG314', 'NISAID', 'CIAID=''' + sCIA +
      ''' and ALMID=''' + sALM + ''' and NISATIP=''INGRESO''' +
      'and TDAID=''' + sTDA + '''');
End;

Procedure TDMLOG.dClose;
Begin
   MultiClose([cdsArti, cdsUsuarios,
      cdsCCost,
         cdsCIA,
         cdsDReqs,
         cdsGArti,
         cdsReqs,
         cdsDReqs,
         cdsUMed,
         cdsUsers,
         cdsSolCot,
         cdsLEntrega,
         cdsFPago,
         cdsComprador,
         cdsTSolCot,
         cdsDSolCot,
         cdsDSCxDRQS,
         cdsTRqs,
         cdsArtPend,
         cdsProv,
         cdsSCxProv,
         cdsMedCom,
         cdsProforma,
         cdsDProforma,
         cdsSolxCIA,
         cdsDOrdComp,
         cdsFAB,
         cdsClnArti,
         cdsQARTI,
         cdsNIS,
         cdsKDX,
         cdsALM,
         cdsTDOC,
         cdsSTK,
         cdsCNS,
         cdsEUNMED,
         cdsNIA,
         cdsTDNISA,
         cdsLKTRAN,
         cdsLOC
         ]);
End;

Procedure TDMLOG.dOpen;
Begin
   MultiOpen([cdsArti, cdsUsuarios,
      cdsCCost,
         cdsCIA,
         cdsDReqs,
         cdsGArti,
         cdsReqs,
         cdsDReqs,
         cdsUMed,
         cdsUsers,
         cdsSolCot,
         cdsLEntrega,
         cdsFPago,
         cdsComprador, //cdsTSolCot, cdsDSolCot,
         cdsDSCxDRQS,
         cdsTRqs,
         cdsArtPend,
         cdsProv,
         cdsSCxProv,
         cdsMedCom,
         cdsProforma,
         cdsDProforma,
         cdsSolxCIA,
         cdsPxAxR,
         cdsFAB,
         cdsClnArti,
         cdsQARTI,
         cdsNIS,
         cdsKDX,
         cdsALM,
         cdsTDOC,
         cdsSTK,
         cdsCNS,
         cdsEUNMED,
         cdsNIA,
         cdsTDNISA,
         cdsLKTRAN,
         cdsLOC
         ]);
End;

Function TDMLOG.CountFor(cds: TwwClientDataSet; sCondicion: String): LongInt;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
Begin
   bmk := cds.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      cdsClone.CloneCursor(cds, True);
      cdsClone.Filtered := False;
      cdsClone.Filter := sCondicion;
      cdsClone.Filtered := True;
      result := cdsClone.RecordCount;
   Finally
      cdsClone.Free;
   End;
   cds.GotoBookmark(bmk);
   cds.FreeBookmark(bmk);
End;

Function TDMLOG.DesEncripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xEncriptado, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xReal, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

Function TDMLOG.Encripta(wPalabra: String): String;
Var
   xLargoPal, i, j: integer;
   xReal, xEncriptado1, xEncriptado2, xEncriptado3, xEncriptado4,
      xEncriptado5, xNuevaPal, xEncriptado: String;
   xTiene: boolean;
Begin
   xReal := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1 := '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2 := '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3 := '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4 := 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5 := ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal := length(wPalabra);
   xNuevaPal := '';
   i := 1;
   While i <= xLargoPal Do
   Begin
      j := 1;
      xTiene := False;
      If (i = 1) Or (i = 11) Or (i = 21) Or (i = 31) Then xEncriptado := xEncriptado1;
      If (i = 2) Or (i = 12) Or (i = 22) Or (i = 32) Then xEncriptado := xEncriptado2;
      If (i = 3) Or (i = 13) Or (i = 23) Or (i = 33) Then xEncriptado := xEncriptado3;
      If (i = 4) Or (i = 14) Or (i = 24) Or (i = 34) Then xEncriptado := xEncriptado4;
      If (i = 5) Or (i = 15) Or (i = 25) Or (i = 35) Then xEncriptado := xEncriptado5;
      If (i = 6) Or (i = 16) Or (i = 26) Or (i = 36) Then xEncriptado := xEncriptado1;
      If (i = 7) Or (i = 17) Or (i = 27) Or (i = 37) Then xEncriptado := xEncriptado2;
      If (i = 8) Or (i = 18) Or (i = 28) Or (i = 38) Then xEncriptado := xEncriptado3;
      If (i = 9) Or (i = 19) Or (i = 29) Or (i = 39) Then xEncriptado := xEncriptado4;
      If (i = 10) Or (i = 20) Or (i = 30) Or (i = 40) Then xEncriptado := xEncriptado5;
      While j <= length(xReal) Do
      Begin
         If copy(wPalabra, i, 1) = copy(xReal, j, 1) Then
         Begin
            xNuevaPal := xNuevaPal + copy(xEncriptado, j, 1);
            xTiene := True;
         End;
         j := j + 1;
      End;
      If Not xTiene Then xNuevaPal := xNuevaPal + copy(wPalabra, i, 1);
      i := i + 1;
   End;
   result := xNuevaPal;
End;

////////////////////////////////
////////////////////////////////
//     Accesos al Sistema     //
////////////////////////////////
////////////////////////////////

Procedure TDMLOG.AccesosUsuarios(xxModulo, xxUsuario, xxTipo, xxForma: String);
Begin
   If Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then
         Exit;
   End;
   cdsGrupos.Filter := '';

   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GRUPOID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'MODULOID=' + '''' + xxModulo + '''' + ' and '
         + 'FORMA=' + '''' + xxForma + '''' + ' and '
         + 'TIPO=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
End;

Procedure TDMLOG.AccesosUsuariosR(xxModulo, xxUsuario, xxTipo: String; xxForma: TForm);
Begin
   If Trim(cdsUsuarios.FieldByname('GRUPOID').AsString) = '' Then
   Begin
      If cdsUsuarios.IndexFieldNames <> 'USERID' Then
         cdsUsuarios.IndexFieldNames := 'USERID';
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
      If Not cdsUsuarios.GotoKey Then Exit;
   End;

   cdsGrupos.Filter := '';
   If xxTipo = '1' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMLOG.wAdmin = 'G') Or (DMLOG.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;

   If xxTipo = '2' Then
   Begin
      cdsGrupos.Filter := 'GrupoID=' + '''' + cdsUsuarios.FieldByname('GRUPOID').AsString + '''' + ' and '
         + 'ModuloID=' + '''' + xxModulo + '''' + ' and '
         + 'Forma=' + '''' + xxForma.Name + '''' + ' and '
         + 'Tipo=' + '''' + xxTipo + '''';
      cdsGrupos.Filtered := True;

      If (DMLOG.wAdmin = 'G') Or (DMLOG.wAdmin = 'P') Then Exit;

      cdsGrupos.First;
      While Not cdsGrupos.Eof Do
      Begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      End;
   End;
End;

Function TDMLOG.BuscaObjeto(Const xNombre: String; xForm: TForm): TControl;
Var
   ic: Integer;
Begin
   Result := Nil;
   For ic := 0 To xForm.ComponentCount - 1 Do
   Begin
      If xForm.Components[ic].Name = xNombre Then
         Result := TControl(xForm.Components[ic]);
   End;
End;

Function TDMLOG.BuscaQry(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
   If UpperCase(wPrv) = 'PRVTGE' Then wPrv := 'prvSQL';
   If UpperCase(wPrv) = 'PRVCXP' Then wPrv := 'prvLOG';

   xSQL := '';
   xSQL := 'Select ' + wCampos + ' from ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' where ' + wWhere;
   xSQL := UpperCase(xSQL);
   cdsQry.Close;
   cdsQry.DataRequest(xSQL); //esta es la llamada remota al provider del servidor
   cdsQry.Open;
   result := cdsQry.FieldByName(wResult).AsString;
End;

Procedure TDMLOG.Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
Begin
   If Length(xxSQL) > 0 Then
   Begin
      xxCds.IndexFieldNames := '';
      xxCds.MasterSource := Nil;
      xxCds.MasterFields := '';
      xxCds.Filter := '';
      xxCds.Filtered := False;
      xxCds.Close;
      xxCds.DataRequest(xxSQL);
   End;
   xxCds.Open;
End;

Function TDMLOG.OperClientDataSet(ClientDataSet: TwwClientDataSet; Expression, Condicion: String): Double;
Var
   cdsClone: TwwClientDataSet;
   bmk: TBookmark;
   Agg: TAggregate;
Begin
   result := 0;
   If trim(Expression) = '' Then
      Exit;
   bmk := ClientDataSet.GetBookmark;
   cdsClone := TwwClientDataSet.Create(Nil);
   Try
      cdsClone.CloneCursor(ClientDataSet, True);
      Agg := cdsClone.Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;
      If Trim(Condicion) <> '' Then
      Begin
         cdsClone.Filtered := False;
         cdsClone.Filter := Condicion;
         cdsClone.Filtered := True;
      End;
      If cdsClone.Aggregates.Items[cdsClone.Aggregates.IndexOf('OPER')].Value <> NULL Then
         result := cdsClone.Aggregates.Items[cdsClone.Aggregates.IndexOf('OPER')].Value;
      cdsClone.Aggregates.Clear;
      ClientDataSet.GotoBookmark(bmk);
      ClientDataSet.FreeBookmark(bmk);
   Finally
      cdsClone.Free;
   End;
End;

Function TDMLOG.RecuperarDatos(xTabla, xCampos, xWhere: String): Boolean;
Var
   xSQL: String;
Begin
   cdsQry.active := False;
   cdsQry.ProviderName := 'prvLOG';
   xSQL := 'SELECT ' + xCampos + ' FROM ' + xTabla;
   If length(xWhere) > 0 Then
      xSQL := xSQL + ' WHERE ' + xWhere;
   cdsQry.DataRequest(xSQL);
   cdsQry.active := True;

   If cdsQry.RecordCount = 0 Then
      Result := False
   Else
      Result := True;
End;

Function TDMLOG.LogDec(xNumero: String; Digitos: Integer): String;
Var
   xFloat: Double;
   xNumTmp: String;
Begin
   If trim(xNumero) <> '' Then
      xFloat := strtofloat(xNumero)
   Else
      xFloat := 0;
   xNumTmp := floattostrf(xFloat, fffixed, 10, Digitos);
   xFloat := strtofloat(xNumTmp);
   If xFloat = 0 Then
      Result := '0.' + stringofchar('0', Digitos)
   Else
      Result := xNumTmp;
End;

Procedure TDMLOG.GrabaDatos(wCDS: TClientDataSet; wNomArch: String);
Var
   Delta, Results, OwnerData: OleVariant;
   ErrorCount: Integer;
Begin
   If (wCDS.Modified) Or (wCDS.ChangeCount > 0) Then
   Begin
      wCDS.CheckBrowseMode;
      Delta := wCDS.Delta;
      Results := DCOM1.Appserver.AS_ApplyUpdates(wCDS.ProviderName, Delta, 0, ErrorCount, OwnerData);
      If Errorcount = 0 Then
      Begin
         wCDS.Reconcile(Results);
         Beep;
      End
      Else
      Begin
         showmessage('Registro No Grabado ' + Inttostr(Errorcount));
      End;
   End;
End;

Function TDMLOG.Factor(xUmed, xUmedEquiv: String): currency;
Var
   xSQL: String;
Begin
   Try
      xSQL := ' SELECT CASE WHEN EUNMID1 = ''' + xUmed + ''' THEN          ' +
         '                  EUNMID2                                   ' +
         '                      WHEN EUNMID2 = ''' + xUmed + ''' THEN   ' +
         '                  EUNMID1                                   ' +
         '                  ELSE NULL                                ' +
         '                  END UNMID ,                              ' +
         '                  CASE WHEN EUNMID1 = ''' + xUmed + ''' THEN  ' +
         '                        EUNMEQ                             ' +
         '                  ELSE                                     ' +
         '                        CAST(1/EUNMEQ AS DECIMAL(15,4))    ' +
         '                  END EUNMEQ                               ' +
         '  FROM TGE156                                              ' +
         '  WHERE                                                    ' +
         '  NOT CASE WHEN EUNMID1 = ''' + xUmed + ''' THEN            ' +
         '                  EUNMID1                                   ' +
         '                      WHEN EUNMID2 = ''' + xUmed + ''' THEN ' +
         '                  EUNMID2                                   ' +
         '                  ELSE NULL                                ' +
         '                  END IS NULL                              ' +
         '   AND                                                     ' +
         '   CASE WHEN EUNMID1 = ''' + xUmed + ''' THEN               ' +
         '            EUNMID2                                         ' +
         '                WHEN EUNMID2 = ''' + xUmed + ''' THEN       ' +
         '            EUNMID1                                         ' +
         '            ELSE NULL                                      ' +
         '            END =''' + xUmedEquiv + '''                     ';
      cdsQry.close;
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      If cdsQry.RecordCount <> 0 Then
         If Not cdsqry.fieldbyname('EUNMEQ').isnull Then
            Result := cdsqry.fieldbyname('EUNMEQ').AsCurrency
         Else
            Result := 0
      Else
         Result := 0;
   Except
      Result := 0;
   End;
End;

Function TDMLOG.UltimoNum(wPrv, wTabla, wCampo, wWhere: String): String;
Var
   xSQL: String;
Begin
   result := MaxSQL('LOG312', 'PROFID', wWhere);

   Exit;
   xSQL := '';
   xSQL := 'select max(' + wCampo + ') as ULT from ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' where ' + wWhere;
   cdsQry.Close;
   cdsQry.ProviderName := wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.FieldbyName('ULT').Value = Null Then
      result := '1'
   Else
   Begin
      result := inttostr(strtoint(cdsQry.FieldbyName('ULT').Value) + 1);
   End;
End;

Function TDMLOG.MaxReqA(Const sCIA, sLOC: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSID', sWhere);
End;

Function TDMLOG.IsExistRqsM(Const sCIA, sLOC, sRQS: String): Boolean;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND RQSID =''' + sRQS + ''' AND LOCID=''' + sLOC + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG308', 'RQSID', sWhere, 'RQSID')) > 0;
End;

Procedure TDMLOG.FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo, xxOrden: String; xxWhere: String);
Var
   xFiltro, xSQL2: String;
Begin
   DMLOG.cdsAcceso.Filtered := False;
   DMLOG.cdsAcceso.Filter := '';
   DMLOG.cdsAcceso.Filter := 'NTabla=' + '''' + xxArchivo + ''' and USERID=''' + wUsuario + ''' ';
   DMLOG.cdsAcceso.Filtered := True;

   xFiltro := '';
   DMLOG.cdsAcceso.First;
   While Not DMLOG.cdsAcceso.Eof Do
   Begin
      If Length(xFiltro) = 0 Then
         xFiltro := xxCampo + '=' + '''' + DMLOG.cdsAcceso.FieldByName('CODIGO').AsString + ''''
      Else
         xFiltro := xFiltro + ' OR ' + xxCampo + '=' + '''' + DMLOG.cdsAcceso.FieldByName('CODIGO').AsString + '''';

      DMLOG.cdsAcceso.Next;
   End;

   If Length(Trim(xFiltro)) > 0 Then
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo + ' WHERE (' + xFiltro + ') ';
      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' AND ( ' + xxWhere + ' )';

      If Length(Trim(xxOrden)) > 0 Then
         xSQL2 := xSQL2 + ' ORDER BY ' + xxOrden;

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End
   Else
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo;
      If Length(Trim(xxWhere)) > 0 Then
         xSQL2 := xSQL2 + ' WHERE ( ' + xxWhere + ' )';

      If Length(Trim(xxOrden)) > 0 Then
         xSQL2 := xSQL2 + ' ORDER BY ' + xxOrden;

      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End;
   xxCds.Open;
End;

Procedure TDMLOG.fg_FiltraTablaOtorgados(wgCds: TwwClientDataSet; wgArchivo, wgCampo, wgOrden: String; wgWhere: String);
Var
   xsFiltro, xsSQL2: String;
Begin

   xsSQL2 := 'Select * FROM TGE014 WHERE USERID = ' + QuotedStr(wUsuario) + ' AND MODULOID = ' + QuotedStr(wModulo) + ' ORDER BY USERID, NTABLA, CODIGO';
   cdsAcceso1.Close;
   cdsAcceso1.DataRequest(xsSQL2);
   cdsAcceso1.Open;

   xsFiltro := '';
   DMLOG.cdsAcceso1.First;
   While Not DMLOG.cdsAcceso1.Eof Do
   Begin
      If Length(xsFiltro) = 0 Then
         xsFiltro := wgCampo + ' = ' + QuotedStr(DMLOG.cdsAcceso1.FieldByName('CODIGO').AsString)
      Else
         xsFiltro := xsFiltro + ' OR ' + wgCampo + ' = ' + QuotedStr(DMLOG.cdsAcceso1.FieldByName('CODIGO').AsString);

      DMLOG.cdsAcceso1.Next;
   End;

   If Length(Trim(xsFiltro)) > 0 Then
   Begin
      xsSQL2 := 'SELECT * FROM ' + wgArchivo + ' WHERE (' + xsFiltro + ') ';
      If Length(Trim(wgWhere)) > 0 Then
         xsSQL2 := xsSQL2 + ' AND ( ' + wgWhere + ' )';

      If Length(Trim(wgOrden)) > 0 Then
         xsSQL2 := xsSQL2 + ' ORDER BY ' + wgOrden;

      wgCds.Close;
      wgCds.DataRequest(xsSQL2);
   End
   Else
   Begin
      xsSQL2 := 'SELECT * FROM ' + wgArchivo + ' WHERE 1 = 2';
      wgCds.Close;
      wgCds.DataRequest(xsSQL2);
   End;
   wgCds.Open;
End;

Procedure TDMLOG.GrabaAuxConta(wCDST: TClientDataSet);
Var
   xSQL2: String;
Begin
   xSQL2 := 'SELECT * FROM CNT201 '
      + 'WHERE AUXID=' + '''' + wCDST.FieldByName('PROV').Value + '''' + ' and '
      + 'CLAUXID=' + '''' + wCDST.FieldByName('CLAUXID').Value + '''';
   cdsQry.Active := False;
   cdsQry.ProviderName := 'prvTGE';
   cdsQry.DataRequest(xSQL2); // Llamada remota al provider del servidor
   cdsQry.Active := True;

   If cdsQry.RecordCount > 0 Then
   Begin
      xSQL2 := 'Update CNT201 '
         + ' Set AUXID=' + '''' + wCDST.FieldByName('Prov').AsString + '''' + ','
         + 'AUXNOMB=' + '''' + wCDST.FieldByName('ProvDes').AsString + '''' + ','
         + 'AUXRUC=' + '''' + wCDST.FieldByName('ProvRuc').AsString + '''' + ','
         + 'AUXDNI=' + '''' + wCDST.FieldByName('Provdni').AsString + '''' + ','
         + 'CLAUXID=' + '''' + wCDST.FieldByName('ClAuxId').AsString + '''' + ','
         + 'AUXABR=' + '''' + wCDST.FieldByName('ProvAbr').AsString + '''' + ','
         + 'PAISID=' + '''' + wCDST.FieldByName('PaisId').AsString + '''' + ','
         + 'AUXDIR=' + '''' + wCDST.FieldByName('ProvDir').AsString + '''' + ','
         + 'AUXCZIP=' + '''' + wCDST.FieldByName('ProvCZip').AsString + '''' + ','
         + 'AUXTELF=' + '''' + wCDST.FieldByName('ProvTelf').AsString + '''' + ','
         + 'AUXFAX=' + '''' + wCDST.FieldByName('ProvFax').AsString + '''' + ','
         + 'AUXEMAIL=' + '''' + wCDST.FieldByName('ProvEMai').AsString + ''''
         + ' Where AUXID=' + '''' + wCDST.FieldByName('Prov').AsString + '''' + ' and '
         + 'CLAUXID=' + '''' + wCDST.FieldByName('ClAuxId').Value + '''';
   End
   Else
   Begin
      xSQL2 := 'INSERT INTO CNT201(AUXID, AUXNOMB, AUXABR, AUXRUC, AUXDNI, PAISID, AUXDIR, '
         + 'AUXCZIP, AUXTELF, AUXFAX, AUXEMAIL, CLAUXID ) '
         + 'VALUES('
         + '''' + wCDSt.FieldByName('Prov').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvDes').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvAbr').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvRuc').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvDni').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('PaisId').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvDir').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvCZip').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvTelf').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvFax').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ProvEMai').AsString + '''' + ','
         + '''' + wCDSt.FieldByName('ClAuxId').AsString + '''' + ' )';
   End;
   DCOM1.AppServer.EjecutaSQL(xSQL2);
End;

Function FRound(xReal: Double; xEnteros, xDecimal: Integer): Double;
Var
   xSQL: String;
Begin
   Result := 0;
   xSQL := 'SELECT ROUND(' + FloatToStr(xReal) + ',' + IntToStr(xDecimal) + ') VALOR FROM DUAL ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If Length(Trim(DMLOG.cdsQry.FieldByName('VALOR').AsString)) > 0 Then Result := DMLOG.cdsQry.FieldByName('VALOR').AsCurrency;
   DMLOG.cdsQry.Close;
End;

Function TDMLOG.CalcTipoCambio(sMoneda: String; dtFecha: tdatetime; sCampo: String): String;
Var
   sSQL: String;
Begin
   result := '';
   If dtFecha = 0 Then exit;
   If trim(sMoneda) = '' Then exit;
   sSQL := 'SELECT ' + sCampo + ' FROM TGE107 WHERE TMONID=' + quotedStr(DMLOG.wTMonExt);
   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := sSQL + ' AND FECHA=DATE(' + quotedStr(formatdatetime(DMLOG.wFormatFecha, dtFecha)) + ')';
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := sSQL + ' AND FECHA=(' + quotedStr(formatdatetime(DMLOG.wFormatFecha, dtFecha)) + ')';
      End;
   DMLOG.cdsSQL.close;
   DMLOG.cdsSQL.DataRequest(sSQL);
   DMLOG.cdsSQL.open;
   result := DMLOG.cdsSQL.fieldbyName(DMLOG.wTipoCambio).asString;
End;

Procedure TDMLOG.Tiempo(wwFecha1, wwFecha2: TDateTime; Var wwAnos, wwMeses, wwDias: Integer);
Var
   wAno1, wMes1, wDia1: Word;
   wAno2, wMes2, wDia2: Word;
Begin
   wwAnos := 0;
   wwMeses := 0;
   wwDias := 0;
   If (wwFecha2 - wwFecha1) > 0 Then
   Begin
   // devuelve años, meses y días entre dos fechas
      DecodeDate(wwFecha1, wAno1, wMes1, wDia1);
      DecodeDate(wwFecha2, wAno2, wMes2, wDia2);
      If wDia2 < wDia1 Then
      Begin
         Case wMes2 Of
            1, 3, 5, 7,
               8, 10, 12:
               Begin
                  wwDias := 31 + wDia2 - wDia1;
               End;
            4, 6, 9, 11:
               Begin
                  wwDias := 30 + wDia2 - wDia1;
               End;
         Else
            Begin
               If (wAno1 Mod 4) = 0 Then
                  wwDias := 29 + wDia2 - wDia1
               Else
               Begin
                  wwDias := 28 + wDia2 - wDia1;
               End;
            End;
         End;
         wMes2 := wMes2 - 1;
      End
      Else
      Begin
         wwDias := wDia2 - wDia1;
      End;
   // CALCULO DE MESES EN EL RANGO
      If wMes2 < wMes1 Then
      Begin
         wwMeses := 12 + wMes2 - wMes1;
         wAno2 := wAno2 - 1;
      End
      Else
      Begin
         wwMeses := wMes2 - wMes1;
      End;
   // CALCULO DE ANUALIDADES DEL RANGO
      wwAnos := wAno2 - wAno1;
   End; // si fecha2>fecha1
End;

Function TDMLOG.MaxNOTranReq(Const sCIA, sLOC: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + '''';
   result := MaxSQL('LOG308', 'RQSNOTRAB', sWhere);
End;

Function TDMLOG.IsExistOTrab(Const sCIA, sLOC, sOTRA: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'CIAID=''' + sCIA + ''' AND RQSNOTRAB =''' + sOTRA +
      ''' AND LOCID=''' + sLOC + '''';
   result := length(DisplayDescrip('prvTGE', 'LOG308', 'RQSNOTRAB', sSQL, 'RQSNOTRAB')) > 0;
End;

Function TDMLOG.MaxPedUsu(Const sCIA, sLOC, sCCO: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + ''' AND CCOSID=''' + sCCO + '''';
   result := MaxSQL('LOG306', 'URQID', sWhere);
End;

Function TDMLOG.MaxNisaSa(Const sCIA, sLOC, sTIN, sALM, sTDA: String): String;
Var
   sWhere: String;
Begin
   sWhere := 'CIAID=''' + sCIA + ''' AND LOCID=''' + sLOC + ''' AND TINID=''' + sTIN + ''' ' +
      'AND ALMID=''' + sALM + ''' AND TDAID=''' + sTDA + ''' AND NISATIP=''SALIDA''';
   result := MaxSQL('LOG314', 'NISAID', sWhere);
End;

Procedure TDMLOG.ppRptNotaSE(sSQL, sCIA, sLOC, sTIN, sALM, sTDO, sNIN, sTip: String);
Var
   xTipo, xProv: String;
Begin
   If sTIP = 'SALIDA' Then
      xTipo := 'S'
   Else
      If sTIP = 'INGRESO' Then
         xTipo := 'I';

   xProv := DMLOG.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', 'CLAUXLOG=''S''', 'CLAUXID');

   If (SRV_D = 'DB2NT') Or
      (SRV_D = 'DB2400') Then
   Begin
      sSQL := 'SELECT B.CIADES, B.CIARUC, B.CIATLF, B.CIAFAX, B.CIADIRE, ';
      sSQL := sSQL + 'C.PROV, C.PROVDES, C.PROVDIR, C.PROVTELF, C.PROVREPR, C.PROVRUC, C.PROVFAX, ';
      sSQL := sSQL + 'D.TMONABR, E.TRIDES, F.ALMDES, G.ALMDES ALMDESORI, A.NISASOLIC, ';
      sSQL := sSQL + 'A.NISAID, A.NISAFDOC, A.NISANDOC, H.DOCDES, A.NISAFREG, A.NISAOBS, I.USERNOM ';
      sSQL := sSQL + 'FROM LOG314 A ';
      sSQL := sSQL + 'LEFT JOIN TGE101 B ON ( A.CIAID = B.CIAID) ';
      sSQL := sSQL + 'LEFT JOIN TGE201 C ON ( A.PROV  = C.PROV AND C.CLAUXID=' + QuotedStr(xProv) + ') ';
      sSQL := sSQL + 'LEFT JOIN TGE103 D ON ( A.TMONID= D.TMONID ) ';
      sSQL := sSQL + 'LEFT JOIN TGE208 E ON ( A.TRIID = E.TRIID AND E.TRISGT=' + QuotedStr(xTipo) + ' ) ';
      sSQL := sSQL + 'LEFT JOIN TGE151 F ON ( A.CIAID = F.CIAID AND A.LOCID=F.LOCID AND A.TINID=F.TINID AND A.ALMID=F.ALMID ) ';
      sSQL := sSQL + 'LEFT JOIN TGE151 G ON ( A.CIAID = G.CIAID AND A.LOCID=G.LOCID AND A.TINID=G.TINID AND A.ALMORIID=G.ALMID ) ';
      sSQL := sSQL + 'LEFT JOIN TGE110 H ON ( A.DOCID = H.DOCID AND H.REFALM=' + quotedStr('S') + ') ';
      sSQL := sSQL + 'LEFT JOIN TGE002 I ON ( A.NISAUSER = I.USERID ) ';
      sSQL := sSQL + 'WHERE A.CIAID= ' + QuotedStr(sCIA);
      sSQL := sSQL + ' AND A.LOCID=' + QuotedStr(sLOC);
      sSQL := sSQL + ' AND A.TINID=' + QuotedStr(sTIN);
      sSQL := sSQL + ' AND A.ALMID=' + QuotedStr(sALM);
      sSQL := sSQL + ' AND A.TDAID=' + QuotedStr(sTDO);
      sSQL := sSQL + ' AND A.NISAID=' + QuotedStr(sNIN);
      sSQL := sSQL + ' AND NISATIP=' + QuotedStr(sTIP);

      DMLOG.cdsQry.DisableControls;
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.ProviderName := 'prvLOG';
      DMLOG.cdsQry.DataRequest(sSQL);
      DMLOG.cdsQry.Open;
      DMLOG.cdsQry.EnableControls;
      sSQL := 'SELECT ';
      sSQL := sSQL + 'A.KDXID, A.ARTID, A.ARTDES, C.UNMABR, ';
      sSQL := sSQL + 'CASE WHEN A.KDXCNTG > 0 THEN A.KDXCNTG ELSE A.KDXCNTU END KDXCNT, ';
      sSQL := sSQL + 'CASE WHEN A.ARTPCG  > 0 THEN A.ARTPCG  ELSE A.ARTPCU  END ARTPC,  ';
      sSQL := sSQL + 'CASE WHEN A.KDXCNTG > 0 THEN A.KDXCNTG * A.ARTPCG ELSE A.KDXCNTU * A.ARTPCU END TOTAL, ';
      sSQL := sSQL + 'CASE WHEN A.UNMIDU IS NULL THEN  A.UNMIDU ELSE A.UNMIDG END UNMID ';
      sSQL := sSQL + 'FROM LOG315 A ';
      sSQL := sSQL + 'LEFT JOIN TGE205 B ON ( A.CIAID = B.CIAID AND A.ARTID = B.ARTID ) ';
      sSQL := sSQL + 'LEFT JOIN TGE130 C ON ( A.UNMIDG= C.UNMID ) ';
      sSQL := sSQL + 'WHERE A.CIAID= ' + QuotedStr(sCIA);
      sSQL := sSQL + ' AND A.LOCID=' + QuotedStr(sLOC);
      sSQL := sSQL + ' AND A.TINID=' + QuotedStr(sTIN);
      sSQL := sSQL + ' AND A.ALMID=' + QuotedStr(sALM);
      sSQL := sSQL + ' AND A.TDAID=' + QuotedStr(sTDO);
      sSQL := sSQL + ' AND A.NISAID=' + QuotedStr(sNIN);
      sSQL := sSQL + ' AND A.NISATIP=' + QuotedStr(sTIP);
      DMLOG.cdsSQL.DisableControls;
      DMLOG.cdsSQL.Close;
      DMLOG.cdsSQL.DataRequest(sSQL);
      DMLOG.cdsSQL.Open;
      DMLOG.cdsSQL.EnableControls;
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
         sSQL := 'SELECT B.CIADES, B.CIARUC, B.CIATLF, B.CIAFAX, B.CIADIRE, ';
         sSQL := sSQL + 'C.PROV, C.PROVDES, C.PROVDIR, C.PROVTELF, C.PROVREPR, C.PROVRUC, C.PROVFAX, ';
         sSQL := sSQL + 'D.TMONABR, E.TRIDES, F.ALMDES, G.ALMDES ALMDESORI, A.NISASOLIC, ';
         sSQL := sSQL + 'A.NISAID, A.NISAFDOC, A.NISANDOC, H.DOCDES, A.NISAFREG, A.NISAOBS, I.USERNOM ';
         sSQL := sSQL + 'FROM LOG314 A, TGE101 B, TGE201 C, TGE103 D, TGE208 E, TGE151 F, TGE151 G, TGE110 H, TGE002 I ';
         sSQL := sSQL + 'WHERE A.CIAID= ' + QuotedStr(sCIA) + ' ';
         sSQL := sSQL + 'AND A.LOCID=' + QuotedStr(sLOC) + ' ';
         sSQL := sSQL + 'AND A.TINID=' + QuotedStr(sTIN) + ' ';
         sSQL := sSQL + 'AND A.ALMID=' + QuotedStr(sALM) + ' ';
         sSQL := sSQL + 'AND A.TDAID=' + QuotedStr(sTDO) + ' ';
         sSQL := sSQL + 'AND A.NISAID=' + QuotedStr(sNIN) + ' ';
         sSQL := sSQL + 'AND NISATIP=' + QuotedStr(sTIP) + ' ';
         sSQL := sSQL + 'AND A.CIAID = B.CIAID(+) ';
         sSQL := sSQL + 'AND A.PROV  = C.PROV(+) AND C.CLAUXID(+)=' + QuotedStr(xProv) + ' ';
         sSQL := sSQL + 'AND A.TMONID= D.TMONID(+) ';
         sSQL := sSQL + 'AND A.TRIID = E.TRIID(+) AND E.TRISGT=' + QuotedStr(xTipo) + ' ';
         sSQL := sSQL + 'AND A.CIAID = F.CIAID(+) AND A.LOCID=F.LOCID(+) AND A.TINID=F.TINID(+) AND A.ALMID=F.ALMID(+) ';
         sSQL := sSQL + 'AND A.CIAID = G.CIAID(+) AND A.LOCID=G.LOCID(+) AND A.TINID=G.TINID(+) AND A.ALMORIID=G.ALMID(+)  ';
         sSQL := sSQL + 'AND A.DOCID = H.DOCID(+) AND H.REFALM=' + quotedStr('S') + ' ';
         sSQL := sSQL + 'AND A.NISAUSER = I.USERID(+)';

         DMLOG.cdsQry.DisableControls;
         DMLOG.cdsQry.Close;
         DMLOG.cdsQry.ProviderName := 'prvLOG';
         DMLOG.cdsQry.DataRequest(sSQL);
         DMLOG.cdsQry.Open;
         DMLOG.cdsQry.EnableControls;

         sSQL := 'SELECT A.KDXID, A.ARTID, A.ARTDES, C.UNMABR, ';
         sSQL := sSQL + 'DECODE(A.KDXCNTU, ''0'', A.KDXCNTG, A.KDXCNTU) KDXCNT, ';
         sSQL := sSQL + 'DECODE(A.ARTPCU,  ''0'', A.ARTPCG, A.ARTPCU) ARTPC, ';
         sSQL := sSQL + 'DECODE(A.KDXCNTU, ''0'', A.KDXCNTG * A.ARTPCG, A.KDXCNTU * A.ARTPCU) TOTAL, ';
         sSQL := sSQL + 'DECODE(A.UNMIDU,  '''',  A.UNMIDG, A.UNMIDU) UNMID ';
         sSQL := sSQL + 'FROM LOG315 A, TGE205 B, TGE130 C ';
         sSQL := sSQL + 'WHERE A.CIAID= ' + QuotedStr(sCIA) + ' ';
         sSQL := sSQL + 'AND A.LOCID=' + QuotedStr(sLOC) + ' ';
         sSQL := sSQL + 'AND A.TINID=' + QuotedStr(sTIN) + ' ';
         sSQL := sSQL + 'AND A.ALMID=' + QuotedStr(sALM) + ' ';
         sSQL := sSQL + 'AND A.TDAID=' + QuotedStr(sTDO) + ' ';
         sSQL := sSQL + 'AND A.NISAID=' + QuotedStr(sNIN) + ' ';
         sSQL := sSQL + 'AND A.NISATIP=' + QuotedStr(sTIP) + ' ';
         sSQL := sSQL + 'AND A.CIAID = B.CIAID(+) AND A.ARTID = B.ARTID(+) ';
         sSQL := sSQL + 'AND A.UNMIDG= C.UNMID(+) ORDER BY KDXID';

         DMLOG.cdsSQL.DisableControls;
         DMLOG.cdsSQL.Close;
         DMLOG.cdsSQL.DataRequest(sSQL);
         DMLOG.cdsSQL.Open;
         DMLOG.cdsSQL.EnableControls;
      End;
End;

Procedure TDMLOG.cdsReqsReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Function TDMLOG.BuscaFecha(PTable, PDescrip, PKey: String; PVal: TDateTime): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select * from ' + PTable + ' ';
   xSQL := xSQL + 'where ' + PKey + '=' + wRepFuncDate + '''' + FORMATDATETIME(wFormatFecha, PVal) + '''' + ')';
   xSQL := UpperCase(xSQL);
   cdsULTTGE.Close;
   cdsULTTGE.ProviderName := 'dspUltTGE';
   cdsULTTGE.DataRequest(xSQL); //este es la llamada remota al provider del servidor
   cdsULTTGE.Open;
   If cdsULTTGE.RecordCount > 0 Then
      Result := True
   Else
      Result := False;
End;

Function TDMLOG.BuscaFacPed(PCia, PClie, PPedido, PClaux: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'select * from FAC301 Where ';
   xSQL := xSQL + 'CIAID=' + quotedstr(PCia);
   xSQL := xSQL + ' AND PEDIDO=' + quotedstr(PPedido);
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.ProviderName := 'dspUltTGE';
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Function TDMLOG.BuscaRegPrecio(PCia, PTLista, PArt: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := 'SELECT * FROM FAC201 WHERE ';
   xSQL := xSQL + 'CIAID=' + '''' + PCia + '''' + ' and ';
   xSQL := xSQL + 'TLISTAID=' + '''' + PTLista + '''' + ' and ';
   xSQL := xSQL + 'ARTID=' + '''' + PArt + '''';
   xSQL := UpperCase(xSQL);
   cdsUltTGE.Close;
   cdsUltTGE.DataRequest(xSQL);
   cdsUltTGE.Open;
   If cdsUltTGE.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Procedure TDMLOG.Accesos;
Begin
   xSQL := 'SELECT * FROM TGE205 ';
   DMLOG.cdsArti.Close;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.FetchOnDemand := False;
   DMLOG.cdsArti.PacketRecords := 15;
   DMLOG.cdsArti.FetchOnDemand := True;
   DMLOG.cdsArti.Open;

   FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   FiltraTabla(DMLOG.cdsTDoc, 'TGE110', 'DOCID', 'DOCID');
   FiltraTabla(DMLOG.cdsPrio, 'TGE155', 'PRIOID', 'PRIOID');
   FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   FiltraTabla(DMLOG.cdsCCost, 'TGE203', 'CCOSID', 'CCOSID');
End;

Function TDMLOG.AnoNumDoc(Flag, Num, Ano: String): String;
Begin
   If Flag = 'S' Then
   Begin
      If copy(Num, 1, 4) = Ano Then
         Num := Num
      Else
         Num := Ano + '0001'
   End
   Else
      Num := Num;
   Result := Num;
End;

Procedure TDMLOG.cdsDODCxDRQSReconcileError(DataSet: TCustomClientDataSet;
   E: EReconcileError; UpdateKind: TUpdateKind;
   Var Action: TReconcileAction);
Begin
   Action := HandleReconcileError(DataSet, UpdateKind, E);
End;

Procedure TDMLOG.DisminuyeForma(Sender: TObject);
Begin
End;

Procedure TDMLOG.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
   wwAccion: String);
Var
   i: integer;
Begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   If wwAccion = 'E' Then
   Begin
      wwFiltro.FMant.cds2.Delete;
   End;

   If wwAccion = 'A' Then
   Begin
      wwFiltro.FMant.cds2.Append;
   End;

   If wwAccion = 'M' Then
   Begin
      wwFiltro.FMant.cds2.Edit;
   End;

   If (wwAccion = 'A') Or (wwAccion = 'M') Then
   Begin
      For i := 0 To wwCdsLee.FieldCount - 1 Do
      Begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
            wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      End;
   End;
   If wwFiltro.FMant.cds2.State In [dsInsert, dsEdit] Then
      wwFiltro.FMant.cds2.Post;
End;

Procedure TDMLOG.AccesosBotones(xxModulo, xxUsuario, xxForma: String);
Var
   wpSQL: String;
Begin
   wpSQL := 'Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, C.GRUPOADM, B.OBJETO '
      + 'From TGE007 A, TGE001 B, TGE003 C '
      + 'where A.USERID=' + quotedstr(xxUsuario)
      + '  and A.GRUPOID=B.GRUPOID(+) '
      + '  and B.MODULOID=' + quotedstr(xxModulo)
      + '  and A.GRUPOID=C.GRUPOID(+) '
      + '  and B.TIPO=''2'' ';
   cdsQry.Close;
   cdsQry.IndexFieldNames := '';
   cdsQry.Filter := '';
   cdsQry.Filtered := False;
   cdsQry.DataRequest(wpSQL);
   cdsQry.Open;

   cdsQry.First;
   While Not cdsQry.Eof Do
   Begin
      wComponente := BuscaObjeto(cdsQry.FieldByName('OBJETO').Value, Screen.ActiveForm);
      If (wComponente.Name = 'Z2bbtnModifica') Or
         (wComponente.Name = 'Z2bbtnConsulta') Then
         wComponente.Enabled := False
      Else
      Begin
         wComponente.Visible := False;
      End;
      cdsQry.Next;
   End;

End;

Function TDMLOG.FiltraCiaPorUsuario(cdsCiaUser: TwwClientDataSet): String;
Var
   cFilter: String;
Begin
   cFilter := '';
   cdsCiaUser.First;
   While Not cdsCiaUser.Eof Do
   Begin
      If cFilter = '' Then
         cFilter := ' CIAID IN ( ''' + cdsCiaUser.FieldByName('CIAID').AsString + ''''
      Else
         cFilter := cFilter + ', ''' + cdsCiaUser.FieldByName('CIAID').AsString + '''';

      cdsCiaUser.Next;
   End;

   If cFilter <> '' Then
      cFilter := cFilter + ' ) ';

   Result := cFilter;
End;

Function TDMLOG.ObtenerIpdeNetbios(Host: String): String;
Var
   WSAData: TWSADATA;
   HostEnt: phostent;
Begin
   Result := '';
   If WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 Then
   Begin
      HostEnt := gethostbyname(PChar(Host));
      If HostEnt <> Nil Then
         Result := String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
      WSACleanup;
   End;
End;

Function TDMLOG.ComputerName: String;
Var
   Buffer: Array[0..100] Of Char;
   MaxSize: Cardinal;
Begin
   MaxSize := SizeOf(Buffer);
   If Not GetComputerName(@Buffer, MaxSize) Then
      Raise Exception.Create('No puedo determinar el nombre de la máquina');
   Result := StrPas(@Buffer);
End;

Function TDMLOG.AccesosModulo: Boolean;
Var
   xSQL: String;
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xdiasduracpass: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
      + '       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
      + 'from TGE006 '
      + 'where USERID = ' + QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime > 0) And
      (cdsQry.FieldByName('FECEXP').AsDateTime < Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result := False;
      Exit;
   End;
   xfecfin := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;

   wOfiId := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip := cdsQry.FieldByName('CTRL_IP').AsString;
   widepc := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
      + '       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
      + '       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
      + 'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
      + 'where USUARIOS.USERID=' + quotedstr(wUsuario) // -- TGE006 USUARIOS
      + '  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
      + '  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
      + '  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
      + '  and ACCESOGRUPO.MODULOID=' + quotedstr(wModulo)
      + '  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result := False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
      xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = ' + QuotedStr(DMLOG.wUsuario);
      cdsQry.Close;
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      While Not cdsQry.Eof Do
      Begin
         If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP Then xingresa := 'S';
         cdsQry.Next;
      End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result := False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON(wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         Else
            MessageDlg('!!! FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡' + chr(13)
               + '            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result := False;
      Exit;
   End;
   Result := True;

End;

Function TDMLOG.fg_ValidaDatosProveedor(wgCodAuxiliar, wgCodProveedor: String; Var wgMensaje: String): Boolean;
Var
   xsSql: String;
   xsExiste: String;
   xsCompaniaLinea: String;
   xsTipoInvLinea: String;

Begin
   wgMensaje := '';
   xsCompaniaLinea := '02';
   xsTipoInvLinea := '26';
   Result := True;

   xsSql := ' Select * from TGE201 '
      + '  where CLAUXID = ' + QuotedStr(wgCodAuxiliar)
      + '    and PROV = ' + QuotedStr(wgCodProveedor);
   cdsQry12.Close;
   cdsQry12.DataRequest(xsSql);
   cdsQry12.Open;

   If fg_ValidaContactosProv(cdsQry12, wgMensaje) = False Then
   Begin
      wgMensaje := wgMensaje + 'Datos de Representante Legal ó Contacto están incompletos' + #13;
      Result := False;
   End;
   If cdsQry12.FieldByName('PROVTELF').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Ingrese el Teléfono del Proveedor' + #13;
      Result := False;
   End;
   If cdsQry12.FieldByName('PROVEMAI').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Ingrese el Correo Electrónico del Proveedor' + #13;
      Result := False;
   End;

   //Domicilio del proveedor
   If (cdsQry12.FieldByName('TIPVIAID').AsString = '') Or
      (cdsQry12.FieldByName('NOMVIA').AsString = '') Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Ingrese la Via y Nombre de la Via' + #13;
      Result := False;
   End;

   If (cdsQry12.FieldByName('NUMDOMIC').AsString = '') And
      (cdsQry12.FieldByName('INTDOMIC').AsString = '') And
      (cdsQry12.FieldByName('MZADOMIC').AsString = '') And
      (cdsQry12.FieldByName('LOTEDOMIC').AsString = '') Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Ingrese el Número, Dpto, Manzana ó el Lote' + #13;
      Result := False;
   End;
   If cdsQry12.FieldByName('DPTOID').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Debe Indicar el Departamento del Proveedor' + #13;
      Result := False;
   End;
   If cdsQry12.FieldByName('CIUDID').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Debe Indicar la Provincia del Proveedor' + #13;
      Result := False;
   End;
   If cdsQry12.FieldByName('PROVCZIP').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Debe Indicar el distrito del Proveedor' + #13;
      Result := False;
   End;

   If cdsQry12.FieldByName('ESDOMIC').AsString = '' Then
   Begin
      wgMensaje := wgMensaje + 'Domicilio del Proveedor: Indique si es domiciliado' + #13;
      Result := False;
   End;

// Valida Tipo de Proveedor
   xsSql := ' CLAUXID = ' + QuotedStr(wgCodAuxiliar) + ' AND PROV = ' + QuotedStr(wgCodProveedor);
   xsExiste := BuscaQry('prvTGE', 'LOG201', 'COUNT(1) EXISTE', xsSql, 'EXISTE');
   If xsExiste = '0' Then
   Begin
      wgMensaje := wgMensaje + 'Debe Ingresar el Rubro del Proveedor' + #13;
      Result := False;
   End;

   xsSql := ' CLAUXID = ' + QuotedStr(wgCodAuxiliar) + ' AND PROV = ' + QuotedStr(wgCodProveedor);
   xsExiste := BuscaQry('prvTGE', 'LOG203', 'COUNT(1) EXISTE', xsSql, 'EXISTE');
   If xsExiste = '0' Then
   Begin
      wgMensaje := wgMensaje + 'Debe Ingresar por lo menos un cliente' + #13;
   End;

   If wgMensaje <> '' Then
   Begin
      wgMensaje := '[VALIDACION DE DATOS DEL PROVEEDOR]' + #13 + wgMensaje;
   End;
   If Result = False Then
   Begin
      Exit;
   End;
   Result := True;
End;

Function TDMLOG.fg_ValidaContactosProv(wgCdsProveedor: TwwClientDataSet; Var wgMensaje: String): Boolean;
Var
   xsSql: String;

   xsCodRepres1: String;
   xsCodRepres2: String;
   xsCodContac: String;
   xsCodAuxiliar: String;
   xsCodProveedor: String;
Begin
   Result := True;
   xsCodAuxiliar := wgCdsProveedor.FieldByName('CLAUXID').AsString;
   xsCodProveedor := wgCdsProveedor.FieldByName('PROV').AsString;
   xsCodRepres1 := 'REP1';
   xsCodRepres2 := 'REP2';
   xsCodContac := 'CONT';
   If wgCdsProveedor.FieldByName('TIPPERID').AsString = '01' Then // no se valida si es persona natural
   Begin
      Result := True;
      Exit;
   End;
   xsSql := ' SELECT * FROM LOG204 WHERE CLAUXID = ' + QuotedStr(xsCodAuxiliar) + ' AND PROV = ' + QuotedStr(xsCodProveedor);
   cdsQry.Close;
   cdsQry.DataRequest(xsSql);
   cdsQry.Open;
   //buscando que por lo menos exista un representante
   If cdsQry.Locate('CLAUXID;PROV;TIPO', VarArrayOf([xsCodAuxiliar, xsCodProveedor, xsCodRepres1]), []) = False Then
   Begin
      If cdsQry.Locate('CLAUXID;PROV;TIPO', VarArrayOf([xsCodAuxiliar, xsCodProveedor, xsCodRepres2]), []) = False Then
      Begin
         wgMensaje := 'Por lo menos debe registrar un Representante Legal' + #13;
         Result := False;
         Exit;
      End;
   End;
   cdsQry.Prior;
   //buscando que exista un contacto
   If cdsQry.Locate('CLAUXID;PROV;TIPO', VarArrayOf([xsCodAuxiliar, xsCodProveedor, xsCodContac]), []) = False Then
   Begin
      wgMensaje := 'Debe registrar un Contacto';
      Result := False;
      Exit;
   End;

   //Verificando si los datos están completos
   While Not cdsQry.Eof Do
   Begin
      If cdsQry.FieldByName('TIPO').AsString = xsCodRepres1 Then
      Begin
         If (cdsQry.FieldByName('NOMBRES').AsString = '') Or
            (cdsQry.FieldByName('CARGOID').AsString = '') Or
            (cdsQry.FieldByName('TIPDOCID').AsString = '') Or
            (cdsQry.FieldByName('NUMDOC').AsString = '') Then
         Begin
            wgMensaje := wgMensaje + 'Los datos del 1er Representante Legal está incompleto' + #13;
            Result := False;
         End;
      End;
      If cdsQry.FieldByName('TIPO').AsString = xsCodRepres2 Then
      Begin
         If (cdsQry.FieldByName('NOMBRES').AsString = '') Or
            (cdsQry.FieldByName('CARGOID').AsString = '') Or
            (cdsQry.FieldByName('TIPDOCID').AsString = '') Or
            (cdsQry.FieldByName('NUMDOC').AsString = '') Then
         Begin
            wgMensaje := wgMensaje + 'Los datos del 2do Representante Legal está incompleto' + #13;
            Result := False;
         End;
      End;
      If cdsQry.FieldByName('TIPO').AsString = xsCodContac Then
      Begin
         If (cdsQry.FieldByName('NOMBRES').AsString = '') Or
            (cdsQry.FieldByName('CARGOID').AsString = '') Or
            (cdsQry.FieldByName('TELEFONO').AsString = '') Or
            (cdsQry.FieldByName('CORREO').AsString = '') Then
         Begin
            wgMensaje := wgMensaje + 'Los datos del Contacto está incompleto' + #13;
            Result := False;
         End;
      End;
      cdsQry.Next;
   End;
   If Result = False Then
   Begin
      Result := False;
      Exit;
   End
   Else
   Begin
      Result := True;
      Exit;
   End;
End;

Function TDMLOG.fg_VerificaVersion(wgVersion: String): Boolean;
Var
   xsSQL: String;
Begin
   Result := False;
   xsSQL := 'SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest(xsSQL);
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result := True
   Else
      Result := False;
End;

//Recupera el número maximo de orden de compra
Function TDMLOG.MaxORDAnio(xsCompania, xsAnio: String): String;
Var
   xsSql: String;
Begin
   xsSql := 'Select lpad(nvl(to_number(max(substr(ODCID,5,5))),0)+1,4,' + QuotedStr('0') + ') NUMERO '
      + '  from LOG304 '
      + ' where CIAID = ' + QuotedStr(xsCompania)
      + '   and substr(ODCID,1,4) = ' + Quotedstr(xsAnio);
   cdsQry.Close;
   cdsQry.DataRequest(xsSql);
   cdsQry.Open;
   Result := xsAnio + cdsQry.FieldByName('NUMERO').AsString;
End;

Function TDMLOG.VerificaTipInventario(vCIAID, vTINID: String): Boolean;
Var
   xsql: String;
Begin
   Xsql := 'Select  HABILITADO from tge152 Where Ciaid=''' + vCiaid + ''' And Tinid=''' + vTinid + ''' and NVL(Habilitado,''S'')=''S'' ';
   cdsQry.Close;
   cdsQry.DataRequest(Xsql);
   cdsQry.Open;
   If cdsQry.RecordCount > 0 Then
      Result := True
   Else
      Result := False;
End;

Function TDMLOG.Valores(Texto: String): double;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont <> ',' Then
         xValor := Trim(xValor) + Trim(xMont);
   End;
   Result := StrToFloat(xValor);
End;

Function TDMLOG.wf_AccesoOpcion(wOpcion: String): Boolean;
Begin
   xSQL := 'Select OBJETO '
      + '     from TGE001 '
      + '    where GRUPOID=' + quotedstr(DMLOG.wGrupo)
      + '      and MODULOID=' + quotedstr(DMLOG.wModulo)
      + '      and TIPO=' + quotedstr('1')
      + '      and OBJETO=' + quotedstr(wOpcion);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No tiene Acceso a esta Opción');
      result := False;
   End
   Else
   Begin
      result := True;
   End;
End;

End.

