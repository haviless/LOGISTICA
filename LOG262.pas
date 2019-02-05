Unit LOG262;
// Inicio Uso de Estándares : 01/08/2011
// Unidad                   : LOG262
// Formulario               : FLPrecio
// Fecha de Creación        :
// Autor                    : Equipo de Desarrollo
// Objetivo                 : Actualizar las listas de precios con los parametros requeridos

// Actualizaciones
// HPC_201404_LOG 09/09/2014 : Se hace una identacioón del código fuente
// HPC_201405_LOG 10/10/2014 : Se adiciona consulta de Stock y datos de ultima Compra
//                           14/10/2014 Se lleva Lista de Precios de Adquisiciones Ventas a Adquisiciones SSGG
//                           14/10/2014 Reordenamiento de Sangría
// HPC_201503_LOG 17/08/2015 : Se modifica en los Sqls que filtran la data del precio de la ultima compra
// HPC_201504_LOG  31/08/2015: Ajustes para mostrar correctamente datos última compra en Grid
// HPC_201505_LOG  04/09/2015: Ajustes a la muestra de Stock.
// HPC_201602_LOG 24/10/2016 Cambio de Control de Versión a 20161024083000
// HPC_201702_LOG 19/06/2017 Se otorga propiedades a objetos de datos
//                20/06/2017 Se modifica SQL base para Adición/Edición del Artículo
// HPC_201802_LOG 07/02/2018 Cambio Total del formulario por tener demasiadas inconsistencias
// HPC_201803_LOG 05/04/2018 Se implementa mejoramiento en la Lista de Precios

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Mask, wwdbedit, StdCtrls, Buttons, Wwdbdlg, wwdblook, ExtCtrls, dbCtrls,
   wwdbdatetimepicker, db, ComCtrls, Mant, wwclient, DBClient, Grids,
   Wwdbigrd, Wwdbgrid, DBGrids;

Type
// Inicio HPC_201802_LOG
// Cambio de nombres a componentes para hacerlos mas entendibles
   TFLPrecio = Class(TForm)
      pnlCabecera: TPanel;
      pnlCab: TPanel;
      Label7: TLabel;
      Label8: TLabel;
      gbUmg: TGroupBox;
      dbeUmg: TwwDBEdit;
      gbUmu: TGroupBox;
      dbeUmu: TwwDBEdit;
      dbePrecioU: TwwDBEdit;
      Label15: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label24: TLabel;
      lblPVtaUMed: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      Label29: TLabel;
      Label30: TLabel;
      pnl1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      pnl3: TPanel;
      lblArticulo: TLabel;
      lblTMoneda: TLabel;
      dblcdArticulo: TwwDBLookupComboDlg;
      dblcTMon: TwwDBLookupCombo;
      edtArticulo: TEdit;
      edtTMon: TEdit;
      pnl2: TPanel;
      dblcLinea: TwwDBLookupCombo;
      dblcFamilia: TwwDBLookupCombo;
      lblLinea: TLabel;
      lblFamilia: TLabel;
      edtLinea: TEdit;
      edtFamilia: TEdit;
      grpTope: TGroupBox;
      dbePorcG: TwwDBEdit;
      dbePorcU: TwwDBEdit;
      lblGnrl: TLabel;
      lnlUnitaria: TLabel;
      dbgTope: TDBRadioGroup;
      grpCantVta: TGroupBox;
      Label11: TLabel;
      Label20: TLabel;
      dbeMinG: TwwDBEdit;
      dbeMinU: TwwDBEdit;
      lblTInventario: TLabel;
      dblcTinid: TwwDBLookupCombo;
      edtTinid: TEdit;
      lblSubFam: TLabel;
      dblcSUBFAM: TwwDBLookupCombo;
      dbeSFAM: TwwDBEdit;
      dbePrecioG: TDBEdit;
      lblLPrecios: TLabel;
      dblcLPrecio: TwwDBLookupCombo;
      edtLPrecio: TEdit;
      Panel2: TPanel;
      lblCostoUltCompra: TLabel;
      lblCostoOrigSoles: TLabel;
      lblCostoNCredSoles: TLabel;
      lblCostoPorcSoles: TLabel;
      lblCostoFinalSoles: TLabel;
      Label32: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      dbeUltCosto_AlmMN: TwwDBEdit;
      dbeNotaCredMN: TwwDBEdit;
      dbePorcNCredMN: TwwDBEdit;
      dbeCostoFinalMN: TwwDBEdit;
      lblCostoOrigDolar: TLabel;
      lblCostoNCredDolar: TLabel;
      lblCostoPorcDolar: TLabel;
      lblCostoFinalDolar: TLabel;
      Label39: TLabel;
      Label40: TLabel;
      Label41: TLabel;
      dbeUltCosto_AlmME: TwwDBEdit;
      dbeNotaCredME: TwwDBEdit;
      dbePorcNCredME: TwwDBEdit;
      dbeCostoFinalME: TwwDBEdit;
      lblTitCostoMonedaOrig: TLabel;
      lblTitCostoMonedaEqui: TLabel;
      dbeTipoCambio: TwwDBEdit;
      lblTCambioUltComp: TLabel;
      dbeDescuento: TwwDBEdit;
      dbePorDes: TwwDBEdit;
      lblDctoIncrPorProm: TLabel;
      Label52: TLabel;
      Label53: TLabel;
      dbePreProm: TwwDBEdit;
      Label57: TLabel;
      dbeIGVProm: TwwDBEdit;
      Label59: TLabel;
      dbePrePromCIGV: TwwDBEdit;
      Bevel7: TBevel;
      Bevel6: TBevel;
      Label63: TLabel;
      dbeDESD: TwwDBEdit;
      Label64: TLabel;
      dbePPD: TwwDBEdit;
      Label65: TLabel;
      dbeIGVPRD: TwwDBEdit;
      Label66: TLabel;
      dbePrePromCIGVD: TwwDBEdit;
      Bevel8: TBevel;
      GroupBox1: TGroupBox;
      dbeTCD: TwwDBEdit;
      wwClientDataSet1: TwwClientDataSet;
      dbeFUC: TwwDBDateTimePicker;
      lblFecUltComp: TLabel;
      GroupBox2: TGroupBox;
      dbeStock: TwwDBEdit;
      lblCostoconIGVSoles: TLabel;
      dbeCostoIGVS: TwwDBEdit;
      lblObsequio: TLabel;
      pnlPrecio: TPanel;
      lblTitPVtaSoles: TLabel;
      lblPVtaUtilidadSoles: TLabel;
      lblPVtaPorcSoles: TLabel;
      lblPVtaSinIGVSoles: TLabel;
      lblPVtaIGVPorcSoles: TLabel;
      lblPVtaConIGVSoles: TLabel;
      dbeUtilidad: TwwDBEdit;
      dbePorUti: TwwDBEdit;
      dbePreVta: TwwDBEdit;
      dbeIGVPV: TwwDBEdit;
      dbePreVtaCIGV: TwwDBEdit;
      bbtnCPV: TBitBtn;
      pnlCons: TPanel;
      lblCantUltComp: TLabel;
      dbeCant: TwwDBEdit;
      pnlUltCompra: TPanel;
      Shape1: TShape;
      Label74: TLabel;
      Label75: TLabel;
      lbludt: TLabel;
      Label77: TLabel;
      Label78: TLabel;
      btnsalir: TBitBtn;
      Label79: TLabel;
      Label80: TLabel;
      pnlStock: TPanel;
      Shape2: TShape;
      lblStockFecha: TLabel;
      dbgStock: TwwDBGrid;
      BitBtn1: TBitBtn;
      dbePorServ: TwwDBEdit;
      lblPVtaServPorcSoles: TLabel;
      dbServ: TwwDBEdit;
      pnlCostoProm: TPanel;
      Bevel5: TBevel;
      lblTitCostoProm: TLabel;
      lblCostoPromSoles: TLabel;
      lblCostoPromDolar: TLabel;
      dbeCostoPromMN: TwwDBEdit;
      dbeCostoPromME: TwwDBEdit;
      dbeTCDC: TwwDBEdit;
      Label83: TLabel;
      Label84: TLabel;
      Label85: TLabel;
      dbePrebase: TDBEdit;
      gbBotones: TGroupBox;
      btnStock: TBitBtn;
      btnDatosCompra: TBitBtn;
      Z2bbtnOK: TBitBtn;
      Z2bbtnCancel: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      lblNotaIngreso: TLabel;
      edtNIngreso: TEdit;
      edtfeccomp: TEdit;
      edtcntcomp: TEdit;
      edtPreComp: TEdit;
      edtCPro: TEdit;
      edtPreCompIGV: TEdit;
      edtCProIGV: TEdit;
      Label1: TLabel;
      edtAlmacen: TEdit;
      dbeIGV: TwwDBEdit;
      lblPVtaServSoles: TLabel;
      lblPVtaIGVSoles: TLabel;
      pnlPrecioME: TPanel;
      lblTitPVtaDolar: TLabel;
      lblPVtaSinIGVDolar: TLabel;
      lblPVtaIGVDolar: TLabel;
      lblPVtaServicioDolar: TLabel;
      lblPVtaConIGVDolar: TLabel;
      lblPVtaUtilidadDolar: TLabel;
      dbeUTID: TwwDBEdit;
      dbePreVtaCIGVD: TwwDBEdit;
      dbePorServD: TwwDBEdit;
      dbeIGVPVD: TwwDBEdit;
      dbePreVtaD: TwwDBEdit;
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
    dbeNroNota: TwwDBEdit;
    lblNroNota: TLabel;	
// Fin HPC_201803_LOG
// Fin HPC_201802_LOG
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcdArticuloExit(Sender: TObject);
      Procedure Z2bbtnOKClick(Sender: TObject);
      Procedure Z2bbtnCancelClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure dbeDsctoGExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbeDsctoUExit(Sender: TObject);
// Inicio HPC_201802_LOG
//    Procedure dbeTcamExit(Sender: TObject);
// Fin HPC_201802_LOG
      Procedure dbePrecioGExit(Sender: TObject);
// Inicio HPC_201802_LOG
//    Procedure dbeVigenciaExit(Sender: TObject);
// Fin HPC_201802_LOG
      Procedure dblcTinidExit(Sender: TObject);
      Procedure dblcLineaExit(Sender: TObject);
      Procedure dblcFamiliaExit(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTVtaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dbgTopeClick(Sender: TObject);
      Procedure dblcSUBFAMExit(Sender: TObject);
      Procedure dbeMinGExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdArticuloEnter(Sender: TObject);
      Procedure dblcLineaEnter(Sender: TObject);
      Procedure dblcFamiliaEnter(Sender: TObject);
      Procedure dblcSUBFAMEnter(Sender: TObject);
      Procedure dbeUtilidadExit(Sender: TObject);
      Procedure dbePorUtiExit(Sender: TObject);
// Inicio HPC_201802_LOG
// Componentes renombrados
      Procedure dbePreVtaExit(Sender: TObject);
      Procedure dbeDescuentoExit(Sender: TObject);
      Procedure dbePorDesExit(Sender: TObject);
      Procedure dbePrePromExit(Sender: TObject);
      Procedure dbePreVtaCIGVExit(Sender: TObject);
      Procedure dbePrePromCIGVExit(Sender: TObject);
// Fin HPC_201802_LOG
      Procedure bbtnCPVClick(Sender: TObject);
      Procedure btnsalirClick(Sender: TObject);
      Procedure btnDatosCompraClick(Sender: TObject);
      Procedure btnStockClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
   Private
    { Private declarations }
      wModif: String; 
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
//      dIGV: Double;  
// Fin HPC_201803_LOG
      dServicio: Double;
      Procedure InicializaCampos;
      Procedure RegistroNuevo;
      Function Consistencia: Boolean;
// Inicio HPC_201802_LOG
// Procedimiento convertido en público
// Procedure CostoDeArticulo;
// Fin HPC_201802_LOG
      Procedure FormatoImportes(cTipo: String);
      Procedure CalculaMontosDetalle(cOrigen: String);
      Procedure ActualizaLista(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
      Function ActualizaListaDePrecio: Boolean;
// Inicio HPC_201802_LOG
// Procedimiento Inicial para mostrar datos
      Procedure IniciaDatos;
// Fin HPC_201802_LOG

   Public
    { Public declarations }	
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
      dIGV: Double;									   
// Fin HPC_201803_LOG
      wContenido: boolean;
// Inicio HPC_201802_LOG
// Procedimiento convertido en público
      Procedure CostoDeArticulo(wCiaid, wArticulo: String);
// Fin HPC_201802_LOG
   End;

Var
   FLPrecio: TFLPrecio;
   xCrea: boolean;
   xSQL: String;

Implementation

Uses
   LOGDM1, oaAD1000, LOG260;

{$R *.DFM}

Procedure TFLPrecio.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Not Z2bbtnCancel.Focused Then
   Begin
      If xCrea Then Exit;
      xWhere := 'TMONID=' + quotedstr(dblcTMon.Text)
         + ' AND (TMON_LOC=' + '''' + 'L' + '''' + ' OR TMON_LOC=' + '''' + 'E' + '''' + ')';
      edtTMon.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

      If DMLOG.wModo = 'M' Then
      Begin
         If dblcTMon.Text = DMLOG.wTMonLoc Then
         Begin
            If lblTitCostoMonedaOrig.Caption = 'Soles' Then
            Else
            Begin
            // Cambiar Importes
               If DMLOG.cdsQry7.FieldByName('UTID').AsFloat > 0 Then
               Begin
                  DMLOG.cdsQry7.Edit;
                  DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat;
                  dbePorUtiExit(Self);
               End
               Else
               Begin
                  DMLOG.cdsLPrecio.Edit;
                  DMLOG.cdsLPrecio.FieldByName('PREVEN').AsString := DMLOG.cdsQry7.FieldByName('PVD').AsString;
// Inicia HPC_201802_LOG
// modificación de nombre del componente
                  dbePreVtaExit(Self);
// Fin HPC_201802_LOG
               End;
            End;
         End
         Else
         Begin
            If (lblTitCostoMonedaOrig.Caption = 'Dolares') Or
               (lblTitCostoMonedaOrig.Caption = 'Dólares') Then
            Else
            Begin
            // Cambiar Importes
               If DMLOG.cdsQry7.FieldByName('UTID').AsFloat > 0 Then
               Begin
                  DMLOG.cdsQry7.Edit;
                  DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat;
                  dbePorUtiExit(Self);
               End
               Else
               Begin
                  DMLOG.cdsLPrecio.Edit;
                  DMLOG.cdsLPrecio.FieldByName('PREVEN').AsString := DMLOG.cdsQry7.FieldByName('PVD').AsString;
// Inicia HPC_201802_LOG
// modificación de nombre del componente
                  dbePreVtaExit(Self);
// Fin HPC_201802_LOG
               End;
            End;
         End;

      End;

      If dblcTMon.Text = DMLOG.wTMonLoc Then
      Begin
         lblTitCostoMonedaOrig.Caption := 'Soles';
         lblTitCostoMonedaEqui.Caption := 'Dolares';
      End
      Else
      Begin
         lblTitCostoMonedaOrig.Caption := 'Dolares';
         lblTitCostoMonedaEqui.Caption := 'Soles';
      End;

      If length(edtTMon.Text) = 0 Then
      Begin
         ShowMessage('Falta Tipo de Moneda');
         dblcTMon.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFLPrecio.dblcdArticuloExit(Sender: TObject);
Var
   xContenido: integer;
Begin
   If xCrea Then Exit;
   If Z2bbtnCancel.Focused Then Exit;
   If dblcLinea.Focused Then Exit;
   If dblcFamilia.Focused Then Exit;
   If dblcSUBFAM.Focused Then Exit;

   If DMLOG.wModo = 'A' Then
   Begin
   // Inicia HPC_201802_LOG
   // cambio de rutina CostodeArtículo con Cia,Artículo
      CostoDeArticulo(dblcCia.Text, dblcdArticulo.Text);
   // Asignación de dataset a componentes
      FormatoImportes('S');
   // modificación de nombre del componente
      If Length(Trim(dbeCostoFinalMN.Text)) = 0 Then
   // Fin HPC_201802_LOG
      Begin
         ShowMessage('Artículo no tiene Precio de Ultima Compra (Ingreso)');
         dblcdArticulo.SetFocus;
         Exit;
      End;
      DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.FieldByName('PREVEN').AsString := DMLOG.cdsQry7.FieldByName('PVD').AsString;
   End;

   If DMLOG.BuscaRegPrecio(dblcCia.text, dblcLPrecio.Text, dblcdArticulo.Text) Then
   Begin
      edtArticulo.Text := '';
      dblcdArticulo.Text := '';
      ShowMessage('Artículo ya fue Ingresado para esta Lista');
      dblcdArticulo.SetFocus;
      exit;
   End;

// busca en Maestro de Artículos
   If length(trim(dblcTinid.text)) > 0 Then
      DMLOG.cdsArti.IndexFieldNames := 'CIAID;TINID;ARTID'
   Else
      DMLOG.cdsArti.IndexFieldNames := 'CIAID;ARTID';

   DMLOG.cdsArti.SetKey;
   DMLOG.cdsArti.FieldByName('CIAID').AsString := wCia;
   If length(trim(dblcTinid.text)) > 0 Then
      DMLOG.cdsArti.FieldByName('TINID').AsString := dblcTinid.text;
   DMLOG.cdsArti.FieldByName('ARTID').AsString := dblcdArticulo.text;
   If DMLOG.cdsArti.GotoKey Then
   Begin
      edtArticulo.Text := DMLOG.cdsArti.fieldbyname('ARTDES').AsString;

      If length(trim(dblcTinid.text)) = 0 Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('TINID').AsString := DMLOG.cdsArti.FieldByName('TINID').AsString;
         edtTinid.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', 'TINID=' + quotedstr(dblcTinid.text), 'TINDES');
      End;

      xContenido := DMLOG.cdsArti.fieldbyname('ARTCONT').AsInteger;
      wContenido := (xcontenido > 1); //para um unitaria

      If DMLOG.cdsLPrecio.FieldByName('GRARID').AsString = '' Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('GRARID').AsString := DMLOG.cdsArti.FieldByName('GRARID').AsString;
         edtLinea.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE131', 'GRARDES', 'CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString) + ' and GRARID=' + quotedstr(dblcLinea.Text), 'GRARDES');
      End;

      If DMLOG.cdsLPrecio.FieldByName('FAMID').AsString = '' Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('FAMID').AsString := DMLOG.cdsArti.FieldByName('FAMID').AsString;
         sSQL := 'CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
            + ' and TINID =' + quotedstr(dblcTINID.text)
            + ' and GRARID=' + quotedstr(dblcLinea.text)
            + ' and FAMID=' + quotedstr(dblcFamilia.text);
         edtFamilia.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');
      End;

      If DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString = '' Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString := DMLOG.cdsArti.FieldByName('SFAMID').AsString;
         sSQL := 'CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
            + ' and TINID =' + quotedstr(dblcTINID.text)
            + ' and GRARID=' + quotedstr(dblcLinea.text)
            + ' and FAMID=' + quotedstr(dblcFamilia.text)
            + ' and SFAMID=' + quotedstr(dblcSUBFAM.text);
         dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
      End;

      DMLOG.cdsLPrecio.fieldbyname('UNMIDG').AsString := DMLOG.cdsArti.fieldbyname('UNMIDG').AsString;
   // Inicia HPC_201802_LOG
   // cambio campo de precio promedio
//      DMLOG.cdsLPrecio.fieldbyname('LPREBASGMO').AsFloat := DMLOG.cdsArti.fieldbyname('ARTPCG').Asfloat;
      DMLOG.cdsLPrecio.fieldbyname('LPREBASGMO').AsFloat := DMLOG.cdsArti.fieldbyname('ARTCPROG').Asfloat;
   // Fin HPC_201802_LOG
      DMLOG.cdsLPrecio.fieldbyname('ARTCONT').AsFloat := DMLOG.cdsArti.fieldbyname('ARTCONT').AsInteger;
      DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString := DMLOG.wTMonLoc;
      edtTMon.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedstr(dblcTMon.Text), 'TMONDES');
      dbePrecioG.Enabled := True;

      If wContenido Then // Si es Mayor
      Begin
         DMLOG.cdsLPrecio.fieldbyname('UNMIDU').AsString := DMLOG.cdsArti.fieldbyname('UNMIDU').AsString;
         dbeMinU.Enabled := True;
         dbePrecioU.Enabled := True;
      End
      Else
      Begin
         DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat := 0;
         DMLOG.cdsLPrecio.fieldbyname('CANTMINU').AsFloat := 0;
         dbeMinU.Enabled := False;
         dbePrecioU.Enabled := False;
      End;

   // Inicia HPC_201802_LOG
   // cambio de rutina CostodeArtículo con Cia,Artículo
      CostoDeArticulo(dblcCia.Text, dblcdArticulo.Text);
   // Fin HPC_201802_LOG

      If DMLOG.wModo = 'A' Then
      Begin
         DMLOG.cdsQry7.Edit;
         DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := 0.00;
         DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := 0.00;
         CalculaMontosDetalle('UTI');
      End;

      pnl1.Enabled := False;
      pnl2.Enabled := False;
   End
   Else
   Begin
      ShowMessage('Artículo Errado');
      dblcdArticulo.SetFocus;
      exit;
   End;

   xSQL := ' Select nvl((Select C.TASA '
      + '                  from TGE101 A,TGE205 B,TGE128 C '
      + '                 where A.CIAID=' + quotedStr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
      + '                   and A.FLGSERV=''S'' '
      + '                   and A.CIAID=B.CIAID '
      + '                   and B.TINID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('TINID').AsString)
      + '                   and B.ARTID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString)
      + '                   and B.FLGSERV=''S'' '
      + '                   and C.TREGID=''07''),0) TASSERV '
      + '      from DUAL ';
   DMLOG.cdsQry.close;
   DMLOG.cdsQry.datarequest(xSQL);
   DMLOG.cdsQry.Open;
   dServicio := DMLOG.cdsQry.FieldByname('TASSERV').AsFloat;
   dbServ.Text := FloatToStr(dServicio);

   If DMLOG.cdsQry7.FieldByName('OBSEQUIO').AsString = 'S' Then
   Begin
      gbUmg.Enabled := False;
      lblObsequio.Visible := True;
   End
   Else
   Begin
      lblObsequio.Visible := False;
      gbUmg.Enabled := True;
   // Inicia HPC_201802_LOG
   // retiro de Utilidad
   //   dbeUtilidad.SetFocus;
   // Fin HPC_201802_LOG
   End;
End;
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
// Inicia HPC_201802_LOG
// cambio de rutina CostodeArtículo con Cia,Artículo
Procedure TFLPrecio.CostoDeArticulo(wCiaid, wArticulo: String);
Var
   cFecha, cAno, cIGV: String;
//   dIGV: Double;
   cAnomm: String;
   wAno, wMes, wDia: word;
Begin
   xSQL := 'Select ' + quotedstr(datetostr(FLisPre.dbdtpFecha.Date)) + ' FECHA from DUAL';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   decodedate(DMLOG.cdsQry.FieldByName('FECHA').AsDateTime, wAno, wMes, wDia);
   cAno := inttostr(wAno);

   xSQL := 'Select TASACAN from TGE108 WHERE TASAFLG=''I'' ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;
   cIGV := FloatToStr(DMLOG.cdsQry12.FieldByName('TASACAN').AsFloat / 100);

   cFecha := DateToStr(FLisPre.dbdtpFecha.Date);
   cAno := Copy(cFecha, 7, 4);
   cAnomm := Copy(cFecha, 7, 4) + Copy(cFecha, 4, 2);
   xSQL := 'Select TCAMVBV TCD, ' + DMLOG.cdsQry12.FieldByName('TASACAN').AsString + ' IGV, TCAMVBC TCDC '
      + '     from TGE107 '
      + '    where ''' + cFecha + '''<=FECHA(+) '
      + '    order by FECHA desc';
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;

   xSQL := 'Select LOG315.TMONID, LOG314.NISSIT, LOG314.NISAFREG, LOG315.CIAID, LOG315.TINID, LOG315.TDAID, LOG315.NISAID, LOG315.NISATIP, '
      + '          LOG315.KDXCNTG,  LOG315.ARTTOTALG, '
      + '          round(LOG315.ARTPCG * LOG315.KDXCNTG, 4) COSARTFAC, LOG315.IMPNOTCRE, '
      + '          TGE205.ARTCPROG COSTOPROMMN, '
      + '          ROUND(LOG315.IMPNOTCRE / LOG315.KDXCNTG, 2) NOTACREDMN, '
      + '          round((LOG315.IMPNOTCRE / case when LOG315.COSARTFAC = 0 then 1 else LOG315.COSARTFAC end) * 100, 2) PORCNCREDMN, '
      + '          TGE205.ARTCPROG PRECIOFINALMN, '
      + '          round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) COSTOPROMME, '
      + '          round((round((case when LOG315.TMONID=''N'' then LOG315.ARTPCG else LOG315.ARTPCG*TGE107.TCAMVBC end) * LOG315.KDXCNTG, 4)) / LOG315.KDXCNTG, 2) ULTCOSTO_ALMMN, '
      + '          round((round((case when LOG315.TMONID=''D'' then LOG315.ARTPCG else LOG315.ARTPCG/TGE107.TCAMVBC end) * LOG315.KDXCNTG, 4)) / LOG315.KDXCNTG, 2) ULTCOSTO_ALMME, '
      + '          round((LOG315.IMPNOTCRE / LOG315.KDXCNTG) / TGE107.TCAMVBV, 2) NOTACREDME, '
      + '          round((LOG315.IMPNOTCRE / case when LOG315.COSARTFAC = 0 then 1 else LOG315.COSARTFAC end) * 100, 2) PORCNCREDME, '
      + '          round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) PRECIOFINALME, '
      + '          TGE107.TCAMVBC TIPOCAMBIO, 0.00 UTILIDAD, 0.0000 PORUTI, 0.00 DESCUENTO, '
      + '          0.00 PORDES, 0.00 IGVPV, 0.000 PREVENCIGV, 0.00 IGVPROM, 0.00 PREPROMCIGV, '
      + '          0.000 PPSERV, 0.00 UTID, 0.00 DESD, 0.00 PVD, 0.00 PPD, 0.00 IGVPVD, '
      + '          0.00 IGVPRD, 0.00 PREVENCIGVD, 0.00 PREPROMCIGVD, 0.000 PPSERVD, '
      + '          LOG337.STKFIN STKSACTG, TGE205.OBSEQUIO, '
      + '          round(TGE205.ARTCPROG * (1 + 0.18), 2) COSTOIGVS, '
      + '          round(round(TGE205.ARTCPROG / TGE107.TCAMVBC, 2) * (1 + 0.18), 2) COSTOIGVD, '
      + '          nvl(TGE205.FLGSERV,''N'') FLGSERV, (select TASA from TGE128 where TIPDET=''SV'') TASASRV '
      + '     from LOG315, TGE208, LOG314, TGE205, TGE107, LOG337 '
      + '    where LOG315.CIAID=' + quotedstr(wCiaid)
      + '      and LOG315.NISATIP=''INGRESO'' '
      + '      and LOG315.ARTID = ' + quotedstr(wArticulo)
      + '      and TGE208.TRIID(+) = LOG315.TRIID and TGE208.TRISGT(+) = ''I'' and TGE208.ACTCOSPRO = ''S'' '
      + '      and LOG315.NISAFREG=(Select max(LOG315.NISAFREG) '
      + '                             from LOG315, TGE208 '
      + '                            where LOG315.CIAID=' + quotedstr(wCiaid)
      + '                              and LOG315.NISATIP=''INGRESO'' '
      + '                              and LOG315.ARTID = ' + quotedstr(wArticulo)
      + '                              and TGE208.TRIID(+) = LOG315.TRIID and TGE208.TRISGT(+) = ''I'' and TGE208.ACTCOSPRO = ''S'' '
      + '                              and LOG315.NISSIT=''ACEPTADO'') '
      + '      and LOG314.CIAID=LOG315.CIAID and LOG314.TINID=LOG315.TINID and LOG314.TDAID=LOG315.TDAID and LOG314.ALMID=LOG315.ALMID '
      + '      and LOG315.NISATIP = LOG314.NISATIP '
      + '          and LOG314.NISAID=LOG315.NISAID and LOG314.NISSIT = ''ACEPTADO'' '
      + '      and TGE205.CIAID(+)=LOG315.CIAID and TGE205.TINID(+)=LOG315.TINID and TGE205.ARTID(+)=LOG315.ARTID '
      + '      and TGE107.FECHA(+)=LOG314.NISAFREG and TGE107.TMONID=''D'' '
      + '      and LOG337.CIAID(+)=LOG315.CIAID and LOG337.LOGANOMM(+) = ' + quotedstr(cAno + DMLOG.StrZero(inttostr(wMes), 2))
      + '      and LOG337.ARTID(+)=LOG315.ARTID ';
   DMLOG.cdsQry7.Close;
   DMLOG.cdsQry7.DataRequest(xSQL);
   DMLOG.cdsQry7.Open;

   If DMLOG.cdsQry7.Recordcount > 0 Then
   Begin
      DMLOG.cdsQry7.Edit;

      DMLOG.cdsQry7.FieldByName('PRECIOFINALMN').AsFloat := DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMMN').AsFloat
         - DMLOG.cdsQry7.FieldByName('NOTACREDMN').AsFloat;
      DMLOG.cdsQry7.FieldByName('PRECIOFINALME').AsFloat := DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMME').AsFloat
         - DMLOG.cdsQry7.FieldByName('NOTACREDME').AsFloat;
      DMLOG.cdsQry7.Post;
   End;

//   FormatoImportes('S');

   DMLOG.cdsQry7.First;
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina FormatoImportes
// Fin HPC_201803_LOG  
Procedure TFLPrecio.FormatoImportes(cTipo: String);
Begin

   If Not DMLOG.cdsQry7.Active Then Exit;

   dbeFUC.DataField := 'NISAFREG';
   dbeFUC.DataSource := DMLOG.dsQry7;
   dbeStock.DataField := 'STKSACTG';
   dbeStock.DataSource := DMLOG.dsQry7;

   dbeUltCosto_AlmMN.DataField := 'ULTCOSTO_ALMMN';
   dbeUltCosto_AlmMN.DataSource := DMLOG.dsQry7;
   dbeNotaCredMN.DataField := 'NOTACREDMN';
   dbeNotaCredMN.DataSource := DMLOG.dsQry7;
   dbePorcNCredMN.DataField := 'PORCNCREDMN';
   dbePorcNCredMN.DataSource := DMLOG.dsQry7;
   dbeCostoFinalMN.DataField := 'PRECIOFINALMN';
   dbeCostoFinalMN.DataSource := DMLOG.dsQry7;
   dbeCostoIGVS.DataField := 'COSTOIGVS';
   dbeCostoIGVS.DataSource := DMLOG.dsQry7;

   dbeUltCosto_AlmME.DataField := 'ULTCOSTO_ALMME';
   dbeUltCosto_AlmME.DataSource := DMLOG.dsQry7;
   dbeNotaCredME.DataField := 'NOTACREDME';
   dbeNotaCredME.DataSource := DMLOG.dsQry7;
   dbePorcNCredME.DataField := 'PORCNCREDME';
   dbePorcNCredME.DataSource := DMLOG.dsQry7;
   dbeCostoFinalME.DataField := 'PRECIOFINALME';
   dbeCostoFinalME.DataSource := DMLOG.dsQry7;

   dbeCostoPromMN.DataField := 'COSTOPROMMN';
   dbeCostoPromMN.DataSource := DMLOG.dsQry7;
   dbeCostoPromME.DataField := 'COSTOPROMME';
   dbeCostoPromME.DataSource := DMLOG.dsQry7;
   dbeTipoCambio.DataField := 'TIPOCAMBIO';
   dbeTipoCambio.DataSource := DMLOG.dsQry7;

   dbeCant.DataField := 'KDXCNTG';
   dbeCant.DataSource := DMLOG.dsQry7;

   dbeUtilidad.DataField := 'UTILIDAD';
   dbeUtilidad.DataSource := DMLOG.dsQry7;
   dbePorUti.DataField := 'PORUTI';
   dbePorUti.DataSource := DMLOG.dsQry7;
   dbeDescuento.DataField := 'DESCUENTO';
   dbeDescuento.DataSource := DMLOG.dsQry7;
   dbePorDes.DataField := 'PORDES';
   dbePorDes.DataSource := DMLOG.dsQry7;

   dbeIGVPV.DataField := 'IGVPV';
   dbeIGVPV.DataSource := DMLOG.dsQry7;

   dbePorServ.DataField := 'PPSERV';
   dbePorServ.DataSource := DMLOG.dsQry7;

   dbeIGV.DataField := 'IGV';
   dbeIGV.DataSource := DMLOG.dsQry6;
   dbePreVtaCIGV.DataField := 'PREVENCIGV';
   dbePreVtaCIGV.DataSource := DMLOG.dsQry7;
   dbeIGVProm.DataField := 'IGVPROM';
   dbeIGVProm.DataSource := DMLOG.dsQry7;
   dbePrePromCIGV.DataField := 'PREPROMCIGV';
   dbePrePromCIGV.DataSource := DMLOG.dsQry7;

   dbeTCD.DataField := 'TCD';
   dbeTCD.DataSource := DMLOG.dsQry6;
   dbeTCDC.DataField := 'TCDC';
   dbeTCDC.DataSource := DMLOG.dsQry6;

   dbeUtiD.DataField := 'UTID';
   dbeUtiD.DataSource := DMLOG.dsQry7;
   dbePreVtaD.DataField := 'PVD';
   dbePreVtaD.DataSource := DMLOG.dsQry7;
   dbeIGVPVD.DataField := 'IGVPVD';
   dbeIGVPVD.DataSource := DMLOG.dsQry7;
   dbePreVtaCIGVD.DataField := 'PREVENCIGVD';
   dbePreVtaCIGVD.DataSource := DMLOG.dsQry7;
   dbePorServD.DataField := 'PPSERVD';
   dbePorServD.DataSource := DMLOG.dsQry7;

   dbeDesD.DataField := 'DESD';
   dbeDesD.DataSource := DMLOG.dsQry7;
   dbePPD.DataField := 'PPD';
   dbePPD.DataSource := DMLOG.dsQry7;
   dbeIGVPRD.DataField := 'IGVPRD';
   dbeIGVPRD.DataSource := DMLOG.dsQry7;
   dbePrePromCIGVD.DataField := 'PREPROMCIGVD';
   dbePrePromCIGVD.DataSource := DMLOG.dsQry7;

{
   FormatoImportes('S');

   If DMLOG.cdsQry7.Recordcount > 0 Then
      CalculaMontosDetalle('PreVta');

   Exit;

   If cTipo = 'S' Then
   Begin
      (DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('NOTACREDMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PORCNCREDMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PRECIOFINALMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMME') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('NOTACREDME') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PORCNCREDME') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PRECIOFINALMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('COSTOPROMMN') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('COSTOPROMME') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('TIPOCAMBIO') As TFloatField).DisplayFormat := '###,###,##0.000';

      (DMLOG.cdsQry7.FieldByName('UTILIDAD') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('UTILIDAD') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('PORUTI') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PORUTI') As TFloatField).EditFormat := '########0.00';

      If DMLOG.cdsLPrecio.FieldByName('CIAID').AsString = '04' Then
      Begin
         (DMLOG.cdsLPrecio.FieldByName('PREVEN') As TFloatField).DisplayFormat := '###,###,##0.00';
         (DMLOG.cdsLPrecio.FieldByName('PREVEN') As TFloatField).EditFormat := '########0.00';
         (DMLOG.cdsLPrecio.FieldByName('PREVENPRO') As TFloatField).DisplayFormat := '###,###,##0.000';
         (DMLOG.cdsLPrecio.FieldByName('PREVENPRO') As TFloatField).EditFormat := '########0.000';
         (DMLOG.cdsLPrecio.FieldByName('PREBASE') As TFloatField).DisplayFormat := '###,###,##0.00';
         (DMLOG.cdsLPrecio.FieldByName('PREBASE') As TFloatField).EditFormat := '########0.00';

      End
      Else
      Begin
         (DMLOG.cdsLPrecio.FieldByName('PREVEN') As TFloatField).DisplayFormat := '###,###,##0.0000';
         (DMLOG.cdsLPrecio.FieldByName('PREVEN') As TFloatField).EditFormat := '########0.0000';
         (DMLOG.cdsLPrecio.FieldByName('PREVENPRO') As TFloatField).DisplayFormat := '###,###,##0.0000';
         (DMLOG.cdsLPrecio.FieldByName('PREVENPRO') As TFloatField).EditFormat := '########0.0000';
         (DMLOG.cdsLPrecio.FieldByName('PREBASE') As TFloatField).DisplayFormat := '###,###,##0.0000';
         (DMLOG.cdsLPrecio.FieldByName('PREBASE') As TFloatField).EditFormat := '########0.0000';

      End;

      (DMLOG.cdsQry7.FieldByName('IGVPV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PREVENCIGV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PREVENCIGV') As TFloatField).EditFormat := '########0.00';

      (DMLOG.cdsQry7.FieldByName('DESCUENTO') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('DESCUENTO') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('PORDES') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PORDES') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('IGVPROM') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PREPROMCIGV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PREPROMCIGV') As TFloatField).EditFormat := '########0.00';
      (DMLOG.cdsQry7.FieldByName('PPSERV') As TFloatField).DisplayFormat := '###,###,##0.00';
      (DMLOG.cdsQry7.FieldByName('PPSERV') As TFloatField).EditFormat := '########0.00';

      (DMLOG.cdsQry7.FieldByName('UTID') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('PVD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('IGVPVD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('PREVENCIGVD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('DESD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('PPD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('IGVPRD') As TFloatField).DisplayFormat := '###,###,##0.000';
      (DMLOG.cdsQry7.FieldByName('PREPROMCIGVD') As TFloatField).DisplayFormat := '###,###,##0.000';

   End
   Else
   Begin
      (DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('NOTACREDMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PORCNCREDMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PRECIOFINALMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('ULTCOSTO_ALMME') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('NOTACREDME') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PORCNCREDME') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PRECIOFINALMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('COSTOPROMMN') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('COSTOPROMME') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('TIPOCAMBIO') As TFloatField).DisplayFormat := '';

      (DMLOG.cdsQry7.FieldByName('UTID') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('IGVPVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PREVENCIGVD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('DESD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PPD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('IGVPRD') As TFloatField).DisplayFormat := '';
      (DMLOG.cdsQry7.FieldByName('PREPROMCIGVD') As TFloatField).DisplayFormat := '';
   End;
  }
End;
// Fin HPC_201802_LOG


// Inicia HPC_201802_LOG
// retira componentes no usados
Procedure TFLPrecio.InicializaCampos;
Begin
   dblcdArticulo.text := '';
   edtArticulo.text := '';
   dblcTMon.text := '';
   edtTMon.text := '';
   dblcTinid.text := '';
   edtTinid.Text := '';
   dblcLinea.text := '';
   edtLinea.text := '';
   dblcFamilia.text := '';
   edtFamilia.text := '';
   dbePrecioG.text := '';
   dblcSUBFAM.text := '';
   dbeSFAM.text := '';
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina Z2bbtnOKClick
Procedure TFLPrecio.Z2bbtnOKClick(Sender: TObject);
Var
   nImp, nImpProm, nImpAct: Double;
Begin

   If Not Consistencia Then Exit;

   If (DMLOG.cdsQry7.fieldbyname('PREVENCIGV').AsFloat < 0) Or (DMLOG.cdsQry7.fieldbyname('PREPROMCIGV').AsFloat < 0) Then
   Begin
      ShowMessage('Precio de Venta debe ser Mayor o Igual a Cero');
      Exit;
   End;

   If FRound(DMLOG.cdsQry7.fieldbyname('PREVENCIGV').AsFloat, 15, 2) < FRound(DMLOG.cdsQry7.fieldbyname('COSTOIGVS').AsFloat, 15, 2) Then
   Begin
      If MessageDlg(' Precio de Venta es Menor a Precio de Costo. ¿ Desea Continuar ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         Exit;
      End;
   End;
   If DMLOG.cdsQry7.fieldbyname('PREPROMCIGV').AsFloat > 0 Then
   Begin
      If FRound(DMLOG.cdsQry7.fieldbyname('PREPROMCIGV').AsFloat, 15, 2) < FRound(DMLOG.cdsQry7.fieldbyname('COSTOIGVS').AsFloat, 15, 2) Then
      Begin
         If MessageDlg(' Precio de Venta de Promoción es Menor a Precio de Costo. ¿ Desea Continuar ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            Exit;
         End;
      End;
   End;

   If wContenido Then
   Begin
      If length(Trim(dbePrecioU.Text)) = 0 Then
         dbePrecioU.Text := '0'
   End;

   Screen.Cursor := crHourGlass;
   DMLOG.cdsLPrecio.edit;
   DMLOG.cdsLPrecio.fieldbyname('ARTDES').AsString := edtArticulo.Text;
   DMLOG.cdsLPrecio.fieldbyname('LPREUSER').AsString := DMLOG.wUsuario; // usuario que registra
   DMLOG.cdsLPrecio.fieldbyname('LPREFREG').AsDateTime := Date; // fecha que registra Usuario

   DMLOG.cdsLPrecio.fieldbyname('LPREHREG').AsDateTime := Date + Time; // Hora de Registro de Usuario
{
  //--
   nImp := StrToFloat('0' + StringReplace(dbePreVta.Text, ',', '', [rfreplaceall]));
   nImpProm := StrToFloat('0' + StringReplace(dbePP.Text, ',', '', [rfreplaceall]));
   If nImpProm > 0 Then
      nImpAct := nImpProm
   Else
      nImpAct := nImp;
  //--
   If DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString = DMLOG.wTMonLoc Then
   Begin
      DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat := nImpAct;
      DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat := nImpAct;
      DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat := 0;
      If wContenido Then
         DMLOG.cdsLPrecio.fieldbyname('LPREPREUMN').AsFloat := DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat;
   End
   Else
      If DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString = DMLOG.wTMonExt Then
      Begin
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat := 0;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat := nImpAct;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat := nImpAct;
         If wContenido Then
            DMLOG.cdsLPrecio.fieldbyname('LPREPREUME').AsFloat := DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat;
      End;
}
(*
   DMLOG.cdsPost(DMLOG.cdsLPrecio);
   DMLOG.cdsLPrecio.Post;

   xSQL := ' Select CIAID, LOCID, TINID, ALMID, TLISTAID, ARTID, ARTCONT, GRARID, FAMID, SFAMID, UNMIDG,'
      + '           UNMIDU, UNMABR, LPRETMONID, LPRETCAM, LPREFINI, LPREVIG, LPREBASGMO, LPREBASGMN,'
      + '           LPREBASGME, LPREBASUMO, LPREBASUMN, LPREBASUME, LPREPINCG, LPREPINCU, LPREVOLMG,'
      + '           LPREVOLMU, LPREPDCTOG, LPREPDCTOU, LPREPREGMO, LPREPREGMN, LPREPREGME, LPREPREUMO,'
      + '           LPREPREUMN, LPREPREUME, LPREDCTO2G, LPREDCTO3G, LPREDCTO4G, LPREDCTO2U, LPREDCTO3U,'
      + '           LPREDCTO4U, CANTMING, CANTMINU, LPREIGV, LPREISC, LPREFLAGD, LPREFREG, LPREHREG, LPREUSER,'
      + '           ARTDES, PREVEN, PREVENPRO, ACTIVO, PREBASE '
      + '      from FAC201 XX '
      + '     where CIAID=' + quotedStr(dblcCia.Text)
      + '       and TINID=' + quotedStr(dblcTinid.Text)
      + '       and ARTID=' + quotedStr(dblcdArticulo.Text)
      + '       and TLISTAID=' + quotedStr(dblcLPrecio.Text);
   DMLOG.cdsLPrecio.DataRequest(xSQL);
   DMLOG.AplicaDatos(DMLOG.cdsLPrecio, 'LPRECIO');
*)
   If DMLOG.wModo = 'A' Then
      xSQL := 'Insert into FAC201(CIAID, TINID, TLISTAID, ARTID, ARTCONT, GRARID, FAMID, SFAMID, UNMIDG, UNMIDU, LPRETMONID, '
         + '                      LPREBASGMO, LPREPDCTOG, LPREPDCTOU, LPREPREGMO, LPREPREGMN, LPREPREGME, LPREPREUMO, CANTMING, '
         + '                      CANTMINU, LPREFLAGD, ARTDES, PREVEN, PREVENPRO, ACTIVO, PREBASE, LPREUSER, LPREFREG, LPREHREG) '
         + '   Values(' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('TINID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('ARTCONT').AsFloat) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('GRARID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('FAMID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('UNMIDG').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('UNMIDU').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREBASGMO').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('CANTMING').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('CANTMINU').AsFloat) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPREFLAGD').AsString) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('ARTDES').AsString) + ','
         + floattostr(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat) + ','
         + floattostr(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('ACTIVO').AsString) + ','
         + floattostr(DMLOG.cdsLPrecio.fieldbyname('PREBASE').AsFloat) + ','
         + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPREUSER').AsString) + ','
         + 'trunc(Sysdate),' // DMLOG.cdsLPrecio.fieldbyname('LPREFREG').AsDateTime
         + 'Sysdate)' // DMLOG.cdsLPrecio.fieldbyname('LPREHREG').AsDateTime
   Else
      xSQL := 'Update FAC201 '
//         + '      Set CIAID='+quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)+','
//         + '          TINID='+quotedstr(DMLOG.cdsLPrecio.FieldByName('TINID').AsString)+','
//         + '          TLISTAID='+quotedstr(DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString)+','
//         + '          ARTID='+quotedstr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString)+','
      + '      Set ARTCONT=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('ARTCONT').AsFloat) + ','
         + '          GRARID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('GRARID').AsString) + ','
         + '          FAMID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('FAMID').AsString) + ','
         + '          SFAMID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString) + ','
         + '          UNMIDG=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('UNMIDG').AsString) + ','
         + '          UNMIDU=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('UNMIDU').AsString) + ','
         + '          LPRETMONID=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPRETMONID').AsString) + ','
         + '          LPREBASGMO=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREBASGMO').AsFloat) + ','
         + '          LPREPDCTOG=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat) + ','
         + '          LPREPDCTOU=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat) + ','
         + '          LPREPREGMO=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsFloat) + ','
         + '          LPREPREGMN=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGMN').AsFloat) + ','
         + '          LPREPREGME=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREGME').AsFloat) + ','
         + '          LPREPREUMO=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsFloat) + ','
         + '          CANTMING=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('CANTMING').Asfloat) + ','
         + '          CANTMINU=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('CANTMINU').AsFloat) + ','
         + '          LPREFLAGD=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPREFLAGD').AsString) + ','
         + '          ARTDES=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('ARTDES').AsString) + ','
         + '          PREVEN=' + floattostr(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat) + ','
         + '          PREVENPRO=' + floattostr(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat) + ','
         + '          ACTIVO=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('ACTIVO').AsString) + ','
         + '          PREBASE=' + floattostr(DMLOG.cdsLPrecio.fieldbyname('PREBASE').AsFloat) + ','
         + '          LPREUSER=' + quotedstr(DMLOG.cdsLPrecio.fieldbyname('LPREUSER').AsString) + ','
         + '          LPREFREG=trunc(Sysdate),'
         + '          LPREHREG=Sysdate'
         + '    where CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
         + '      and TLISTAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString)
         + '      and ARTID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al Actualizar');
      Exit;
   End;

   Screen.Cursor := crDefault;
   ShowMessage('Grabación Exitosa');

   If DMLOG.wModo = 'A' Then
   Begin
      Z2bbtnNuevo.Enabled := True;
      Z2bbtnNuevo.Setfocus;
   End;
   DMLOG.wModo := 'M';
End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.Z2bbtnCancelClick(Sender: TObject);
Begin
   If DMLOG.cdsLPrecio.State = dsInsert Then
      DMLOG.cdsLPrecio.Delete;
   close;
End;

Procedure TFLPrecio.Z2bbtnNuevoClick(Sender: TObject);
Begin
   RegistroNuevo;
   Z2bbtnNuevo.Enabled := False;
End;

Procedure TFLPrecio.RegistroNuevo;
Var
   xWhere: String;
Begin
   pnl1.Enabled := True;
   pnl2.Enabled := True;
   pnl3.Enabled := True;

   DMLOG.cdsLPrecio.Append;

   dblcCia.Text := wCia;

   DMLOG.cdsLPrecio.FieldByName('CIAID').AsString := wCia;
   edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', 'CIAID=' + quotedStr(dblcCia.Text), 'CIADES');
   edtTinid.text := '';
   DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString := wLPe;

// Lista de Precios
   xWhere := 'CIAID=' + QuotedStr(dblcCia.Text) + ' and TLISTAID=' + quotedstr(dblcLPrecio.Text);

   xWhere := 'select TLISTADES from FAC101 where ' + xWhere;
   DMLOG.cdsQry.close;
   DMLOG.cdsQry.datarequest(xWhere);
   DMLOG.cdsQry.Open;
   edtLPrecio.Text := DMLOG.cdsQry.FieldByName('TLISTADES').AsString;

   edtLinea.text := '';
   edtFamilia.text := '';
   dbeSFAM.text := '';
   edtArticulo.text := '';
   edtTMon.text := '';

   gbUmg.Enabled := false;
   gbUmu.Enabled := false;

   DMLOG.cdsLPrecio.fieldbyname('LPREFLAGD').AsString := 'N';
   dblcTinId.SetFocus;
End;

Procedure TFLPrecio.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_Dialogkey, VK_TAB, 0);
   End;
End;

Procedure TFLPrecio.dbeDsctoGExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: double;
   xPBaseG, xIncG, xDsctoG: double;
Begin
   If Not Z2bbtnCancel.focused Then
   Begin
      If xCrea Then Exit;
      xPinc := 0;
      xPDsc := 0;
      xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
      xBase := DMLOG.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
      If xBase = 'S' Then
      Begin
         xPinc := xPBaseG * xIncG;
         xPDsc := xPBaseG * xDsctoG;
         xPrecio := (xPBaseG + xPinc) - xPDsc;
         DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').value := FRound(xPrecio, 15, 2);
      End
      Else
         If xBase = '' Then
         Begin
            dbePrecioG.enabled := true;
            dbePrecioG.setfocus;
         End;
      If wcontenido Then
         dbeUmU.setfocus
      Else
         Z2bbtnOK.setfocus;
   End;
End;

Function TFLPrecio.Consistencia: Boolean;
Begin
// consistencia Para los Topes
   If length(Trim(dbePorcG.Text)) = 0 Then
   Begin
      DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat := 0;
      dbePorcG.Text := '0'
   End;

   If length(Trim(dbePorcU.Text)) = 0 Then
   Begin
      DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat := 0;
      dbePorcU.Text := '0';
   End;

   If dbgTope.ItemIndex = 0 Then
   Begin
      If (StrtoFloat(dbePorcG.Text) < 0) Or (StrtoFloat(dbePorcG.Text) > 100) Then
         Raise exception.Create('Porcentaje No Valido');
      If wContenido Then
      Begin
         If (StrtoFloat(dbePorcU.Text) < 0) Or (StrtoFloat(dbePorcU.Text) > 100) Then
            Raise exception.Create('Porcentaje No Valido');
      End;
   End;

// consistencia Compañia
   If length(dblcCia.Text) = 0 Then
      Raise exception.Create('Falta Código de Compañia');
   If length(edtCia.Text) = 0 Then
      Raise exception.Create('Código de Compañia Errado');

// consistencia Código de Lista de Precios
   If length(dblcLPrecio.Text) = 0 Then
      Raise exception.Create('Falta Lista de Precios');
   If length(edtLPrecio.Text) = 0 Then
      Raise exception.Create('Código de Lista Errado');

// consistencia Código de Línea de Articulo
   If length(dblcLinea.Text) = 0 Then
      Raise exception.Create('Falta Línea de Artículo');
   If length(edtLinea.Text) = 0 Then
      Raise exception.Create('Código de Línea de Artículo Errado');

// consistencia Código de Tipo de Inventario
   If length(dblcTinid.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Inventario');
   If length(edtLinea.Text) = 0 Then
      Raise exception.Create('Código de Tipo de Inventario Errado');

// consistencia Codigo de Articulo
   If length(dblcdArticulo.Text) = 0 Then
      Raise exception.Create('Falta Articulo');
   If length(edtArticulo.Text) = 0 Then
      Raise exception.Create('Código de Articulo Errado');

// consistencia Codigo Moneda
   If length(dblcTmon.Text) = 0 Then
      Raise exception.Create('Falta Código de Moneda');
   If length(edtTmon.Text) = 0 Then
      Raise exception.Create('Código de Moneda Errado');

   Result := True;
End;

Procedure TFLPrecio.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Try
      FormatoImportes('');
      DMLOG.cdsLPrecio.CancelUpdates;
      dbeCostoIGVS.DataSource := Nil;
      dbeCostoIGVS.DataField := '';

      If DMLOG.wTipoAdicion = 'xFiltro' Then
      Begin
         If DMLOG.cdsLPrecio.recordcount > 0 Then
            ActualizaLista(GLPrecio, DMLOG.cdsLPrecio, DMLOG.wModo);
      End;

      DMLOG.cdsArti.Filtered := False;
   Except
   End
End;

// Inicia HPC_201802_LOG
// cambio de rutina ActualizaLista
Procedure TFLPrecio.ActualizaLista(wwFiltro: TMant; wwCdsLee: TwwClientDataSet; wwAccion: String);
Var
   i: integer;
   wlAno, wlMes, wlDia: word;
   xStock: String;
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

      xSQL := ' Select ' + DMLOG.wRepFecServi + ' FECHA from TGE901 ';
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;

      DecodeDate(strtodate(datetostr(DMLOG.cdsQry.fieldbyname('FECHA').AsDateTime)), wlAno, wlMes, wlDia);

      xSQL := ' Select STKFIN STKALM '
         + '      from LOG319 '
         + '     Where CIAID=' + quotedstr(dblcCia.Text)
         + '       and ARTID=' + quotedstr(dblcdArticulo.Text)
         + '       and LOGANOMM=' + quotedstr(inttostr(wlAno) + DMLOG.StrZero(inttostr(wlMes), 2));
      DMLOG.cdsQry.Close;
      DMLOG.cdsQry.DataRequest(xSQL);
      DMLOG.cdsQry.Open;
      xStock := DMLOG.cdsQry.FieldByName('STKALM').AsString;
   End;

   If wwAccion = 'M' Then
   Begin
      wwFiltro.FMant.cds2.Edit;
   End;

   If (wwAccion = 'A') Or (wwAccion = 'M') Then
   Begin
      If (wwAccion = 'A') Then
      Begin
         wwFiltro.FMant.cds2.FieldByname('CIAID').AsString := DMLOG.cdsLPrecio.FieldByName('CIAID').AsString;
         wwFiltro.FMant.cds2.FieldByname('TINID').AsString := DMLOG.cdsLPrecio.FieldByName('TINID').AsString;
         wwFiltro.FMant.cds2.FieldByname('TLISTAID').AsString := DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString;
         wwFiltro.FMant.cds2.FieldByname('GRARID').AsString := DMLOG.cdsLPrecio.FieldByName('GRARID').AsString;
         wwFiltro.FMant.cds2.FieldByname('FAMID').AsString := DMLOG.cdsLPrecio.FieldByName('FAMID').AsString;
         wwFiltro.FMant.cds2.FieldByname('SFAMID').AsString := DMLOG.cdsLPrecio.FieldByName('SFAMID').AsString;
         wwFiltro.FMant.cds2.FieldByname('ARTID').AsString := DMLOG.cdsLPrecio.FieldByName('ARTID').AsString;
         wwFiltro.FMant.cds2.FieldByname('ARTDES').AsString := edtArticulo.Text;
         wwFiltro.FMant.cds2.FieldByname('ARTCONT').AsString := DMLOG.cdsLPrecio.FieldByName('ARTCONT').AsString;
         wwFiltro.FMant.cds2.FieldByname('UNMIDG').AsString := DMLOG.cdsLPrecio.FieldByName('UNMIDG').AsString;
         wwFiltro.FMant.cds2.FieldByname('UNMIDU').AsString := DMLOG.cdsLPrecio.FieldByName('UNMIDU').AsString;
         wwFiltro.FMant.cds2.FieldByname('LPRETMONID').AsString := DMLOG.cdsLPrecio.FieldByName('LPRETMONID').AsString;
         wwFiltro.FMant.cds2.FieldByname('STKALM').AsString := xStock;
         wwFiltro.FMant.cds2.FieldByname('STKEXHIB').AsString := '0';
         wwFiltro.FMant.cds2.FieldByname('STKOTROS').AsString := '0';
         wwFiltro.FMant.cds2.FieldByname('STKTOTAL').AsString := '0';
         wwFiltro.FMant.cds2.FieldByname('COSTOMN').AsString := StringReplace(dbeCostoFinalMN.Text, ',', '', [rfreplaceall]);
         wwFiltro.FMant.cds2.FieldByname('COSTOME').AsString := StringReplace(dbeCostoFinalME.Text, ',', '', [rfreplaceall]);
      End;

      wwFiltro.FMant.cds2.FieldByname('TMONABR').AsString := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONABR', 'TMONID=''' + dblcTMon.Text + '''', 'TMONABR');
      wwFiltro.FMant.cds2.FieldByname('LPREPREGMO').AsString := StringReplace(DMLOG.cdsLPrecio.fieldbyname('LPREPREGMO').AsString, ',', '', [rfreplaceall]);
      wwFiltro.FMant.cds2.FieldByname('LPREPREUMO').AsString := StringReplace(DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').AsString, ',', '', [rfreplaceall]);
      wwFiltro.FMant.cds2.FieldByname('LPREPDCTOG').AsString := DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsString;

      If DMLOG.cdsLPrecio.FieldByName('LPRETMONID').AsString = DMLOG.wTMonLoc Then
      Begin

         wwFiltro.FMant.cds2.FieldByname('PRECIOMN').AsString := '0.00';

         If (dbePrePromCIGV.Text = '0.00') Or (dbePrePromCIGV.Text = '0') Then
         Begin
            wwFiltro.FMant.cds2.FieldByname('LPREPREGIGV').AsString := StringReplace(dbePreVtaCIGV.Text, ',', '', [rfreplaceall]);
            wwFiltro.FMant.cds2.FieldByname('PRECIOME').AsString := StringReplace(dbePreVtaCIGVD.Text, ',', '', [rfreplaceall]);
         End
         Else
         Begin
            wwFiltro.FMant.cds2.FieldByname('LPREPREGIGV').AsString := StringReplace(dbePrePromCIGV.Text, ',', '', [rfreplaceall]);
            wwFiltro.FMant.cds2.FieldByname('PRECIOME').AsString := StringReplace(dbePrePromCIGVD.Text, ',', '', [rfreplaceall]);
         End;

      End
      Else
      Begin

         wwFiltro.FMant.cds2.FieldByname('PRECIOME').AsString := '0.00';

         If (dbePrePromCIGV.Text = '0.00') Or (dbePrePromCIGV.Text = '0') Then
         Begin
            wwFiltro.FMant.cds2.FieldByname('LPREPREGIGV').AsString := StringReplace(dbePreVtaCIGV.Text, ',', '', [rfreplaceall]);
            wwFiltro.FMant.cds2.FieldByname('PRECIOMN').AsString := StringReplace(dbePreVtaCIGVD.Text, ',', '', [rfreplaceall]);
         End
         Else
         Begin
            wwFiltro.FMant.cds2.FieldByname('LPREPREGIGV').AsString := StringReplace(dbePrePromCIGV.Text, ',', '', [rfreplaceall]);
            wwFiltro.FMant.cds2.FieldByname('PRECIOMN').AsString := StringReplace(dbePrePromCIGVD.Text, ',', '', [rfreplaceall]);
         End;

      End;
   End;

   If wwFiltro.FMant.cds2.State In [dsInsert, dsEdit] Then
      wwFiltro.FMant.cds2.Post;
End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.dbeDsctoUExit(Sender: TObject);
Var
   xWhere, xBase: String;
   xPinc, xPdsc, xPrecio: real;
   xPBaseU, xIncU, xDsctoU: double;
Begin
   xPinc := 0;
   xPDsc := 0;
   xWhere := 'TLISTAID=''' + dblcLPrecio.Text + '''';
   xBase := DMLOG.BuscaQry('dspTLista', 'FAC101', '*', xWhere, 'TLISTABASE');
   If xBase = 'S' Then
   Begin
      xPinc := xPBaseU * xIncU;
      xPDsc := xPBaseU * xDsctoU;
      xPrecio := xPBaseU + xPinc - xPDsc;
      DMLOG.cdsLPrecio.fieldbyname('LPREPREUMO').value := FRound(xPrecio, 15, 2);
   End
   Else
      If xBase = '' Then
      Begin
         dbePrecioU.enabled := true;
         dbePrecioU.setfocus;
      End;
End;

// Inicia HPC_201802_LOG
// retiro de rutina dbeTcamExit
{
Procedure TFLPrecio.dbeTcamExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   dbePrecioG.Enabled := true;
   dbePrecioG.SetFocus;
End;
}
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina dbePrecioGExit
Procedure TFLPrecio.dbePrecioGExit(Sender: TObject);
Begin
   If DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat < 0 Then
   Begin
      ShowMessage('Precio No puede ser menor a 0(cero) ');
      dbePrecioG.SetFocus;
      exit;
   End;
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// retiro de rutina dbeVigenciaExit
{
Procedure TFLPrecio.dbeVigenciaExit(Sender: TObject);
Begin
   If xCrea Then Exit;
End;
}
// Fin HPC_201802_LOG

Procedure TFLPrecio.dblcTinidExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;

   If (length(dblcTinid.text) = 0) And (dblcdArticulo.Focused) Then exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and TINID=' + quotedstr(dblcTinid.text);

   edtTinid.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', xWhere, 'TINDES');
   If length(edtTinid.text) = 0 Then
   Begin
      Showmessage('Ingrese el Tipo de Inventario');
      dblcTinid.SetFocus;
      exit;
   End;

   xSQL := 'Select * from TGE151 where ' + xWhere;
   DMLOG.cdsALM.Close;
   DMLOG.cdsALM.DataRequest(xSQL);
   DMLOG.cdsALM.open;

   xSQL := 'Select * from TGE131 where ' + xWhere;
   DMLOG.cdsGArti.Close;
   DMLOG.cdsGArti.DataRequest(xSQL);
   DMLOG.cdsGArti.Open;
End;

Procedure TFLPrecio.dblcLineaExit(Sender: TObject);
Begin
   If xCrea Then exit;

   If length(dblcLinea.text) = 0 Then
   Begin
      exit;
   End;

   edtLinea.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE131', 'GRARDES', 'CIAID=' + quotedStr(dblcCia.Text) + ' AND GRARID=' + quotedstr(dblcLinea.Text), 'GRARDES');

   If length(edtLinea.text) = 0 Then
   Begin
      Showmessage('Código de Línea de Artículo Errado');
      dblcLinea.SetFocus;
      exit;
   End;

   xSQL := ' Select * '
      + '      from TGE169 '
      + '     where CIAID=' + quotedStr(dblcCia.Text)
      + '       and TINID=' + quotedStr(dblcTinid.Text)
      + '       and GRARID=' + quotedStr(dblcLinea.Text);
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.DataRequest(xSQL);
   DMLOG.cdsFAM.Open;
End;

Procedure TFLPrecio.dblcFamiliaExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If xCrea Then exit;
   sSQL := 'CIAID=' + QuotedsTr(dblcCia.text)
      + ' and GRARID=' + quotedstr(dblcLinea.text)
      + ' and TINID =' + quotedstr(dblcTINID.text)
      + ' and FAMID =' + quotedstr(dblcFamilia.text);
   edtFamilia.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE169', 'FAMDES', sSQL, 'FAMDES');

   sSQL := 'Select * '
      + '     from TGE170 '
      + '    where TGE170.CIAID=' + QuotedStr(dblcCia.text)
      + '      and TGE170.GRARID=' + QuotedStr(dblcLinea.text)
      + '      and TGE170.TINID=' + QuotedStr(dblcTINID.text)
      + '      and TGE170.FAMID=' + QuotedStr(dblcFamilia.text);
   DMLOG.cdsSUBFAM.Close;
   DMLOG.cdsSUBFAM.DataRequest(sSQL);
   DMLOG.cdsSUBFAM.Open;
End;

Procedure TFLPrecio.FormCreate(Sender: TObject);
Begin
   DMLOG.cdsTINID.Close;
   DMLOG.cdsTINID.Open;
   xSQL := 'Select * from TGE131 where CIAID=' + quotedStr(FLisPre.dblcCia.Text);
   DMLOG.cdsGArti.Close;
   DMLOG.cdsGArti.DataRequest(xSQL);
   DMLOG.cdsGArti.Open;
   xSQL := 'Select * from TGE169 where CIAID=' + quotedStr(FLisPre.dblcCia.Text);
   DMLOG.cdsFAM.Close;
   DMLOG.cdsFAM.DataRequest(xSQL);
   DMLOG.cdsFAM.Open;
// Inicio HPC_201702_LOG
// 19/07/2017 Se otorga propiedades a objetos de datos
// datos generales del artículo
   // Compañía
   dblcCia.DataSource := DMLOG.dsLPrecio;
   dblcCia.DataField := 'CIAID';
   dblcCia.LookupTable := DMLOG.cdsCIA;
   dblcCia.LookupField := 'CIAID';
   // T.Inventario
   dblcTinid.DataSource := DMLOG.dsLPrecio;
   dblcTinid.DataField := 'TINID';
   dblcTinid.LookupTable := DMLOG.cdsTINID;
   dblcTinid.LookupField := 'TINID';
   // Lista de Precios
   dblcLPrecio.DataSource := DMLOG.dsLPrecio;
   dblcLPrecio.DataField := 'TLISTAID';
   dblcLPrecio.LookupTable := DMLOG.cdsTLista;
   dblcLPrecio.LookupField := 'TLISTAID';
   // Línea
   dblcLinea.DataSource := DMLOG.dsLPrecio;
   dblcLinea.DataField := 'GRARID';
   dblcLinea.LookupTable := DMLOG.cdsGArti;
   dblcLinea.LookupField := 'GRARID';
   // Familia
   dblcFamilia.DataSource := DMLOG.dsLPrecio;
   dblcFamilia.DataField := 'FAMID';
   dblcFamilia.LookupTable := DMLOG.cdsFAM;
   dblcFamilia.LookupField := 'FAMID';
   // Sub Familia
   dblcSUBFAM.DataSource := DMLOG.dsLPrecio;
   dblcSUBFAM.DataField := 'SFAMID';
   dblcSUBFAM.LookupTable := DMLOG.cdsSUBFAM;
   dblcSUBFAM.LookupField := 'SFAMID';
   // Artículo
   dblcdArticulo.DataSource := DMLOG.dsLPrecio;
   dblcdArticulo.DataField := 'ARTID';
   dblcdArticulo.LookupTable := DMLOG.cdsArti;
   dblcdArticulo.LookupField := 'ARTID';
   // Tipo de Moneda
   dblcTMon.DataSource := DMLOG.dsLPrecio;
   dblcTMon.DataField := 'LPRETMONID';
   dblcTMon.LookupTable := DMLOG.cdsTMoneda;
   dblcTMon.LookupField := 'TMONID';

// Fin HPC_201702_LOG
End;

Procedure TFLPrecio.dblcTVtaNotInList(Sender: TObject; LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFLPrecio.dbgTopeClick(Sender: TObject);
Begin
   If dbgTope.ItemIndex = 0 Then
   Begin
      dbePorcG.Enabled := True;
      If wContenido Then
         dbePorcU.Enabled := True
      Else
         dbePorcU.Enabled := False;
   End
   Else
   Begin
      If DMLOG.cdsLPrecio.State <> dsEdit Then
         DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOG').AsFloat := 0;
      DMLOG.cdsLPrecio.fieldbyname('LPREPDCTOU').AsFloat := 0;
      dbePorcG.Text := '0';
      dbePorcU.Text := '0';
      dbePorcG.Enabled := False;
      dbePorcU.Enabled := False;
   End;
End;

Procedure TFLPrecio.dblcSUBFAMExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If length(dblcSUBFAM.text) = 0 Then exit;
   sSQL := 'CIAID=' + QuotedsTr(dblcCia.text)
      + ' and GRARID=' + quotedstr(dblcLinea.text)
      + ' and TINID =' + quotedstr(dblcTINID.text)
      + ' and FAMID =' + quotedstr(dblcFamilia.text)
      + ' and SFAMID=' + quotedstr(dblcSUBFAM.text);
   dbeSFAM.text := DMLOG.BuscaQry('dspUltTGE', 'TGE170', 'SFAMDES', sSQL, 'SFAMDES');
End;

Procedure TFLPrecio.dbeMinGExit(Sender: TObject);
Begin
   If Length(Trim(dbeMinG.Text)) = 0 Then
   Begin
      DMLOG.cdsLPrecio.Edit;
      DMLOG.cdsLPrecio.fieldbyname('CANTMING').AsString := '0';
   End;
End;

// Inicia HPC_201802_LOG
// cambio de rutina FormShow
Procedure TFLPrecio.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
   xCrea := true;
   IniciaDatos;
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina dblcdArticuloEnter
Procedure TFLPrecio.dblcdArticuloEnter(Sender: TObject);
Begin
   xSQL := ' Select * '
      + '      from (Select A.ARTID, A.ARTDES, A.ARTABR, A.ARTCONT, A.CIAID, '
      + '                   A.TINID, A.GRARID, A.FAMID, A.SFAMID, '
//      + '                   A.UNMIDG, A.ARTPCG, A.UNMIDU, B.ARTID LPRECIOS '
   + '                   A.UNMIDG, A.ARTCPROG, A.UNMIDU, B.ARTID LPRECIOS '
      + '              from TGE205 A,FAC201 B '
      + '             where A.CIAID=' + QuotedStr(dblcCia.Text);
   If length(trim(dblcTinid.Text)) > 0 Then
      xSQL := xSQL + '  and A.TINID=' + QuotedStr(dblcTinid.Text);
   If Length(Trim(dblcLinea.Text)) > 0 Then
      xSQL := xSQL + '  and A.GRARID=' + QuotedStr(dblcLinea.Text);
   If Length(Trim(dblcFamilia.Text)) > 0 Then
      xSQL := xSQL + '  and A.FAMID=' + QuotedStr(dblcFamilia.Text);
   If Length(Trim(dblcSUBFAM.Text)) > 0 Then
      xSQL := xSQL + '  and A.SFAMID=' + QuotedStr(dblcSUBFAM.Text);
   xSQL := xSQL
      + '               and B.CIAID(+)=A.CIAID and B.TLISTAID(+)=' + quotedstr(dblcLPrecio.Text)
      + '               and B.ARTID(+)=A.ARTID '
      + '            ) XX '
      + '     where LPRECIOS is null ';
   DMLOG.cdsArti.IndexFieldNames := '';
   DMLOG.cdsArti.close;
   DMLOG.cdsArti.DataRequest(xSQL);
   DMLOG.cdsArti.IndexFieldNames := 'CIAID;TINID;ARTID';
   DMLOG.cdsArti.open;

   dblcdArticulo.Selected.Clear;
   dblcdArticulo.Selected.Add('ARTID'#9'9'#9'Código');
   dblcdArticulo.Selected.Add('ARTDES'#9'30'#9'Artículo');
   dblcdArticulo.Selected.Add('GRARID'#9'5'#9'Línea');
   dblcdArticulo.Selected.Add('FAMID'#9'5'#9'Fam.');
   dblcdArticulo.Selected.Add('SFAMID'#9'5'#9'Sub Fam.');
   dblcdArticulo.Selected.Add('UNMIDG'#9'3'#9'U.M');
   dblcdArticulo.Selected.Add('LPREPREGMO'#9'9'#9'Precio Vta.');
End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.dblcLineaEnter(Sender: TObject);
Begin
   If length(trim(edtTinid.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero el Tipo de Inventario');
      dblcTinid.SetFocus;
      exit;
   End;
End;

Procedure TFLPrecio.dblcFamiliaEnter(Sender: TObject);
Begin
// Verifica Tipo de Inventario
   If length(trim(edtTinid.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero el Tipo de Inventario');
      dblcTinid.SetFocus;
      exit;
   End;
// Verifica Línea o Grupo
   If length(trim(edtLinea.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero la Línea de Productos');
      dblcLinea.SetFocus;
      exit;
   End;
End;

Procedure TFLPrecio.dblcSUBFAMEnter(Sender: TObject);
Begin
// Verifica Tipo de Inventario
   If length(trim(edtTinid.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero el Tipo de Inventario');
      dblcTinid.SetFocus;
      exit;
   End;
// Verifica Línea o Grupo
   If length(trim(edtLinea.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero la Línea de Productos');
      dblcLinea.SetFocus;
      exit;
   End;
// Verifica Familia
   If length(trim(edtFamilia.Text)) = 0 Then
   Begin
      ShowMessage('Debe registrar primero la Línea de Productos');
      dblcFamilia.SetFocus;
      exit;
   End;
End;

// Inicia HPC_201802_LOG
// cambio de rutina CalculaMontosDetalle
Procedure TFLPrecio.CalculaMontosDetalle(cOrigen: String);
Var
   dCosto, xbase: Double;
Begin
   DMLOG.cdsQry7.Edit;
   DMLOG.cdsLPrecio.Edit;

   If dblcTMon.Text = DMLOG.wTMonExt Then
      dCosto := DMLOG.cdsQry7.FieldByName('COSTOPROMME').AsFloat
   Else
      dCosto := DMLOG.cdsQry7.FieldByName('COSTOPROMMN').AsFloat;

   If DMLOG.cdsQry7.FieldByName('FLGSERV').AsString = 'N' Then
      DMLOG.cdsQry7.FieldByName('TASASRV').AsFloat := 0;

   If (cOrigen = 'DesdeDatosTabla') Then
   Begin
   // Base Imponible
      DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat, 15, 2);
   // IGV
      DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (dIGV / 100), 15, 2);
   // Servicio
      DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (DMLOG.cdsQry7.FieldByName('TASASRV').AsFloat / 100), 15, 2);
   // Precio de Venta con IGV
      DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat
         + DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat
         + DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat;

   // Base Imponible de Precio de Venta de Promoción
      DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat, 15, 2);
   // Precio de Venta de Promoción con IGV
      DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat * (1 + (dIGV / 100)), 15, 4);
   // IGV Precio de Venta de Promoción
      DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat := DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat
         - DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
   End;

   If (cOrigen = 'PreVta') Then
   Begin
   // IGV
      DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (dIGV / 100), 15, 2);
   // Servicio
      DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (DMLOG.cdsQry7.FieldByName('TASASRV').AsFloat / 100), 15, 2);
   // Precio de Venta con IGV
      DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat
         + DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat
         + DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat;
   // Si no es DM-Plaza el Precio de Venta de Promoción se inicializa con el Precio de Venta Normal
      If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString <> '04' Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
         DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat := DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat;
         DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat := DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat;
      End;	
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMN').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
// Fin HPC_201803_LOG
   End;

   If (cOrigen = 'PreVtaCIGV') Then
   Begin
   // Base Imponible
      xbase := (1 + (dIGV + DMLOG.cdsQry7.FieldByName('TASASRV').AsFloat) / 100);
      DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat
         / xBase, 15, 4);
   // IGV
      DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (dIGV / 100), 15, 2);
   // Servicio
      DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (DMLOG.cdsQry7.FieldByName('TASASRV').AsFloat / 100), 15, 2);
   // Si no es DM-Plaza el Precio de Venta de Promoción se inicializa con el Precio de Venta Normal
      If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString <> '04' Then
      Begin
         DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
         DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat := DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat;
         DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat := DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat;
      End;			 
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMN').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;
// Fin HPC_201803_LOG
   End;

   If (cOrigen = 'PrePromCIGV') Then
   Begin
   // Base Imponible
      If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString = '04' Then
         DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat / (1 + (dIGV / 100)), 15, 3)
      Else
         DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat / (1 + (dIGV / 100)), 15, 4);
   // IGV Precio de Venta de Promoción
      DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat := DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat
         - DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
   // Para la Cia 04 DM Plaza - Se iguala los datos del Precio de Venta de Promoción con el Precio de Venta Regular
      If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString = '04' Then
      Begin
      // Base Imponible
         DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
      // IGV
         DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat;
      // Servicio
         DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat := 0.00;
      // Precio de Venta con IGV
         DMLOG.cdsQry7.fieldbyname('PREVENCIGV').AsFloat := DMLOG.cdsQry7.fieldbyname('PREPROMCIGV').AsFloat;
      End;
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMN').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat;
// Fin HPC_201803_LOG
   End;

// La UTILIDAD siempre se cálcula
// Utilidad
   DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat - dCosto, 15, 2);
   If DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat > 0 Then
      DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / dCosto) * 100, 15, 2)
   Else
   Begin
      DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := 0;
   End;
// El Importe y Porcentaje de Incremento/Descuento respecto al Precio Base siempre se calcula
// Incremento / Descuento del Precio de Venta de Promoción respecto al Precio Base
   If DMLOG.cdsLPrecio.FieldByName('PREBASE').AsFloat = 0 Then
      DMLOG.cdsLPrecio.FieldByName('PREBASE').AsFloat := DMLOG.cdsQry7.fieldbyname('PREVENCIGV').AsFloat;

   DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREBASE').AsFloat
      - DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat, 15, 2);
   If DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat > 0 Then
      lblDctoIncrPorProm.Caption := 'Descuento'
   Else
      lblDctoIncrPorProm.Caption := 'Incremento';
   If DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat <> 0 Then
      DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat
         / DMLOG.cdsLPrecio.FieldByName('PREBASE').AsFloat) * 100, 15, 2)
   Else
   Begin
      DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := 0;
   End;

{
   If (DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat = 0) And (DMLOG.cdsQry7.FieldByName('OBSEQUIO').AsString <> 'S') Then
   Begin
      If DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat <= 0 Then
         DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := dCosto
      Else
         DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat;
   End;

   If (cOrigen = 'PreVtaCIGV') Then
   Begin
      DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat / (1 + ((dIGV + dServicio) / 100)), 15, 5);
   End;

   If dCosto = 0 Then
      dCosto := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat;

   If (cOrigen = 'PUT') Then
      DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat * dCosto) / 100, 15, 2);

   If (cOrigen = 'PreVta') Or (cOrigen = 'PreVtaCIGV') Then
   Begin
      DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat - dCosto;
      If dCosto > 0 Then
         DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / dCosto) * 100, 15, 2);
   End
   Else
   Begin
      If dCosto > 0 Then
         DMLOG.cdsQry7.FieldByName('PORUTI').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / dCosto) * 100, 15, 2);

      If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString = '04' Then
         DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto), 15, 2)
      Else
         DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto), 15, 4);
   End;

   DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat := FRound((DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (dIGV / 100)), 15, 2);
   DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * (dServicio / 100), 15, 2);
   DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat := FRound(FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat, 15, 2) + DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat, 15, 2);

   If (cOrigen = 'PDE') Then
   Begin
      If DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat <> 0 Then
         DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat := FRound((DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * DMLOG.cdsQry7.FieldByName('PORDES').AsFloat) / 100, 15, 2)
      Else
         DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat := DMLOG.cdsQry7.FieldByName('PORDES').AsFloat;
   End;

   If (DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat <> 0) Or (DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat > 0) Then
   Begin
      If (cOrigen = 'PreVta') Or (cOrigen = 'PP') Or (cOrigen = 'PrePromCIGV') Then
      Begin
         DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat - DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat, 15, 2);
         If DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat <> 0 Then
            DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat / DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat) * 100, 15, 2)
         Else
            DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat;
      End
      Else
      Begin
         If DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat <> 0 Then
            DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat / DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat) * 100, 15, 2)
         Else
            DMLOG.cdsQry7.FieldByName('PORDES').AsFloat := DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat;

         If DMLOG.cdsLPrecio.FieldByname('CIAID').AsString = '04' Then
            DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto) - DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat, 15, 2)
         Else
            DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto) - DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat, 15, 4);
      End;
   End;

   DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat := FRound((DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat * (dIGV / 100)), 15, 3); //rmz

//   DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat := DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat + StrToFloat(dbePorServ.Text);

   DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat := DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat
      + DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat
      + DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat;

   If (cOrigen <> 'PrePromCIGV') Then
   Begin
      DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat + DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat, 15, 2);
      DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := FRound((DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat + dCosto) - DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat, 15, 4);
   End
   Else
   Begin
      if DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat>0 then
         DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat/1.18, 15, 4)
      else
         DMLOG.cdsLPrecio.FieldByName('LPREPREGMO').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat, 15, 4);
   End;
}
   DMLOG.cdsLPrecio.Post;

   If DMLOG.cdsQry6.FieldByName('TCD').AsFloat > 0 Then
   Begin
      If dblcTMon.Text = DMLOG.wTMonExt Then
      Begin
         If DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat > 0 Then
            DMLOG.cdsQry7.FieldByName('UTID').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PVD').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('IGVPVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PREVENCIGVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         If DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat > 0 Then
            DMLOG.cdsQry7.FieldByName('DESD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PPD').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('IGVPRD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PREPROMCIGVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PPSERVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat * DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
      End
      Else
      Begin
         If DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat > 0 Then
            DMLOG.cdsQry7.FieldByName('UTID').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('UTILIDAD').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PVD').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVEN').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('IGVPVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('IGVPV').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PREVENCIGVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREVENCIGV').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         If DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat > 0 Then
            DMLOG.cdsQry7.FieldByName('DESD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('DESCUENTO').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PPD').AsFloat := FRound(DMLOG.cdsLPrecio.FieldByName('PREVENPRO').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('IGVPRD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('IGVPROM').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PREPROMCIGVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PREPROMCIGV').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
         DMLOG.cdsQry7.FieldByName('PPSERVD').AsFloat := FRound(DMLOG.cdsQry7.FieldByName('PPSERV').AsFloat / DMLOG.cdsQry6.FieldByName('TCD').AsFloat, 15, 2);
      End;
   End
   Else
   Begin
      DMLOG.cdsQry7.FieldByName('UTID').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PVD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('IGVPVD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PREVENCIGVD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('DESD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PPD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('IGVPRD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PREPROMCIGVD').AsFloat := 0;
      DMLOG.cdsQry7.FieldByName('PPSERVD').AsFloat := 0;
   End;

   DMLOG.cdsQry7.Post;
End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.dbeUtilidadExit(Sender: TObject);
Begin
   CalculaMontosDetalle('UTI');
End;

Procedure TFLPrecio.dbePorUtiExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PUT');
End;

// Inicia HPC_201802_LOG
// cambio de rutina dbePreVtaExit
Procedure TFLPrecio.dbePreVtaExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PreVta');
   Z2bbtnOK.SetFocus;
End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.dbeDescuentoExit(Sender: TObject);
Begin
   CalculaMontosDetalle('DES');
End;

Procedure TFLPrecio.dbePorDesExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PDE');
End;

// Inicia HPC_201802_LOG
// cambio de rutina dbePrePromExit
Procedure TFLPrecio.dbePrePromExit(Sender: TObject);
Begin
   CalculaMontosDetalle('PP');
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina dbePreVtaCIGVExit
Procedure TFLPrecio.dbePreVtaCIGVExit(Sender: TObject);
Begin
   If DMLOG.cdsQry7.FieldByname('PREVENCIGV').Asfloat < 0 Then
   Begin
      ShowMessage('El Precio de Venta al Publico debe ser Negativo');
      dbePreVtaCIGV.SetFocus;
      Exit;
   End;
   CalculaMontosDetalle('PreVtaCIGV');
   Z2bbtnOK.SetFocus;
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina dbePrePromCIGVExit
Procedure TFLPrecio.dbePrePromCIGVExit(Sender: TObject);
Begin
   If DMLOG.cdsQry7.FieldByname('PREPROMCIGV').Asfloat < 0 Then
   Begin
      ShowMessage('El Precio de Venta al Publico no puede ser Negativo');
      dbePrePromCIGV.SetFocus;
      Exit;
   End;
   CalculaMontosDetalle('PrePromCIGV');
   Z2bbtnOK.SetFocus;
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina bbtnCPVClick
Procedure TFLPrecio.bbtnCPVClick(Sender: TObject);
Begin
   If dbeCostoFinalMN.Text = '' Then
   Begin
      ShowMessage('Articulo no tiene Precio de Ultima Compra');
      Exit;
   End;

   If ActualizaListaDePrecio Then
      ShowMessage('Precio de Venta Actualizado');
End;
// Fin HPC_201802_LOG

// Inicia HPC_201802_LOG
// cambio de rutina ActualizaListaDePrecio
Function TFLPrecio.ActualizaListaDePrecio: Boolean;
Var
   nImp, nImpProm: Double;
Begin
   Result := False;
//   xSQL := ' Select B.NISAFREG, B.NISAID, A.ARTID, KDXCNTG, NVL(D.ARTPCG,0) ARTPCGS, '
   xSQL := ' Select B.NISAFREG, B.NISAID, A.ARTID, KDXCNTG, NVL(D.ARTCPROG,0) ARTPCGS, '
//      + '           ROUND( NVL(D.ARTPCG,0)/C.TCAMVBV ,2) ARTPCGD '
   + '           ROUND( NVL(D.ARTCPROG,0)/C.TCAMVBV ,2) ARTPCGD '
      + '      from LOG315 A, LOG314 B, TGE107 C,TGE205 D, TGE208 '
      + '     where A.CIAID=''' + dblcCia.Text + ''' '
      + '       and A.TINID=''' + dblcTinid.Text + ''' '
      + '       and A.ARTID=''' + dblcdArticulo.Text + ''' '
      + '       and A.NISATIP=''INGRESO'' and A.NISAFREG>=''01/01/2005'' '
      + '       and TGE208.TRIID(+)=A.TRIID and TGE208.TRISGT(+)=''I'' and TGE208.ACTCOSPRO=''S'' '
      + '       and A.CIAID=B.CIAID and A.TINID=B.TINID and A.TDAID=B.TDAID and A.ALMID=B.ALMID '
      + '       and A.NISATIP=B.NISATIP and A.NISAID=B.NISAID and B.NISSIT=''ACEPTADO'' '
      + '       and B.NISAFREG=C.FECHA(+) '
      + '       and A.CIAID=D.CIAID(+) and A.TINID=D.TINID(+) and A.GRARID=D.GRARID(+) and A.ARTID=D.ARTID(+) '
      + '     order BY B.NISAFREG DESC, B.NISAID DESC';
   DMLOG.cdsQry1.Close;
   DMLOG.cdsQry1.IndexfieldNames := '';
   DMLOG.cdsQry1.Filter := '';
   DMLOG.cdsQry1.Filtered := False;
   DMLOG.cdsQry1.DataRequest(xSQL);
   DMLOG.cdsQry1.Open;

   If DMLOG.cdsQry1.Recordcount <= 0 Then
   Begin
//      xSQL := 'Select B.NISAFREG, B.NISAID, A.ARTID, KDXCNTG, NVL(D.ARTPCG,0) ARTPCGS, '
      xSQL := 'Select B.NISAFREG, B.NISAID, A.ARTID, KDXCNTG, NVL(D.ARTCPROG,0) ARTPCGS, '
//         + '          ROUND( NVL(D.ARTPCG,0)/C.TCAMVBV ,2) ARTPCGD '
      + '          ROUND( NVL(D.ARTCPROG,0)/C.TCAMVBV ,2) ARTPCGD '
         + '     from LOG315 A, LOG314 B, TGE107 C,TGE205 D, TGE208 '
         + '    where A.CIAID=''' + dblcCia.Text + ''' '
         + '      and A.TINID=''' + dblcTinid.Text + ''' '
         + '      and A.ARTID=''' + dblcdArticulo.Text + ''' '
         + '      and A.NISATIP=''INGRESO'' and A.NISAFREG>=''01/01/2003'' '
         + '      and TGE208.TRIID(+)=A.TRIID and TGE208.TRISGT(+)=''I'' and TGE208.ACTCOSPRO=''S'' '
         + '      and A.CIAID=B.CIAID and A.TINID=B.TINID and A.TDAID=B.TDAID and A.ALMID=B.ALMID '
         + '      and A.NISATIP=B.NISATIP and A.NISAID=B.NISAID and B.NISSIT=''ACEPTADO'' '
         + '      and B.NISAFREG=C.FECHA(+) '
         + '      and A.CIAID=D.CIAID(+) and A.TINID=D.TINID(+) and A.GRARID=D.GRARID(+) and A.ARTID=D.ARTID(+) '
         + '    order BY B.NISAFREG DESC, B.NISAID DESC';
      DMLOG.cdsQry1.Close;
      DMLOG.cdsQry1.DataRequest(xSQL);
      DMLOG.cdsQry1.Open;
   End;

   xSQL := ' Select A.CIAID, A.TINID, A.TLISTAID, A.ARTID, A.ARTCONT, A.GRARID, A.FAMID, '
      + '           A.SFAMID, A.UNMIDG, LPRETMONID, LPREVIG, LPREBASGMO, LPREBASGMN, LPREBASGME, '
      + '           LPREPDCTOG, LPREPDCTOU, LPREPREGMO, LPREPREGMN, LPREPREGME, '
      + '           CANTMING, CANTMINU,  LPREIGV, LPREFLAGD, LPREFREG, LPREHREG, '
      + '           LPREUSER, A.ARTDES, PREVEN, PREVENPRO, PREBASE, ACTIVO, C.LINCOM, D.UTILIDAD, '
      + '           case when LPRETMONID=''N'' '
      + '                then ' + FloatToStr(DMLOG.cdsQry1.FieldByName('ARTPCGS').AsFloat)
      + '                else ' + FloatToStr(DMLOG.cdsQry1.FieldByName('ARTPCGD').AsFloat)
      + '            end PRECOM '
      + '      From FAC201 A, TGE205 B, ALM_TIP_ART C, ALM_LIN_COM D '
      + '     where A.CIAID=' + quotedstr(dblcCia.Text)
      + '       and A.TINID=' + quotedstr(dblcTinid.Text)
      + '       and A.TLISTAID in (' + quotedstr(dblcLPrecio.Text) + ') '
      + '       and A.ARTID=' + quotedstr(dblcdArticulo.Text)
      + '       and A.CIAID=B.CIAID(+) AND A.TINID=B.TINID(+) AND A.ARTID=B.ARTID(+) '
      + '       and B.TIPART=C.TIPART(+) '
      + '       and C.LINCOM=D.LINCOM(+) '
      + '     order by A.TLISTAID, A.ARTID ';
   DMLOG.cdsQry1.Close;
   DMLOG.cdsQry1.DataRequest(xSQL);
   DMLOG.cdsQry1.Open;

   If DMLOG.cdsQry1.FieldByName('UTILIDAD').AsFloat <= 0 Then
   Begin
      ShowMessage('Articulo no tiene asignada Utilidad de Venta. Revisar');
      Exit;
   End;

   If DMLOG.cdsQry1.RecordCount >= 1 Then
   Begin

      nImp := FRound((1 + (DMLOG.cdsQry1.FieldByName('UTILIDAD').AsFloat / 100)) * DMLOG.cdsQry1.FieldByName('PRECOM').AsFloat, 15, 4);

      nImpProm := StrToFloat('0' + StringReplace(dbePreProm.Text, ',', '', [rfreplaceall]));

      If nImpProm <= 0 Then
         xSQL := 'Update FAC201 '
            + '      set PREVEN=' + FloatToStr(nImp) + ', '
            + '          LPREPREGMO=' + FloatToStr(nImp) + ','
            + '          LPREPREGMN=' + FloatToStr(nImp)
            + '    where CIAID=' + quotedstr(dblcCia.Text)
            + '      and TINID=' + quotedstr(dblcTinid.Text)
            + '      and TLISTAID IN (' + quotedstr(dblcLPrecio.Text) + ') '
            + '      and ARTID=' + quotedstr(dblcdArticulo.Text)
      Else
         xSQL := 'Update FAC201 '
            + '      set PREVEN=' + FloatToStr(nImp) + ', '
            + '          LPREPREGMO=' + FloatToStr(nImpProm) + ', '
            + '          LPREPREGMN=' + FloatToStr(nImpProm)
            + '     where CIAID=' + quotedstr(dblcCia.Text)
            + '       and TINID=' + quotedstr(dblcTinid.Text)
            + '       and TLISTAID IN (' + quotedstr(dblcLPrecio.Text) + ') '
            + '       and ARTID=' + quotedstr(dblcdArticulo.Text);

      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al Actualizar');
         Exit;
      End;
      Result := True;
   End;

End;
// Fin HPC_201802_LOG

Procedure TFLPrecio.btnsalirClick(Sender: TObject);
Begin
   pnlUltCompra.Visible := False;
End;

Procedure TFLPrecio.btnDatosCompraClick(Sender: TObject);
Var
   cIGV: Double;
   OldSysLocal: TSysLocale;
Begin

   OldSysLocal := SysLocale;
   SysLocale.MiddleEast := True;
   edtfeccomp.BiDiMode := bdRightToLeft;
   edtcntcomp.BiDiMode := bdRightToLeft;
   edtPreComp.BiDiMode := bdRightToLeft;
   edtCPro.BiDiMode := bdRightToLeft;
   edtPreCompIGV.BiDiMode := bdRightToLeft;
   edtCProIGV.BiDiMode := bdRightToLeft;

// IGV
   xSQL := 'Select TASACAN from TGE108 WHERE TASAFLG=''I'' ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;
   cIGV := (DMLOG.cdsQry12.FieldByName('TASACAN').AsFloat / 100);

// Datos de Ultima Compra
// Inicio HPC_201702_LOG
// 20/06/2017 Se modifica SQL de Datos de Última Compra, se agrega Nro.Nota de Ingreso y Almacén
{
   xSql := ' Select round(KDXCNTG,2) KDXCNTG, ARTPCG, NISAFREG, ARTMORIPCG '
      + '      from (Select a.KDXCNTG,a.ARTPCG,a.NISAFREG,a.ARTMORIPCG '
      + '              from LOG315 A '
      + '             Where A.ARTID=' + quotedstr(dblcdArticulo.Text)
      + '               and A.TRIID in (Select TRIID '
      + '                                 from TGE208 '
      + '                                where TRISGT=''I'' AND ACTCOSPRO=''S'') '
      + '               and A.NISAFREG<=trunc(Sysdate) '
      + '             order by NISAFREG DESC) '
      + '     where ROWNUM=1 ';
}
   xSQL := 'Select LOG315.NISAID, LOG315.ALMID, TGE151.ALMDES, round(LOG315.KDXCNTG,2) KDXCNTG, LOG315.ARTPCG, LOG315.NISAFREG, LOG315.ARTMORIPCG '
      + '     from DB2ADMIN.LOG315, DB2ADMIN.TGE151 '
      + '    where LOG315.CIAID=' + quotedstr(DMLOG.cdsQry7.FieldByName('CIAID').AsString)
      + '      and LOG315.TINID=' + quotedstr(DMLOG.cdsQry7.FieldByName('TINID').AsString)
      + '      and LOG315.NISATIP=' + quotedstr('INGRESO')
      + '      and LOG315.NISAID=' + quotedstr(DMLOG.cdsQry7.FieldByName('NISAID').AsString)
      + '      and TGE151.CIAID=LOG315.CIAID'
      + '      and TGE151.ALMID=LOG315.ALMID';
// Fin HPC_201702_LOG
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;

   TNumericField(DMLOG.cdsQry12.FieldByname('KDXCNTG')).DisplayFormat := '##0';
   TNumericField(DMLOG.cdsQry12.FieldByname('ARTPCG')).DisplayFormat := '###,###0.000';
   TNumericField(DMLOG.cdsQry12.FieldByname('ARTMORIPCG')).DisplayFormat := '###,###0.000';

   edtAlmacen.Text := DMLOG.cdsQry12.FieldByname('ALMID').Asstring + ' - ' + DMLOG.cdsQry12.FieldByname('ALMDES').Asstring;
   edtNIngreso.Text := DMLOG.cdsQry12.FieldByname('NISAID').Asstring;
   edtfeccomp.Text := DMLOG.cdsQry12.FieldByname('NISAFREG').Asstring;
   edtcntcomp.Text := DMLOG.cdsQry12.FieldByname('KDXCNTG').Asstring;
   edtPreComp.Text := DMLOG.cdsQry12.FieldByname('ARTMORIPCG').Asstring;
   edtCPro.Text := DMLOG.cdsQry12.FieldByname('ARTPCG').Asstring;
   edtPreCompIGV.Text := FloatToStr(FRound(DMLOG.cdsQry12.FieldByname('ARTMORIPCG').AsFloat + DMLOG.cdsQry12.FieldByname('ARTMORIPCG').AsFloat * cIGV, 13, 2));
   edtCProIGV.Text := FloatToStr(FRound(DMLOG.cdsQry12.FieldByname('ARTPCG').AsFloat + DMLOG.cdsQry12.FieldByname('ARTPCG').AsFloat * cIGV, 13, 2));

   pnlUltCompra.Left := 176;
   pnlUltCompra.Top := 248;
   pnlUltCompra.Visible := True;

End;

Procedure TFLPrecio.btnStockClick(Sender: TObject);
Var
   vAnd: String;
   vtotal: double;
Begin

   dbgStock.Selected.Clear;
   dbgStock.Selected.Add('ALMID'#9'8'#9'Almacen'#9'F');
   dbgStock.Selected.Add('ALMDES'#9'25'#9'Descripción'#9'F');
   dbgStock.Selected.Add('STKFIN'#9'3'#9'Stock'#9'F');
   dbgStock.ApplySelected;
   pnlStock.Top := 264;
   pnlStock.Left := 269;

   vAnd := ' ';
   xsql := ' Select CODIGO '
      + '      From TGE004 '
      + '     Where NTABLA=''TGE151'' '
      + '       and USERID=''' + DMLOG.wUsuario + ''' ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;
// Inicio HPC_201702_LOG
// Se cambia de posición a Preposición "and", se pone en variable vAnd
// Se retira "and" de SQL para cdsQry12
   If DMLOG.cdsQry12.RecordCount > 0 Then
   Begin
      vAnd := ' and A.ALMID IN (Select CODIGO from tge004 where ntabla=''TGE151'' AND USERID=''' + DMLOG.wUsuario + ''' ) ';
   End;

   xSQL := ' Select A.LOGANOMM, A.ARTID, A.ALMID, B.ALMDES, nvl(A.STKFIN,0) STKFIN, '
      + '           trunc(sysdate) FECHA '
      + '      From LOG319 A,TGE151 B '
      + '     Where A.CIAID=' + quotedstr(dblcCia.Text)
      + '       and A.LOGANOMM=to_char(sysdate,''YYYYMM'') '
      + '       and A.TINID=' + quotedstr(dblcTinid.Text)
      + '       and A.ARTID=' + quotedstr(dblcdArticulo.Text)
      + vAnd
      + '       and B.CIAID(+)=A.CIAID '
      + '       and B.TINID(+)=A.TINID '
      + '       and B.ALMID(+)=A.ALMID '
      + '     Order By A.ALMID ';
   DMLOG.cdsQry12.Close;
   DMLOG.cdsQry12.DataRequest(xSQL);
   DMLOG.cdsQry12.Open;

   If DMLOG.cdsQry12.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Stock en el(los) Almacen(es) asignado(s) al Usuario');
      Exit;
   End;

   vtotal := 0;
   While Not DMLOG.cdsQry12.eof Do
   Begin
      vtotal := vtotal + DMLOG.cdsQry12.Fieldbyname('STKFIN').AsFloat;
      DMLOG.cdsQry12.Next;
   End;

   dbgStock.ColumnByName('STKFIN').FooterValue := FloatToStr(vtotal);
   DMLOG.cdsQry12.First;
   lblStockFecha.Caption := 'Stock a la Fecha ' + DMLOG.cdsQry12.FieldByName('Fecha').AsString;
   dbgStock.DataSource := DMLOG.dsQry12;
   pnlStock.visible := True;
   dbgStock.ColumnByName('STKFIN').FooterValue := FloatToStr(vtotal);
   dbgStock.RefreshDisplay;

End;

Procedure TFLPrecio.BitBtn1Click(Sender: TObject);
Begin
   pnlStock.visible := False;
End;

// Inicia HPC_201802_LOG
// nueva rutina IniciaDatos
Procedure TFLPrecio.IniciaDatos;
Var
   xWhere: String;
Begin
   Z2bbtnNuevo.Enabled := False;
   lblObsequio.Visible := False;

   DMLOG.BuscaQry('dspUltTGE', 'TGE108', '*', 'TASAFLG=''I'' ', 'TASAID');
   dIGV := DMLOG.cdsQry.FieldByName('TASACAN').AsFloat;
// Inicio HPC_201803_LOG
// Se implementa mejoramiento en la Lista de Precios
   xSQL := 'Select nvl(ARTIGV,''S'') ARTIGV, nvl(ART_IGV_EXO,''N'') ART_IGV_EXO '
      + '     from DB2ADMIN.TGE205 '
      + '    where TGE205.CIAID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
      + '      and TGE205.ARTID=' + quotedstr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString);
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.FieldByName('ARTIGV').AsString = 'N' Then
      dIGV := 0;
// Fin HPC_201803_LOG

   xSQL := ' Select nvl((Select C.TASA '
      + '                  from TGE101 A,TGE205 B,TGE128 C '
      + '                 where A.CIAID=' + quotedStr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
      + '                   and A.FLGSERV=''S'' '
      + '                   and A.CIAID=B.CIAID '
      + '                   and B.TINID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('TINID').AsString)
      + '                   and B.ARTID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString)
      + '                   and B.FLGSERV=''S'' '
      + '                   and C.TREGID=''07''),0) TASSERV '
      + '      from DUAL ';
   DMLOG.cdsQry.close;
   DMLOG.cdsQry.datarequest(xSQL);
   DMLOG.cdsQry.Open;
   dServicio := DMLOG.cdsQry.FieldByname('TASSERV').AsFloat;
   dbServ.Text := FloatToStr(dServicio);

   If DMLOG.wModo = 'A' Then
   Begin
      RegistroNuevo
   End
   Else
   Begin
      If DMLOG.wModo = 'M' Then
      Begin
         xCrea := false;
         wModif := 'S';

         xSQL := ' Select A.ARTID, A.ARTDES, A.ARTABR, A.ARTCONT, A.CIAID, '
            + '           A.TINID, A.GRARID, A.FAMID, A.SFAMID, '
            + '           A.UNMIDG, A.ARTCPROG, A.UNMIDU '
            + '      from TGE205 A '
            + '     where A.CIAID=' + quotedStr(DMLOG.cdsLPrecio.FieldByName('CIAID').AsString)
            + '       and A.TINID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('TINID').AsString)
            + '       and A.ARTID=' + QuotedStr(DMLOG.cdsLPrecio.FieldByName('ARTID').AsString);
         DMLOG.cdsArti.IndexFieldNames := '';
         DMLOG.cdsArti.close;
         DMLOG.cdsArti.DataRequest(xSQL);
         DMLOG.cdsArti.open;

         DMLOG.cdsLPrecio.Edit;
      // Compañía
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString);
         edtCia.Text := DMLOG.DisplayDescrip('PRVSQL', 'TGE101', 'CIADES', xWhere, 'CIADES');
      // Tipo de Inventario
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString)
            + ' and TINID=' + quotedstr(DMLOG.cdsArti.FieldByName('TINID').AsString);
         edtTinid.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE152', 'TINDES', xWhere, 'TINDES');

      // Lista de Precios
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString)
            + ' and TLISTAID=' + quotedstr(dblcLPrecio.text);

         xWhere := 'select TLISTADES from FAC101 where ' + xWhere;
         DMLOG.cdsQry.close;
         DMLOG.cdsQry.datarequest(xWhere);
         DMLOG.cdsQry.Open;
         edtLPrecio.Text := DMLOG.cdsQry.FieldByName('TLISTADES').AsString;

      // Línea de Artículo
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString)
            + ' and TINID=' + quotedstr(DMLOG.cdsArti.FieldByName('TINID').AsString)
            + ' and GRARID=' + quotedstr(DMLOG.cdsArti.FieldByName('GRARID').AsString);
         edtLinea.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE131', 'GRARDES', xWhere, 'GRARDES');
      // Familia
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString)
            + ' and TINID=' + quotedstr(DMLOG.cdsArti.FieldByName('TINID').AsString)
            + ' and GRARID=' + quotedstr(DMLOG.cdsArti.FieldByName('GRARID').AsString)
            + ' and FAMID=' + quotedstr(DMLOG.cdsArti.FieldByName('FAMID').AsString);
         edtFamilia.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE169', 'FAMDES', xWhere, 'FAMDES');
      // SubFamilia
         xWhere := 'CIAID=' + quotedStr(DMLOG.cdsArti.FieldByName('CIAID').AsString)
            + ' and TINID=' + quotedstr(DMLOG.cdsArti.FieldByName('TINID').AsString)
            + ' and GRARID=' + quotedstr(DMLOG.cdsArti.FieldByName('GRARID').AsString)
            + ' and FAMID=' + quotedstr(DMLOG.cdsArti.FieldByName('FAMID').AsString)
            + ' and SFAMID=' + quotedstr(DMLOG.cdsArti.FieldByName('SFAMID').AsString);
         dbeSFAM.text := DMLOG.DisplayDescrip('prvTGE', 'TGE170', 'SFAMDES', xWhere, 'SFAMDES');

         edtArticulo.Text := DMLOG.cdsArti.FieldByName('ARTDES').AsString;
         edtTMon.Text := DMLOG.BuscaQry('dspUltTGE', 'TGE103', 'TMONDES', 'TMONID=' + quotedstr(dblcTMon.Text), 'TMONDES');

         If dblcTMon.Text = DMLOG.wTMonLoc Then
         Begin
            lblTitCostoMonedaOrig.Caption := 'Soles';
            lblTitCostoMonedaEqui.Caption := 'Dólares';
         End
         Else
         Begin
            lblTitCostoMonedaOrig.Caption := 'Dólares';
            lblTitCostoMonedaEqui.Caption := 'Soles';
         End;

         If DMLOG.cdsLPrecio.FieldByName('CIAID').AsString = '04' Then
         Begin
            If Not ActualizaListaDePrecio Then
            Begin
               ShowMessage('Problemas con el Precio del Articulo');
               CostoDeArticulo(dblcCia.Text, dblcdArticulo.Text);
               Close;
            End;
         End;

      // Para Refrescar el CDS
         DMLOG.cdsLPrecio.Close;
         DMLOG.cdsLPrecio.Open;

         CostoDeArticulo(dblcCia.Text, dblcdArticulo.Text);
         CalculaMontosDetalle('DesdeDatosTabla');

         pnl1.Enabled := False;
         pnl2.Enabled := False;
         pnl3.Enabled := True;

         pnlPrecio.Enabled := True;
         If (DMLOG.cdsLPrecio.FieldByName('CIAID').AsString = '04') And
            ((DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString = '2DE') Or
            (DMLOG.cdsLPrecio.FieldByName('TLISTAID').AsString = 'CIE')) Then
         Begin
            pnlPrecio.Enabled := False;
         End;

         dblcdArticulo.Enabled := False;

         If DMLOG.cdsQry7.FieldByName('OBSEQUIO').AsString = 'S' Then
         Begin
            lblObsequio.Visible := True;
         End
         Else
         Begin
            lblObsequio.Visible := False;
            gbUmg.Enabled := True;
         End;

      End;
   End;

   FormatoImportes('S');

   dblcCia.Enabled := false;
   dblcLPrecio.Enabled := false;

   pnlCons.Visible := False;
   xWhere := 'USERID=' + quotedStr(DMLOG.wUsuario);
   If DMLOG.DisplayDescrip('prvTGE', 'LOG_LIS_PRE', 'PREVILEGIO', xWhere, 'PREVILEGIO') <> 'S' Then
   Begin
      pnlCab.Enabled := False;
      pnlCons.Visible := True;
   End;

   xCrea := false;

   If DMLOG.wModo = 'M' Then
   Begin
      If pnlPrecio.Enabled Then
      Begin
         If dbePreVta.Enabled Then dbePreVta.SetFocus;
      End
      Else
      Begin
         If dbePrePromCIGV.Enabled Then dbePrePromCIGV.SetFocus;
      End;
   End;
End;
// Fin HPC_201802_LOG

End.

