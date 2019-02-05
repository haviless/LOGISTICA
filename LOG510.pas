Unit LOG510;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG510
//Formulario               : FPedUsu
//Fecha de Creación        : 28/11/2011
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Esta ventana se encarga de registrar los requerimientos
//                           de usuario registrado por las secretarias y aceptado por
//                           los jefes del área correspondiente.

//ACTUALIZACIONES
//HPC_201201_LOG 02/02/2012: Se realizan los siguientes ajuste solicitados por el usuario BLARREA:
//                           ­	Si se selecciona el tipo de requerimiento "C-Solicitud de Artículos"
//                              entonces poner por defecto como Tipo de Inventario "26-Suministros Diversos" y
//                              Almacén "01-Almacén Central"
//                           ­	El panel de selección de los artículos debe buscar los artículos cuyo nombre
//                              coinciden con el criterio de búsqueda ingresado. Se podrá buscar de acuerdo
//                              a uno o más criterios presionando la barra espaciadora para separar los criterios de búsqueda.
//                           ­	El panel de ingreso del detalle de Requerimientos de Usuario de
//                              tipo "S-Solicitud de Servicios" no se modificará.
//                           ­	El ingreso del campo Tipo de Servicio será obligatorio si el Requerimiento de Usuario
//                              es del tipo "S-Solicitud de Servicios"
//                           ­	El campo de Observaciones del Requermiento de Usuario deberá ser obligatorio
//                           ­	Eliminar el campo "Anotación" en el panel de selección de artículos
//                           ­	Al momento de buscar el artículo que se incluirá en el Requerimiento de
//                              Usuario se deberá mostrar el stock actual del artículo.
//                           ­	Los campos referidos al destino de los aartículos o servicios del
//                              requerimiento deberán estar bloqueados.
//                           ­	El formato de impresión del requerimiento de usuario mostrará el nombre
//                              del Jefe de Area sólo si el requerimiento está Aceptado, si sólo está
//                              grabado entonces no se mostrará el nombre del Jefe de Área
//HPC_201203_LOG 24/04/2012: -  se implementó el campo "Genera OC" para identificar a los requerimientos
//                              que generarán ordenes de compra.
//                           -  se habilitael campo Centro de Costo de destino para los usuarios de servicios generales
//HPC_201206_LOG 07/05/2012: -  Se implementó la funcionalidad que permite registrar a determinados usuarios
//                              en mas de 1 centro de costo
//HPC_201301_LOG 15/04/2013  -  Cuando se  ingresa un nuevo requerimiento; en el casillero de Tipo de Inventario podrá visualizar
//                              todos los tipos, al seleccionar uno de ellos debe bloquearse si el Tipo de Inventario esta DESHABILITADO
//                              mostrando el siguiente mensaje: "Tipo de Inventario está DESHABILITADO",  solo podrá avanzar si pone un
//                              Tipo de Inventario HABILITADO  o podrá salir del formulario sin grabar con el botón izquierdo superior (cerrar).
//HPC_201303_LOG 02/05/2013  -  Cuando se  ingresa un nuevo requerimiento, solo  deberá mostrar los artículos que estén marcados como ACTIVOS en
//                              el maestro de artículos.
// HPC_201405_LOG          : 14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
// HPC_201702_LOG         03/07/2017   Cambia forma de grabación de Cabecera y Detalle
// HCP_201801_LOG         agrega campo de Observaciones y Unidad de Medida a grabación de Edición
//                        cambia a Estado dsBrowse si está en Edit o Insert en Transferencia a SSGG
//                        Agrega Control para seguir grabando sólo cuando esta añadiendo registros nuevos

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, Wwdbdlg, Mask, wwdbedit, ExtCtrls, Buttons, Wwdbigrd,
   Grids, Wwdbgrid, wwdbdatetimepicker, DBCtrls, db, Wwdotdot, Wwdbcomb,
   ppStrtch, ppMemo, ppVar, ppCtrls, ppPrnabl, ppClass, ppBands, ppProd,
   ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppViewr, ppTypes,
   Variants, ppEndUsr, ppParameter, MsgDlgs;

Type
   TFPedUsu = Class(TForm)
      lblCIA: TLabel;
      dblcCompania: TwwDBLookupCombo;
      edtCompania: TEdit;
      Label3: TLabel;
      dblcLocalidad: TwwDBLookupCombo;
      edtLocalidad: TEdit;
      lblFReg: TLabel;
      dtpFechaRegistro: TwwDBDateTimePicker;
      dblcTipoRequerimiento: TwwDBLookupCombo;
      Label13: TLabel;
      edtTipoRequerimiento: TEdit;
      lblCC: TLabel;
      cbdlgCCUsuario: TwwDBLookupComboDlg;
      edtCCUsuario: TEdit;
      Label6: TLabel;
      edtNumReqUsuario: TwwDBEdit;
      dblcCompaniaSolicitante: TwwDBLookupCombo;
      Label10: TLabel;
      edtCompaniaSolicitante: TEdit;
      dblcLocalidadSolicitante: TwwDBLookupCombo;
      Label11: TLabel;
      edtLocalidadSolicitante: TEdit;
      cbdlgCCSolicitante: TwwDBLookupComboDlg;
      Label1: TLabel;
      edtCCSolicitante: TEdit;
      lblObserv: TLabel;
      pnlDetalleG: TPanel;
      txtFechaAceptar: TDBText;
      lblFRecep: TLabel;
      Label15: TLabel;
      dbgRequerimientoUsuarioDet: TwwDBGrid;
      btnAdicionarItem: TwwIButton;
      stxTitulo1: TPanel;
      Z2bbtnAceptar: TBitBtn;
      btnEditarCabecera: TBitBtn;
      btnGrabarRequerimiento: TBitBtn;
      btnAceptaCabecera: TBitBtn;
      pnlInventario: TPanel;
      Label4: TLabel;
      Label2: TLabel;
      dblcTipoInventario: TwwDBLookupCombo;
      edtTipoInventario: TEdit;
      dblcAlmacen: TwwDBLookupCombo;
      edtAlmacen: TEdit;
      btnSalir: TBitBtn;
      pnlTipoServicio: TPanel;
      lblObra: TLabel;
      dblcTipoServicio: TwwDBLookupCombo;
      edtTipoServicio: TEdit;
      pnlDetalleArticulo: TPanel;
      lnlNum: TLabel;
      lblArt: TLabel;
      lblCanPed: TLabel;
      lblTipoUMed: TLabel;
      lblUMed: TLabel;
      lblSUBFAM: TLabel;
      lblGrArtID: TLabel;
      lblFAM: TLabel;
      Label9: TLabel;
      Label14: TLabel;
      stxTitulo2: TStaticText;
      btnGrabar: TBitBtn;
      btnCancelar: TBitBtn;
      edtItem: TwwDBEdit;
      cbdlgArticulo: TwwDBLookupComboDlg;
      edtCantidadPedida: TwwDBEdit;
      dblcUnidadMedida: TwwDBLookupCombo;
      dblcTipoUM: TwwDBComboBox;
      edtArticulo: TEdit;
      edtUMedReq: TEdit;
      dbgArticulos: TwwDBGrid;
      edtCriterioBusqueda: TwwDBEdit;
      btnBuscar: TButton;
      pnlDetalleServicio: TPanel;
      lblItem: TLabel;
      lblTexto: TLabel;
      lblCntPed: TLabel;
      lblUnMed: TLabel;
      btnGrabarServicio: TBitBtn;
      btnCancelarServicio: TBitBtn;
      edtItemServicio: TwwDBEdit;
      stxTitulo3: TStaticText;
      edtCantidadPedidaServicio: TwwDBEdit;
      dblcUnidadMedidaServicio: TwwDBLookupCombo;
      edtUnidadMedServicio: TEdit;
      btnImprimir: TBitBtn;
      memAnotacion: TDBMemo;
      ppdbReporte: TppDBPipeline;
      ppReporte1: TppReport;
      ppDesigner1: TppDesigner;
      memObservacion: TDBMemo;
      Label5: TLabel;
      memObservacionServicio: TDBMemo;
      txtEstado: TDBText;
      ppParameterList2: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppShape2: TppShape;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppLabel14: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppLabel18: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBMemo2: TppDBMemo;
      ppDBText25: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine3: TppLine;
      ppDBText26: TppDBText;
      ppLine5: TppLine;
      ppLabel19: TppLabel;
      ppDBText27: TppDBText;
      ppLine6: TppLine;
      ppLabel20: TppLabel;
      ppLine7: TppLine;
      ppLabel21: TppLabel;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppLine8: TppLine;
      ppLabel22: TppLabel;
      ppDBText30: TppDBText;
      ppLine9: TppLine;
      ppLabel23: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSummaryBand2: TppSummaryBand;
      ppLabel24: TppLabel;
      ppDBMemo3: TppDBMemo;
      ppLine10: TppLine;
      txtSituacion: TDBText;
      Label7: TLabel;
      dblcGeneraOC: TwwDBLookupCombo;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcLocalidadExit(Sender: TObject);
      Procedure dblcTipoRequerimientoExit(Sender: TObject);
      Procedure cbdlgCCUsuarioExit(Sender: TObject);
      Procedure edtNumReqUsuarioKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcCompaniaSolicitanteExit(Sender: TObject);
      Procedure dblcLocalidadSolicitanteExit(Sender: TObject);
      Procedure cbdlgCCSolicitanteExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcTipoInventarioExit(Sender: TObject);
      Procedure dblcAlmacenExit(Sender: TObject);
      Procedure dblcTipoServicioExit(Sender: TObject);
      Procedure btnAceptaCabeceraClick(Sender: TObject);
      Procedure btnAdicionarItemClick(Sender: TObject);
      Procedure btnGrabarServicioClick(Sender: TObject);
      Procedure btnCancelarServicioClick(Sender: TObject);
      Procedure edtCriterioBusquedaKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnBuscarClick(Sender: TObject);
      Procedure btnCancelarClick(Sender: TObject);
      Procedure dbgArticulosRowChanged(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure cbdlgArticuloExit(Sender: TObject);
      Procedure dblcUnidadMedidaExit(Sender: TObject);
      Procedure dbgArticulosCellChanged(Sender: TObject);
      Procedure dbgRequerimientoUsuarioDetDblClick(Sender: TObject);
      Procedure btnEditarCabeceraClick(Sender: TObject);
      Procedure btnGrabarRequerimientoClick(Sender: TObject);
      Procedure btnImprimirClick(Sender: TObject);
      Procedure Z2bbtnAceptarClick(Sender: TObject);
      Procedure dblcUnidadMedidaServicioExit(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure dbgRequerimientoUsuarioDetKeyDown(Sender: TObject;
         Var Key: Word; Shift: TShiftState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
      Procedure fg_AsignaDataSource;
      Procedure fg_Asignalookup;
      Procedure fg_RecuperaRequerimiento(wgCompania, wgLocalidad, wgCentroCosto, wgNumRequerimiento: String);
      Procedure fg_RecuperaRequerimientoDet(wgCompania, wgLocalidad, wgCentroCosto, wgNumRequerimiento: String);
      Procedure fg_HabilitarCabecera(wgboolean: Boolean);
      Procedure fg_NumeroRequerimientoUsuario;
      Function fg_ValidaCabecera: Boolean;
      Procedure fg_CompletarCabecera;
      Procedure fg_LimpiarPanel;
      Procedure fg_HabilitarDetalle(wgBoolean: Boolean);
      Procedure fg_DefaultRequerimiento;
      Procedure fg_UbicacionPaneles;
      Function fg_ValidaPanelServicioActivo: Boolean;
      Procedure fg_GrabaDetalleServicioActivo;
      Procedure fg_GrabaDetalleArticulo;
      Procedure fg_DefaultDetalle;
      Procedure fg_Filtra_ArticulosPanel;
      Function fg_ValidaPanelArticulo: Boolean;
      Procedure fg_RecuperaArticulo;
      Procedure fg_HabilitaPanelArticulo(wgBoolean: Boolean);
      Procedure fg_HabilitaPanelServicioActivo(wgBoolean: Boolean);
      Procedure fg_RecuperaServicioActivo;
      Procedure fg_HabilitarPorTipoReq(wgTipoRequerimiento: String; wgBoolean: Boolean);
   Public
    { Public declarations }
      wError: String;
   End;

Var
   FPedUsu: TFPedUsu;
   xsAccionDetalle: String;
   xsTipoInventario, xsTipoAlmacen: String;
   xsUsuarioReqOC: String;
   xSigueGrab: Boolean;

Implementation
{$R *.dfm}
Uses LOGDM1, oaAD3000;

Procedure TFPedUsu.fg_Asignalookup;
Begin

   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'8'#9'ID'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'30'#9'Compañía'#9'F');
   dblcCompania.LookupTable := DMLOG.cdsCIA;
   dblcCompania.LookupField := 'CIAID';
   DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
// sólo se puede registrar requerimientos a la compañía 02 y 04
   DMLOG.cdsCia.Filtered := False;
   DMLOG.cdsCia.Filter := '';
   DMLOG.cdsCia.Filter := ' CIAID IN (' + QuotedStr('02') + ',' + QuotedStr('04') + ')';
   DMLOG.cdsCia.Filtered := True;

   dblcLocalidad.LookupTable := DMLOG.cdsLOC;
   dblcLocalidad.LookupField := 'LOCID';

   dblcTipoRequerimiento.LookupTable := DMLOG.cdsTipSol;
   dblcTipoRequerimiento.LookupField := 'TIPOADQ';
   DMLOG.FiltraTabla(DMLOG.cdsTipSol, 'TGE173', 'TIPOADQ', 'TIPOADQ');

   cbdlgCCUsuario.LookupTable := DMLOG.cdsCCost;
   cbdlgCCUsuario.LookupField := 'CCOSID';
   DMLOG.FiltraCDS(DMLOG.cdsCCost, 'SELECT * FROM TGE203 WHERE CCOSACT=' + QuotedStr('S') + ' AND CCOSMOV = ' + QuotedStr('S') + ' ORDER BY CCOSID');

   dblcCompaniaSolicitante.LookupTable := DMLOG.cdsCIA;
   dblcCompaniaSolicitante.LookupField := 'CIAID';

   dblcLocalidadSolicitante.LookupTable := DMLOG.cdsLOC;
   dblcLocalidadSolicitante.LookupField := 'LOCID';

   cbdlgCCSolicitante.LookupTable := DMLOG.cdsCCost;
   cbdlgCCSolicitante.LookupField := 'CCOSID';

   dblcTipoServicio.LookupTable := DMLOG.cdsObra;
   dblcTipoServicio.LookupField := 'OBRAID';
   dblcTipoInventario.LookupTable := DMLOG.cdsTINID;
   dblcTipoInventario.LookupField := 'TINID';
   DMLOG.FiltraTabla(DMLOG.cdsObra, 'TGE213', 'OBRAID', 'OBRAID');

   dblcAlmacen.LookupTable := DMLOG.cdsALM;
   dblcAlmacen.LookupField := 'ALMID';

   dbgArticulos.DataSource := DMLOG.dsQry12;
   dbgArticulos.Selected.Clear;
   dbgArticulos.Selected.Add('ARTID'#9'8'#9'Cod~Art'#9'F');
   dbgArticulos.Selected.Add('ARTDES'#9'50'#9'Artículo'#9'F');
   dbgArticulos.Selected.Add('GRARID'#9'5'#9'Cod~Linea'#9'F');
   dbgArticulos.Selected.Add('GRARDES'#9'20'#9'Línea'#9'F');
   dbgArticulos.Selected.Add('STOCK'#9'10'#9'Stock~Actual'#9'F');
   DMLOG.FiltraCDS(DMLOG.cdsQry11, 'SELECT * FROM TGE801 ');
   dblcGeneraOC.LookupTable := DMLOG.cdsQry11;
   dblcGeneraOC.LookupField := 'VALOR';

End;

Procedure TFPedUsu.fg_AsignaDataSource;
Begin

   dblcCompania.DataSource := DMLOG.dsPedUsu;
   dblcCompania.DataField := 'CIAID';
   dblcLocalidad.DataSource := DMLOG.dsPedUsu;
   dblcLocalidad.DataField := 'LOCID';
   dtpFechaRegistro.DataSource := DMLOG.dsPedUsu;
   dtpFechaRegistro.DataField := 'URQFREG';
   dblcTipoRequerimiento.DataSource := DMLOG.dsPedUsu;
   dblcTipoRequerimiento.DataField := 'TIPOADQ';
   cbdlgCCUsuario.DataSource := DMLOG.dsPedUsu;
   cbdlgCCUsuario.DataField := 'CCOSID';

   edtNumReqUsuario.DataSource := DMLOG.dsPedUsu;
   edtNumReqUsuario.DataField := 'URQID';
   dblcCompaniaSolicitante.DataSource := DMLOG.dsPedUsu;
   dblcCompaniaSolicitante.DataField := 'CIAIDSOLIC';
   dblcLocalidadSolicitante.DataSource := DMLOG.dsPedUsu;
   dblcLocalidadSolicitante.DataField := 'LOCIDSOLIC';
   cbdlgCCSolicitante.DataSource := DMLOG.dsPedUsu;
   cbdlgCCSolicitante.DataField := 'URQSOLIC';
   dblcTipoServicio.DataSource := DMLOG.dsPedUsu;
   dblcTipoServicio.DataField := 'OBRAID';
   dblcTipoInventario.DataSource := DMLOG.dsPedUsu;
   dblcTipoInventario.DataField := 'TINID';
   dblcAlmacen.DataSource := DMLOG.dsPedUsu;
   dblcAlmacen.DataField := 'ALMID';
   memObservacion.DataSource := DMLOG.dsPedUsu;
   memObservacion.DataField := 'URQOBS';
   txtEstado.DataSource := DMLOG.dsPedUsu;
   txtEstado.DataField := 'URQEST';
   txtSituacion.DataSource := DMLOG.dsPedUsu;
   txtSituacion.DataField := 'URQESTUSR';
   txtFechaAceptar.DataSource := DMLOG.dsPedUsu;
   txtFechaAceptar.DataField := 'URQACEPHREG';

   dbgRequerimientoUsuarioDet.DataSource := DMLOG.dsDPedUsu;
   dbgArticulos.DataSource := DMLOG.dsQry12;

   //Paneles
   edtItem.DataSource := DMLOG.dsDPedUsu;
   edtItem.DataField := 'DURQID';
   cbdlgArticulo.DataSource := DMLOG.dsDPedUsu;
   cbdlgArticulo.DataField := 'ARTID';

   memAnotacion.DataSource := DMLOG.dsDPedUsu;
   memAnotacion.DataField := 'DURQOBSUSR';
   dblcTipoUM.DataSource := DMLOG.dsDPedUsu;
   dblcTipoUM.DataField := 'FLAGUM';
   dblcUnidadMedida.DataSource := DMLOG.dsDPedUsu;
   dblcUnidadMedida.DataField := 'UNMIDG';
   edtCantidadPedida.DataSource := DMLOG.dsDPedUsu;
   edtCantidadPedida.DataField := 'DURQCNSG';

   edtItemServicio.DataSource := DMLOG.dsDPedUsu;
   edtItemServicio.DataField := 'DURQID';
// Inicio HCP_201801_LOG
// Libera componente de Unidad de Medida de Servicio del datasource
//   dblcUnidadMedidaServicio.DataSource := DMLOG.dsDPedUsu;
//   dblcUnidadMedidaServicio.DataField := 'UNMIDG';
// Fin HCP_201801_LOG
   edtCantidadPedidaServicio.DataSource := DMLOG.dsDPedUsu;
   edtCantidadPedidaServicio.DataField := 'DURQCNSG';
   memObservacionServicio.DataSource := DMLOG.dsDPedUsu;
   memObservacionServicio.DataField := 'DURQOBS';
   dblcGeneraOC.DataSource := DMLOG.dsPedUsu;
   dblcGeneraOC.DataField := 'GENOC';
End;

Procedure TFPedUsu.dblcCompaniaExit(Sender: TObject);
Var
   xsSql: String;
Begin
// Verifica si el Tipo de Inventario asignado al usuario esta deshabilidato
   wError := 'N';
   If Not DMLOG.VerificaTipInventario(dblcCompania.Text, dblcTipoInventario.Text) And (Length(trim(dblcTipoInventario.Text)) > 0) Then
   Begin
      ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(dblcTipoInventario.Text) + ' está DESHABILITADO..');
      wError := 'S';
   End;

   xsSql := 'CIAID=' + quotedstr(dblcCompania.Text);
   edtCompania.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xsSql, 'CIADES');
   If edtCompania.Text = '' Then
   Begin
      ShowMessage('Compañía no es válida');
      dblcCompania.SetFocus;
      Exit;
   End;

   xsSql := 'Select * from TGE126 where CIAID=' + quotedstr(dblcCompania.Text);
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(xsSql);
   DMLOG.cdsLOC.open;

   xsSql := ' CCOSACT=' + QuotedStr('S')
      + ' AND CCOSMOV = ' + QuotedStr('S')
      + ' AND CCOSCIAS LIKE ' + Quotedstr('%' + dblcCompania.Text + '%');

   If xsUsuarioReqOC = 'S' Then
   Begin
      DMLOG.FiltraCDS(DMLOG.cdsCCost, 'Select * from TGE203 where ' + xsSql);
   End
   Else
   Begin
      DMLOG.fg_FiltraTablaOtorgados(DMLOG.cdsCCost, 'TGE203', 'CCOSID', 'CCOSID', xsSql);
   End;

   If (DMLOG.wModo = 'A') Or (DMLOG.wModo = 'M') Then
   Begin
      fg_HabilitarCabecera(True);
   // Actualizando tipo de inventario
      If DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString <> '' Then
         dblcTipoRequerimientoExit(dblcTipoRequerimiento);
   End;

   If DMLOG.cdsPedUsu.State In [dsInsert] Then
   Begin
      dblcCompaniaSolicitante.Text := dblcCompania.text;
      DMLOG.cdsPedUsu.FieldByName('CIAIDSOLIC').AsString := dblcCompania.Text;
      edtCompaniaSolicitante.Text := edtCompania.text;
   End;

End;

Procedure TFPedUsu.dblcLocalidadExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'LOCID=' + QuotedStr(dblcLocalidad.Text) + ' AND CIAID=' + QuotedStr(dblcCompania.text);
   edtLocalidad.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xsSql, 'LOCDES');
   If edtLocalidad.Text = '' Then
   Begin
      ShowMessage('La localidad no es válida');
      dblcLocalidad.SetFocus;
      Exit;
   End;

   xsSql := 'SELECT * FROM TGE152 WHERE CIAID=' + QuotedStr(dblcCompania.Text);
   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.DataRequest(xsSql);
   DMLOG.cdsTINID.open;

   If DMLOG.cdsPedUsu.State In [dsInsert] Then
   Begin
      dblcLocalidadSolicitante.Text := dblcLocalidad.text;
      DMLOG.cdsPedUsu.FieldByName('LOCIDSOLIC').AsString := dblcLocalidad.Text;
      edtLocalidadSolicitante.Text := edtLocalidad.text;
   End;
End;

Procedure TFPedUsu.dblcTipoRequerimientoExit(Sender: TObject);
Var
   xsSql: String;
Begin
   edtTipoRequerimiento.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + QuotedStr(DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString), 'TIPADQDES');
   If edtTipoRequerimiento.Text = '' Then
   Begin
      ShowMessage('El Tipo de Requerimiento no es válido');
      dblcTipoRequerimiento.Setfocus;
      Exit;
   End;

   xsSql := 'SELECT * FROM TGE142 WHERE TIPOADQ=' + QuotedStr(DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString);
   DMLOG.cdsTRqs.Close;
   DMLOG.cdsTRqs.DataRequest(xsSql);
   DMLOG.cdsTRqs.Open;
   DMLOG.cdsTRqs.First;

   If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'C') Then
   Begin
      dblcTipoServicio.Text := '';
      edtTipoServicio.Text := '';
      DMLOG.cdsPedUsu.FieldByName('OBRAID').AsString := '';

   // verifica si se habilita o no el campo Genera OC
      If xsUsuarioReqOC <> 'S' Then
      Begin
         dblcGeneraOC.Text := 'N';
         DMLOG.cdsPedUsu.FieldByName('GENOC').AsString := 'N';
      End;

      If dblcCompania.Text = '02' Then
      Begin
         dblcTipoInventario.Text := xsTipoInventario;
         DMLOG.cdsPedUsu.FieldByName('TINID').AsString := xsTipoInventario;
         dblcTipoInventarioExit(dblcTipoInventario);
         dblcAlmacen.Text := xsTipoAlmacen;
         dblcAlmacenExit(dblcAlmacen);
         DMLOG.cdsPedUsu.FieldByName('ALMID').AsString := xsTipoAlmacen;
         dblcTipoInventario.Enabled := False;
         dblcAlmacen.Enabled := False;
      End
      Else
      Begin
         dblcTipoInventario.Enabled := True;
         dblcAlmacen.Enabled := True;
      End;
   End
   Else
      If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'S') Or
         (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'A') Then
      Begin
         dblcTipoInventario.Text := '';
         edtTipoInventario.Text := '';
         DMLOG.cdsPedUsu.FieldByName('TINID').AsString := '';
         DMLOG.cdsPedUsu.FieldByName('ALMID').AsString := '';
         dblcAlmacen.Text := '';
         edtAlmacen.Text := '';
         If DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'A' Then
         Begin
            dblcTipoServicio.Text := '';
            edtTipoServicio.Text := '';
            DMLOG.cdsPedUsu.FieldByName('OBRAID').AsString := '';
         End;
      End;
   fg_HabilitarPorTipoReq(DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString, True);
End;

Procedure TFPedUsu.cbdlgCCUsuarioExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'CCOSID=' + quotedStr(cbdlgCCUsuario.text)
      + ' AND CCOSCIAS LIKE ''%' + dblcCompania.Text + '%''';
   edtCCUsuario.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES', xsSql, 'CCOSDES');
   edtCCSolicitante.Text := edtCCUsuario.Text;
   If Length(Trim(edtCCUsuario.Text)) = 0 Then
      ErrorMsg('Error', 'Centro de Costo no Existe.. ');
End;

Procedure TFPedUsu.edtNumReqUsuarioKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [' ', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '.', '-', '_'] Then
      Key := #0;
End;

Procedure TFPedUsu.dblcCompaniaSolicitanteExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'CIAID=' + quotedstr(dblcCompaniaSolicitante.text);
   edtCompaniaSolicitante.text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xsSql, 'CIADES');
End;

Procedure TFPedUsu.dblcLocalidadSolicitanteExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'LOCID=' + quotedstr(dblcLocalidadSolicitante.text) + ' AND CIAID=' + quotedstr(dblcCompaniaSolicitante.text);
   edtLocalidadSolicitante.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xsSql, 'LOCDES');
End;

Procedure TFPedUsu.cbdlgCCSolicitanteExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'CCOSID=' + quotedStr(cbdlgCCSolicitante.text) + ' AND CCOSCIAS LIKE ''%' + dblcCompaniaSolicitante.Text + '%'' AND CCOSACT=''S''';
   DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES, CCOSMOV', xsSql, 'CCOSDES');
   If Length(Trim(DMLOG.cdsQry.FieldByName('CCOSMOV').ASString)) = 0 Then
   Begin
      edtCCSolicitante.Text := '';
      ErrorMsg('Adquisiciones', 'Sólo puede Seleccionar un C.Costo de Ultimo Nivel y Debe estar habilitado para Compañía');
      Exit;
   End;
   edtCCSolicitante.Text := DMLOG.cdsQry.FieldByName('CCOSDES').ASString;

   If Length(Trim(edtCCSolicitante.Text)) = 0 Then
      ErrorMsg('Error', 'Centro de Costo Solicitante no Existe.. ');

End;

Procedure TFPedUsu.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      If self.ActiveControl Is TDBMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPedUsu.FormKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If key = Vk_escape Then Close;
End;

Procedure TFPedUsu.fg_RecuperaRequerimiento(wgCompania, wgLocalidad, wgCentroCosto, wgNumRequerimiento: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select * '
      + '       from LOG306 '
      + '      where CIAID = ' + QuotedStr(wgCompania)
      + '        and LOCID = ' + QuotedStr(wgLocalidad)
      + '        and CCOSID = ' + QuotedStr(wgCentroCosto)
      + '        and URQID = ' + QuotedStr(wgNumRequerimiento);
   DMLOG.cdsPedUsu.Close;
   DMLOG.cdsPedUsu.DataRequest(xsSql);
   DMLOG.cdsPedUsu.Open;

   xsSql := 'CIAID=' + quotedstr(dblcCompania.Text);
   edtCompania.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', xsSql, 'CIADES');

   xsSql := 'LOCID=' + QuotedStr(dblcLocalidad.Text) + ' AND CIAID=' + QuotedStr(dblcCompania.text);
   edtLocalidad.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE126', 'LOCDES', xsSql, 'LOCDES');

   edtTipoRequerimiento.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE173', 'TIPADQDES', 'TIPOADQ=' + QuotedStr(DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString), 'TIPADQDES');

   xsSql := 'CCOSID=' + quotedStr(cbdlgCCUsuario.text) + ' AND CCOSCIAS LIKE ''%' + dblcCompania.Text + '%''';
   edtCCUsuario.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES', xsSql, 'CCOSDES');

   dblcCompaniaSolicitanteExit(dblcCompaniaSolicitante);
   dblcLocalidadSolicitanteExit(dblcLocalidadSolicitante);
   xsSql := 'CCOSID=' + quotedStr(cbdlgCCSolicitante.text) + ' AND CCOSCIAS LIKE ''%' + dblcCompaniaSolicitante.Text + '%'' AND CCOSACT=''S''';
   edtCCSolicitante.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE203', 'CCOSDES, CCOSMOV', xsSql, 'CCOSDES');

   xsSql := 'TINID=' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID=' + QuotedStr(dblcCompania.Text);
   edtTipoInventario.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xsSql, 'TINDES');

   xsSql := 'LOCID=' + QuotedStr(dblcLocalidad.text) + ' AND TINID=' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID=' + quotedstr(dblcCompania.Text);
   xsSql := 'SELECT * FROM TGE151 WHERE ' + xsSql;
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(xsSql);
   DMLOG.cdsALM.open;

   dblcAlmacenExit(dblcAlmacen);
   dblcTipoServicioExit(dblcTipoServicio);
End;

Procedure TFPedUsu.fg_RecuperaRequerimientoDet(wgCompania, wgLocalidad, wgCentroCosto, wgNumRequerimiento: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select * '
      + '       from LOG307 '
      + '      where CIAID = ' + QuotedStr(wgCompania)
      + '        and LOCID = ' + QuotedStr(wgLocalidad)
      + '        and CCOSID = ' + QuotedStr(wgCentroCosto)
      + '        and URQID = ' + QuotedStr(wgNumRequerimiento);
   DMLOG.cdsDPedUsu.Close;
   DMLOG.cdsDPedUsu.DataRequest(xsSql);
   DMLOG.cdsDPedUsu.Open;
End;

Procedure TFPedUsu.FormActivate(Sender: TObject);
Var
   xsSql: String;
Begin
   wError := 'N';
   xsTipoInventario := '26';
   xsTipoAlmacen := '01';
   xsSql := 'USERID=' + quotedstr(DMLOG.wUsuario);
   xsUsuarioReqOC := DMLOG.DisplayDescrip('prvTGE', 'TGE171', 'REQOC', xsSql, 'REQOC');
   FPedUsu.Caption := FPedUsu.Caption + ' [' + DMLOG.wUsuario + ']';
   fg_AsignaDataSource;
   fg_Asignalookup;
   fg_UbicacionPaneles;
   If DMLOG.wModo = 'A' Then
   Begin
      xsSql := 'Select * from LOG307 where 1 = 2';
      DMLOG.cdsDPedUsu.Close;
      DMLOG.cdsDPedUsu.DataRequest(xsSql);
      DMLOG.cdsDPedUsu.Open;
      fg_DefaultRequerimiento;
      fg_HabilitarCabecera(True);
      fg_HabilitarDetalle(False);
      fg_HabilitarPorTipoReq(dblcTipoRequerimiento.Text, True);
   End
   Else
      If DMLOG.wModo = 'M' Then
      Begin
         fg_RecuperaRequerimiento(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
            DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
            DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
            DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
         fg_RecuperaRequerimientoDet(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
            DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
            DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
            DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
         DMLOG.cdsPedUsu.Edit;
         fg_HabilitarCabecera(True);
         fg_HabilitarPorTipoReq(dblcTipoRequerimiento.Text, True);
         fg_HabilitarDetalle(False);
         If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString <> 'INICIAL' Then
         Begin
            DMLOG.wModo := 'C';
         End;
      End;
   If DMLOG.wModo = 'C' Then
   Begin
      fg_RecuperaRequerimiento(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
         DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
         DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
         DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
      fg_RecuperaRequerimientoDet(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
         DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
         DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
         DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
      fg_HabilitarCabecera(False);
      fg_HabilitarPorTipoReq(dblcTipoRequerimiento.Text, False);
      fg_HabilitarDetalle(False);

      //Si es de SSGG y estado ACEPTADO entonces habilita Genera OC
      If (xsUsuarioReqOC = 'S') And
         (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'ACEPTADO') Then
      Begin
         btnGrabarRequerimiento.Enabled := False;
      End;
   End;

End;

Procedure TFPedUsu.fg_HabilitarCabecera(wgboolean: Boolean);
Begin
   dblcCompania.Enabled := wgboolean;
   dblcLocalidad.Enabled := wgboolean;
   dblcTipoRequerimiento.Enabled := wgboolean;
   dblcCompaniaSolicitante.Enabled := False;
   dblcLocalidadSolicitante.Enabled := False;
   cbdlgCCSolicitante.Enabled := False;
   dblcTipoInventario.Enabled := False;
   dblcAlmacen.Enabled := False;
   memObservacion.ReadOnly := Not (wgboolean);
   If wgboolean = False Then
   Begin
      memObservacion.Font.Color := clBtnShadow;
   End
   Else
   Begin
      memObservacion.Font.Color := clNavy;
   End;

   btnAceptaCabecera.Enabled := wgboolean;
   If DMLOG.cdsCCost.RecordCount > 1 Then
      cbdlgCCSolicitante.Enabled := wgboolean
   Else
      cbdlgCCSolicitante.Enabled := False;

   If (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL') And
      (DMLOG.wModo = 'M') Then
   Begin
      dblcCompania.Enabled := False;
      dblcLocalidad.Enabled := False;
      cbdlgCCUsuario.Enabled := False;
   End;

   //solo se habilita el campo tipo de requerimiento si no tiene detalle
   If DMLOG.cdsDPedUsu.RecordCount > 0 Then
   Begin
      dblcTipoRequerimiento.Enabled := False;
   End;
   If xsUsuarioReqOC = 'S' Then
      dblcGeneraOC.Enabled := (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL')
   Else
      dblcGeneraOC.Enabled := False;
End;

Procedure TFPedUsu.dblcTipoInventarioExit(Sender: TObject);
Var
   xsSql: String;
Begin

   xsSql := 'TINID=' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID=' + QuotedStr(dblcCompania.Text);
   edtTipoInventario.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE152', 'TINDES', xsSql, 'TINDES');

   xsSql := 'LOCID=' + QuotedStr(dblcLocalidad.text) + ' AND TINID=' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID=' + quotedstr(dblcCompania.Text);
   xsSql := 'SELECT * FROM TGE151 WHERE ' + xsSql;
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(xsSql);
   DMLOG.cdsALM.open;

  //Se restringe la modificación e inserción  del tipo de  inventario
   wError := 'N';
   If (Not DMLOG.VerificaTipInventario(dblcCompania.Text, dblcTipoInventario.Text)) And
      (Length(trim(dblcTipoInventario.Text)) > 0) And
      (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL') Then
   Begin
      ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(dblcTipoInventario.Text) + ' está DESHABILITADO..');
      edtTipoInventario.Text := '';
      dblcTipoInventario.SetFocus;
      wError := 'S';
      exit;
   End;

End;

Procedure TFPedUsu.dblcAlmacenExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'LOCID=' + QuotedStr(dblcLocalidad.text) + ' AND TINID=' + QuotedStr(dblcTipoInventario.Text) + ' AND CIAID=' + QuotedStr(dblcCompania.Text) + ' AND ALMID=' + QuotedStr(dblcAlmacen.Text);
   edtAlmacen.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE151', 'ALMDES', xsSql, 'ALMDES');
End;

Procedure TFPedUsu.dblcTipoServicioExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'OBRAID=' + quotedStr(dblcTipoServicio.text);
   edtTipoServicio.text := DMLOG.DisplayDescrip('prvSQL', 'TGE213', 'OBRADES', xsSql, 'OBRADES');
End;

Procedure TFPedUsu.fg_NumeroRequerimientoUsuario;
Var
   xsNumeroRequerimiento: String;
   xsFecha: String;
   xsWhere: String;
Begin
   xsFecha := DateToStr(dtpFechaRegistro.Date);

   xsWhere := ' CIAID = ' + QuotedStr(dblcCompania.Text);

   xsNumeroRequerimiento := DMLOG.MaxSQL('LOG306', 'URQID', xsWhere);

   If copy(xsNumeroRequerimiento, 1, 4) = Copy(xsFecha, 7, 4) Then
      edtNumReqUsuario.Text := xsNumeroRequerimiento
   Else
      edtNumReqUsuario.Text := Copy(xsFecha, 7, 4) + '0001';

   DMLOG.cdsPedUsu.FieldByName('URQID').AsString := edtNumReqUsuario.Text;
End;

Procedure TFPedUsu.btnAceptaCabeceraClick(Sender: TObject);
Var
   xsFlagAdiciona: String;
   xsSQL: String;
Begin
   Try
   // Inicio HPC_201702_LOG
   // 04/07/2017 reordena definición de número, validación y datos complemengtarios

      If fg_ValidaCabecera = False Then
      Begin
         Exit;
      End;

      If DMLOG.wModo = 'A' Then
      Begin
         xsFlagAdiciona := 'SI';
      End
      Else
      Begin
         xsFlagAdiciona := 'NO';
      End;

      If Not (DMLOG.cdsPedUsu.State In [dsEdit]) Then
      Begin
         DMLOG.cdsPedUsu.Edit;
      End;

   // 03/07/2017 añade comentarios a las rutinas
      fg_CompletarCabecera; // completa datos de fechas y datos de auditoría
      fg_HabilitarCabecera(False); // habilita o deshabilita componentes
      fg_HabilitarPorTipoReq(dblcTipoRequerimiento.Text, False); // habilita o deshabilita paneles
      fg_HabilitarDetalle(True); // // habilita o deshabilita botones

   // 03/07/2017 cambia grabación de cabecera por orden SQL
      If xsFlagAdiciona = 'SI' Then
      Begin
         fg_NumeroRequerimientoUsuario;
         xsSQL := 'Insert into LOG306(CIAID, LOCID, CCOSID, URQID, URQEST, URQESTUSR, URQSOLIC, TIPOADQ, TINID, '
            + '                      ALMID, URQOBS, URQUSR, URQFREG, URQHREG, OBRAID, OBRADES,'
            + '                      CCOSDES, URQSOLICDES, URQANO, URQMM, URQDD, URQTRI, URQSEM, URQSS, URQANOMM, URQAATRI, URQAASEM, '
            + '                      URQAASS, HORA, CIAIDSOLIC, LOCIDSOLIC, TINDES, URQFECHA, URQHORA, GENOC) '
            + '   Values('
            + quotedstr(dblcCompania.Text) + ','
            + quotedstr(dblcLocalidad.Text) + ','
            + quotedstr(cbdlgCCUsuario.Text) + ','
            + quotedstr(edtNumReqUsuario.Text) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQESTUSR').AsString) + ','
            + quotedstr(cbdlgCCSolicitante.Text) + ','
            + quotedstr(dblcTipoRequerimiento.Text) + ','
            + quotedstr(dblcTipoInventario.Text) + ','
            + quotedstr(dblcAlmacen.Text) + ','
            + quotedstr(memObservacion.Text) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQUSR').AsString) + ','
            + '           trunc(Sysdate),'
            + '           Sysdate, '
            + quotedstr(dblcTipoServicio.Text) + ', '
            + quotedstr(edtTipoServicio.Text) + ', '
            + quotedstr(edtCCUsuario.Text) + ','
            + quotedstr(edtCCSolicitante.Text) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQANO').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQMM').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQDD').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQTRI').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQSEM').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQSS').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQANOMM').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQAATRI').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQAASEM').AsString) + ','
            + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQAASS').AsString) + ','
            + '           Sysdate, '
            + quotedstr(dblcCompaniaSolicitante.Text) + ','
            + quotedstr(dblcLocalidadSolicitante.Text) + ','
            + quotedstr(edtTipoInventario.Text) + ','
            + '           trunc(Sysdate),'
            + '           Sysdate, '
            + quotedstr(dblcGeneraOC.Text) + ')';
      End
      Else
      Begin
         xsSQL := 'Update LOG306 '
            + '      Set URQSOLIC=' + quotedstr(cbdlgCCSolicitante.Text) + ','
            + '          OBRAID=' + quotedstr(dblcTipoServicio.Text) + ','
            + '          OBRADES=' + quotedstr(edtTipoServicio.Text) + ','
            + '          GENOC=' + quotedstr(dblcGeneraOC.Text) + ','
            + '          URQOBS=' + quotedstr(memObservacion.Text) + ','
            + '          URQUSR=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQUSR').AsString) + ','
            + '          URQFREG=trunc(Sysdate),'
            + '          URQHREG=Sysdate '
            + '    where CIAID=' + quotedstr(dblcCompania.Text)
            + '      and LOCID=' + quotedstr(dblcLocalidad.Text)
            + '      and CCOSID=' + quotedstr(cbdlgCCUsuario.Text)
            + '      and URQID=' + quotedstr(edtNumReqUsuario.Text);
      End;
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
      Except
         ShowMessage('No se pudo grabar la Cabecera del Requerimiento, reintente');
         btnAceptaCabecera.SetFocus;
         Exit;
      End;

      fg_RecuperaRequerimiento(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
         DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
         DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
         DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
      If xsFlagAdiciona = 'SI' Then
      Begin
         btnAdicionarItemClick(btnAdicionarItem);
      End;
   Except
      Exit;
   End;

End;

Function TFPedUsu.fg_ValidaCabecera: Boolean;
Begin
   If wError = 'S' Then
   Begin
      ShowMessage('El Tipo de Inventario ' + trim(dblcTipoInventario.Text) + ' está DESHABILITADO..');
      Result := False;
      Exit;
   End;

   If Length(edtCompania.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Compañía...');
      Result := False;
      Exit;
   End;
   If (dblcCompania.Text <> '02') And (dblcCompania.Text <> '04') Then
   Begin
      ShowMessage('En esta Compañía no se puede registrar requerimientos');
      Result := False;
      Exit;
   End;
   If Length(edtLocalidad.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Localidad...');
      Result := False;
      Exit;
   End;
// Inicio HPC_201702_LOG
// 05/07/2017 retira validación de Número de Requerimiento para este punto ya que se genera en forma posterior
{
   If Length(edtNumReqUsuario.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar No. de Pedido...');
      Result := False;
      Exit;
   End;
  }
// Fin HPC_201702_LOG
   If Length(edtTipoRequerimiento.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Tipo de Requerimiento...');
      Result := False;
      Exit;
   End;

   If Length(trim(cbdlgCCUsuario.Text)) = 0 Then
   Begin
      ShowMessage('Falta Registrar el Solicitante...');
      Result := False;
      Exit;
   End;

   If Length(trim(dblcCompaniaSolicitante.Text)) = 0 Then
   Begin
      ShowMessage('Falta Registrar Compañia del Solicitante...');
      Result := False;
      Exit;
   End;
   If Length(trim(dblcLocalidadSolicitante.Text)) = 0 Then
   Begin
      ShowMessage('Falta Registrar Localidad del Solicitante...');
      Result := False;
      Exit;
   End;
   If Length(trim(cbdlgCCSolicitante.Text)) = 0 Then
   Begin
      ShowMessage('Falta Registrar Centro de Costo Solicitante...');
      Result := False;
      Exit;
   End;
   If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'C') Then
   Begin
      If Length(trim(dblcTipoInventario.Text)) = 0 Then
      Begin
         ShowMessage('Falta Registrar Tipo de Inventario...');
         Result := False;
         Exit;
      End;
      If Length(trim(dblcAlmacen.Text)) = 0 Then
      Begin
         ShowMessage('Falta Registrar el Almacén...');
         Result := False;
         Exit;
      End;

      If length(trim(dblcGeneraOC.Text)) = 0 Then
      Begin
         ShowMessage('Falta indicar si Generará Orden de Compra o NO');
         Result := False;
         Exit;
      End;
   End
   Else
      If DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'S' Then
      Begin
         If Length(trim(dblcTipoServicio.Text)) = 0 Then
         Begin
            ShowMessage('Falta Registrar el Tipo de Servicio...');
            Result := False;
            Exit;
         End;
         If length(trim(dblcGeneraOC.Text)) = 0 Then
         Begin
            ShowMessage('Falta indicar si Generará Orden de Compra o NO');
            Result := False;
            Exit;
         End;
      End;

   If length(trim(DMLOG.cdsPedUsu.FieldbyName('URQOBS').AsString)) = 0 Then
   Begin
      ShowMessage('Falta ingresar una Observación / Comentario...');
      Result := False;
      Exit;
   End;

   Result := True;
End;

Procedure TFPedUsu.fg_CompletarCabecera;
Var
   xsFecha, xsSql: String;

Begin
   DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString := 'INICIAL';
   DMLOG.cdsPedUsu.FieldbyName('URQESTUSR').AsString := 'EMITIDO';
   xsFecha := FormatDateTime(DMLOG.wFormatFecha, dtpFechaRegistro.Date);

   xsSql := 'SELECT * FROM TGE114 WHERE FECHA=' + quotedstr(xsFecha);
   DMLOG.FiltraCDS(DMLOG.cdsPeriodo, xsSql);

   DMLOG.cdsPedUsu.FieldbyName('URQANO').AsString := Copy(xsFecha, 7, 4);
   DMLOG.cdsPedUsu.FieldbyName('URQMM').AsString := DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   DMLOG.cdsPedUsu.FieldbyName('URQDD').AsString := DMLOG.strzero(Copy(xsFecha, 1, 2), 2);

   DMLOG.cdsPedUsu.FieldbyName('URQTRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQSEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQSS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQAATRI').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQAASEM').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQAASS').AsString := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;

   DMLOG.cdsPedUsu.FieldbyName('URQANOMM').AsString := Copy(xsFecha, 7, 4) + DMLOG.strzero(Copy(xsFecha, 4, 2), 2);
   If length(trim(DMLOG.cdsPedUsu.FieldbyName('URQITECOBS').AsString)) = 0 Then
      DMLOG.cdsPedUsu.FieldbyName('URQITECOBS').AsString := '.';

   If Length(Trim(DMLOG.cdsPedUsu.FieldByName('TINID').AsString)) > 0 Then
      DMLOG.cdsPedUsu.FieldByName('TINDES').AsString := edtTipoInventario.Text;

   DMLOG.cdsPedUsu.FieldByName('CCOSDES').AsString := edtCCUsuario.Text;
   DMLOG.cdsPedUsu.FieldByName('URQSOLICDES').AsString := edtCCSolicitante.Text;

   If length(trim(DMLOG.cdsPedUsu.FieldbyName('OBRAID').AsString)) > 0 Then
      DMLOG.cdsPedUsu.FieldbyName('OBRADES').AsString := edtTipoServicio.Text;

   If DMLOG.wModo = 'A' Then
   Begin
      DMLOG.cdsPedUsu.FieldbyName('URQUSR').AsString := DMLOG.wUsuario;
      DMLOG.cdsPedUsu.FieldbyName('URQFREG').AsDateTime := Date;
      DMLOG.cdsPedUsu.FieldbyName('URQHREG').AsDateTime := Date + SysUtils.Time;
      DMLOG.cdsPedUsu.FieldByName('URQHORA').AsDateTime := date + SysUtils.Time;
      DMLOG.cdsPedUsu.FieldByName('URQFECHA').AsDateTime := date;
      DMLOG.cdsPedUsu.FieldByName('HORA').AsDateTime := date + SysUtils.Time;
      DMLOG.wModo := 'M';
   End;
End;

Procedure TFPedUsu.btnAdicionarItemClick(Sender: TObject);
Begin
   If Trim(DMLOG.cdsPedUsu.FieldbyName('URQESTUSR').AsString) = 'ANULADO' Then
   Begin
      ErrorMsg('Adquisiciones', ' El Pedido se encuentra Anulado, no puede Insertar Registros ');
      Exit;
   End;

   If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'ACEPTADO' Then
   Begin
      ErrorMsg('Adquisiciones', ' El Requerimiento ya a sido Aceptado, No puede Añadir mas Items ');
      Exit;
   End;

   If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'S') Or
      (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'A') Then
   Begin
      fg_LimpiarPanel;
      pnlDetalleServicio.Enabled := True;
      pnlDetalleServicio.Visible := True;
      xsAccionDetalle := 'ADICIONAR';
      fg_DefaultDetalle;
      memObservacionServicio.SetFocus();
   End
   Else
      If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'C') Then
      Begin
         fg_LimpiarPanel;
         pnlDetalleArticulo.Enabled := True;
         pnlDetalleArticulo.Visible := True;
         xsAccionDetalle := 'ADICIONAR';
         fg_DefaultDetalle;
         edtCriterioBusqueda.SetFocus();
      End;
   fg_HabilitarDetalle(False);

End;

Procedure TFPedUsu.fg_LimpiarPanel;
Begin

   edtItemServicio.Text := '';
   dblcUnidadMedidaServicio.Text := '';
   edtUnidadMedServicio.Text := '';
   edtCantidadPedidaServicio.Text := '';
   memObservacionServicio.Text := '';

   //controles de pnlDetalleArticulo
   edtCriterioBusqueda.Text := '';
   edtItem.Text := '';
   cbdlgArticulo.Text := '';
   edtArticulo.Text := '';
   memAnotacion.Text := '';
   dblcTipoUM.Text := '';
   dblcUnidadMedida.Text := '';
   edtUMedReq.Text := '';
   edtCantidadPedida.Text := '';
   DMLOG.cdsQry12.Close;

End;

Procedure TFPedUsu.fg_HabilitarDetalle(wgBoolean: Boolean);
Begin
   btnAdicionarItem.Enabled := wgBoolean;
   dbgRequerimientoUsuarioDet.Enabled := wgBoolean;
   btnEditarCabecera.Enabled := wgBoolean;
// Inicio HPC_201702_LOG
// 05/07/2017 El Botón de Grabar deberá estar habilitado sólo si el Estado del Requerimiento en INICIAL
   btnGrabarRequerimiento.Enabled := (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL'); // wgBoolean;
   Z2bbtnAceptar.Enabled := (DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL'); // wgBoolean;
// Final HPC_201702_LOG
End;

Procedure TFPedUsu.fg_HabilitaPanelArticulo(wgBoolean: Boolean);
Begin
   edtCriterioBusqueda.Enabled := wgBoolean;
   btnBuscar.Enabled := wgBoolean;
   dbgArticulos.Enabled := wgBoolean;
   cbdlgArticulo.Enabled := wgBoolean;
   memAnotacion.Enabled := wgBoolean;
   edtCantidadPedida.Enabled := wgBoolean;
End;

Procedure TFPedUsu.fg_HabilitaPanelServicioActivo(wgBoolean: Boolean);
Begin
   edtCantidadPedidaServicio.Enabled := wgBoolean;
   memObservacionServicio.Enabled := wgBoolean;
End;

Procedure TFPedUsu.fg_DefaultRequerimiento;
Var
   xsSql: String;
Begin
   xsSql := 'SELECT * FROM LOG107 WHERE USR=' + quotedstr(DMLOG.wUsuario) + ' AND TIPOADQ = ' + QuotedStr('C') + ' ORDER BY TIPOADQ';
   DMLOG.FiltraCDS(DMLOG.cdsSQL, xsSql);
   DMLOG.cdsPedUsu.FieldbyName('URQFREG').AsDateTime := Date;
   DMLOG.cdsPedUsu.FieldbyName('CCOSID').AsString := DMLOG.cdsSQL.fieldbyName('CCOSID').asString;
   DMLOG.cdsPedUsu.FieldbyName('URQSOLIC').AsString := DMLOG.cdsSQL.fieldbyName('CCOSID').asString;
   cbdlgCCUsuarioExit(cbdlgCCUsuario);
   cbdlgCCUsuario.Enabled := False;
   cbdlgCCSolicitanteExit(cbdlgCCSolicitante);
   If DMLOG.cdsSQL.RecordCount >= 1 Then
   Begin
      dblcCompania.Text := DMLOG.cdsSQL.fieldbyName('CIAID').asString;
      dblcCompaniaExit(dblcCompania);
      DMLOG.cdsPedUsu.FieldbyName('CIAID').AsString := DMLOG.cdsSQL.fieldbyName('CIAID').asString;
      dblcLocalidad.Text := DMLOG.cdsSQL.fieldbyName('LOCID').asString;
      dblcLocalidadExit(dblcLocalidad);
      DMLOG.cdsPedUsu.FieldbyName('LOCID').AsString := DMLOG.cdsSQL.fieldbyName('LOCID').asString;
      If DMLOG.cdsSQL.fieldbyName('TIPOADQ').asString = 'C' Then
      Begin
         DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString := 'C';
         dblcTipoRequerimiento.Text := DMLOG.cdsSQL.fieldbyName('TIPOADQ').asString;
         dblcTipoRequerimientoExit(dblcTipoRequerimiento);

         //VERIFICA SI EL TIPO DE INVENTARIO ASIGNADO AL USUARIO ESTA DESHABILIDATO
         If Not DMLOG.VerificaTipInventario(DMLOG.cdsSQL.fieldbyName('CIAID').asString, DMLOG.cdsSQL.fieldbyName('TINID').asString) Then
         Begin
            ErrorMsg('Inventarios', 'El Tipo de Inventario ' + trim(DMLOG.cdsSQL.fieldbyName('TINID').asString) + ' está DESHABILITADO..');
            dblcCompania.SetFocus;
            exit;
         End;
         DMLOG.cdsPedUsu.FieldbyName('TINID').AsString := DMLOG.cdsSQL.fieldbyName('TINID').asString;
         dblcTipoInventario.Text := DMLOG.cdsSQL.fieldbyName('TINID').asString;
         dblcTipoInventarioExit(dblcTipoInventario);
         DMLOG.cdsPedUsu.FieldbyName('ALMID').AsString := DMLOG.cdsSQL.fieldbyName('ALMID').asString;
         dblcAlmacen.Text := DMLOG.cdsSQL.fieldbyName('ALMID').asString;
         dblcAlmacenExit(dblcAlmacen);
      End
      Else
         If DMLOG.cdsSQL.fieldbyName('TIPOADQ').asString = 'S' Then
         Begin
            DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString := 'S';
            dblcTipoRequerimiento.Text := DMLOG.cdsSQL.fieldbyName('TIPOADQ').asString;
            dblcTipoRequerimientoExit(dblcTipoRequerimiento);
         End;
   End;

End;

Procedure TFPedUsu.fg_UbicacionPaneles;
Begin
   pnlDetalleServicio.Top := 200;
   pnlDetalleServicio.Left := 230;
   pnlDetalleArticulo.Top := 50;
   pnlDetalleArticulo.Left := 90;
End;

Function TFPedUsu.fg_ValidaPanelServicioActivo: Boolean;
Begin
   //Si estado permite modificar
   If DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString <> 'INICIAL' Then
   Begin
      ErrorMsg('Adquisiciones', 'El estado del Requerimiento no permite modificarlo');
      Result := False;
      Exit;
   End;
   //Verificando que campos tengan valores válidos
   If trim(dblcUnidadMedidaServicio.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'La unidad de medida no puede estar en blanco');
      dblcUnidadMedidaServicio.SetFocus;
      Result := False;
      Exit;
   End;
   If trim(edtCantidadPedidaServicio.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad no puede estar en blanco');
      edtCantidadPedidaServicio.SetFocus;
      Result := False;
      Exit;
   End;
   If strtofloat(edtCantidadPedidaServicio.Text) <= 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad tiene ser mayor a cero');
      edtCantidadPedidaServicio.SetFocus;
      Result := False;
      Exit;
   End;
   If trim(memObservacionServicio.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'Debe ingresar una Observación o Comentario');
      memObservacionServicio.SetFocus;
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFPedUsu.fg_GrabaDetalleServicioActivo;
Var
   xsSql: String;
Begin
   Try
      DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').asString := DMLOG.cdsPedUsu.FieldByName('TIPOADQ').asString;
      DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString := DMLOG.cdsPedUsu.FieldByName('CIAID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('LOCID').AsString := DMLOG.cdsPedUsu.FieldByName('LOCID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('DURQFREG').AsDateTime := Date;
      DMLOG.cdsDPedUsu.FieldByName('DURQHREG').AsDateTime := Date + SysUtils.Time;

      DMLOG.cdsDPedUsu.FieldByName('URQID').AsString := DMLOG.cdsPedUsu.FieldByName('URQID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('CCOSID').AsString := DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString := DMLOG.wUsuario;

      DMLOG.cdsDPedUsu.FieldbyName('URQANO').AsString := DMLOG.cdsPedUsu.FieldbyName('URQANO').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQMES').AsString := DMLOG.cdsPedUsu.FieldbyName('URQMM').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQDIA').AsString := DMLOG.cdsPedUsu.FieldbyName('URQDD').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQTRIM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQTRI').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQSEM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQSEM').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQANOMES').AsString := DMLOG.cdsPedUsu.FieldbyName('URQANOMM').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQSS').AsString := DMLOG.cdsPedUsu.fieldbyName('URQSS').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAATRI').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAATRI').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAASEM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAASEM').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAASS').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAASS').asString;

      DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString := edtItemServicio.Text;
      DMLOG.cdsDPedUsu.FieldByName('ARTID').AsString := edtItemServicio.Text;
      If length(trim(DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString)) = 0 Then
         DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString := '.';

      DMLOG.cdsDPedUsu.FieldByName('FLAGUM').AsString := 'G';
      DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString := dblcUnidadMedidaServicio.Text; //vunmid;
      DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString := edtCantidadPedidaServicio.Text;

      DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsString := DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString;
      DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsString := DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString;

      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').AsFloat := 0;
      DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString := memObservacionServicio.Text;
// Inicio HPC_201702_LOG
{
      DMLOG.cdsDPedUsu.ApplyUpdates(0);
      btnAdicionarItemClick(btnAdicionarItem);
   Except
      ErrorMsg('Adquisiciones', 'No se grabó el Detalle del Requerimiento');
   End;
}
   // 03/07/2017   Cambia forma de grabación de Detalle de Requerimientos
      DMLOG.cdsDPedUsu.Post;
      If xsAccionDetalle = 'ADICIONAR' Then
         xsSQL := 'Insert into DB2ADMIN.LOG307(CIAID, LOCID, CCOSID, URQID, DURQID, '
         + '                                ARTID, DURQCNSG, DURQCNSU, DURQCNAG, DURQCNAU, DURQFREG, DURQHREG, FLAGUM, UNMIDG, TIPOADQ, '
            + '                                DURQOBS, DURQOBSUSR, URQUSR, URQANO, URQMES, URQDIA, URQTRIM, URQSEM, URQANOMES, URQSS, URQAASEM, '
            + '                                URQAASS, URQAATRI, DURQCNSLG, DURQCNSLU) '
            + '    Values('
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('LOCID').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('CCOSID').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQID').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('ARTID').AsString) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').AsFloat) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').AsFloat) + ','
            + ' trunc(Sysdate),'
            + ' Sysdate,'
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('FLAGUM').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQANO').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQMES').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQDIA').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQTRIM').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQSEM').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQANOMES').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQSS').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAASEM').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAASS').AsString) + ','
            + quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAATRI').AsString) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat) + ','
            + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').AsFloat) + ')'
      Else
         xsSQL := 'Update DB2ADMIN.LOG307 '
            + '       Set DURQCNSG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat) + ','
            + '           DURQCNAG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat) + ','
            + '           URQUSR=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString) + ','
         // Inicio HCP_201801_LOG
         // agrega campo de Observaciones y Unidad de Medida a grabación de Edición
            + '           DURQOBS='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString) + ','
            + '           UNMIDG='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString) + ','
         // Fin HCP_201801_LOG
            + '           DURQFREG=trunc(Sysdate),'
            + '           DURQHREG=Sysdate,'
            + '           DURQCNSLG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat)
            + '     Where CIAID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString)
            + '       and URQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQID').AsString)
            + '       and DURQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString);
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
   Except
      xSigueGrab := False;
      ShowMessage('No se pudo grabar el Detalle del Requerimiento, reintente');
      Exit;
   End;
End;

Procedure TFPedUsu.btnGrabarServicioClick(Sender: TObject);
Begin
   Try
      If fg_ValidaPanelServicioActivo = False Then
      Begin
         Exit;
      End;
      xSigueGrab := True;
      fg_GrabaDetalleServicioActivo;
      If Not xSigueGrab Then
         exit
      Else
      // Inicio HPC_201801_LOG
      // Agrega Control para seguir grabando sólo cuando esta añadiendo registros nuevos
         If xsAccionDetalle = 'ADICIONAR' Then
            btnAdicionarItemClick(btnAdicionarItem);
      // Fin HPC_201801_LOG
   Except
      Exit;
   End;
End;

Procedure TFPedUsu.fg_DefaultDetalle;
Var
   xsItemMax: String;
Begin
   xsItemMax := DMLOG.StrZero(DMLOG.MaxValue('DURQID', DMLOG.cdsDPedUsu), 3);
   If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').asString = 'S') Or
      (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').asString = 'A') Then
   Begin
      If xsAccionDetalle = 'ADICIONAR' Then
      Begin
         DMLOG.cdsDPedUsu.Append;
      End;
      dblcUnidadMedidaServicio.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=' + QuotedStr('S'), 'UNMID');
      edtUnidadMedServicio.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=' + QuotedStr(dblcUnidadMedidaServicio.Text), 'UNMDES');
      edtCantidadPedidaServicio.Text := '1';
      dblcUnidadMedidaServicio.Enabled := False;
      edtUnidadMedServicio.Enabled := False;
      edtItemServicio.Enabled := False;
      edtItemServicio.Text := xsItemMax;
      DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString := xsItemMax;
   End
   Else
   Begin
      If xsAccionDetalle = 'ADICIONAR' Then
      Begin
         DMLOG.cdsDPedUsu.Append;
      End;
      edtUMedReq.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMDES', 'UNMID=' + QuotedStr(DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString), 'UNMDES');
      dblcTipoUM.Text := 'G';
      dblcUnidadMedida.Enabled := False;
      edtUMedReq.Enabled := False;
      edtItem.Enabled := False;
      edtItem.Text := xsItemMax;
      DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString := xsItemMax;
   End;
   DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString := DMLOG.DisplayDescrip('prvSQL', 'TGE130', 'UNMID', 'UNMSERV=' + QuotedStr('S'), 'UNMID');
End;

Procedure TFPedUsu.btnCancelarServicioClick(Sender: TObject);
Begin
   If DMLOG.cdsDPedUsu.State In [dsInsert, dsEdit] Then
   Begin
      DMLOG.cdsDPedUsu.Cancel;
   End;
   fg_LimpiarPanel;
   pnlDetalleServicio.Visible := False;
   fg_habilitarDetalle(True);
End;

Procedure TFPedUsu.fg_Filtra_ArticulosPanel;
Var
   xsCadenaFiltro: String;
   xsFiltro: String;
   xsSqlPuntaje, xsSqlWhere, xsSqlOrder, xsSql: String;
   xsDelimitador: String;
Begin
   xsDelimitador := ' ';
   xsCadenaFiltro := Trim(edtCriterioBusqueda.Text);
   If Length(xsCadenaFiltro) = 0 Then
   Begin
      Showmessage('No se ingresó criterios de búsqueda');
      Exit;
   End;

   //diviviendo la cadena
   Repeat
      If Pos(xsDelimitador, xsCadenaFiltro) > 0 Then
      Begin
         xsFiltro := copy(xsCadenaFiltro, 0, Pos(xsDelimitador, xsCadenaFiltro) - 1);
         xsCadenaFiltro := copy(xsCadenaFiltro, Pos(xsDelimitador, xsCadenaFiltro) + 1, Length(xsCadenaFiltro));
      End
      Else
      Begin
         xsFiltro := xsCadenaFiltro;
         xsCadenaFiltro := '';
      End;
      If Length(xsSqlWhere) > 0 Then
      Begin
         xsSqlWhere := xsSqlWhere + ' AND ';
      End;
      //Verifico si es código del artículo
      If Length(xsFiltro) = 8 Then
      Begin
         xsSqlWhere := xsSqlWhere + ' ( ARTICULO.ARTID = ' + QuotedStr(xsFiltro) + ' OR ARTICULO.ARTDES  LIKE ' + QuotedStr('%' + xsFiltro + '%') + ') AND NVL(ARTICULO.ARTEST,''H'')=''H'' ';
      End
      Else
      Begin
         xsSqlWhere := xsSqlWhere + ' UPPER( ARTICULO.ARTDES ) LIKE ' + QuotedStr('%' + xsFiltro + '%') + ' AND NVL(ARTICULO.ARTEST,''H'')=''H'' ';
      End;
   Until Length(xsCadenaFiltro) <= 0;

   xsSql := xsSql
      + ' Select ARTICULO.ARTID ARTID, '
      + '        ARTICULO.ARTDES ARTDES, '
      + '        ARTICULO.GRARID GRARID,LINEA.GRARDES GRARDES, '
      + '        ARTICULO.FAMID FAMID, FAMILIA.FAMDES FAMDES,   '
      + '        ARTICULO.SFAMID SFAMID, SUBFAMILIA.SFAMDES SFAMDES, '
      + '        ARTICULO.CIAID CIAID,ARTICULO.TINID TINID, ARTICULO.UNMIDG UNMIDG, '
      + '        ARTICULO.ARTCNTG STOCK '
      + '   from TGE205 ARTICULO, TGE152 TIPOINVENTARIO, TGE131 LINEA, '
      + '        TGE169 FAMILIA, TGE170 SUBFAMILIA '
      + '  where TIPOINVENTARIO.CIAID = LINEA.CIAID '
      + '    and TIPOINVENTARIO.TINID = LINEA.TINID '
      + '    and LINEA.CIAID = FAMILIA.CIAID '
      + '    and LINEA.TINID = FAMILIA.TINID '
      + '    and LINEA.GRARID = FAMILIA.GRARID '
      + '    and FAMILIA.CIAID = SUBFAMILIA.CIAID '
      + '    and FAMILIA.TINID = SUBFAMILIA.TINID '
      + '    and FAMILIA.GRARID = SUBFAMILIA.GRARID '
      + '    and FAMILIA.FAMID = SUBFAMILIA.FAMID '
      + '    and ARTICULO.CIAID = SUBFAMILIA.CIAID '
      + '    and ARTICULO.TINID = SUBFAMILIA.TINID '
      + '    and ARTICULO.GRARID = SUBFAMILIA.GRARID '
      + '    and ARTICULO.FAMID = SUBFAMILIA.FAMID '
      + '    and ARTICULO.SFAMID = SUBFAMILIA.SFAMID '
      + '    and ARTICULO.CIAID = ' + QuotedStr(dblcCompania.Text)
      + '    and ARTICULO.TINID = ' + QuotedStr(dblcTipoInventario.Text)
      + '    and ( ' + xsSqlWhere + ' ) '
      + '  order by ARTICULO.ARTID ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xsSql);
   DMLOG.cdsQry12.Open;

End;

Procedure TFPedUsu.edtCriterioBusquedaKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If (Key = ' ') Or (key = #13) Then
   Begin
      fg_Filtra_ArticulosPanel;
   End;
   If Key = #27 Then //escape
   Begin
      btnCancelarClick(btnCancelar);
   End;

End;

Procedure TFPedUsu.btnBuscarClick(Sender: TObject);
Begin
   fg_Filtra_ArticulosPanel;
End;

Procedure TFPedUsu.btnCancelarClick(Sender: TObject);
Begin
   If DMLOG.cdsDPedUsu.State In [dsInsert, dsEdit] Then
      DMLOG.cdsDPedUsu.Cancel;
   fg_LimpiarPanel;
   pnlDetalleArticulo.Visible := False;
   fg_habilitarDetalle(True);
End;

Procedure TFPedUsu.dbgArticulosRowChanged(Sender: TObject);
Begin
   If DMLOG.cdsQry12.RecordCount > 0 Then
   Begin
      cbdlgArticulo.Text := DMLOG.cdsQry12.FieldByName('ARTID').AsString;
      cbdlgArticuloExit(cbdlgArticulo);
      dblcTipoUM.Text := 'G';
      dblcUnidadMedida.Text := DMLOG.cdsQry12.FieldByName('UNMIDG').AsString;
      dblcUnidadMedidaExit(dblcUnidadMedida);

      memAnotacion.Text := '';
      edtCantidadPedida.Text := '';
      DMLOG.cdsDPedUsu.FieldbyName('DURQCNSG').AsString := '';
      DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString := '';

      DMLOG.cdsDPedUsu.FieldbyName('GRARID').AsString := DMLOG.cdsQry12.fieldbyName('GRARID').asString;
      DMLOG.cdsDPedUsu.FieldbyName('FAMID').AsString := DMLOG.cdsQry12.fieldbyName('FAMID').asString;
      DMLOG.cdsDPedUsu.FieldbyName('SFAMID').AsString := DMLOG.cdsQry12.fieldbyName('SFAMID').asString;
   End;
End;

Procedure TFPedUsu.btnGrabarClick(Sender: TObject);
Begin
   Try
      If fg_ValidaPanelArticulo = False Then
      Begin
         Exit;
      End;
      xSigueGrab := True;
      fg_GrabaDetalleArticulo;
      If Not xSigueGrab Then
         exit
      Else
      // Inicio HPC_201801_LOG
      // Agrega Control para seguir grabando sólo cuando esta añadiendo registros nuevos
         If xsAccionDetalle = 'ADICIONAR' Then
            btnAdicionarItemClick(btnAdicionarItem);
      // Fin HPC_201702_LOG
   Except
      Exit;
   End;
End;

Function TFPedUsu.fg_ValidaPanelArticulo: Boolean;
Begin
   //Si estado permite modificar
   If DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString <> 'INICIAL' Then
   Begin
      ErrorMsg('Adquisiciones', 'El estado del Requerimiento no permite modificarlo');
      Result := False;
      Exit;
   End;
   //Verificando que campos tengan valores válidos
   If trim(cbdlgArticulo.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'No se ha seleccionado ningún Artículo');
      edtCriterioBusqueda.SetFocus;
      Result := False;
      Exit;
   End;

   If trim(dblcUnidadMedida.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'La unidad de medida no puede estar en blanco');
      dblcUnidadMedida.SetFocus;
      Result := False;
      Exit;
   End;
   If trim(edtCantidadPedida.Text) = '' Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad no puede estar en blanco');
      edtCantidadPedida.SetFocus;
      Result := False;
      Exit;
   End;
   If strtofloat(edtCantidadPedida.Text) <= 0 Then
   Begin
      ErrorMsg('Adquisiciones', 'La Cantidad tiene que ser mayor a cero');
      edtCantidadPedida.SetFocus;
      Result := False;
      Exit;
   End;

   Result := True;
End;

Procedure TFPedUsu.fg_GrabaDetalleArticulo;
Var
   xsSql: String;
Begin
   Try
      DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').asString := DMLOG.cdsPedUsu.FieldByName('TIPOADQ').asString;
      DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString := DMLOG.cdsPedUsu.FieldByName('CIAID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('LOCID').AsString := DMLOG.cdsPedUsu.FieldByName('LOCID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('DURQFREG').AsDateTime := Date;
      DMLOG.cdsDPedUsu.FieldByName('DURQHREG').AsDateTime := Date + SysUtils.Time;

      DMLOG.cdsDPedUsu.FieldByName('URQID').AsString := DMLOG.cdsPedUsu.FieldByName('URQID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('CCOSID').AsString := DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString;
      DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString := DMLOG.wUsuario;

      DMLOG.cdsDPedUsu.FieldbyName('URQANO').AsString := DMLOG.cdsPedUsu.FieldbyName('URQANO').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQMES').AsString := DMLOG.cdsPedUsu.FieldbyName('URQMM').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQDIA').AsString := DMLOG.cdsPedUsu.FieldbyName('URQDD').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQTRIM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQTRI').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQSEM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQSEM').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQANOMES').AsString := DMLOG.cdsPedUsu.FieldbyName('URQANOMM').AsString;
      DMLOG.cdsDPedUsu.FieldbyName('URQSS').AsString := DMLOG.cdsPedUsu.fieldbyName('URQSS').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAATRI').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAATRI').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAASEM').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAASEM').asString;
      DMLOG.cdsDPedUsu.FieldbyName('URQAASS').AsString := DMLOG.cdsPedUsu.fieldbyName('URQAASS').asString;

      xsSql := 'CIAID=' + QuotedStr(dblcCompania.text)
         + ' AND GRARID=' + QuotedStr(DMLOG.cdsDPedUsu.FieldbyName('GRARID').AsString)
         + ' AND TINID =' + QuotedStr(DMLOG.cdsPedUsu.FieldbyName('TINID').AsString)
         + ' AND FAMID =' + QuotedStr(DMLOG.cdsDPedUsu.FieldbyName('FAMID').AsString)
         + ' AND SFAMID=' + QuotedStr(DMLOG.cdsDPedUsu.FieldbyName('SFAMID').AsString);
      DMLOG.cdsDPedUsu.FieldByName('SFAMDES').AsString := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', xsSql, 'SFAMDES');

      DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString := edtArticulo.Text;

      DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString := edtItem.Text;
      DMLOG.cdsDPedUsu.FieldByName('ARTID').AsString := cbdlgArticulo.Text;
      If length(trim(DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString)) = 0 Then
         DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString := '.';

      DMLOG.cdsDPedUsu.FieldByName('FLAGUM').AsString := dblcTipoUM.Text;
      DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString := dblcUnidadMedida.Text; //vunmid;
      DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString := edtCantidadPedida.Text;

      DMLOG.cdsDPedUsu.FieldByName('ALMID').AsString := DMLOG.cdsPedUsu.fieldbyName('ALMID').asString;
      DMLOG.cdsDPedUsu.FieldByName('TINID').AsString := DMLOG.cdsPedUsu.fieldbyName('TINID').asString;
      DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsString := DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString;
      DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsString := DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsString;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').AsFloat := 0;
      If DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').IsNull Then DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').AsFloat := 0;

// Inicio HPC_201702_LOG
   // 03/07/2017   Cambia forma de grabación de Detalle de Requerimientos
      DMLOG.cdsDPedUsu.Post;
      If xsAccionDetalle = 'ADICIONAR' Then
         xsSQL := 'Insert into DB2ADMIN.LOG307(CIAID, LOCID, CCOSID, URQID, DURQID, ALMID, TINID, GRARID, FAMID, SFAMID, SFAMDES, ARTID, '
            + '                                DURQCNSG, DURQCNSU, DURQCNAG, DURQCNAU, DURQFREG, DURQHREG, FLAGUM, UNMIDG, TIPOADQ, '
            + '                                DURQOBS, DURQOBSUSR, URQUSR, URQANO, URQMES, URQDIA, URQTRIM, URQSEM, URQANOMES, URQSS, URQAASEM, '
            + '                                URQAASS, URQAATRI, DURQCNSLG, DURQCNSLU) '
            + '    Values('
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('LOCID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('CCOSID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('ALMID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('TINID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('GRARID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('FAMID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('SFAMID').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('SFAMDES').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('ARTID').AsString) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').AsFloat) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').AsFloat) + ','
            +              ' trunc(Sysdate),'
            +              ' Sysdate,'
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('FLAGUM').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('DURQOBSUSR').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQANO').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQMES').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQDIA').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQTRIM').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQSEM').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQANOMES').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQSS').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAASEM').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAASS').AsString) + ','
            +              quotedstr(DMLOG.cdsDPedUsu.FieldbyName('URQAATRI').AsString) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat) + ','
            +              floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLU').AsFloat) + ')'
      Else
         xsSQL := 'Update DB2ADMIN.LOG307 '
            + '       Set DURQCNSG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat) + ','
            + '           DURQCNAG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat) + ','
            + '           URQUSR=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQUSR').AsString) + ','
            + '           DURQFREG=trunc(Sysdate),'
            + '           DURQHREG=Sysdate,'
            + '           DURQCNSLG=' + floattostr(DMLOG.cdsDPedUsu.FieldByName('DURQCNSLG').AsFloat)
            + '     Where CIAID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString)
            + '       and URQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQID').AsString)
            + '       and DURQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString);
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
   Except
      xSigueGrab := False;
      ShowMessage('No se pudo grabar el Detalle del Requerimiento, reintente');
      Exit;
   End;
// Fin HPC_201702_LOG
End;

Procedure TFPedUsu.cbdlgArticuloExit(Sender: TObject);
Var
   xsSql: String;
Begin
   If btnCancelar.Focused Then Exit;
   edtArticulo.clear;

   If Length(Trim(cbdlgArticulo.Text)) > 0 Then
   Begin
      xsSql := 'ARTID=' + QuotedStr(UpperCase(cbdlgArticulo.Text)) + ' AND CIAID=' + QuotedStr(dblcCompania.Text);
      edtArticulo.Text := DMLOG.displaydescrip('prvSQL', 'TGE205', 'ARTDES', xsSql, 'ARTDES');
   End;
End;

Procedure TFPedUsu.dblcUnidadMedidaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := 'UNMID=' + QuotedStr(dblcUnidadMedida.text);
   edtUMedReq.Text := DMLOG.displaydescrip('prvSQL', 'TGE130', 'UNMDES', xsSql, 'UNMDES');
End;

Procedure TFPedUsu.dbgArticulosCellChanged(Sender: TObject);
Begin
   dbgArticulosRowChanged(dbgArticulos);
End;

Procedure TFPedUsu.dbgRequerimientoUsuarioDetDblClick(Sender: TObject);
Begin
   If DMLOG.cdsDPedUsu.RecordCount = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' No Existen Registros a Editar ');
      Exit;
   End;
   If DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'C' Then
   Begin
      fg_RecuperaArticulo;
      pnlDetalleArticulo.Visible := True;
   End;
   If (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'A') Or
      (DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString = 'S') Then
   Begin
      fg_RecuperaServicioActivo;
      pnlDetalleServicio.Visible := True;
   End;

End;

Procedure TFPedUsu.fg_RecuperaArticulo;
Begin
   edtArticulo.Text := DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString;
   dblcUnidadMedidaExit(dblcUnidadMedida);

   //verifica si el detalle pueder ser editado o no
   If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL' Then
   Begin
      xsAccionDetalle := 'EDITAR';
      DMLOG.cdsDPedUsu.Edit;
      fg_HabilitaPanelArticulo(True);
   End
   Else
   Begin
      xsAccionDetalle := 'CONSULTAR';
      fg_HabilitaPanelArticulo(False);
   End;

End;

Procedure TFPedUsu.fg_RecuperaServicioActivo;
Begin
// Inicio HPC_201801_LOG
// Inicializa componente con valor del campo
   dblcUnidadMedidaServicio.text := DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString;
// Fin HPC_201801_LOG
   dblcUnidadMedidaServicioExit(dblcUnidadMedidaServicio);
   If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'INICIAL' Then
   Begin
      xsAccionDetalle := 'EDITAR';
      DMLOG.cdsDPedUsu.Edit;
      fg_HabilitaPanelServicioActivo(True);
   End
   Else
   Begin
      xsAccionDetalle := 'CONSULTAR';
      fg_HabilitaPanelServicioActivo(False);
   End;
End;

Procedure TFPedUsu.btnEditarCabeceraClick(Sender: TObject);
Begin
   fg_HabilitarCabecera(True);
   fg_HabilitarDetalle(False);
   fg_HabilitarPorTipoReq(dblcTipoRequerimiento.Text, True);

   //solo se habilita el campo tipo de requerimiento si no tiene detalle
   If DMLOG.cdsDPedUsu.RecordCount > 0 Then
   Begin
      dblcTipoRequerimiento.Enabled := False;
   End;
End;

Procedure TFPedUsu.btnGrabarRequerimientoClick(Sender: TObject);
Var
   xsSQL: String;
Begin
// Inicio HPC_201702_LOG
// 04/07/2017 cambia grabación de cabecera por orden SQL
   xsSQL := 'Update LOG306 '
      + '      Set URQUSR=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQUSR').AsString) + ','
      + '          URQFREG=trunc(Sysdate),'
      + '          URQHREG=Sysdate '
      + '    where CIAID=' + quotedstr(dblcCompania.Text)
      + '      and LOCID=' + quotedstr(dblcLocalidad.Text)
      + '      and CCOSID=' + quotedstr(cbdlgCCUsuario.Text)
      + '      and URQID=' + quotedstr(edtNumReqUsuario.Text);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
   Except
      ShowMessage('No se pudo grabar la Cabecera del Requerimiento, reintente');
      Exit;
   End;
   fg_HabilitarCabecera(False);
   fg_HabilitarDetalle(True);
   Showmessage('Datos Grabados correctamente');
{
   try
      DMLOG.ControlTran(9, DMLOG.cdsPedUsu, 'PEDUSU');
      DMLOG.ControlTran(9, DMLOG.cdsDPedUsu, 'DPEDUSU');
      fg_RecuperaRequerimiento(dblcCompania.Text, dblcLocalidad.Text, cbdlgCCUsuario.Text, edtNumReqUsuario.Text);
      fg_RecuperaRequerimientoDet(dblcCompania.Text, dblcLocalidad.Text, cbdlgCCUsuario.Text, edtNumReqUsuario.Text);

      fg_HabilitarCabecera(False);
      If DMLOG.cdsPedUsu.FieldByName('URQEST').AsString = 'ACEPTADO' Then
      Begin
         dblcGeneraOC.Enabled := False;
         btnGrabarRequerimiento.Enabled := False;
      End;
      Showmessage('Datos Grabados correctamente');

   Except
      Raise Exception.Create('Error al momento de Grabar el Requerimiento de Usuario');
   End;
}
// Fin HPC_201702_LOG
End;

Procedure TFPedUsu.btnImprimirClick(Sender: TObject);
Var
   xsSql: String;
Begin
   Screen.Cursor := crHourGlass;
   xsSql := ' Select A.CIAID, A.LOCID, A.CCOSID, H.CCOSDES, A.URQSOLIC, '
      +              quotedstr(edtCCSolicitante.Text) + ' URQSOLICDES, '
      + '           A.URQFREG, G.TIPADQDES, A.URQEST,'
      + '           A.URQID, A.URQESTUSR, A.TIPOADQ, A.URQOBS, A.URQUSR, A.URQACEPUSR, '
      + '           A.URQITECUSR, A.URQENVUSR, A.URQAUTOUSR, '
      + '           A.PRIOID, A.COMPDES, A.TINID, URQFECHA, '
      + '           B.DURQID, B.ALMID, B.GRARID, B.FAMID, B.SFAMID, B.SFAMDES, B.ARTID, '
      + '           B.DURQCNSG, B.DURQCNAG, B.UNMIDG, B.DURQOBSUSR, B.DURQOBS, '
      + '           C.CIADES, D.UNMABR, E.PRIODES, F.OBRADES, '
      + '           (Select CASE WHEN A.URQEST = ' + QuotedStr('ACEPTADO')
      + '                        THEN RRHH201.TRABNOMT ELSE ' + QuotedStr('') + ' END '
      + '              from TGE203, RRHH201 '
      + '             where A.CCOSID = TGE203.CCOSID '
      + '               and TGE203.TRABIDRESP = RRHH201.TRABID '
      + '               and RRHH201.CIAID = ' + QuotedStr('01') + ' ) JEFE '
      + '      from LOG306 A, LOG307 B, TGE101 C, TGE130 D, TGE155 E, TGE213 F, '
      + '           TGE173 G ,TGE203 H '
      + '     where A.CIAID=' + quotedstr(dblcCompania.text)
      + '       and A.LOCID=' + quotedstr(dblcLocalidad.text)
      + '       and A.CCOSID=' + quotedStr(cbdlgCCUsuario.text)
      + '       and A.URQID=' + quotedStr(edtNumReqUsuario.text)
      + '       and A.CIAID=B.CIAID '
      + '       and A.LOCID=B.LOCID '
      + '       and A.CCOSID=B.CCOSID '
      + '       and A.URQID=B.URQID '
      + '       and A.CIAID=C.CIAID '
      + '       and B.UNMIDG=D.UNMID(+) '
      + '       and A.PRIOID=E.PRIOID(+) '
      + '       and A.OBRAID=F.OBRAID(+) '
      + '       and A.TIPOADQ=G.TIPOADQ(+) '
      + '       and H.CCOSID(+)=A.CCOSID AND H.CCOSCIAS(+) LIKE ''%''||A.CIAID||''%'' '
      + '     order by DURQID ';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xsSql);
   DMLOG.cdsReporte.Open;

   Screen.Cursor := crDefault;
   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      Information('Adquisiciones', 'No Existe Información a Mostrar,' + #13 + ' Debe grabar el Requerimiento para poder Imprimir');
      Exit;
   End;
   ppdbReporte.DataSource := DMLOG.dsReporte;
   ppReporte1.DataPipeline := ppdbReporte;
   ppReporte1.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ReqUsuario.rtm';
   ppReporte1.Template.LoadFromFile;
   If cbDisenoRep.Checked Then
   Begin
      ppDesigner1.Report := ppReporte1;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      ppReporte1.Print;
      ppReporte1.Stop;
   End;
End;

Procedure TFPedUsu.Z2bbtnAceptarClick(Sender: TObject);
// Inicio HPC_201702_LOG
// 04/07/2017 Se agrega variable para actualizar Estado de Requerimiento por SQL
Var
   xsSQL: String;
// Fin HPC_201702_LOG
Begin
   If DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString <> 'INICIAL' Then
   Begin
      ShowMessage('El requerimiento no está en estado INICIAL' + #13 + 'No puede Transferir a SSGG');
      Exit;
   End;
   If DMLOG.cdsDPedUsu.RecordCount = 0 Then
   Begin
      ShowMessage('El requerimiento no tiene Detalle ' + #13 + 'No puede Transferir a SSGG');
      Exit;
   End;

   If MessageDlg('Transferir a SSGG,' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrNo Then
   Begin
      Exit;
   End;
   Try
      Screen.Cursor := crHourGlass;

   // Inicio HCP_201801_LOG
   // cambia a Estado dsBrowse si está en Edit o Insert
      If DMLOG.cdsPedUsu.State In ([dsInsert, dsEdit]) Then
         DMLOG.cdsPedUsu.Post;
   // Fin HCP_201801_LOG

      If DMLOG.cdsPedUsu.State In [dsBrowse] Then
      Begin
         DMLOG.cdsPedUsu.Edit;
         DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString := 'ACEPTADO';
         DMLOG.cdsPedUsu.FieldbyName('URQESTUSR').AsString := 'JEFE DE AREA';
         DMLOG.cdsPedUsu.FieldbyName('URQACEPUSR').AsString := DMLOG.wUsuario;
         DMLOG.cdsPedUsu.FieldByName('URQACEPFREG').AsDateTime := Date;
         DMLOG.cdsPedUsu.FieldByName('URQACEPHREG').AsDateTime := date + SysUtils.Time;
         DMLOG.cdsPedUsu.Post;
      // Inicio HPC_201702_LOG
      // 04/07/2017 Se cambia actualización de Estado de Requerimiento a orden SQL
         {
         DMLOG.cdsPedUsu.ApplyUpdates(0);
         DMLOG.cdsDPedUsu.ApplyUpdates(0);
         }
         xsSQL := 'Update LOG306 '
            + '       Set URQEST=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQEST').AsString) + ', '
            + '           URQESTUSR=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQESTUSR').AsString) + ', '
            + '           URQACEPUSR=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQACEPUSR').AsString) + ', '
            + '           URQACEPFREG=trunc(Sysdate), '
            + '           URQACEPHREG=Sysdate '
            + '     Where CIAID=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('CIAID').AsString)
            + '       and URQID=' + quotedstr(DMLOG.cdsPedUsu.FieldbyName('URQID').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
         Except
            ShowMessage('No se pudo grabar el Estado del Requerimiento a ACEPTADO, reintente');
            Exit;
         End;

         If DMLOG.wTipoAdicion = 'xFiltro' Then
         Begin
            DMLOG.ActualizaFiltro(Mtx3000, DMLOG.cdsPedUsu, 'M');
         End;
         {
         fg_RecuperaRequerimiento(DMLOG.cdsPedUsu.FieldByName('CIAID').AsString,
            DMLOG.cdsPedUsu.FieldByName('LOCID').AsString,
            DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString,
            DMLOG.cdsPedUsu.FieldByName('URQID').AsString);
         }
      // Fin HPC_201702_LOG
         fg_HabilitarCabecera(False);
         fg_HabilitarDetalle(False);
         DMLOG.wModo := 'C';
      End
      Else
      Begin
         ShowMessage('No se pudo Transferir a Servicios Generales el Requerimiento');
      End;
   Except
      ShowMessage('Error al momento de Actualizar el Requerimiento');
   End;
   Screen.Cursor := crDefault
End;

Procedure TFPedUsu.dblcUnidadMedidaServicioExit(Sender: TObject);
Var
   xsSql: String;
Begin
// Inicio HPC_201801_LOG
// Busca por Unidad de Medida del Servicio
//   xsSql := 'UNMID=' + QuotedStr(dblcUnidadMedida.text);
   xsSql := 'UNMID=' + QuotedStr(dblcUnidadMedidaServicio.text);
// Fin HPC_201801_LOG
   edtUnidadMedServicio.Text := DMLOG.displaydescrip('prvSQL', 'TGE130', 'UNMDES', xsSql, 'UNMDES');
End;

Procedure TFPedUsu.btnSalirClick(Sender: TObject);
Begin
// Inicio HPC_201702_LOG
// 04/07/2017 Deja de evaluar cambios en cds ya que la grabación es por SQL
{
   If (DMLOG.cdsPedUsu.Modified) Or (DMLOG.cdsPedUsu.changeCount > 0) Or
      (DMLOG.cdsDPedUsu.Modified) Or (DMLOG.cdsDPedUsu.changeCount > 0) Then
   Begin
      If MessageDlg(' Existe Registros sin Grabar ' + #13 +
         ' Desea Salir sin Grabar los cambios? ', mtconfirmation, [mbYes, MbNo], 0) = mrYes Then
      Begin
         Close;
      End
      Else
      Begin
         Exit;
      End;
   End;
}
// Fin HPC_201702_LOG
   Close;
End;

Procedure TFPedUsu.dbgRequerimientoUsuarioDetKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Var
   xsSQL: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If MessageDlg(' ¿ Eliminar Registro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
      // Inicio HPC_201702_LOG
         xsSQL := 'Delete from LOG307 '
            + '     where CIAID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString)
            + '       and URQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('URQID').AsString)
            + '       and DURQID=' + quotedstr(DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString);
         Try
            DMLOG.DCOM1.AppServer.EjecutaSQL(xsSQL);
//      DMLOG.cdsDPedUsu.ApplyUpdates(0);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Requerimiento, reintente');
            Exit;
         End;
         DMLOG.cdsDPedUsu.Delete;
         ShowMessage('Registro del detalle eliminado correctamente');
      // Fin HPC_201702_LOG
      End
   End;
End;

Procedure TFPedUsu.fg_HabilitarPorTipoReq(wgTipoRequerimiento: String; wgBoolean: Boolean);
Begin
   //habilitando en función al tipo de requerimiento
   If wgTipoRequerimiento = 'C' Then
   Begin
      pnlInventario.Enabled := True;
      dblcTipoInventario.Color := clWindow;
      edtTipoInventario.Color := clWindow;
      dblcAlmacen.Color := clWindow;
      edtAlmacen.Color := clWindow;
      pnlTipoServicio.Enabled := False;
      dblcTipoServicio.Enabled := False;
      dblcTipoServicio.Color := $00E2E2E2;
      edtTipoServicio.Color := $00E2E2E2;
   End
   Else
   Begin
      If wgTipoRequerimiento = 'S' Then
      Begin
         pnlInventario.Enabled := False;
         dblcTipoInventario.Enabled := False;
         dblcAlmacen.Enabled := False;
         dblcTipoInventario.Color := $00E2E2E2;
         edtTipoInventario.Color := $00E2E2E2;
         dblcAlmacen.Color := $00E2E2E2;
         edtAlmacen.Color := $00E2E2E2;
         pnlTipoServicio.Enabled := True;
         dblcTipoServicio.Color := clWindow;
         edtTipoServicio.Color := clWindow;
         dblcTipoServicio.Enabled := wgBoolean;
      End
      Else
      Begin
         pnlInventario.Enabled := False;
         dblcTipoInventario.Enabled := False;
         dblcAlmacen.Enabled := False;
         dblcTipoInventario.Color := $00E2E2E2;
         edtTipoInventario.Color := $00E2E2E2;
         dblcAlmacen.Color := $00E2E2E2;
         edtAlmacen.Color := $00E2E2E2;
         pnlTipoServicio.Enabled := False;
         dblcTipoServicio.Enabled := False;
         dblcTipoServicio.Color := $00E2E2E2;
         edtTipoServicio.Color := $00E2E2E2;
      End;
   End;
End;

Procedure TFPedUsu.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry11.Close;
End;

// Inicio HPC_201702_LOG
Procedure TFPedUsu.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;
// Fin HPC_201702_LOG

End.

