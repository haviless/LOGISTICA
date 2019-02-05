Unit LOG341;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG341
//Formulario               : FCuadroComparativo
//Fecha de Creación        : 09/07/2012
//Autor                    : Abelardo Sulca Palomino
//Objetivo                 : Genera el Cuadro Comparativo

//ACTUALIZACIONES
//HPC_201211_LOG 19/07/2012:  Se implementa el formato horizontal para
//                            cuadro comparativo
//HPC_201303_LOG 02/05/2013: Permitir en el CUADRO COMPARATIVO DE COTIZACIONES imprimir tambien a dos decimales.
//HPC_201306_LOG 31/11/2013: Se adiciona Numero de Cotizacion Ganadora, se adiciona campos en el Select de la impresión para mostrar la
//                           información requerida por S.G.
//HPC_201403_LOG 06/06/2014  Se modifica para que hacepte en el cuadrocomparativo cuatro proveedores, se imprime en hoja horizontal en vertical
//                           muestra tres proveedores, tambien se adiciona la fecha de creación del cuadro comparativo, tambien las observaciones
//                           de los proveedores como la observación general del cuadro comparativo.
//                           reordenamiento de la Sangría
// HPC_201801_LOG 15/01/2018 Divide SQL en partes para evaluación
//                           Corrige SQL, faltaba coma(,) en SQL que imprime Cuadro Comparativo


Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Mask, wwdbedit, Wwdbdlg, wwdbdatetimepicker, StdCtrls,
   wwdblook, DBCtrls, ComCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, db,
   Wwdbspin, ppBands, ppCache, ppClass, ppEndUsr, ppProd, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, ppStrtch, ppMemo, ppVar, ppCtrls, ppPrnabl,
   ppParameter, ppCTMain, daDataView, daQueryDataView, daDBBDE, ppModule,
   daDataModule, jpeg;

Type
   TFCuadroComparativo = Class(TForm)
      lblCIA: TLabel;
      dblcCompania: TwwDBLookupCombo;
      edtCompania: TEdit;
      lblFReg: TLabel;
      dtpFechaCComparativo: TwwDBDateTimePicker;
      dbgDetalleCotizacion: TwwDBGrid;
      GroupBox1: TGroupBox;
      Label5: TLabel;
      btnImprimeCComparativo: TBitBtn;
      btnAnular: TBitBtn;
      btnGrabar: TBitBtn;
      btnAceptar: TBitBtn;
      btnSalir: TBitBtn;
      dblcProfSugerida: TwwDBLookupCombo;
      Label1: TLabel;
      lblObserv: TLabel;
      memObservacion: TDBMemo;
      Label6: TLabel;
      edtNumCComparativo: TwwDBEdit;
      GroupBox2: TGroupBox;
      Label2: TLabel;
      dtpFechaSolCotizacion: TwwDBDateTimePicker;
      Label3: TLabel;
      lblTMon: TLabel;
      dblcTMoneda: TwwDBLookupCombo;
      edtTMoneda: TwwDBEdit;
      lblComprador: TLabel;
      dblcComprador: TwwDBLookupCombo;
      edtComprador: TwwDBEdit;
      dblcNumSolCotizacion: TwwDBLookupComboDlg;
      edtEstado: TwwDBEdit;
      ppdbCuadroComparativo: TppDBPipeline;
      pprCuadroComparativo: TppReport;
      ppParameterList1: TppParameterList;
      ppdCuadroComparativo: TppDesigner;
      Label4: TLabel;
      edtDependencia: TwwDBEdit;
      GroupBox3: TGroupBox;
      rbHorizontal: TRadioButton;
      rbVertical: TRadioButton;
      pprCuadroComparativoV: TppReport;
      ppParameterList2: TppParameterList;
      cbDiseno: TCheckBox;
      Label7: TLabel;
      chk2decimales: TCheckBox;
      dblcProfGanadora: TwwDBLookupCombo;
      Label8: TLabel;
      ppHeaderBand1: TppHeaderBand;
      ppVShapeAlternativa3: TppShape;
      ppVShapeAlternativa2: TppShape;
      ppVShapeAlternativa1: TppShape;
      ppLine1: TppLine;
      btnGanadora: TBitBtn;
      ppHeaderBand2: TppHeaderBand;
      ppLine27: TppLine;
      ppLine28: TppLine;
      ppLine29: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLine45: TppLine;
      ppLine46: TppLine;
      ppLine47: TppLine;
      ppLine48: TppLine;
      ppDBMemo4: TppDBMemo;
      ppDBMemo5: TppDBMemo;
      ppDBMemo6: TppDBMemo;
      ppLabel31: TppLabel;
      ppDBText11: TppDBText;
      ppLine50: TppLine;
      ppSystemVariable4: TppSystemVariable;
      ppLabel32: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel33: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppImage2: TppImage;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppDBText12: TppDBText;
      ppDBMemo7: TppDBMemo;
      ppLabel40: TppLabel;
      ppDBText13: TppDBText;
      ppLine31: TppLine;
      ppLabel30: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppVShapeDetAlternativa3: TppShape;
      ppVShapeDetAlternativa2: TppShape;
      ppVShapeDetAlternativa1: TppShape;
      ppDBText14: TppDBText;
      ppDBPUnitV1: TppDBText;
      ppDBText16: TppDBText;
      ppDBPUnitV2: TppDBText;
      ppDBText18: TppDBText;
      ppDBPUnitV3: TppDBText;
      ppDBText21: TppDBText;
      ppLine51: TppLine;
      ppLine52: TppLine;
      ppLine55: TppLine;
      ppLine57: TppLine;
      ppDBText22: TppDBText;
      ppLine53: TppLine;
      ppDBText58: TppDBText;
      ppLine30: TppLine;
      ppFooterBand2: TppFooterBand;
      ppLabel61: TppLabel;
      ppLabel64: TppLabel;
      ppLine73: TppLine;
      ppLabel54: TppLabel;
      ppLine72: TppLine;
      ppLabel51: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      ppVShapeSumAlternativa1: TppShape;
      ppVShapeSumAlternativa3: TppShape;
      ppVShapeSumAlternativa2: TppShape;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLine63: TppLine;
      ppLine64: TppLine;
      ppLine65: TppLine;
      ppLine66: TppLine;
      ppLine67: TppLine;
      ppLine68: TppLine;
      ppDBText33: TppDBText;
      ppDBText46: TppDBText;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText54: TppDBText;
      ppDBText55: TppDBText;
      ppDBText56: TppDBText;
      ppDBText57: TppDBText;
      ppDBText59: TppDBText;
      ppDBText60: TppDBText;
      ppDBText61: TppDBText;
      ppDBText62: TppDBText;
      ppDBText63: TppDBText;
      ppDBText64: TppDBText;
      ppDBText65: TppDBText;
      ppDBText20: TppDBText;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppDBText53: TppDBText;
      ppDBMemo12: TppDBMemo;
      ppDBMemo13: TppDBMemo;
      ppDBMemo14: TppDBMemo;
      ppLine44: TppLine;
      ppLabel1: TppLabel;
      lblFechacc2: TppLabel;
      dos_ppShape6: TppShape;
      tres_ppShape7: TppShape;
      ppShape2: TppShape;
      ppShape1: TppShape;
      uno_ppshapeAlternativa1: TppShape;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel21: TppLabel;
      ppDBText10: TppDBText;
      ppLine26: TppLine;
      ppSystemVariable1: TppSystemVariable;
      ppLabel57: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel58: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel60: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppLabel3: TppLabel;
      ppLabel12: TppLabel;
      ppDBText1: TppDBText;
      ppDBMemo8: TppDBMemo;
      ppLabel13: TppLabel;
      ppDBText2: TppDBText;
      ppImage1: TppImage;
      cuatro_ppShape8: TppShape;
      ppLabel37: TppLabel;
      ppLabel59: TppLabel;
      ppShape12: TppShape;
      uno_ppShape13: TppShape;
      dos_ppShape14: TppShape;
      Tres_ppShape15: TppShape;
      cuatro_ppShape16: TppShape;
      ppDBMemo1: TppDBMemo;
      ppDBMemo2: TppDBMemo;
      ppDBMemo3: TppDBMemo;
      ppDBMemo16: TppDBMemo;
      lblFechaCC: TppLabel;
      ppDetailBand1: TppDetailBand;
      cuatro_ppShape11: TppShape;
      tres_ppShape10: TppShape;
      dos_ppShape9: TppShape;
      ppShape5: TppShape;
      ppShape4: TppShape;
      uno_ppShape3: TppShape;
      ppDBText3: TppDBText;
      ppDBPUnit1: TppDBText;
      ppDBText5: TppDBText;
      ppDBPUnit2: TppDBText;
      ppDBText7: TppDBText;
      ppDBPUnit3: TppDBText;
      ppDBText9: TppDBText;
      ppDBText23: TppDBText;
      ppDBMemo15: TppDBMemo;
      ppDBText4: TppDBText;
      ppDBPUnit6: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine25: TppLine;
      ppLabel55: TppLabel;
      ppLine24: TppLine;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLine23: TppLine;
      ppLabel18: TppLabel;
      ppSummaryBand1: TppSummaryBand;
      ppShape8: TppShape;
      ppShape7: TppShape;
      ppShape6: TppShape;
      ppShape3: TppShape;
      cuatro_ppShape19: TppShape;
      tres_ppShape18: TppShape;
      dos_ppShape17: TppShape;
      uno_ppShapeSumAlternativa1: TppShape;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLine35: TppLine;
      ppLine36: TppLine;
      ppLine37: TppLine;
      ppLine38: TppLine;
      ppLine39: TppLine;
      ppLine40: TppLine;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText66: TppDBText;
      ppDBMemo9: TppDBMemo;
      ppDBMemo10: TppDBMemo;
      ppDBMemo11: TppDBMemo;
      ppLabel56: TppLabel;
      ppDBMemo17: TppDBMemo;
      ppDBText8: TppDBText;
      ppDBText15: TppDBText;
      ppDBText17: TppDBText;
      ppDBText19: TppDBText;
      ppDBText24: TppDBText;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      Procedure FormShow(Sender: TObject);
      Procedure dblcCompaniaExit(Sender: TObject);
      Procedure dblcNumSolCotizacionExit(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure dbgDetalleCotizacionDblClick(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure btnAceptarClick(Sender: TObject);
      Procedure btnImprimeCComparativoClick(Sender: TObject);
      Procedure dblcProfSugeridaExit(Sender: TObject);
      Procedure ppHeaderBand1BeforePrint(Sender: TObject);
      Procedure btnAnularClick(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure ppDBPUnit1Print(Sender: TObject);
      Procedure ppDBPUnit2Print(Sender: TObject);
      Procedure ppDBPUnit3Print(Sender: TObject);
      Procedure ppDBPUnitV1Print(Sender: TObject);
      Procedure ppDBPUnitV2Print(Sender: TObject);
      Procedure ppDBPUnitV3Print(Sender: TObject);
      Procedure btnGanadoraClick(Sender: TObject);
      Procedure lblFechaCCPrint(Sender: TObject);
      Procedure lblFechacc2Print(Sender: TObject);
      Procedure ppDBPUnit6Print(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
      Procedure fg_AsignaDatasource;
      Procedure fg_AsignaLookup;
      Procedure fg_RecuperaCComparativo(wgCompania, wgNumSolCotizacion, wgNumCComparativo: String);
      Procedure fg_RecuperaSolCotizacion(wgCompania,
         wgNumSolCotizacion: String);
      Function fg_NumCComparativo(wgFecha: TDate): String;
      Procedure fg_RecuperaProforma(wgCompania, wgNumSolCotizacion: String);
      Procedure fg_GrabarCcomparativo;
      Function fg_ValidaCabecera(Var wgMensaje: String): Boolean;
      Function fg_ValidaDetalleCComparativo(Var wgMensaje: String): Boolean;
      Procedure fg_CompletarDatos;
      Procedure fg_HabilitaCComparativo(wgBoolean: Boolean);
      Function fg_ValidaProfSugerida(wgCompania, wgProformaId: String; Var wgMensaje: String): Boolean;
      Procedure fg_ActualizarSolCotizacion(wgCompania, wgNumSolCotizacion,
         wgNumCComparativo: String);
      Procedure fg_GrabarCComparativoSQL;
   Public
    { Public declarations }
      xsCompania: String;
      xsNumSolCotizacion: String;
      xsNumCComparativo: String;
      xnProfSugerida: Integer;
   End;

Var
   FCuadroComparativo: TFCuadroComparativo;

Implementation

Uses LOGDM1; //,oaAD3000;
{$R *.dfm}

Procedure TFCuadroComparativo.fg_AsignaDatasource;
Begin
// solicitud de cotizacion
   dblcNumSolCotizacion.DataSource := DMLOG.dsSolCot;
   dblcNumSolCotizacion.DataField := 'SCCID';
   dtpFechaSolCotizacion.DataSource := DMLOG.dsSolCot;
   dtpFechaSolCotizacion.DataField := 'SCCFSOL';
   dblcTMoneda.DataSource := DMLOG.dsSolCot;
   dblcTMoneda.DataField := 'TMONID';
   dblcComprador.DataSource := DMLOG.dsSolCot;
   dblcComprador.DataField := 'COMPID';

// cuadro comparativo
   dblcCompania.DataSource := DMLOG.dsCuadroComparativo;
   dblcCompania.DataField := 'CIAID';
   dtpFechaCComparativo.DataSource := DMLOG.dsCuadroComparativo;
   dtpFechaCComparativo.DataField := 'FECHA';
   edtNumCComparativo.DataSource := DMLOG.dsCuadroComparativo;
   edtNumCComparativo.DataField := 'NUMCC';
   edtDependencia.DataSource := DMLOG.dsCuadroComparativo;
   edtDependencia.DataField := 'DEPENDENCIA';
   memObservacion.DataSource := DMLOG.dsCuadroComparativo;
   memObservacion.DataField := 'OBSERVACION';
   edtEstado.DataSource := DMLOG.dsCuadroComparativo;
   edtEstado.DataField := 'ESTCC';
   dblcProfSugerida.DataSource := DMLOG.dsCuadroComparativo;
   dblcProfSugerida.DataField := 'PROFIDSUG';

   dblcProfGanadora.DataSource := DMLOG.dsCuadroComparativo;
   dblcProfGanadora.DataField := 'PROFIDGAN';

   dbgDetalleCotizacion.DataSource := DMLOG.dsProformaLista;
End;

Procedure TFCuadroComparativo.fg_AsignaLookup;
Var
   xsSql: String;
Begin
   dblcCompania.Selected.Clear;
   dblcCompania.Selected.Add('CIAID'#9'8'#9'ID'#9'F');
   dblcCompania.Selected.Add('CIADES'#9'30'#9'Compañía'#9'F');

   dblcNumSolCotizacion.Selected.Clear;
   dblcNumSolCotizacion.Selected.Add('SCCID'#9'8'#9'SolCotización'#9'F');
   dblcNumSolCotizacion.Selected.Add('SCCFSOL'#9'8'#9'Fecha'#9'F');
   dblcNumSolCotizacion.Selected.Add('SCCOBS'#9'50'#9'Observción'#9'F');

   DMLOG.FiltraTabla(DMLOG.cdsTMoneda, 'TGE103', 'TMONID', 'TMONID');
   DMLOG.FiltraTabla(DMLOG.cdsCia, 'TGE101', 'CIAID', 'CIAID');
   DMLOG.FiltraTabla(DMLOG.cdsComprador, 'TGE135', 'COMPCID', 'COMPCID');

   xsSql := ' CIAID = ' + QuotedStr(xsCompania) + ' AND NUMCC IS NULL  ';
   DMLOG.FiltraTabla(DMLOG.cdsQry12, 'LOG302', 'CIAID', 'SCCFSOL', xsSql);

   dblcNumSolCotizacion.LookupTable := DMLOG.cdsQry12;
   dblcNumSolCotizacion.LookupField := 'SCCID';

   dblcCompania.LookupTable := DMLOG.cdsCIA;
   dblcCompania.LookupField := 'CIAID';
   dblcTMoneda.LookupTable := DMLOG.cdsTMoneda;
   dblcTMoneda.LookupField := 'TMONID';
   dblcComprador.LookupTable := DMLOG.cdsComprador;
   dblcComprador.LookupField := 'COMPCID';

   dblcProfSugerida.Selected.Clear;
   dblcProfSugerida.Selected.Add('PROFID'#9'8'#9'Proforma'#9'F');
   dblcProfSugerida.Selected.Add('PROVDES'#9'30'#9'Proveedor'#9'F');
   dblcProfSugerida.LookupTable := DMLOG.cdsQry11;
   dblcProfSugerida.LookupField := 'PROFID';

   dblcProfGanadora.Selected.Clear;
   dblcProfGanadora.Selected.Add('PROFID'#9'8'#9'Proforma'#9'F');
   dblcProfGanadora.Selected.Add('PROVDES'#9'30'#9'Proveedor'#9'F');
   dblcProfGanadora.LookupTable := DMLOG.cdsQry10;
   dblcProfGanadora.LookupField := 'PROFID';

   dbgDetalleCotizacion.Selected.Clear;
   dbgDetalleCotizacion.Selected.Add('PROFID'#9'8'#9'ProfID'#9'F');
   dbgDetalleCotizacion.Selected.Add('PROFFEMI'#9'9'#9'Fecha'#9'F');
   dbgDetalleCotizacion.Selected.Add('CLAUXID'#9'5'#9'Tipo~Aux'#9'F');
   dbgDetalleCotizacion.Selected.Add('PROV'#9'5'#9'Cód~Prov'#9'F');
   dbgDetalleCotizacion.Selected.Add('PROVDES'#9'35'#9'Razon~Social'#9'F');
   dbgDetalleCotizacion.Selected.Add('PROFTOTALG'#9'10'#9'Total'#9'F');
   dbgDetalleCotizacion.Selected.Add('FLAGCCOM'#9'6'#9'Cuadro~Comp'#9'F');
   dbgDetalleCotizacion.SetControlType('FLAGCCOM', fctCheckBox, 'S;N');
   dbgDetalleCotizacion.Refresh;
   dbgDetalleCotizacion.RefreshDisplay;
   dbgDetalleCotizacion.Repaint;

End;

Procedure TFCuadroComparativo.fg_RecuperaCComparativo(wgCompania, wgNumSolCotizacion, wgNumCComparativo: String);
Var
   xsSql: String;
Begin
   xsSql := 'Select * '
      + '      from LOG341 '
      + '     where CIAID = ' + QuotedStr(wgCompania)
      + '       and SCCID = ' + QuotedStr(wgNumSolCotizacion)
      + '       and NUMCC = ' + QuotedStr(wgNumCComparativo);
   DMLOG.cdsCuadroComparativo.Close;
   DMLOG.cdsCuadroComparativo.DataRequest(xsSql);
   DMLOG.cdsCuadroComparativo.Open;

   If (DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'INICIAL') Or
      (DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = '') Then
   Begin
      DMLOG.cdsCuadroComparativo.Edit;
   End;

   If DMLOG.cdsCuadroComparativo.RecordCount > 0 Then
   Begin
      xsSql := ' CIAID=' + Quotedstr(dblcCompania.Text);
      edtCompania.Text := DMLOG.DisplayDescrip('prvLOG', 'TGE101', '*', xsSql, 'CIADES');
   End;
End;

Procedure TFCuadroComparativo.FormShow(Sender: TObject);
Var
   xsSql: String;
Begin
   If xsCompania = '' Then
   Begin
      xsCompania := '02';
   End;
   fg_AsignaDatasource;
   fg_AsignaLookup;
   If DMLOG.wModo = 'A' Then
   Begin
      fg_RecuperaCComparativo('', '', '');
      fg_RecuperaSolCotizacion(xsCompania, xsNumSolCotizacion);
      fg_RecuperaProforma(xsCompania, xsNumSolCotizacion);
      fg_AsignaLookup;
      If DMLOG.cdsCuadroComparativo.State <> DSEdit Then
      Begin
         DMLOG.cdsCuadroComparativo.Edit;
      End;
      DMLOG.cdsCuadroComparativo.FieldByName('FECHA').AsDateTime := Date;
      //si viene de la ventana de solicitud de cotizaciones
      If xsNumSolCotizacion <> '' Then
      Begin
         dblcNumSolCotizacion.Enabled := False;
         DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString := xsCompania;
         xsSql := ' CIAID=' + Quotedstr(xsCompania);
         edtCompania.Text := DMLOG.DisplayDescrip('prvLOG', 'TGE101', '*', xsSql, 'CIADES');
         dblcCompania.Text := xsCompania;
         dblcCompania.Enabled := False;
         dtpFechaCComparativo.Enabled := False;
      End;
   End
   Else
      If DMLOG.wModo = 'M' Then
      Begin
         fg_RecuperaCComparativo(xsCompania, xsNumSolCotizacion, xsNumCComparativo);
         fg_RecuperaSolCotizacion(xsCompania, xsNumSolCotizacion);
         fg_RecuperaProforma(xsCompania, xsNumSolCotizacion);
         fg_HabilitaCComparativo(True);
         If DMLOG.cdsCuadroComparativo.State <> DSEdit Then
         Begin
            DMLOG.cdsCuadroComparativo.Edit;
         End;
         If DMLOG.cdsProformaLista.State <> DsEdit Then
         Begin
            DMLOG.cdsProformaLista.Edit;
         End;
      End
      Else
         If DMLOG.wModo = 'C' Then
         Begin
            fg_RecuperaCComparativo(xsCompania, xsNumSolCotizacion, xsNumCComparativo);
            fg_RecuperaSolCotizacion(xsCompania, xsNumSolCotizacion);
            fg_RecuperaProforma(xsCompania, xsNumSolCotizacion);
            fg_HabilitaCComparativo(False);
            btnGanadora.Visible := True;
         End;

End;

Procedure TFCuadroComparativo.fg_RecuperaSolCotizacion(wgCompania,
   wgNumSolCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := ' Select * '
      + '       from LOG302 '
      + '      where CIAID = ' + QuotedStr(wgCompania)
      + '        and SCCID = ' + QuotedStr(wgNumSolCotizacion);
   DMLOG.cdsSolCot.Close;
   DMLOG.cdsSolCot.DataRequest(xsSql);
   DMLOG.cdsSolCot.Open;
   If DMLOG.cdsSolCot.RecordCount > 0 Then
   Begin
      xsSql := ' TMONID = ' + QuotedStr(dblcTMoneda.Text);
      edtTMoneda.Text := DMLOG.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xsSql, 'TMONDES');

      xsSql := ' COMPCID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('COMPID').AsString);
      edtComprador.Text := DMLOG.DisplayDescrip('prvSQL', 'TGE135', 'COMPDES', xsSql, 'COMPDES');
   End;
End;

Procedure TFCuadroComparativo.dblcCompaniaExit(Sender: TObject);
Var
   xsSql: String;
Begin
   xsSql := ' CIAID=' + Quotedstr(dblcCompania.Text);
   edtCompania.Text := DMLOG.DisplayDescrip('prvLOG', 'TGE101', '*', xsSql, 'CIADES');
   fg_RecuperaProforma(dblcCompania.Text, dblcNumSolCotizacion.Text);
End;

Procedure TFCuadroComparativo.dblcNumSolCotizacionExit(Sender: TObject);
Begin
   fg_RecuperaSolCotizacion(xsCompania, dblcNumSolCotizacion.Text);
End;

Procedure TFCuadroComparativo.btnSalirClick(Sender: TObject);
Begin
   Close;
End;

Function TFCuadroComparativo.fg_NumCComparativo(wgFecha: TDate): String;
Var
   xsSql: String;
   xsNumCComparativo: String;
   xsFecha: String;
Begin
   xsFecha := DateToStr(wgFecha);
   xsSql := ' CIAID = ' + QuotedStr(dblcCompania.Text);

   xsNumCComparativo := DMLOG.MaxSQL('LOG341', 'NUMCC', xsSql);

   If copy(xsNumCComparativo, 1, 4) = Copy(xsFecha, 7, 4) Then
      Result := xsNumCComparativo
   Else
      Result := Copy(xsFecha, 7, 4) + '0001';
End;

Procedure TFCuadroComparativo.fg_RecuperaProforma(wgCompania,
   wgNumSolCotizacion: String);
Var
   xsSql: String;
Begin
   xsSql := 'Select * '
      + '      from LOG312 '
      + '     where CIAID = ' + QuotedStr(wgCompania)
      + '       and SCCID = ' + QuotedStr(wgNumSolCotizacion);
   DMLOG.cdsProformaLista.Close;
   DMLOG.cdsProformaLista.DataRequest(xsSql);
   DMLOG.cdsProformaLista.Open;

   If (DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'INICIAL') Or
      (DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = '') Then
   Begin
      DMLOG.cdsProformaLista.Edit;
   End;
   xsSql := 'Select * '
      + '      from LOG312 '
      + '     where CIAID = ' + QuotedStr(wgCompania)
      + '       and SCCID = ' + QuotedStr(wgNumSolCotizacion);
   DMLOG.cdsQry11.Close;
   DMLOG.cdsQry11.DataRequest(xsSql);
   DMLOG.cdsQry11.Open;

   DMLOG.cdsQry10.Close;
   DMLOG.cdsQry10.DataRequest(xsSql);
   DMLOG.cdsQry10.Open;

End;

Procedure TFCuadroComparativo.dbgDetalleCotizacionDblClick(
   Sender: TObject);
Begin
   If (dbgDetalleCotizacion.Columns[dbgDetalleCotizacion.GetActiveCol - 1].FieldName = 'FLAGCCOM')
      And ((DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'INICIAL') Or
      (DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = '')) Then
   Begin
      If DMLOG.cdsProformaLista.State <> DSEdit Then
      Begin
         DMLOG.cdsProformaLista.Edit;
      End;

      If DMLOG.cdsProformaLista.FieldByName('FLAGCCOM').AsString = 'S' Then
      Begin
         DMLOG.cdsProformaLista.FieldByName('FLAGCCOM').AsString := 'N';
      End
      Else
      Begin
         DMLOG.cdsProformaLista.FieldByName('FLAGCCOM').AsString := 'S';
      End;
   End;
End;

Procedure TFCuadroComparativo.btnGrabarClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   fg_CompletarDatos;
   If fg_ValidaCabecera(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;
   If fg_ValidaDetalleCComparativo(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;
   fg_GrabarCcomparativo;
   fg_RecuperaCComparativo(dblcCompania.Text, dblcNumSolCotizacion.Text, edtNumCComparativo.Text);
End;

Procedure TFCuadroComparativo.fg_GrabarCcomparativo;
Begin

   Try
      fg_GrabarCComparativoSQL;

      DMLOG.cdsProformaLista.ApplyUpdates(0);
      fg_ActualizarSolCotizacion(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString,
         DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString,
         DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString);
   Except
      ShowMessage('Error al Grabar el Cuadro Comparativo');
      Exit;
   End;
End;

Function TFCuadroComparativo.fg_ValidaCabecera(
   Var wgMensaje: String): Boolean;
Begin
   If dblcNumSolCotizacion.Text = '' Then
   Begin
      wgMensaje := 'Debe Seleccionar una Solicitud de Cotización';
      Result := False;
      Exit;
   End;
   If dblcCompania.Text = '' Then
   Begin
      wgMensaje := 'Debe Seleccionar la Compañía';
      Result := False;
      Exit;
   End;
   If edtDependencia.Text = '' Then
   Begin
      wgMensaje := 'Debe registrar la Dependencia';
      Result := False;
      Exit;
   End;

   If memObservacion.Text = '' Then
   Begin
      wgMensaje := 'Debe Ingresar el Sustento';
      Result := False;
      Exit;
   End;
   Result := True;

End;

Function TFCuadroComparativo.fg_ValidaDetalleCComparativo(
   Var wgMensaje: String): Boolean;
Var
   xnProformasEnCComparativo: Integer;
   xnI: Integer;
Begin
   xnProformasEnCComparativo := 0;
   If DMLOG.cdsProformaLista.RecordCount = 0 Then
   Begin
      wgMensaje := 'No existe Proformas para la actual ' + #13
         + 'Solicitud de Cotización';
      Result := False;
      Exit;
   End;
   DMLOG.cdsProformaLista.First;
   For xnI := 1 To DMLOG.cdsProformaLista.RecordCount Do
   Begin
      If DMLOG.cdsProformaLista.FieldByName('FLAGCCOM').AsString = 'S' Then
      Begin
         xnProformasEnCComparativo := xnProformasEnCComparativo + 1;
      End;
      DMLOG.cdsProformaLista.Next;
   End;
   If xnProformasEnCComparativo = 0 Then
   Begin
      wgMensaje := 'Debe seleccionar por lo menos una Proforma para el Cuadro Comparativo';
      Result := False;
      Exit;
   End;
   If xnProformasEnCComparativo > 4 Then
   Begin
      wgMensaje := 'El Cuadro Comparativo sólo se puede generar con'
         + 'cuatro Proformas como máximo';
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFCuadroComparativo.fg_CompletarDatos;
Var
   Y, M, D: Word;
Begin
   If edtNumCComparativo.Text = '' Then
   Begin
      DecodeDate(DMLOG.cdsCuadroComparativo.FieldByName('FECHA').Value, Y, M, D);
      DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString := 'INICIAL';
      DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString := fg_NumCComparativo(dtpFechaCComparativo.Date);
      DMLOG.cdsCuadroComparativo.FieldByName('USUREG').AsString := DMLOG.wUsuario;
      DMLOG.cdsCuadroComparativo.FieldByName('FECREG').AsDateTime := Date;
      DMLOG.cdsCuadroComparativo.FieldByName('ANOMM').AsString := IntToStr(Y) + DMLOG.strzero(IntToStr(M), 2);
   End
   Else
   Begin
      DMLOG.cdsCuadroComparativo.FieldByName('USUMOD').AsString := DMLOG.wUsuario;
      DMLOG.cdsCuadroComparativo.FieldByName('FECMOD').AsDateTime := Date;
   End;
   DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString := dblcNumSolCotizacion.Text;
End;

Procedure TFCuadroComparativo.btnAceptarClick(Sender: TObject);
Var
   xsMensaje: String;
Begin
   fg_CompletarDatos;
   If fg_ValidaCabecera(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;
   If fg_ValidaDetalleCComparativo(xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;
   If (dblcProfSugerida.Text <> '') And
      (fg_ValidaProfSugerida(dblcCompania.Text, dblcProfSugerida.Text, xsMensaje) = False) Then
   Begin
      ShowMessage(xsMensaje);
      Exit;
   End;
   If MessageDlg('Se pasará a estado ACEPTADO el Cuadro Comparativo,' + #13 + ' ¿Desea Continuar?', mtconfirmation, [mbYes, MbNo], 0) = mrNo Then
   Begin
      Exit;
   End;
   DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString := 'ACEPTADO';
   DMLOG.cdsCuadroComparativo.FieldByName('USUACPCC').AsString := DMLOG.wUsuario;
   DMLOG.cdsCuadroComparativo.FieldByName('FECACPCC').AsDateTime := Date;
   fg_GrabarCcomparativo;
   fg_RecuperaCComparativo(dblcCompania.Text, dblcNumSolCotizacion.Text, edtNumCComparativo.Text);
   fg_HabilitaCComparativo(False);
End;

Procedure TFCuadroComparativo.fg_HabilitaCComparativo(wgBoolean: Boolean);
Begin

   edtDependencia.Enabled := wgBoolean;
   memObservacion.Enabled := wgBoolean;
   dblcProfSugerida.Enabled := wgBoolean;
   btnGrabar.Enabled := wgBoolean;
   btnAceptar.Enabled := wgBoolean;
   If DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'INICIAL' Then
   Begin
      dblcNumSolCotizacion.Enabled := False;
      dblcCompania.Enabled := False;
      dtpFechaCComparativo.Enabled := False;
   End
   Else
   Begin
      dblcNumSolCotizacion.Enabled := wgBoolean;
      dblcCompania.Enabled := wgBoolean;
      dtpFechaCComparativo.Enabled := wgBoolean;
   End;
   If DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString = 'ANULADO' Then
   Begin
      btnAnular.Enabled := wgBoolean;
   End;
End;

Procedure TFCuadroComparativo.btnImprimeCComparativoClick(
   Sender: TObject);
Var
   xsSql: WideString;
   xsProforma1, xsProforma2, xsProforma3: String;
   xsProforma4: String;
   xsProfSugerida: String;
// Inicio HPC_201801_LOG
// 15/01/2018 Divide SQL en partes para evaluación
   xSQL1, xSQL2, xSQL3, xSQL4, xSQL5 : String;
// Fin HPC_201801_LOG
Begin
   Screen.Cursor := crHourGlass;

   xsSql := ' Select MAX(CASE WHEN ROWNUM = 1 THEN LOG312.PROFID ELSE NULL END) UNO_PROFORMA, '
      + '            MAX(CASE WHEN ROWNUM = 2 THEN LOG312.PROFID ELSE NULL   END) DOS_PROFORMA, '
      + '            MAX(CASE WHEN ROWNUM = 3 THEN LOG312.PROFID ELSE NULL   END) TRES_PROFORMA, '
      + '            MAX(CASE WHEN ROWNUM = 4 THEN LOG312.PROFID ELSE NULL   END) CUATRO_PROFORMA, '
      + '            LOG341.PROFIDSUG '
      + '       from LOG312, LOG341 '
      + '      where LOG312.CIAID = LOG341.CIAID '
      + '        and LOG312.SCCID = LOG341.SCCID '
      + '        and LOG341.CIAID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString)
      + '        and LOG341.SCCID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString)
      + '        and LOG341.NUMCC = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString)
      + '        and LOG312.FLAGCCOM = ' + Quotedstr('S')
      + '      group by LOG341.PROFIDSUG ';
   DMLOG.cdsReporte.Close;
   DMLOG.cdsReporte.DataRequest(xsSql);
   DMLOG.cdsReporte.Open;
   If DMLOG.cdsReporte.RecordCount = 0 Then
   Begin
      Showmessage('El Cuadro Comparativo no contiene proformas a visualizar');
      Exit;
   End;
   xsProforma1 := DMLOG.cdsReporte.FieldByName('UNO_PROFORMA').AsString;
   xsProforma2 := DMLOG.cdsReporte.FieldByName('DOS_PROFORMA').AsString;
   xsProforma3 := DMLOG.cdsReporte.FieldByName('TRES_PROFORMA').AsString;

   xsProforma4 := DMLOG.cdsReporte.FieldByName('CUATRO_PROFORMA').AsString;
   xsProfSugerida := DMLOG.cdsReporte.FieldByName('PROFIDSUG').AsString;
   If (xsProforma1 = xsProfSugerida) And (xsProfSugerida <> '') Then xnProfSugerida := 1;
   If (xsProforma2 = xsProfSugerida) And (xsProfSugerida <> '') Then xnProfSugerida := 2;
   If (xsProforma3 = xsProfSugerida) And (xsProfSugerida <> '') Then xnProfSugerida := 3;
   If (xsProforma4 = xsProfSugerida) And (xsProfSugerida <> '') Then xnProfSugerida := 4;
// Inicio HPC_201801_LOG
// 15/01/2018 Divide SQL en partes para evaluación
   xSQL1 := ' SELECT PROFORMA.CIAID, '
      + '            PROFORMA.SCCID,  '
      + '            PROFORMA.ARTID,  '
      + '            PROFORMA.DPROFOBS, '
      + '            LOG341.NUMCC, '
      + '            LOG341.OBSERVACION, '
      + '            LOG341.USUREG, '
      + '            LOG341.FECREG, '
      + '            LOG341.FECHA, '
      + '            LOG341.DEPENDENCIA, '
      + '            MAX(UNO_UNMIDG)     UNO_UNMIDG,  '
      + '            MAX(UNO_DPROFCNTG)  UNO_DPROFCNTG,  '
      + '            MAX(UNO_DPROFPUNG)  UNO_DPROFPUNG,  '
      + '            MAX(UNO_DPROFIMP)   UNO_DPROFIMP,  '
      + '            MAX(UNO_PROVEEDOR)  UNO_PROVEEDOR, '
      + '            MAX(UNO_TENTREGA)   UNO_TENTREGA,  '
      + '            MAX(UNO_FPAGO)      UNO_FPAGO,   '
      + '            MAX(UNO_SUBTOTAL)   UNO_SUBTOTAL,  '
      + '            MAX(UNO_IMPUESTO)   UNO_IMPUESTO, '
      + '            MAX(UNO_TOTAL)      UNO_TOTAL, '
      + '            MAX(UNO_PROFOBS)    UNO_PROFOBS,'
      + '            MAX(UNO_MONEDA)     UNO_MONEDA, '
      + '            MAX(UNO_GARANTIA)   UNO_GARANTIA, '
      + '            MAX(DOS_UNMIDG)     DOS_UNMIDG, '
      + '            MAX(DOS_DPROFCNTG)  DOS_DPROFCNTG, '
      + '            MAX(DOS_DPROFPUNG)  DOS_DPROFPUNG, '
      + '            MAX(DOS_DPROFIMP)   DOS_DPROFIMP,  '
      + '            MAX(DOS_PROVEEDOR)  DOS_PROVEEDOR, '
      + '            MAX(DOS_TENTREGA)   DOS_TENTREGA,  '
      + '            MAX(DOS_FPAGO)      DOS_FPAGO,  '
      + '            MAX(DOS_SUBTOTAL)   DOS_SUBTOTAL, '
      + '            MAX(DOS_IMPUESTO)   DOS_IMPUESTO,  '
      + '            MAX(DOS_TOTAL)      DOS_TOTAL,  '
      + '            MAX(DOS_MONEDA)     DOS_MONEDA, '
      + '            MAX(DOS_PROFOBS)    DOS_PROFOBS,'
      + '            MAX(DOS_GARANTIA)   DOS_GARANTIA, '
      + '            MAX(TRES_UNMIDG)    TRES_UNMIDG, '
      + '            MAX(TRES_DPROFCNTG) TRES_DPROFCNTG,  '
      + '            MAX(TRES_DPROFPUNG) TRES_DPROFPUNG,  '
      + '            MAX(TRES_DPROFIMP)  TRES_DPROFIMP,  '
      + '            MAX(TRES_PROVEEDOR) TRES_PROVEEDOR, '
      + '            MAX(TRES_TENTREGA)  TRES_TENTREGA,  '
      + '            MAX(TRES_FPAGO)     TRES_FPAGO, '
      + '            MAX(TRES_SUBTOTAL)  TRES_SUBTOTAL, '
      + '            MAX(TRES_IMPUESTO)  TRES_IMPUESTO, '
      + '            MAX(TRES_TOTAL)     TRES_TOTAL,  '
      + '            MAX(TRES_PROFOBS)   TRES_PROFOBS,'
      + '            MAX(TRES_MONEDA)    TRES_MONEDA, '
      + '            MAX(TRES_GARANTIA)  TRES_GARANTIA, '
      + '            MAX(CUATRO_UNMIDG)    CUATRO_UNMIDG, '
      + '            MAX(CUATRO_DPROFCNTG) CUATRO_DPROFCNTG, '
      + '            MAX(CUATRO_DPROFPUNG) CUATRO_DPROFPUNG, '
      + '            MAX(CUATRO_DPROFIMP)  CUATRO_DPROFIMP,  '
      + '            MAX(CUATRO_PROVEEDOR) CUATRO_PROVEEDOR, '
      + '            MAX(CUATRO_TENTREGA)  CUATRO_TENTREGA,  '
      + '            MAX(CUATRO_FPAGO)     CUATRO_FPAGO, '
      + '            MAX(CUATRO_SUBTOTAL)  CUATRO_SUBTOTAL, '
      + '            MAX(CUATRO_IMPUESTO)  CUATRO_IMPUESTO, '
      + '            MAX(CUATRO_TOTAL)     CUATRO_TOTAL,  '
      + '            MAX(CUATRO_PROFOBS)   CUATRO_PROFOBS,'
      + '            MAX(CUATRO_MONEDA)    CUATRO_MONEDA, '
      + '            MAX(CUATRO_GARANTIA)  CUATRO_GARANTIA, '
      +              QuotedStr(DMLOG.wUsuario) + ' USUARIO_IMPRIME '
      + '       FROM LOG341, TGE103,';
   xSQL2 :=
        '            (SELECT LOG313.CIAID,'
      + '                    LOG312.SCCID, '
      + '                    LOG313.PROFID,'
      + '                    LOG313.ARTID, '
      + '                    LOG313.DPROFOBS,'
      + '                    LOG313.UNMIDG     UNO_UNMIDG,'
      + '                    LOG313.DPROFCNTG  UNO_DPROFCNTG, '
      + '                    LOG313.DPROFPUNG  UNO_DPROFPUNG, '
      + '                    LOG313.DPROFIMP   UNO_DPROFIMP,  '
      + '                    LOG312.PROVDES    UNO_PROVEEDOR,'
      + '                    TO_CHAR(LOG312.PROFTEN)||' + QuotedStr(' Días') + '  UNO_TENTREGA, '
      + '                    CXC101.CCOMERDES  UNO_FPAGO, '
      + '                    LOG312.PROFIXTCC  UNO_SUBTOTAL, '
      + '                    LOG312.PROFTTIMPU UNO_IMPUESTO, '
      + '                    LOG312.PROFTOTALG UNO_TOTAL, '
      + '                    LOG312.PROFOBS UNO_PROFOBS,'
      + '                    TGE103.TMONDES     UNO_MONEDA, '
      + '                    TGE194.GARANTIADES UNO_GARANTIA, '
      + '                    NULL              DOS_UNMIDG, '
      + '                    NULL              DOS_DPROFCNTG, '
      + '                    NULL              DOS_DPROFPUNG, '
      + '                    NULL              DOS_DPROFIMP, '
      + '                    NULL              DOS_PROVEEDOR, '
      + '                    NULL              DOS_TENTREGA, '
      + '                    NULL              DOS_FPAGO, '
      + '                    NULL              DOS_SUBTOTAL,'
      + '                    NULL              DOS_IMPUESTO,'
      + '                    NULL              DOS_TOTAL, '
      + '                    NULL              DOS_PROFOBS, '
      + '                    NULL              DOS_MONEDA, '
      + '                    NULL              DOS_GARANTIA, '
      + '                    NULL              TRES_UNMIDG,  '
      + '                    NULL              TRES_DPROFCNTG, '
      + '                    NULL              TRES_DPROFPUNG, '
      + '                    NULL              TRES_DPROFIMP, '
      + '                    NULL              TRES_PROVEEDOR, '
      + '                    NULL              TRES_TENTREGA, '
      + '                    NULL              TRES_FPAGO, '
      + '                    NULL              TRES_SUBTOTAL, '
      + '                    NULL              TRES_IMPUESTO,'
      + '                    NULL              TRES_TOTAL,  '
      + '                    NULL              TRES_PROFOBS,'
      + '                    NULL              TRES_MONEDA, '
      + '                    NULL              TRES_GARANTIA, '
      + '                    NULL              CUATRO_UNMIDG, '
      + '                    NULL              CUATRO_DPROFCNTG, '
      + '                    NULL              CUATRO_DPROFPUNG, '
      + '                    NULL              CUATRO_DPROFIMP, '
      + '                    NULL              CUATRO_PROVEEDOR, '
      + '                    NULL              CUATRO_TENTREGA, '
      + '                    NULL              CUATRO_FPAGO, '
      + '                    NULL              CUATRO_SUBTOTAL, '
      + '                    NULL              CUATRO_IMPUESTO, '
      + '                    NULL              CUATRO_TOTAL,  '
      + '                    NULL              CUATRO_PROFOBS,'
      + '                    NULL              CUATRO_MONEDA, '
      + '                    NULL              CUATRO_GARANTIA '
      + '               FROM LOG313, LOG312, TGE103,CXC101,TGE194 '
      + '              WHERE LOG313.CIAID = LOG312.CIAID '
      + '                AND LOG313.SCCID = LOG312.SCCID '
      + '                AND LOG313.PROFID = LOG312.PROFID '
      + '                AND LOG312.TMONID = TGE103.TMONID '
      + '                AND LOG312.CIAID = CXC101.CIAID '
      + '                AND LOG312.FPAGOID = CXC101.CCOMERID '
      + '                AND LOG312.GARANTIAID = TGE194.GARANTIAID '
      + '                AND LOG313.CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)
      + '                AND LOG313.PROFID = ' + QuotedStr(xsProforma1);
   xSQL3 :=
        '              UNION ALL '
      + '             SELECT LOG313.CIAID, '
      + '                    LOG312.SCCID, '
      + '                    LOG313.PROFID,'
      + '                    LOG313.ARTID,'
      + '                    LOG313.DPROFOBS,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    LOG313.UNMIDG,'
      + '                    LOG313.DPROFCNTG,'
      + '                    LOG313.DPROFPUNG,'
      + '                    LOG313.DPROFIMP,'
      + '                    LOG312.PROVDES ,'
      + '                    TO_CHAR(LOG312.PROFTEN)||' + QuotedStr(' Días') + ', '
      + '                    CXC101.CCOMERDES ,'
      + '                    LOG312.PROFIXTCC  ,'
      + '                    LOG312.PROFTTIMPU ,'
      + '                    LOG312.PROFTOTALG ,'
      + '                    LOG312.PROFOBS DOS_PROFOBS,'
      + '                    TGE103.TMONDES    DOS_MONEDA,'
      + '                    TGE194.GARANTIADES DOS_GARANTIA, '
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL '
      + '               FROM LOG313, LOG312, TGE103,CXC101,TGE194 '
      + '              WHERE LOG313.CIAID = LOG312.CIAID '
      + '                AND LOG313.SCCID = LOG312.SCCID '
      + '                AND LOG313.PROFID = LOG312.PROFID '
      + '                AND LOG312.TMONID = TGE103.TMONID '
      + '                AND LOG312.CIAID = CXC101.CIAID'
      + '                AND LOG312.FPAGOID = CXC101.CCOMERID'
      + '                AND LOG312.GARANTIAID = TGE194.GARANTIAID'
      + '                AND LOG313.CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)
      + '                AND LOG313.PROFID = ' + QuotedStr(xsProforma2);
   xSQL4 :=
        '              UNION ALL '
      + '             SELECT LOG313.CIAID, '
      + '                    LOG312.SCCID, '
      + '                    LOG313.PROFID,'
      + '                    LOG313.ARTID, '
      + '                    LOG313.DPROFOBS,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    LOG313.UNMIDG,'
      + '                    LOG313.DPROFCNTG,'
      + '                    LOG313.DPROFPUNG,'
      + '                    LOG313.DPROFIMP,'
      + '                    LOG312.PROVDES,' // --1 proveedor
      + '                    TO_CHAR(LOG312.PROFTEN)||' + QuotedStr(' Días') + ' , ' //  --1 tiempo de entrega
      + '                    CXC101.CCOMERDES,'  //     --1 forma de pago
      + '                    LOG312.PROFIXTCC,'  //  --1 subtotal
      + '                    LOG312.PROFTTIMPU,'  //  --1 impuesto
      + '                    LOG312.PROFTOTALG, '  //   --1 total
      + '                    LOG312.PROFOBS TRES_PROFOBS,'
      + '                    TGE103.TMONDES, '
   // 15/01/2018 Corrige SQL, faltaba coma(,)
   //   + '                    TGE194.GARANTIADES TRES_GARANTIA '
      + '                    TGE194.GARANTIADES TRES_GARANTIA, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL, '
      + '                    NULL '
      + '               FROM LOG313, LOG312, TGE103,CXC101, TGE194 '
      + '              WHERE LOG313.CIAID = LOG312.CIAID '
      + '                AND LOG313.SCCID = LOG312.SCCID '
      + '                AND LOG313.PROFID = LOG312.PROFID '
      + '                AND LOG312.TMONID = TGE103.TMONID '
      + '                AND LOG312.CIAID = CXC101.CIAID'
      + '                AND LOG312.FPAGOID = CXC101.CCOMERID'
      + '                AND LOG312.GARANTIAID = TGE194.GARANTIAID'
      + '                AND LOG313.CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)
      + '                AND LOG313.PROFID = ' + QuotedStr(xsProforma3);
   xSQL5 :=
        '              UNION ALL  '
      + '             SELECT LOG313.CIAID, '
      + '                    LOG312.SCCID, '
      + '                    LOG313.PROFID,'
      + '                    LOG313.ARTID, '
      + '                    LOG313.DPROFOBS,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    NULL,'
      + '                    LOG313.UNMIDG,'
      + '                    LOG313.DPROFCNTG,'
      + '                    LOG313.DPROFPUNG,'
      + '                    LOG313.DPROFIMP,'
      + '                    LOG312.PROVDES,' // --1 proveedor
      + '                    TO_CHAR(LOG312.PROFTEN)||' + QuotedStr(' Días') + ', ' //  --1 tiempo de entrega
      + '                    CXC101.CCOMERDES, ' //  --1 forma de pago
      + '                    LOG312.PROFIXTCC, ' //  --1 subtotal
      + '                    LOG312.PROFTTIMPU,' //  --1 impuesto
      + '                    LOG312.PROFTOTALG,' //  --1 total
      + '                    LOG312.PROFOBS CUATRO_PROFOBS,'
      + '                    TGE103.TMONDES,'
      + '                    TGE194.GARANTIADES CUATRO_GARANTIA '
      + '               FROM LOG313, LOG312, TGE103,CXC101, TGE194 '
      + '              WHERE LOG313.CIAID = LOG312.CIAID '
      + '                AND LOG313.SCCID   = LOG312.SCCID '
      + '                AND LOG313.PROFID  = LOG312.PROFID '
      + '                AND LOG312.TMONID  = TGE103.TMONID '
      + '                AND LOG312.CIAID   = CXC101.CIAID '
      + '                AND LOG312.FPAGOID = CXC101.CCOMERID '
      + '                AND LOG312.GARANTIAID = TGE194.GARANTIAID '
      + '                AND LOG313.CIAID = ' + QuotedStr(DMLOG.cdsSolCot.FieldByName('CIAID').AsString)
      + '                AND LOG313.PROFID = ' + QuotedStr(xsProforma4)
      + '            ) PROFORMA '
      + '      where LOG341.CIAID = PROFORMA.CIAID '
      + '        and LOG341.SCCID =  PROFORMA.SCCID '
      + '        and LOG341.NUMCC  = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString)
      + '      group by PROFORMA.CIAID,PROFORMA.SCCID,PROFORMA.ARTID,PROFORMA.DPROFOBS, LOG341.NUMCC, '
      + '               LOG341.OBSERVACION, LOG341.USUREG, LOG341.FECREG,LOG341.FECHA, LOG341.DEPENDENCIA ';
   xsSql := xSQL1 + xSQL2 + xSQL3 + xSQL4 + xSQL5;
// Fin HPC_201801_LOG
   DMLOG.cdsSql.Close;
   DMLOG.cdsSql.DataRequest(xsSql);
   DMLOG.cdsSql.Open;
   Screen.Cursor := crDefault;

   If DMLOG.cdsSql.RecordCount = 0 Then
   Begin
      ShowMessage('No Existe Información a Mostrar');
      Exit;
   End;

   ppdbCuadroComparativo.DataSource := DMLOG.dsSql;
   If rbHorizontal.Checked Then
   Begin
      pprCuadroComparativo.DataPipeline := ppdbCuadroComparativo;
      pprCuadroComparativo.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CuadroComparativo.rtm';
      pprCuadroComparativo.Template.LoadFromFile;
      If cbDiseno.checked Then
      Begin
         ppdCuadroComparativo.Report := pprCuadroComparativo;
         ppdCuadroComparativo.Show;
      End
      Else
      Begin
         pprCuadroComparativo.Print;
         pprCuadroComparativo.Stop;
      End;
   End
   Else
   Begin
      pprCuadroComparativoV.DataPipeline := ppdbCuadroComparativo;
      pprCuadroComparativoV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CuadroComparativoV.rtm';
      pprCuadroComparativoV.Template.LoadFromFile;
      If cbDiseno.checked Then
      Begin
         ppdCuadroComparativo.Report := pprCuadroComparativoV;
         ppdCuadroComparativo.Show;
      End
      Else
      Begin
         pprCuadroComparativoV.Print;
         pprCuadroComparativoV.Stop;
      End;
   End;
End;

Function TFCuadroComparativo.fg_ValidaProfSugerida(wgCompania, wgProformaId: String;
   Var wgMensaje: String): Boolean;
Var
   xsSql: String;
   xnI: Integer;
   xnEnCuadroComparativo: Integer;
Begin
   xnEnCuadroComparativo := 0;
   DMLOG.cdsProformaLista.First;
   If DMLOG.cdsProformaLista.Locate('CIAID;PROFID', VarArrayOf([wgCompania, wgProformaId]), []) Then
   Begin
      If DMLOG.cdsProformaLista.FieldByName('FLAGCCOM').AsString = 'S' Then
      Begin
         xnEnCuadroComparativo := 1;
      End;
   End
   Else
   Begin
      wgMensaje := 'La Proforma Nº' + QuotedStr(wgProformaId) + ' no forma parte de la Solicitud de Cotización';
      Result := False;
      Exit;
   End;

   If xnEnCuadroComparativo = 0 Then
   Begin
      wgMensaje := ' La Proforma Sugerida no forma parte' + #13 + 'del Cuadro Comparativo';
      Result := False;
      Exit;
   End;

   Result := True
End;

Procedure TFCuadroComparativo.dblcProfSugeridaExit(Sender: TObject);
Var
   xsMensaje: String;
Begin
   If dblcProfSugerida.Text = '' Then
   Begin
      Exit;
   End;
   If fg_ValidaProfSugerida(DMLOG.cdsProformaLista.FieldByName('CIAID').AsString,
      dblcProfSugerida.Text, xsMensaje) = False Then
   Begin
      ShowMessage(xsMensaje);
      dblcProfSugerida.Text := '';
      dblcProfSugerida.SetFocus;
      Exit;
   End;
End;

Procedure TFCuadroComparativo.ppHeaderBand1BeforePrint(Sender: TObject);
Var
   xxColor: TColor;
Begin
   xxColor := $00FAF1DE;
   If xnProfSugerida = 1 Then
   Begin
      uno_ppshapeAlternativa1.Brush.Color := xxColor;
      uno_ppShape13.Brush.Color := xxColor;
      uno_ppshapeSumAlternativa1.Brush.Color := xxColor;
      uno_ppShape3.Brush.Color := xxColor
   End
   Else
   Begin
      uno_ppshapeAlternativa1.Brush.Color := clWhite;
      uno_ppShape13.Brush.Color := clWhite;
      uno_ppshapeSumAlternativa1.Brush.Color := clWhite;
      uno_ppShape3.Brush.Color := clWhite;
   End;
   If xnProfSugerida = 2 Then
   Begin
      dos_ppShape6.Brush.Color := xxColor;
      dos_ppShape9.Brush.Color := xxColor;
      dos_ppShape14.Brush.Color := xxColor;
      dos_ppShape17.Brush.Color := xxColor;
   End
   Else
   Begin
      dos_ppShape6.Brush.Color := clWhite;
      dos_ppShape9.Brush.Color := clWhite;
      dos_ppShape14.Brush.Color := clWhite;
      dos_ppShape17.Brush.Color := clWhite;

   End;
   If xnProfSugerida = 3 Then
   Begin
      tres_ppShape7.Brush.Color := xxColor;
      tres_ppShape10.Brush.Color := xxColor;
      Tres_ppShape15.Brush.Color := xxColor;
      tres_ppShape18.Brush.Color := xxColor;
   End
   Else
   Begin
      tres_ppShape7.Brush.Color := clWhite;
      tres_ppShape10.Brush.Color := clWhite;
      Tres_ppShape15.Brush.Color := clWhite;
      tres_ppShape18.Brush.Color := clWhite;
   End;
End;

Procedure TFCuadroComparativo.fg_ActualizarSolCotizacion(wgCompania,
   wgNumSolCotizacion, wgNumCComparativo: String);
Var
   xsSql: String;
Begin
   xsSql := ' Update LOG302 '
      + '        set NUMCC = ' + QuotedStr(wgNumCComparativo)
      + '      where CIAID = ' + QuotedStr(wgCompania)
      + '        and SCCID = ' + QuotedStr(wgNumSolCotizacion);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar la Solicitud de Cotización')
   End;
End;

Procedure TFCuadroComparativo.btnAnularClick(Sender: TObject);
Var
   xsSql: String;
Begin
   If edtNumCComparativo.Text = '' Then
   Begin
      ShowMessage('No existe el Cuadro Comparativo');
      Exit;
   End;

   If MessageDlg(' Se anulará el Cuadro Comparativo Nº ' + edtNumCComparativo.Text + #13 +
      '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Try
         xsSql := ' Update LOG341 '
            + '        set ESTCC = ' + QuotedStr('ANULADO') + ', '
            + '            USUANU = ' + QuotedStr(DMLOG.wUsuario) + ','
            + '            FECANU = SYSDATE '
            + '      where CIAID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString)
            + '        and SCCID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString)
            + '        and NUMCC = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);

         xsSql := ' Update LOG312 '
            + '        set FLAGCCOM = ' + QuotedStr('')
            + '      where CIAID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString)
            + '        and SCCID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString);
         DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);

         fg_ActualizarSolCotizacion(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString,
            DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString, '');

         fg_RecuperaCComparativo(dblcCompania.Text, dblcNumSolCotizacion.Text, edtNumCComparativo.Text);
         fg_HabilitaCComparativo(False);

         DMLOG.wModo := 'C';
         ShowMessage('El Cuadro Comparativo Nº ' + edtNumCComparativo.Text + #13 +
            'pasó a estado ANULADO');
         Exit;
      Except
         ShowMessage('Error al Anular el Cuadro Comparativo');
         Exit;
      End;
   End;
End;

Procedure TFCuadroComparativo.fg_GrabarCComparativoSQL;
Var
   xsSql: String;
Begin
   //Verifica si ya existe el registro
   xsSql := ' CIAID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString) +
      ' AND SCCID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString) +
      ' AND NUMCC = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString);
   If Length(DMLOG.BuscaQry('dspUltTGE', 'LOG341', '*', xsSql, 'NUMCC')) = 0 Then
   Begin
      xsSql := ' Insert into LOG341 (CIAID,SCCID,NUMCC,FECHA,ANOMM,PROFIDSUG,ESTCC,USUACPCC, '
         + '                         FECACPCC,USUANU,FECANU,OBSERVACION,USUREG,FECREG, '
         + '                         USUMOD,FECMOD,DEPENDENCIA,'
         + '                         PROFIDGAN,FECPROFGAN,USUPROFGAN) '
         + '     values ('+QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString) + ','
         + '               to_date(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECHA').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('ANOMM').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('PROFIDSUG').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUACPCC').AsString) + ','
         + '               to_date(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECACPCC').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUANU').AsString) + ','
         +                'TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECANU').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('OBSERVACION').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUREG').AsString) + ','
         + '               to_date(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECREG').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUMOD').AsString) + ','
         + '               to_date(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECMOD').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '), '
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('DEPENDENCIA').AsString) + ','
         +                 QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('PROFIDGAN').AsString) + ','
         + '               sysdate,''' + DMLOG.wUsuario + ''')';
   End
   Else
   Begin
      xsSql := ' UPDATE LOG341 '
         + '        SET (CIAID,SCCID,NUMCC,FECHA,ANOMM,PROFIDSUG,ESTCC,USUACPCC, '
         + '             FECACPCC,USUANU,FECANU,OBSERVACION,USUREG,FECREG, '
         + '             USUMOD,FECMOD,PROFIDGAN,FECPROFGAN,USUPROFGAN)= '
         + '             (SELECT '+QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString) + ','
         + '                       TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECHA').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('ANOMM').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('PROFIDSUG').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('ESTCC').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUACPCC').AsString) + ','
         + '                       TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECACPCC').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUANU').AsString) + ','
         + '                       TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECANU').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('OBSERVACION').AsString) + ','
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUREG').AsString) + ','
         + '                       TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECREG').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('USUMOD').AsString) + ','
         + '                       TO_DATE(' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('FECMOD').AsString) + ',' + QuotedStr('DD/MM/YYYY') + '),'
         +                         QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('PROFIDGAN').AsString) + ','
         + '                       SYSDATE,''' + DMLOG.wUsuario + ''' FROM DUAL )'
         + '                 WHERE CIAID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('CIAID').AsString)
         + '                   AND SCCID = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('SCCID').AsString)
         + '                   AND NUMCC = ' + QuotedStr(DMLOG.cdsCuadroComparativo.FieldByName('NUMCC').AsString);
   End;
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al Actualizar El Cuadro Comparativo');
      Exit;
   End;
End;

Procedure TFCuadroComparativo.ppHeaderBand2BeforePrint(Sender: TObject);
Var
   xxColor: TColor;
Begin
   xxColor := $00FAF1DE;
   If xnProfSugerida = 1 Then
   Begin
      ppVshapeAlternativa1.Brush.Color := xxColor;
      ppVshapeDetAlternativa1.Brush.Color := xxColor;
      ppVshapeSumAlternativa1.Brush.Color := xxColor;
   End
   Else
   Begin
      ppVshapeAlternativa1.Brush.Color := clWhite;
      ppVshapeDetAlternativa1.Brush.Color := clWhite;
      ppVshapeSumAlternativa1.Brush.Color := clWhite;
   End;
   If xnProfSugerida = 2 Then
   Begin
      ppVshapeAlternativa2.Brush.Color := xxColor;
      ppVshapeDetAlternativa2.Brush.Color := xxColor;
      ppVshapeSumAlternativa2.Brush.Color := xxColor;
   End
   Else
   Begin
      ppVshapeAlternativa2.Brush.Color := clWhite;
      ppVshapeDetAlternativa2.Brush.Color := clWhite;
      ppVshapeSumAlternativa2.Brush.Color := clWhite;
   End;
   If xnProfSugerida = 3 Then
   Begin
      ppVshapeAlternativa3.Brush.Color := xxColor;
      ppVshapeDetAlternativa3.Brush.Color := xxColor;
      ppVshapeSumAlternativa3.Brush.Color := xxColor;
   End
   Else
   Begin
      ppVshapeAlternativa3.Brush.Color := clWhite;
      ppVshapeDetAlternativa3.Brush.Color := clWhite;
      ppVshapeSumAlternativa3.Brush.Color := clWhite;
   End;
End;

Procedure TFCuadroComparativo.ppDBPUnit1Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnit1.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnit1.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnit2Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnit2.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnit2.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnit3Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnit3.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnit3.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnit6Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnit6.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnit6.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnitV1Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnitV1.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnitV1.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnitV2Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnitV2.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnitV2.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.ppDBPUnitV3Print(Sender: TObject);
Begin
   If chk2decimales.Checked Then
      ppDBPUnitV3.DisplayFormat := '### ### ##0.00;-### ### ##0.00'
   Else
      ppDBPUnitV3.DisplayFormat := '### ### ##0.0000;-### ### ##0.0000';
End;

Procedure TFCuadroComparativo.btnGanadoraClick(Sender: TObject);
Begin
   fg_GrabarCcomparativo;
   fg_RecuperaCComparativo(dblcCompania.Text, dblcNumSolCotizacion.Text, edtNumCComparativo.Text);
   fg_HabilitaCComparativo(False);
End;

Procedure TFCuadroComparativo.lblFechaCCPrint(Sender: TObject);
Begin
   lblFechaCC.Text := 'Fecha :' + DateToStr(dtpFechaCComparativo.Date);
End;

Procedure TFCuadroComparativo.lblFechacc2Print(Sender: TObject);
Begin
   lblFechacc2.Text := 'Fecha :' + DateToStr(dtpFechaCComparativo.Date);
End;

Procedure TFCuadroComparativo.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry10.CLose;
   DMLOG.cdsQry11.Close;
   DMLOG.cdsReporte.Close;
   DMLOG.cdsSql.Close;
   Action := caFree;
End;

End.

