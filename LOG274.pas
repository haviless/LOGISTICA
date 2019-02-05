Unit LOG274;
// Actualizaciones:
// HPC_201305_LOG 19/11/2011: Inicio de Formulario
//                            Orden de Trabajo
// HPC_201401_LOG 10/01/2014
// HPC_201401_LOG 29/05/2014  -	El Supervisor o Jefe puede editar el ESTADO de la OT, por algún error de asignación.
//                            -	Se adicionó un botón que muestra el detalle del trabajo.
//                            -	Se adicionó un botón que muestra las observaciones ingresadas en los estatus EN PROCESO, ATENDIDO, DEVUELTO.
// HPC_201405_LOG 22/09/2014  Se adiciona control transaccional a la grabación de Órdenes de Trabajo
// HPC_201504_LOG 21/08/2015: Ajustes para visualización correcta de fechas

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, wwdbdatetimepicker, wwdblook, Grids,
   Wwdbigrd, Wwdbgrid, DB, ExtCtrls, ppEndUsr, ppBands, ppCache, ppClass,
   ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppReport, ppCtrls,
   ppVar, ppPrnabl, ppParameter, ppStrtch, ppMemo;

Type
   TFOrdTrabResp = Class(TForm)
      gbEstado: TGroupBox;
      Panel1: TPanel;
      edtUsuario: TEdit;
      dbgOrdeneTrabajo: TwwDBGrid;
      GroupBox2: TGroupBox;
      gbUbicacion: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      dblcLoc: TwwDBLookupCombo;
      EdtLoc: TEdit;
      dblCCosto: TwwDBLookupCombo;
      edtCCosto: TEdit;
      gbReferencia: TGroupBox;
      Label4: TLabel;
      Label6: TLabel;
      dblcReferencia: TwwDBLookupCombo;
      edtReferencia: TEdit;
      edtNumReferencia: TEdit;
      dbdFecReferencia: TwwDBDateTimePicker;
      BtnFiltrar: TBitBtn;
      Label3: TLabel;
      ChkInicial: TCheckBox;
      Label5: TLabel;
      chkPendiente: TCheckBox;
      ChkEnProceso: TCheckBox;
      chkAtendido: TCheckBox;
      chkDevuelto: TCheckBox;
      BtnSalir: TBitBtn;
      PnlEstTrabajo: TPanel;
      Shape1: TShape;
      RbInicial: TRadioButton;
      RbPendiente: TRadioButton;
      RbEnProceso: TRadioButton;
      RbAtendido: TRadioButton;
      RbDevuelto: TRadioButton;
      Label8: TLabel;
      GroupBox3: TGroupBox;
      BitBtn2: TBitBtn;
      btnGrabar: TBitBtn;
      bbtnControlEstado: TBitBtn;
      btnReporteOC: TBitBtn;
      ppRepOTPerResponsable: TppReport;
      ppBDEOTPerRes: TppBDEPipeline;
      ppD1: TppDesigner;
      ppParameterList1: TppParameterList;
      pnlObservaciones: TPanel;
      Shape2: TShape;
      lblObservacion: TLabel;
      BitBtn1: TBitBtn;
      BtnSalirObservacion: TBitBtn;
      pnlHistorial: TPanel;
      Shape3: TShape;
      GroupBox1: TGroupBox;
      GroupBox4: TGroupBox;
      GroupBox5: TGroupBox;
      memProceso: TMemo;
      memAtendido: TMemo;
      memDevuelto: TMemo;
      BitBtn4: TBitBtn;
      Label11: TLabel;
      lblFecProceso: TLabel;
      lblFecAtendido: TLabel;
      lblFecDevuelto: TLabel;
      Label7: TLabel;
      EdtDocAtencion: TEdit;
      Label9: TLabel;
      dbdFecAtencion: TwwDBDateTimePicker;
      gropobservacion: TGroupBox;
      GroupBox6: TGroupBox;
      memDetalla: TMemo;
      edtfecini: TEdit;
      Label12: TLabel;
      BitBtn3: TBitBtn;
      BitBtn5: TBitBtn;
      dblcResponsable: TwwDBLookupCombo;
      ppHeaderBand1: TppHeaderBand;
      ppLabel8: TppLabel;
      ppLabel18: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppImage1: TppImage;
      ppDBMemo1: TppDBMemo;
      ppDBMemo2: TppDBMemo;
      ppShape2: TppShape;

      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLine17: TppLine;
      ppLine18: TppLine;
      ppLine19: TppLine;
      ppLine21: TppLine;
      ppLine22: TppLine;
      ppLine23: TppLine;
      ppLine24: TppLine;

      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;

      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;

      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel17: TppLabel;
      pplbResponsable: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape1: TppShape;

      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;

      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;

      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppFooterBand1: TppFooterBand;

      memObservacion: TMemo;
      Procedure FormCreate(Sender: TObject);
      Procedure BtnFiltrarClick(Sender: TObject);
      Procedure dbgOrdeneTrabajoExit(Sender: TObject);
      Procedure BtnSalirClick(Sender: TObject);
      Procedure dblcLocExit(Sender: TObject);
      Procedure dblCCostoExit(Sender: TObject);
      Procedure dblcReferenciaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbgOrdeneTrabajoCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure bbtnControlEstadoClick(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure btnReporteOCClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dbgOrdeneTrabajoDblClick(Sender: TObject);
      Procedure dblcResponsableExit(Sender: TObject);
      Procedure dblcResponsableChange(Sender: TObject);
      Procedure dblcLocChange(Sender: TObject);
      Procedure dblCCostoChange(Sender: TObject);
      Procedure dblcReferenciaChange(Sender: TObject);
      Procedure edtNumReferenciaChange(Sender: TObject);
      Procedure dbdFecReferenciaChange(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BtnSalirObservacionClick(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure EdtDocAtencionKeyPress(Sender: TObject; Var Key: Char);
      Procedure memObservacionKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    procedure dblcLocEnter(Sender: TObject);
    procedure dblCCostoEnter(Sender: TObject);
    procedure dblcReferenciaEnter(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
      xCOMPCID: String;
      xCheck: Integer;
      inicio: String;
   End;

Var
   FOrdTrabResp: TFOrdTrabResp;

Implementation

Uses LOGDM1, LOG272, LOG271;

{$R *.dfm}

Procedure TFOrdTrabResp.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   xCOMPCID := '';
   inicio := 'S';

   If DMLOG.cdsUsuarios.FieldByName('GRUPOADM').AsString = 'P' Then
   Begin
    //Responsable
      dblcResponsable.Visible := True;
      edtUsuario.Visible := False;
      XSQL := 'Select * From TGE135 Where USERID is not null ';
      DMLOG.cdsComprador2.Close;
      DMLOG.cdsComprador2.DataRequest(XSQL);
      DMLOG.cdsComprador2.Open;
      DMLOG.cdsComprador2.Locate('USERID', VarArrayOf([DMLOG.wUsuario]), []);
      xCOMPCID := DMLOG.cdsComprador2.FieldByname('COMPCID').AsString;
      dblcResponsable.LookupField := 'COMPCID';
      dblcResponsable.LookupTable := DMLOG.cdsComprador2;
      dblcResponsable.Selected.Clear;
      dblcResponsable.Selected.add('COMPDES'#9'30'#9'Nombre'#9'F');
   End
   Else
   Begin
      dblcResponsable.Visible := False;
      edtUsuario.Visible := True;
      XSQL := 'Select * From TGE135 Where USERID=''' + DMLOG.wUsuario + ''' ';
      DMLOG.cdsComprador2.Close;
      DMLOG.cdsComprador2.DataRequest(XSQL);
      DMLOG.cdsComprador2.Open;
      EdtUsuario.Text := DMLOG.cdsComprador2.FieldByname('COMPDES').AsString;
      xCOMPCID := DMLOG.cdsComprador2.FieldByname('COMPCID').AsString;
   End;

   pplbResponsable.Caption := DMLOG.cdsComprador2.FieldByname('COMPDES').AsString;

 //Tabla de Locales
   XSQL := 'Select A.*,B.PROVDES PROPIETARIO From ACF120 A, TGE201 B WHERE A.CODPRO=B.PROV(+) order by LOCDES ';
   DMLOG.cdsLOC.Close;
   DMLOG.cdsLOC.DataRequest(XSQL);
   DMLOG.cdsLOC.PacketRecords := 20;
   DMLOG.cdsLOC.Open;
   dblcLOC.LookupField := 'LOCID';
   dblcLOC.LookupTable := DMLOG.cdsLOC;
   dblcLOC.Selected.Clear;
   dblcLOC.Selected.Add('LOCID'#9'2'#9'Código'#9'F');
   dblcLOC.Selected.Add('LOCDES'#9'30'#9'Descripción'#9'F');

   //Tabla de Centro de Costos
   XSQL := 'Select * FROM TGE203 WHERE CCOSACT=''S'' AND CCOSMOV=''S'' ';
   DMLOG.cdsCCost.Close;
   DMLOG.cdsCCost.DataRequest(XSQL);
   DMLOG.cdsCCost.Open;
   dblCCosto.LookupField := 'CCOSID';
   dblCCosto.LookupTable := DMLOG.cdsCCost;
   dblCCosto.Selected.Clear;
   dblCCosto.Selected.add('CCOSID'#9'5'#9'Código'#9'F');
   dblCCosto.Selected.add('CCOSABR'#9'20'#9'Descripción'#9'F');

   //Referencia
   XSQL := 'Select *  From LOG_TREQ_ORD_TRAB ';
   DMLOG.cdsTReqOrdTrab.Close;
   DMLOG.cdsTReqOrdTrab.DataRequest(XSQL);
   DMLOG.cdsTReqOrdTrab.Open;
   dblcReferencia.LookupField := 'TREQ_OT_ID';
   dblcReferencia.LookupTable := DMLOG.cdsTReqOrdTrab;
   dblcReferencia.Selected.Clear;
   dblcReferencia.Selected.add('TREQ_OT_ID'#9'5'#9'Código'#9'F');
   dblcReferencia.Selected.add('TREQ_OT_DES'#9'20'#9'Descripción'#9'F');

   dbgOrdeneTrabajo.Selected.Clear;
   dbgOrdeneTrabajo.Selected.Add('NUMORDTRA'#9'10'#9'Ord.Trab.'#9'F');
   dbgOrdeneTrabajo.Selected.Add('COMPDES'#9'10'#9'Comprador'#9'F');
   dbgOrdeneTrabajo.Selected.Add('ESTTRAB'#9'10'#9'Estado'#9'F');
   dbgOrdeneTrabajo.Selected.Add('TIPOTRABAJODES'#9'15'#9'Tipo Trabajo'#9'F');
   dbgOrdeneTrabajo.Selected.Add('FECINITRAB'#9'10'#9'Fec.Inicio'#9'F');
   dbgOrdeneTrabajo.Selected.Add('FECFINTRAB'#9'10'#9'Fec.Final'#9'F');
   dbgOrdeneTrabajo.Selected.Add('TREQ_OT_DES'#9'15'#9'Referencia'#9'F');
   dbgOrdeneTrabajo.Selected.Add('NUMREF'#9'15'#9'Num.Refe.'#9'F');
   dbgOrdeneTrabajo.Selected.Add('FECREF'#9'10'#9'Fec.Ref'#9'F');
   dbgOrdeneTrabajo.Selected.Add('FECREC'#9'10'#9'Fec.Rec'#9'F');
   dbgOrdeneTrabajo.Selected.Add('LOCDES'#9'15'#9'Localidad'#9'F');
   dbgOrdeneTrabajo.Selected.Add('CCOSDES'#9'15'#9'Centro Costo'#9'F');

   If DMLOG.cdsUsuarios.FieldByName('GRUPOADM').AsString = 'P' Then
      xSQL := 'select A.CIAID,A.NUMORDTRA,A.NUMORDDET,A.ESTTRAB,E.TIPOTRABAJODES,A.FECINITRAB,A.FECFINTRAB,F.TREQ_OT_DES,A.OBSDETTRAB,A.OBSENPRO,A.FECENPRO,A.OBSATE,A.OBSDEV,A.FECDEV, '
            + '       B.NUMREF,B.FECREF,B.FECREC,D.LOCDES,C.CCOSDES, G.COMPDES, A.NUMATENCION, A.FECATENCION, A.FECFINTRAB '
            + '  from LOG_ORDEN_TRABAJO_DET A, LOG_ORDEN_TRABAJO_CAB B,TGE203 C,ACF120 D, LOG_TIPO_TRABAJO E,LOG_TREQ_ORD_TRAB F, TGE135 G '
            + ' where A.CODRESPONSABLE=''' + Trim(xCOMPCID) + ''' and A.CIAID=B.CIAID '
            + '   and A.TIPOTRABAJOID=E.TIPOTRABAJOID(+)'
            + '   and A.NUMORDTRA=B.NUMORDTRA '
            + '   and B.TREQ_OT_ID=F.TREQ_OT_ID(+)  '
            + '   and B.CCOSID=C.CCOSID(+)  AND B.CODLOC=D.LOCID(+) '
            + '   and G.COMPCID(+)=A.CODRESPONSABLE '
            + ' order by A.CIAID,A.NUMORDTRA DESC, A.NUMORDDET '
   Else
      xSQL := 'select A.CIAID,A.NUMORDTRA,A.NUMORDDET,A.ESTTRAB,E.TIPOTRABAJODES,A.FECINITRAB,A.FECFINTRAB,F.TREQ_OT_DES,A.OBSDETTRAB,A.OBSENPRO,A.FECENPRO,A.OBSATE,A.OBSDEV,A.FECDEV, '
            + '       B.NUMREF,B.FECREF,B.FECREC,D.LOCDES,C.CCOSDES, G.COMPDES, A.NUMATENCION, A.FECATENCION, A.FECFINTRAB '
            + '  from LOG_ORDEN_TRABAJO_DET A, LOG_ORDEN_TRABAJO_CAB B,TGE203 C,ACF120 D, LOG_TIPO_TRABAJO E,LOG_TREQ_ORD_TRAB F, TGE135 G '
            + ' where A.CODRESPONSABLE=''' + Trim(xCOMPCID) + ''' and A.CIAID=B.CIAID '
            + '   and A.TIPOTRABAJOID=E.TIPOTRABAJOID(+)'
            + '   and A.NUMORDTRA=B.NUMORDTRA '
            + '   and B.TREQ_OT_ID=F.TREQ_OT_ID(+)  '
            + '   and B.CCOSID=C.CCOSID(+)  AND B.CODLOC=D.LOCID(+) '
            + '   and G.COMPCID(+)=A.CODRESPONSABLE '
            + ' order by A.CIAID,A.NUMORDTRA DESC, A.NUMORDDET ';
   DMLOG.cdsOrdTrabDet.Close;
   DMLOG.cdsOrdTrabDet.DataRequest(xSql);
   DMLOG.cdsOrdTrabDet.Open;
   dbgOrdeneTrabajo.DataSource := DMLOG.dsOrdTrabDet;
End;

Procedure TFOrdTrabResp.BtnFiltrarClick(Sender: TObject);
Var
   xSql, xWhere, xComa: String;
Begin
   xWhere := ' ';
   xCheck := 0;
   xComa := '';
   If Length(Trim(dblcLoc.Text)) > 0 Then
      xWhere := xWhere + ' And B.CodLoc=''' + dblcLoc.Text + ''' ';
   If Length(Trim(dblCCosto.Text)) > 0 Then
      xWhere := xWhere + ' And B.CCOSID=''' + dblCCosto.Text + ''' ';
   If Length(Trim(dblcReferencia.Text)) > 0 Then
      xWhere := xWhere + ' And B.TREQ_OT_ID=''' + dblcReferencia.Text + ''' ';
   If Length(Trim(edtNumReferencia.Text)) > 0 Then
      xWhere := xWhere + ' And B.Numref=''' + TRim(edtNumReferencia.Text) + ''' ';
   If Length(Trim(dbdFecReferencia.Text)) > 0 Then
      xWhere := xWhere + ' And B.FecRef=''' + TRim(dbdFecReferencia.Text) + ''' ';
   If (ChkInicial.Checked) Or
      (ChkPendiente.Checked) Or
      (ChkEnProceso.Checked) Or
      (ChkAtendido.Checked) Or
      (ChkDevuelto.Checked) Then
   Begin
      xWhere := xWhere + ' And A.ESTTRAB in ('
   End;

   If ChkInicial.Checked Then
   Begin
      If xCheck > 0 Then
         xcoma := ','
      Else
         xcoma := '';
      xCheck := xCheck + 1;
      xWhere := xWhere + xcoma + '''INICIAL''';
   End;

   If chkPendiente.Checked Then
   Begin
      If xCheck > 0 Then
         xcoma := ','
      Else
         xcoma := '';
      xCheck := xCheck + 1;
      xWhere := xWhere + xcoma + '''PENDIENTE''';
   End;
   If ChkEnProceso.Checked Then
   Begin
      If xCheck > 0 Then
         xcoma := ','
      Else
         xcoma := '';
      xCheck := xCheck + 1;
      xWhere := xWhere + xcoma + '''EN PROCESO''';
   End;

   If chkAtendido.Checked Then
   Begin
      If xCheck > 0 Then
         xcoma := ','
      Else
         xcoma := '';
      xCheck := xCheck + 1;
      xWhere := xWhere + xcoma + '''ATENDIDO''';
   End;

   If chkDevuelto.Checked Then
   Begin
      If xCheck > 0 Then
         xcoma := ','
      Else
         xcoma := '';
      xCheck := xCheck + 1;
      xWhere := xWhere + xcoma + '''DEVUELTO''';
   End;

   If (ChkInicial.Checked) Or
      (ChkPendiente.Checked) Or
      (ChkEnProceso.Checked) Or
      (ChkAtendido.Checked) Or
      (ChkDevuelto.Checked) Then
   Begin
      xWhere := xWhere + ') '
   End;

   If DMLOG.cdsUsuarios.FieldByName('GRUPOADM').AsString = 'P' Then
      xSQL := 'select A.CIAID,A.NUMORDTRA,A.NUMORDDET,A.ESTTRAB,E.TIPOTRABAJODES,A.FECINITRAB,A.FECFINTRAB,F.TREQ_OT_DES,A.OBSDETTRAB,A.OBSENPRO,A.FECENPRO,A.OBSATE,A.OBSDEV,A.FECDEV, '
            + '       B.NUMREF,B.FECREF,B.FECREC,D.LOCDES,C.CCOSDES, G.COMPDES, A.NUMATENCION, A.FECATENCION, A.FECFINTRAB '
            + '  from LOG_ORDEN_TRABAJO_DET A, LOG_ORDEN_TRABAJO_CAB B,TGE203 C,ACF120 D, LOG_TIPO_TRABAJO E,LOG_TREQ_ORD_TRAB F, TGE135 G '
            + ' where A.CODRESPONSABLE=''' + Trim(xCOMPCID) + ''' and A.CIAID=B.CIAID '
            + '   and A.TIPOTRABAJOID=E.TIPOTRABAJOID(+)'
            + '   and A.NUMORDTRA=B.NUMORDTRA ' + xWhere
            + '   and B.TREQ_OT_ID=F.TREQ_OT_ID(+)  '
            + '   and B.CCOSID=C.CCOSID(+) AND B.CODLOC=D.LOCID(+) '
            + '   and G.COMPCID(+)=A.CODRESPONSABLE '
            + ' order by A.CIAID,A.NUMORDTRA DESC, A.NUMORDDET '
   Else
      xSQL := 'select A.CIAID,A.NUMORDTRA,A.NUMORDDET,A.ESTTRAB,E.TIPOTRABAJODES,A.FECINITRAB,A.FECFINTRAB,F.TREQ_OT_DES,A.OBSDETTRAB,A.OBSENPRO,A.FECENPRO,A.OBSATE,A.OBSDEV,A.FECDEV, '
            + '       B.NUMREF,B.FECREF,B.FECREC,D.LOCDES,C.CCOSDES, G.COMPDES, A.NUMATENCION, A.FECATENCION, A.FECFINTRAB '
            + '  From LOG_ORDEN_TRABAJO_DET A, LOG_ORDEN_TRABAJO_CAB B,TGE203 C,ACF120 D, LOG_TIPO_TRABAJO E,LOG_TREQ_ORD_TRAB F, TGE135 G '
            + ' Where A.CODRESPONSABLE=''' + Trim(xCOMPCID) + ''' AND A.CIAID=B.CIAID '
            + '   and A.TIPOTRABAJOID=E.TIPOTRABAJOID(+)'
            + '   and A.NUMORDTRA=B.NUMORDTRA ' + xWhere
            + '   and B.TREQ_OT_ID=F.TREQ_OT_ID(+)  '
            + '   and B.CCOSID=C.CCOSID(+) AND B.CODLOC=D.LOCID(+) '
            + '   and G.COMPCID(+)=A.CODRESPONSABLE '
            + ' Order by  A.CIAID,A.NUMORDTRA DESC,A.NUMORDDET ';
   DMLOG.cdsOrdTrabDet.Close;
   DMLOG.cdsOrdTrabDet.DataRequest(xSql);
   DMLOG.cdsOrdTrabDet.Open;
   dbgOrdeneTrabajo.DataSource := DMLOG.dsOrdTrabDet;

   pplbResponsable.Caption := DMLOG.cdsComprador2.FieldByname('COMPDES').AsString;
   edtUsuario.Text := DMLOG.cdsComprador2.FieldByname('COMPDES').AsString;
End;

Procedure TFOrdTrabResp.dbgOrdeneTrabajoExit(Sender: TObject);
Var
   xSql: String;
Begin

End;

Procedure TFOrdTrabResp.BtnSalirClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFOrdTrabResp.dblcLocExit(Sender: TObject);
Begin
   If DMLOG.cdsLOC.locate('LOCID', VarArrayOf([dblcLoc.Text]), []) Then
      EdtLoc.Text := DMLOG.cdsLOC.FieldByname('LOCDES').AsString
   Else
      EdtLoc.Text := '';
End;

Procedure TFOrdTrabResp.dblCCostoExit(Sender: TObject);
Begin
   If DMLOG.cdsCCost.locate('CCOSID', VarArrayOf([dblCCosto.Text]), []) Then
      EdtCCosto.Text := DMLOG.cdsCCost.FieldByname('CCOSDES').AsString
   Else
      EdtCCosto.Text := '';
End;

Procedure TFOrdTrabResp.dblcReferenciaExit(Sender: TObject);
Begin
   If DMLOG.cdsTReqOrdTrab.locate('TREQ_OT_ID', VarArrayOf([dblcReferencia.Text]), []) Then
      edtReferencia.Text := DMLOG.cdsTReqOrdTrab.FieldByname('TREQ_OT_DES').AsString
   Else
      edtReferencia.Text := '';
End;

Procedure TFOrdTrabResp.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFOrdTrabResp.dbgOrdeneTrabajoCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin

   If (Field.FieldName = 'ESTTRAB') Then
   Begin
      If DMLOG.cdsOrdTrabDet.Fieldbyname('ESTTRAB').AsString = 'DEVUELTO' Then
      Begin
         AFont.Color := clWhite;
         ABrush.Color := clRed;
         AFont.Size := 8;
         AFont.Style := [];
      End;
      If DMLOG.cdsOrdTrabDet.Fieldbyname('ESTTRAB').AsString = 'INICIAL' Then
      Begin
         AFont.Color := clBlack;
         ABrush.Color := clBtnFace;
         AFont.Size := 8;
         AFont.Style := [];
      End;
      If DMLOG.cdsOrdTrabDet.Fieldbyname('ESTTRAB').AsString = 'PENDIENTE' Then
      Begin
         AFont.Color := clBlack;
         ABrush.Color := clYellow;
         AFont.Size := 8;
         AFont.Style := [];
      End;
      If DMLOG.cdsOrdTrabDet.Fieldbyname('ESTTRAB').AsString = 'EN PROCESO' Then
      Begin
         AFont.Color := clWhite;
         ABrush.Color := clgreen;
         AFont.Size := 8;
         AFont.Style := [];
      End;
      If DMLOG.cdsOrdTrabDet.Fieldbyname('ESTTRAB').AsString = 'ATENDIDO' Then
      Begin
         AFont.Color := clWhite;
         ABrush.Color := clBlue;
         AFont.Size := 8;
         AFont.Style := [];
      End;
   End;

End;

Procedure TFOrdTrabResp.bbtnControlEstadoClick(Sender: TObject);
Begin
   If (DMLOG.wUsuario <> 'BLARREA') And (DMLOG.wUsuario <> 'ASOUSA') And (DMLOG.wUsuario <> 'HNORIEGA') Then
   Begin
      If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'ATENDIDO' Then
      Begin
         ShowMessage('El Requerimiento ya se encuentra ATENDIDO');
         Exit;
      End;

      If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'DEVUELTO' Then
      Begin
         ShowMessage('La Atención de este Requerimiento fue DEVUELTA');
         Exit;
      End;
      RbPendiente.Visible := False;
   End
   Else
   Begin
      RbPendiente.Visible := True;
   End;

   If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'PENDIENTE' Then RbPendiente.Checked := True;
   If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'EN PROCESO' Then RbEnProceso.Checked := True;
   If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'ATENDIDO' Then RbAtendido.Checked := True;
   If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'DEVUELTO' Then RbDevuelto.Checked := True;

   memDetalla.Lines.Text := DMLOG.cdsOrdTrabDet.FieldByName('OBSDETTRAB').AsString;
   edtfecini.Text := DMLOG.cdsOrdTrabDet.FieldByName('FECINITRAB').AsString;

   PnlEstTrabajo.Left := 160;
   PnlEstTrabajo.Top := 225;
   PnlEstTrabajo.Visible := True;
   gbEstado.Enabled := False;
   PnlEstTrabajo.Enabled := True;
End;

Procedure TFOrdTrabResp.btnGrabarClick(Sender: TObject);
Begin
   PnlEstTrabajo.Enabled := False;
   pnlObservaciones.top := 254;
   pnlObservaciones.Left := 210;
   pnlObservaciones.Visible := True;
   memObservacion.Lines.Text := '';

   If RbEnProceso.Checked Then
   Begin
      memObservacion.Lines.Text := TRim(DMLOG.cdsOrdTrabDet.FieldByName('OBSENPRO').AsString); //rmz
      EdtDocAtencion.Enabled := True;
      dbdFecAtencion.Enabled := True;
      gropobservacion.Enabled := False;
      lblObservacion.Caption := 'OBSERVACION - TRABAJO EN PROCESO';
      EdtDocAtencion.SetFocus;
   End;

   If RbAtendido.Checked Then
   Begin
      EdtDocAtencion.Enabled := True;
      dbdFecAtencion.Enabled := True;
      gropobservacion.Enabled := False;
      lblObservacion.Caption := 'OBSERVACION - TRABAJO ATENDIDO';
      EdtDocAtencion.SetFocus;
   End;

   If RbDevuelto.Checked Then
   Begin
      EdtDocAtencion.Enabled := False;
      dbdFecAtencion.Enabled := False;
      gropobservacion.Enabled := True;
      lblObservacion.Caption := 'OBSERVACION - TRABAJO DEVUELTO';
      memObservacion.SetFocus;
   End;

   If RbPendiente.Checked Then
   Begin
      EdtDocAtencion.Enabled := False;
      dbdFecAtencion.Enabled := False;
      lblObservacion.Caption := 'OBSERVACION - TRABAJO PENDIENTE';
   End;
End;

Procedure TFOrdTrabResp.btnReporteOCClick(Sender: TObject);
Begin
   ppBDEOTPerRes.DataSource := DMLOG.dsOrdTrabDet;
   ppRepOTPerResponsable.Print;
   ppRepOTPerResponsable.Stop;
End;

Procedure TFOrdTrabResp.BitBtn2Click(Sender: TObject);
Begin
   PnlEstTrabajo.Visible := False;
   gbEstado.Enabled := True;
End;

Procedure TFOrdTrabResp.dbgOrdeneTrabajoDblClick(Sender: TObject);
Var
   xMsg: String;
   xSQL: String;
Begin
   If DMLOG.cdsOrdTrabDet.FieldByName('ESTTRAB').AsString = 'ATENDIDO' Then
   Begin

      xMsg := 'El Requerimiento ya se encuentra ATENDIDO ' + chr(13)
            + ' Número Documento de atencion: ' + DMLOG.cdsOrdTrabDet.FieldByName('NUMATENCION').AsString + chr(13)
            + ' Fecha  Documento de atención: ' + datetostr(DMLOG.cdsOrdTrabDet.FieldByName('FECATENCION').AsDateTime) + chr(13)
            + ' Fecha Final de Atención     : ' + datetostr(DMLOG.cdsOrdTrabDet.FieldByName('FECFINTRAB').AsDateTime);
      ShowMessage(xMsg);
   End
   Else
      bbtnControlEstadoClick(Sender);
End;

Procedure TFOrdTrabResp.dblcResponsableExit(Sender: TObject);
Begin
   EdtUsuario.Text := DMLOG.cdsComprador2.FieldByname('COMPDES').AsString;
   xCOMPCID := DMLOG.cdsComprador2.FieldByname('COMPCID').AsString;
End;

Procedure TFOrdTrabResp.dblcResponsableChange(Sender: TObject);
Begin
   If inicio <> 'S' Then
   Begin
      Try
         DMLOG.cdsOrdTrabDet.EmptyDataSet;
      Except
      End;
   End;
   inicio := 'N';
End;

Procedure TFOrdTrabResp.dblcLocChange(Sender: TObject);
Begin
   DMLOG.cdsOrdTrabDet.EmptyDataSet;
End;

Procedure TFOrdTrabResp.dblCCostoChange(Sender: TObject);
Begin
   DMLOG.cdsOrdTrabDet.EmptyDataSet;
End;

Procedure TFOrdTrabResp.dblcReferenciaChange(Sender: TObject);
Begin
   DMLOG.cdsOrdTrabDet.EmptyDataSet;
End;

Procedure TFOrdTrabResp.edtNumReferenciaChange(Sender: TObject);
Begin
   DMLOG.cdsOrdTrabDet.EmptyDataSet;
End;

Procedure TFOrdTrabResp.dbdFecReferenciaChange(Sender: TObject);
Begin
   DMLOG.cdsOrdTrabDet.EmptyDataSet;
End;

Procedure TFOrdTrabResp.BitBtn1Click(Sender: TObject);
Var
   xSql, xEstado, vQueActualizo: String;
   nEstado: integer;
Begin
   nEstado := 0;

   If RbInicial.Checked Then
   Begin
      nEstado := nEstado + 1;
      xEstado := 'INICIAL';
      If xCheck > 0 Then ChkInicial.Checked := True;
   End;

   If RbPendiente.Checked Then
   Begin
      nEstado := nEstado + 1;
      xEstado := 'PENDIENTE';
      vQueActualizo := ',OBSATE=NULL,FECATENCION=NULL,OBSDEV=NULL,FECDEV=NULL,OBSENPRO=NULL,FECENPRO=NULL,FECFINTRAB=NULL,NUMATENCION=NULL ';
      If xCheck > 0 Then chkPendiente.Checked := True;
   End;

   If RbEnProceso.Checked Then
   Begin
      If Length(Trim(EdtDocAtencion.Text)) = 0 Then
      Begin
         ShowMessage('Debe ingresar Documento de Atención');
         Exit;
      End;
      nEstado := nEstado + 1;
      xEstado := 'EN PROCESO';
      memObservacion.Lines.Text := Trim(memObservacion.Lines.Text) + '[' + Trim(EdtDocAtencion.Text) + '-' + TRIM(dbdFecAtencion.Text) + '];  ';
      vQueActualizo := ',OBSENPRO=''' + memObservacion.Lines.Text + ''',FECENPRO=''' + TRIM(dbdFecAtencion.Text) + ''' ';
      If xCheck > 0 Then ChkEnProceso.Checked := True;
   End;

   If RbAtendido.Checked Then
   Begin
      If Length(Trim(dbdFecAtencion.Text)) = 0 Then
      Begin
         ShowMessage('Debe ingresar Fecha de Atención');
         Exit;
      End;

      If Length(Trim(EdtDocAtencion.Text)) = 0 Then
      Begin
         ShowMessage('Debe ingresar Documento de Atención');
         Exit;
      End;

      nEstado := nEstado + 1;
      memObservacion.Lines.Text := Trim(memObservacion.Lines.Text) + '[' + Trim(EdtDocAtencion.Text) + '-' + TRIM(dbdFecAtencion.Text) + '];  ';
      vQueActualizo := ',OBSATE=''' + memObservacion.Lines.Text + ''',FECATENCION=''' + TRIM(dbdFecAtencion.Text) + ''',FECFINTRAB=''' + TRIM(dbdFecAtencion.Text) + ''',NUMATENCION=''' + EdtDocAtencion.Text + ''' ';
      xEstado := 'ATENDIDO';
      If xCheck > 0 Then chkAtendido.Checked := True;
   End;

   If RbDevuelto.Checked Then
   Begin
      vQueActualizo := ',OBSDEV=''' + memObservacion.Lines.Text + ''',FECDEV=SYSDATE ';
      nEstado := nEstado + 1;
      xEstado := 'DEVUELTO';
      If xCheck > 0 Then chkDevuelto.Checked := True;
   End;

   If nEstado = 0 Then
   Begin
      ShowMessage('Debe marcar un ESTADO del Requerimiento');
      Exit;
   End;

   DMLOG.cdsOrdTrabDet.Edit;
   DMLOG.cdsOrdTrabDet.FieldByName('NUMATENCION').AsString := EdtDocAtencion.Text;
   DMLOG.cdsOrdTrabDet.FieldByName('FECATENCION').AsDateTime := dbdFecAtencion.date;
   DMLOG.cdsOrdTrabDet.FieldByName('FECFINTRAB').AsDateTime := date;
   DMLOG.cdsOrdTrabDet.Post;

   //Inicio HPC_201405_LOG
   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   xSQL := 'Update LOG_ORDEN_TRABAJO_DET '
         + '   set ESTTRAB=''' + xEstado + ''' '
         + vQueActualizo
         + ' Where CIAID=' + quotedstr(DMLOG.cdsOrdTrabDet.FieldByName('CIAID').AsString)
         + '   and NUMORDTRA=' + quotedstr(DMLOG.cdsOrdTrabDet.FIELDbYNAME('NUMORDTRA').AsString)
         + '   and NUMORDDET=' + quotedstr(DMLOG.cdsOrdTrabDet.FIELDbYNAME('NUMORDDET').AsString);
   Try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar grabar el Detalle de la Orden');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Raise;
      exit;
   End;


   xSQL := 'Select count(1) NUMPENDIENTES '
         + '  From LOG_ORDEN_TRABAJO_DET '
         + ' Where CIAID=' + quotedstr(DMLOG.cdsOrdTrabDet.FieldByName('CIAID').AsString)
         + '   and NUMORDTRA=' + quotedstr(DMLOG.cdsOrdTrabDet.FIELDbYNAME('NUMORDTRA').AsString)
         + '   and ESTTRAB not in (''ATENDIDO'',''DEVUELTO'') ';
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.DataRequest(xSQL);
   DMLOG.cdsQry.Open;
   If DMLOG.cdsQry.FieldByName('NUMPENDIENTES').AsInteger = 0 Then
   Begin
      xSQL := 'update LOG_ORDEN_TRABAJO_CAB '
            + '   set ESTGENERAL=''ATENDIDO'', '
            + '       FLAGCERRADO=''S'', '
            + '       FECCERRADO=sysdate, '
      //Inicio HPC_201503_LOG
            + '       FECFINGEN=sysdate, '
      //Fin HPC_201503_LOG
            + '       USUCERRADO=' + quotedstr(DMLOG.wUsuario)
            + ' Where CIAID=' + quotedstr(DMLOG.cdsOrdTrabDet.FieldByName('CIAID').AsString)
            + '   and NUMORDTRA=' + quotedstr(DMLOG.cdsOrdTrabDet.FIELDbYNAME('NUMORDTRA').AsString);
      Try
         DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar el Estado ATENDIDO de la Orden de Trabajo');
         DMLOG.DCOM1.AppServer.RetornaTransaccion;
         Raise;
         exit;
      End;
   End;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   //Final HPC_201405_LOG

   ShowMessage('Se Grabó con Éxito');
   BtnSalirObservacionClick(self);
   gbEstado.Enabled := True;
   BtnFiltrarClick(Self);
   EdtDocAtencion.Text := '';
   dbdFecAtencion.Text := '';

End;

Procedure TFOrdTrabResp.BtnSalirObservacionClick(Sender: TObject);
Begin
   pnlObservaciones.Visible := False;
   PnlEstTrabajo.Visible := False;
   PnlEstTrabajo.Enabled := True;
   gbEstado.Enabled := True;
   BtnFiltrarClick(Self);
   EdtDocAtencion.Text := '';
   dbdFecAtencion.Text := '';
End;

Procedure TFOrdTrabResp.BitBtn3Click(Sender: TObject);
Begin
   DMLOG.wModo := 'C';
   DMLOG.wciaid := DMLOG.cdsOrdTrabDet.FieldByname('CIAID').AsString;
   DMLOG.wNumordtra := DMLOG.cdsOrdTrabDet.FieldByname('NUMORDTRA').AsString;
   DMLOG.wNumorddet := DMLOG.cdsOrdTrabDet.FieldByname('NUMORDDET').AsString;

//   if FOrdenTrabajo<>nil then
//      FOrdenTrabajo.Close;
   try
      FOrdenTrabajo := TFOrdenTrabajo.Create(Self); // LOG271.PAS
      fDetalleOrdTrab := TfDetalleOrdTrab.Create(Self); // LOG272.PAS
      fDetalleOrdTrab.ShowModal;
   Finally
      FOrdenTrabajo.Close;
      fDetalleOrdTrab.Close;
   end;
End;

Procedure TFOrdTrabResp.BitBtn5Click(Sender: TObject);
Begin
   memProceso.Lines.Text := DMLOG.cdsOrdTrabDet.Fieldbyname('OBSENPRO').AsString;
   lblFecProceso.Caption := DMLOG.cdsOrdTrabDet.Fieldbyname('FECENPRO').AsString;
   memAtendido.Lines.Text := DMLOG.cdsOrdTrabDet.Fieldbyname('OBSATE').AsString;
   lblFecAtendido.Caption := DMLOG.cdsOrdTrabDet.Fieldbyname('FECATENCION').AsString;
   memDevuelto.Lines.Text := DMLOG.cdsOrdTrabDet.FieldByname('OBSDEV').AsString;
   lblFecDevuelto.Caption := DMLOG.cdsOrdTrabDet.FieldByname('FECDEV').AsString;
   pnlHistorial.Top := 40;
   pnlHistorial.Left := 216;
   pnlHistorial.Visible := True;
End;

Procedure TFOrdTrabResp.BitBtn4Click(Sender: TObject);
Begin
   pnlHistorial.Visible := False;
End;

Procedure TFOrdTrabResp.EdtDocAtencionKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [Chr(39), '´'] Then
      Key := #0;
End;

Procedure TFOrdTrabResp.memObservacionKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [Chr(39), '´'] Then
      Key := #0;
End;

Procedure TFOrdTrabResp.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   dbgOrdeneTrabajo.DataSource := Nil;
   DMLOG.cdsComprador2.Close;
   DMLOG.cdsLOC.Close;
   DMLOG.cdsQry.Close;
End;

procedure TFOrdTrabResp.dblcLocEnter(Sender: TObject);
Var
   xSQL: String;
begin
   if DMLOG.cdsLOC.Active = False then
   Begin
   // Locales
      xSQL := 'Select A.*,B.PROVDES PROPIETARIO '
            + '  From ACF120 A, TGE201 B '
            + ' where A.CODPRO=B.PROV(+) '
            + ' order by LOCDES ';
      DMLOG.cdsLOC.Close;
      DMLOG.cdsLOC.DataRequest(xSQL);
      DMLOG.cdsLOC.PacketRecords := 20;
      DMLOG.cdsLOC.Open;
   End;
end;

procedure TFOrdTrabResp.dblCCostoEnter(Sender: TObject);
Var
   xSQL: String;
begin
   if DMLOG.cdsCCost.Active = False then
   Begin
      xSQL := 'Select * '
            + '  from TGE203 '
            + ' where CCOSACT=''S'' and CCOSMOV=''S'' ';
      DMLOG.cdsCCost.Close;
      DMLOG.cdsCCost.DataRequest(XSQL);
      DMLOG.cdsCCost.Open;
   End;
end;

procedure TFOrdTrabResp.dblcReferenciaEnter(Sender: TObject);
Var
   xSQL: String;
begin
   if DMLOG.cdsTReqOrdTrab.Active = False then
   Begin
   // Referencia
      xSQL := 'Select * '
            + '  From LOG_TREQ_ORD_TRAB ';
      DMLOG.cdsTReqOrdTrab.Close;
      DMLOG.cdsTReqOrdTrab.DataRequest(XSQL);
      DMLOG.cdsTReqOrdTrab.Open;
   End;
end;

End.

