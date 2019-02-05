Unit LOG273;
// Actualizaciones:
// HPC_201305_LOG 19/11/2011: Inicio de Formulario
//                            Orden de Trabajo
// HPC_201401_LOG 10/01/2014
// HPC_201401_LOG 29/05/2014: Se corrigió los estados de las OT y el procedimiento en el sistema que genera este problema.
//                            Se adiciono un filtro por Usuario en el Consolidado de OT
//                            Se cambio el paramento de Fecha Recepción por Fecha de Inicio de Trabajo
// HPC_201405_LOG 22/09/2014  Se adiciona control transaccional a la grabación de Órdenes de Trabajo

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, wwdbdatetimepicker, ppEndUsr, ppDB,
   ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
   ppCache, ppCtrls, ppVar, ppPrnabl, ppParameter, ppModule, daDataModule, db,
   wwdblook, ppStrtch, ppMemo;

Type
   TFToolOTrabajo = Class(TForm)
      pnlComandos: TPanel;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      DbdFechainicio: TwwDBDateTimePicker;
      Label2: TLabel;
      DbdFechafinal: TwwDBDateTimePicker;
      btnReporteOC: TBitBtn;
      ChkInicial: TCheckBox;
      chkPendiente: TCheckBox;
      ChkEnProceso: TCheckBox;
      chkAtendido: TCheckBox;
      chkDevuelto: TCheckBox;
      Label3: TLabel;
      Label4: TLabel;
      ppRConsolidado: TppReport;
      ppDB1: TppBDEPipeline;
      ppD1: TppDesigner;
      ppParameterList1: TppParameterList;
      GroupBox2: TGroupBox;
      BitBtn1: TBitBtn;
      Label5: TLabel;
      Label6: TLabel;
      BtnInicial: TBitBtn;
      bbtnCambiaEstado: TBitBtn;
      dblcResponsable: TwwDBLookupCombo;
      chkUsuario: TCheckBox;
      ppHeaderBand1: TppHeaderBand;
      ppShape11: TppShape;
      ppShape10: TppShape;
      ppShape9: TppShape;
      ppShape8: TppShape;
      ppShape6: TppShape;
      ppShape5: TppShape;
      ppShape3: TppShape;
      ppShape2: TppShape;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      pplbDelAl: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel8: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine15: TppLine;
      ppLabel22: TppLabel;
      ppLabel2: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppShape4: TppShape;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppLine13: TppLine;
      ppLine14: TppLine;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppLine16: TppLine;
      ppDBText14: TppDBText;
      ppDBMemo1: TppDBMemo;
      ppFooterBand1: TppFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppShape12: TppShape;
      ppLabel12: TppLabel;
      ppDBText6: TppDBText;
      ppShape13: TppShape;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBMemo2: TppDBMemo;
      ppImage1: TppImage;
      Procedure btnReporteOCClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BtnInicialClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnCambiaEstadoClick(Sender: TObject);
      Procedure chkUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FToolOTrabajo: TFToolOTrabajo;

Implementation

Uses LOGDM1, LOG274, oaAD3100;

{$R *.dfm}

Procedure TFToolOTrabajo.btnReporteOCClick(Sender: TObject);
Var
   xSql, xWhere, xComa: String;
   xCheck: Integer;
Begin

   xWhere := '';
   xCheck := 0;
   xComa := '';

   If (ChkInicial.Checked) Or
      (ChkPendiente.Checked) Or
      (ChkEnProceso.Checked) Or
      (ChkAtendido.Checked) Or
      (ChkDevuelto.Checked) Then
   Begin
      xWhere := xWhere + ' And B.ESTTRAB in ('
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

   If (chkUsuario.Checked) Then
   Begin
      xWhere := xWhere + ' And B.CODRESPONSABLE=''' + DMLOG.cdsComprador.FieldbyName('COMPCID').AsString + ''' ';
   End;

   xSql := 'SELECT TO_CHAR(A.FECINIGEN,''MON'') MESCREA,A.NUMORDTRA,C.COMPDES,D.TREQ_OT_DES,A.NUMREF,A.FECREF,A.FECREC,'
         + '       E.CCOSDES,F.LOCDES,G.TIPOTRABAJODES,B.FECINITRAB,B.FECFINTRAB,B.ESTTRAB,B.NUMATENCION,B.OBSDETTRAB '
         + '  FROM LOG_ORDEN_TRABAJO_CAB A,LOG_ORDEN_TRABAJO_DET B,TGE135 C,LOG_TREQ_ORD_TRAB D,TGE203 E,ACF120 F, LOG_TIPO_TRABAJO G '
         + ' WHERE A.CIAID=B.CIAID AND A.NUMORDTRA=B.NUMORDTRA AND '
         + '       B.FECINITRAB>=''' + DbdFechainicio.Text + ''' And B.FECINITRAB<=''' + DbdFechafinal.Text + ''' And '
         + '       B.CODRESPONSABLE=C.COMPCID(+) AND A.TREQ_OT_ID=D.TREQ_OT_ID AND '
         + '       A.CCOSID=E.CCOSID(+) AND A.CODLOC=F.LOCID(+) AND '
         + '       B.TIPOTRABAJOID=G.TIPOTRABAJOID(+) ' + xWhere
         + ' Order By C.COMPDES ';
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest(xSql);
   DMLOG.cdsQry3.Open;

   If DMLOG.cdsQry3.RecordCount = 0 Then
   Begin
      ShowMessage('No existe Información para imprimir');
      Exit;
   End;

   ppDB1.DataSource := DMLOG.dsQry3;
   pplbDelAl.Caption := 'Del ' + DbdFechainicio.Text + ' Al ' + DbdFechafinal.Text;
   ppRConsolidado.Print;
   ppRConsolidado.Stop;
End;

Procedure TFToolOTrabajo.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
   xTieneAcceso: Boolean;
Begin
   xTieneAcceso := False;

// Responsable TGE135
   xSQL := 'Select * From TGE135 Where USERID=''' + DMLOG.wUsuario + ''' ';
   DMLOG.cdsComprador.Close;
   DMLOG.cdsComprador.DataRequest(XSQL);
   DMLOG.cdsComprador.Open;
   If DMLOG.cdsComprador.RecordCount = 1 Then xTieneAcceso := True;

   If Not xTieneAcceso Then
   Begin
      ShowMessage('El Usuario ''' + DMLOG.wUsuario + ''' no esta registrado como COMPRADOR (TGE135)');
   End
   Else
   Begin
      FOrdTrabResp := TFOrdTrabResp.Create(Self); // LOG274.PAS

     // mañana probar si no es usuario que pueda manejar todos los responsbles
     // ver porque al ingresar no muestra el detalle

      If DMLOG.cdsUsuarios.FieldByName('GRUPOADM').AsString = 'P' Then
      Begin
         FOrdTrabResp.dblcResponsable.Text := DMLOG.cdsComprador.FieldByname('COMPDES').AsString;
         FOrdTrabResp.xCOMPCID := DMLOG.cdsComprador.FieldByname('COMPCID').AsString;
      End
      Else
      Begin
         FOrdTrabResp.EdtUsuario.Text := DMLOG.cdsComprador.FieldByname('COMPDES').AsString;
         FOrdTrabResp.xCOMPCID := DMLOG.cdsComprador.FieldByname('COMPCID').AsString;
      End;

      FOrdTrabResp.ShowModal;
   End;
End;

Procedure TFToolOTrabajo.BtnInicialClick(Sender: TObject);
Var
   xsql: String;
   B: TbookMark;
Begin
   b := Mtx3100.FMant.cds2.GetBookmark;
   Mtx3100.FMant.cds2.DisableControls;

// Inicio HPC_201405_LOG
   xSQL := 'Update LOG_ORDEN_TRABAJO_CAB '
         +'    set ESTGENERAL='+quotedstr('INICIAL')
         + ' where CIAID='+quotedstr(Mtx3100.FMant.cds2.FieldByname('CIAID').AsString)
         + '   and NUMORDTRA='+quotedstr(Mtx3100.FMant.cds2.FieldByname('NUMORDTRA').AsString);
   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se pudo actualizar la Orden de Trabajo con Estado INICIAL');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Raise;
      exit;
   end;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
   ShowMessage('Se pudo actualizar la Orden de Trabajo con Estado INICIAL con éxito');
// Final HPC_201405_LOG   

   xSql := 'Select A.CIAID,trunc(A.FECCREACION) FECCREACION,A.NUMORDTRA,A.TREQ_OT_ID,F.TREQ_OT_DES,A.NUMREF,trunc(A.FECREF) FECREF,'
         + '       trunc(A.FECREC) FECREC, A.CODLOC, D.LOCDES, A.CCOSID, C.CCOSDES, A.TIPOTRABAJOID, E.TIPOTRABAJODES,'
         + '       A.ESTGENERAL, A.FECINIGEN, A.FECFINGEN, A.USUARIO, A.OBSTRAB '
         + '  From LOG_ORDEN_TRABAJO_CAB A,'
         + '       TGE203 C, ACF120 D, LOG_TIPO_TRABAJO E, LOG_TREQ_ORD_TRAB F '
         + ' Where A.TIPOTRABAJOID=E.TIPOTRABAJOID(+) '
         + '   and A.TREQ_OT_ID=F.TREQ_OT_ID(+) '
         + '   and A.CCOSID=C.CCOSID(+) '
         + '   and A.CODLOC=D.LOCID(+) ';
   Mtx3100.UsuarioSQL.Clear;
   Mtx3100.NoVisible.Clear;
   Mtx3100.UsuarioSQL.Add(xSQL);
   Mtx3100.NewQuery;

   Mtx3100.FMant.cds2.GotoBookmark(B);
   Mtx3100.FMant.cds2.EnableControls;
   Mtx3100.FMant.cds2.FreeBookmark(B);
End;

Procedure TFToolOTrabajo.FormCreate(Sender: TObject);
Begin
   If DMLOG.cdsUsuarios.FieldByName('GRUPOADM').AsString = 'P' Then
      BtnInicial.Visible := True
   Else
      BtnInicial.Visible := False;

   XSQL := 'Select * From TGE135 Where USERID is not null ';
   DMLOG.cdsComprador.Close;
   DMLOG.cdsComprador.DataRequest(XSQL);
   DMLOG.cdsComprador.Open;
   dblcResponsable.LookupField := 'COMPCID';
   dblcResponsable.LookupTable := DMLOG.cdsComprador;
   dblcResponsable.Selected.Clear;
   dblcResponsable.Selected.add('COMPDES'#9'30'#9'Nombre'#9'F');
End;

Procedure TFToolOTrabajo.bbtnCambiaEstadoClick(Sender: TObject);
Var
   xSQL: String;
Begin
// Inicio HPC_201405_LOG
   xSQL := 'DECLARE CURSOR ORDENES IS '
         + ' Select A.CIAID,A.NUMORDTRA, '
         + '        (Select MIN(NUMORDTRA) '
         + '           From LOG_ORDEN_TRABAJO_DET B '
         + '          Where A.CIAID=B.CIAID AND A.NUMORDTRA=B.NUMORDTRA AND B.ESTTRAB not in (''DEVUELTO'') ) NPENDIENTE, '
         + '        (Select COUNT(1) '
         + '           From LOG_ORDEN_TRABAJO_DET B '
         + '          Where A.CIAID=B.CIAID AND A.NUMORDTRA=B.NUMORDTRA AND B.ESTTRAB not in (''ATENDIDO'',''DEVUELTO'') ) VPENDIENTE '
         + '   From LOG_ORDEN_TRABAJO_CAB A; '
         + 'Begin '
         + '   For N IN ORDENES Loop '
         + '      If N.VPENDIENTE>0 THEN '
         + '         Update LOG_ORDEN_TRABAJO_CAB '
         + '            Set ESTGENERAL=''PENDIENTE'' '
         + '          Where CIAID=N.CIAID and NUMORDTRA=N.NUMORDTRA; '
         + '      End If; '
         + '      If N.VPENDIENTE=0 AND N.NPENDIENTE IS NULL THEN '
         + '         Update LOG_ORDEN_TRABAJO_CAB '
         + '            Set ESTGENERAL=''PENDIENTE'' '
         + '          Where CIAID=N.CIAID and NUMORDTRA=N.NUMORDTRA; '
         + '      End If; '
         + '      If N.VPENDIENTE=0 AND N.NPENDIENTE IS NOT NULL THEN '
         + '         Update LOG_ORDEN_TRABAJO_CAB '
         + '            Set ESTGENERAL=''ATENDIDO'' '
         + '          Where CIAID=N.CIAID and NUMORDTRA=N.NUMORDTRA; '
         + '      End If; '
         + '   End Loop; '
         + 'End;';
   DMLOG.DCOM1.AppServer.IniciaTransaccion;
   try
      DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se pudo actualizar la Orden de Trabajo');
      DMLOG.DCOM1.AppServer.RetornaTransaccion;
      Raise;
      exit;
   end;
   DMLOG.DCOM1.AppServer.GrabaTransaccion;
End;

Procedure TFToolOTrabajo.chkUsuarioClick(Sender: TObject);
Begin
   If chkUsuario.Checked Then
      dblcResponsable.Enabled := True
   Else
   Begin
      dblcResponsable.Enabled := False;
      dblcResponsable.Text := '';
   End;
End;

procedure TFToolOTrabajo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMLOG.cdsQry3.Close;
   DMLOG.cdsComprador.Close;
end;

End.

