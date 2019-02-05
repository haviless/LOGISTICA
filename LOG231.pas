Unit LOG231;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DB;

Type
   TFConsultaCXP = Class(TForm)
      bbtnConsultar: TBitBtn;
      pcConsultaSeguimOC: TPageControl;
      tsSolicOPago: TTabSheet;
      tsRegistroCXP: TTabSheet;
      tsPagos: TTabSheet;
      dbgSolicOPago: TwwDBGrid;
      dbgRegCxP: TwwDBGrid;
      dbgPagos: TwwDBGrid;
      bbtnTodasLasProv: TBitBtn;
      Procedure bbtnConsultarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dbgRegCxPDblClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dbgSolicOPagoTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dbgRegCxPCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnTodasLasProvClick(Sender: TObject);
      Procedure dbgRegCxPTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FConsultaCXP: TFConsultaCXP;
   xSQL: String;
   xTieneProvis: Boolean;
   xCiaId, xClAuxId, xProv, xODCId: String;

Implementation

Uses LOG219, oaAD3100, LOGDM1;

{$R *.dfm}

Procedure TFConsultaCXP.bbtnConsultarClick(Sender: TObject);
Begin
   xSQL := 'Select CIAID, CLAUXID, PROV, ODCID '
      + '     from LOG304 '
      + '    where CIAID=' + quotedstr(Mtx3100.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and ODCID=' + quotedstr(Mtx3100.FMant.cds2.FieldByName('ODCID').AsString);
   DMLOG.cdsQry2.Close;
   DMLOG.cdsQry2.DataRequest(xSQL);
   DMLOG.cdsQry2.Open;
   If DMLOG.cdsQry2.Recordcount = 0 Then
   Begin
      ShowMessage('No se ha ubicado la Orden de Compra');
      Exit;
   End;

   xCiaId := DMLOG.cdsQry2.FieldByName('CIAID').AsString;
   xClAuxId := DMLOG.cdsQry2.FieldByName('CLAUXID').AsString;
   xProv := DMLOG.cdsQry2.FieldByName('PROV').AsString;
   xODCId := DMLOG.cdsQry2.FieldByName('ODCID').AsString;

// Solicitudes de Orden de Pago de la Orden de Compra
   xSQL := '   Select NUMORDPAG, ODCID, PROV, DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, BASIMP, IGV, TOTAL, '
      + '          CPESTTRA, USUANU, FECANU, USUREG, FECREG, USUMOD, FECMOD, ITEM '
      + '     from LOG130 '
      + '    where CIAID=' + quotedstr(Mtx3100.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and ODCID=' + quotedstr(Mtx3100.FMant.cds2.FieldByName('ODCID').AsString);
   DMLOG.cdsQry3.Close;
   DMLOG.cdsQry3.DataRequest(xSQL);
   DMLOG.cdsQry3.Open;
   {
   If DMLOG.cdsQry3.Recordcount>0 Then
   Begin
         xSolicOPago := 'Solicitudes de Orden de Pago:'+chr(13);
         xProvisiones := 'Provisiones:'+chr(13);
         xPagos := 'Pagos:'+chr(13);
         While not DMLOG.cdsQry3.EOF do
         Begin
            xSolicOPago := xSolicOPago
               + 'Nro.O.Pago:'+quotedstr(DMLOG.cdsQry3.FieldByName('NUMORDPAG').AsString)+', '
               + 'Tipo de Documento:'+quotedstr(DMLOG.cdsQry3.FieldByName('DOCID').AsString)+', '
               + 'Serie de Documento:'+quotedstr(DMLOG.cdsQry3.FieldByName('CPSERIE').AsString)+', '
               + 'Nro. de Documento:'+quotedstr(DMLOG.cdsQry3.FieldByName('CPNODOC').AsString)+chr(13);
   }
// Provisiones por Pagar
   xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, DOCID, CPSERIE, CPNODOC, CPFRECEP, '
      + '          CPFEMIS, CPFVCMTO, TMONID, CPESTADO, CPMTOORI, CPPAGORI, CPSALORI, CPUSER, CPFREG, PROVDES, ''N'' ENCONTRADO '
      + '     from CXP301 '
      + '    where CLAUXID=' + quotedstr(xClAuxId)
      + '      and PROV=' + quotedstr(xProv)
      + '      and CPESTADO in (''C'',''P'')';
//      + '      and CPFEMIS>='+quotedstr(datetostr(Mtx3100.FMant.cds2.FieldByName('ODCFEMI').AsDateTime));
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry4.DataRequest(xSQL);
   DMLOG.cdsQry4.Open;
   If DMLOG.cdsQry4.RecordCount > 0 Then
   Begin
      xTieneProvis := False;
      If DMLOG.cdsQry4.Locate('DOCID;CPSERIE;CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('DOCID').AsString,
         DMLOG.cdsQry3.FieldByName('CPSERIE').AsString,
            DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
         xTieneProvis := True
      Else
         If DMLOG.cdsQry4.Locate('CPSERIE;CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('CPSERIE').AsString,
            DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
            xTieneProvis := True
         Else
            If DMLOG.cdsQry4.Locate('CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
               xTieneProvis := True;
   End;
   If xTieneProvis Then
   Begin
      DMLOG.cdsQry4.Edit;
      DMLOG.cdsQry4.FieldByName('ENCONTRADO').AsString := 'S';
      DMLOG.cdsQry4.Post;
   End;
End;

Procedure TFConsultaCXP.FormCreate(Sender: TObject);
Begin
// Solicitudes de Orden de Pago
   dbgSolicOPago.datasource := DMLOG.dsQry3;
   dbgSolicOPago.Selected.Clear;
   dbgSolicOPago.Selected.Add('NUMORDPAG'#9'10'#9'Solic.O.Pago'#9#9);
   dbgSolicOPago.Selected.Add('ODCID'#9'10'#9'Orden de Compra'#9#9);
   dbgSolicOPago.Selected.Add('PROV'#9'10'#9'Cód.Prov'#9#9);
   dbgSolicOPago.Selected.Add('DOCID'#9'10'#9'Tipo Doc'#9#9);
   dbgSolicOPago.Selected.Add('CPSERIE'#9'10'#9'Serie Doc'#9#9);
   dbgSolicOPago.Selected.Add('CPNODOC'#9'10'#9'Nro.Doc'#9#9);
   dbgSolicOPago.Selected.Add('CPFRECEP'#9'10'#9'F.Recepción'#9#9);
   dbgSolicOPago.Selected.Add('CPFEMIS'#9'10'#9'F.Emisión'#9#9);
   dbgSolicOPago.Selected.Add('CPFVCMTO'#9'10'#9'F.Vencimiento'#9#9);
   dbgSolicOPago.Selected.Add('TMONID'#9'10'#9'T.Moneda'#9#9);
   dbgSolicOPago.Selected.Add('BASIMP'#9'10'#9'Base Imponible'#9#9);
   dbgSolicOPago.Selected.Add('IGV'#9'10'#9'IGV'#9#9);
   dbgSolicOPago.Selected.Add('TOTAL'#9'10'#9'Total'#9#9);
   dbgSolicOPago.Selected.Add('CPESTTRA'#9'10'#9'Estado'#9#9);
   dbgSolicOPago.Selected.Add('USUANU'#9'10'#9'Usu.q Anuló'#9#9);
   dbgSolicOPago.Selected.Add('FECANU'#9'10'#9'Fec.Anul'#9#9);
   dbgSolicOPago.Selected.Add('USUREG'#9'10'#9'Usu.q Reg'#9#9);
   dbgSolicOPago.Selected.Add('FECREG'#9'10'#9'Fec.Reg'#9#9);
   dbgSolicOPago.Selected.Add('USUMOD'#9'10'#9'Usu.q Modif'#9#9);
   dbgSolicOPago.Selected.Add('FECMOD'#9'10'#9'Fec.Modif.'#9#9);
   dbgSolicOPago.Selected.Add('ITEM'#9'10'#9'Item'#9#9);
   dbgSolicOPago.ApplySelected;

// Provisiones por Pagar
   dbgRegCxP.datasource := DMLOG.dsQry4;
   dbgRegCxP.Selected.Clear;
   dbgRegCxP.Selected.Add('CLAUXID'#9'10'#9'Clase Aux'#9#9);
   dbgRegCxP.Selected.Add('PROV'#9'10'#9'Cod.Proveedor'#9#9);
   dbgRegCxP.Selected.Add('PROVRUC'#9'10'#9'RUC Proveedor'#9#9);
   dbgRegCxP.Selected.Add('PROVDES'#9'30'#9'Nombre del Proveedor'#9#9);
   dbgRegCxP.Selected.Add('DOCID'#9'5'#9'Tipo.Doc'#9#9);
   dbgRegCxP.Selected.Add('CPSERIE'#9'5'#9'Serie'#9#9);
   dbgRegCxP.Selected.Add('CPNODOC'#9'15'#9'Nro.Doc'#9#9);
   dbgRegCxP.Selected.Add('CPFRECEP'#9'10'#9'Fec.Recep'#9#9);
   dbgRegCxP.Selected.Add('CPFEMIS'#9'10'#9'Fec.Emisión'#9#9);
   dbgRegCxP.Selected.Add('CPFVCMTO'#9'10'#9'Fec.Vcmto.'#9#9);
   dbgRegCxP.Selected.Add('TMONID'#9'5'#9'T.Moneda'#9#9);
   dbgRegCxP.Selected.Add('CPESTADO'#9'6'#9'Estado'#9#9);
   dbgRegCxP.Selected.Add('CPMTOORI'#9'10'#9'Monto Total'#9#9);
//   dbgRegCxP.Selected.Add('CPPAGORI'#9'10'#9'Monto Pagado'#9#9);
//   dbgRegCxP.Selected.Add('CPSALORI'#9'10'#9'Monto Saldo'#9#9);
   dbgRegCxP.Selected.Add('CIAID'#9'5'#9'Compañía'#9#9);
   dbgRegCxP.Selected.Add('CPANOMES'#9'10'#9'Año+Mes'#9#9);
   dbgRegCxP.Selected.Add('TDIARID'#9'5'#9'T.Diario'#9#9);
   dbgRegCxP.Selected.Add('CPNOREG'#9'10'#9'Nro.Registro'#9#9);
   dbgRegCxP.Selected.Add('CPUSER'#9'10'#9'Usuario'#9#9);
   dbgRegCxP.Selected.Add('CPFREG'#9'10'#9'Fec.Registro'#9#9);
   dbgRegCxP.ApplySelected;

// Pagos Realizados
   dbgPagos.datasource := DMLOG.dsQry5;
   xSQL := 'Select ''12'' DOCID, ''123456789012'' CPSERIE, ''123456789012345'' CPNODOC, '
      + '          ''12345'' FPAGOID, ''123456789012345'' NROCHEQUE, '
      + '          ''12'' BANCOID, ''123456789012345678901234567890'' BANCONOM, ''123456789012345'' CCBCOID, trunc(Sysdate) FECPAGO, '
      + '          ''1234567890123456789012345678901234567890123456789012345678901234567890'' GIRADOA, '
      + '          ''12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' GLOSA '
      + '     from DUAL '
      + '    where 1<>1';
   DMLOG.cdsQry5.Close;
   DMLOG.cdsQry5.DataRequest(xSQL);
   DMLOG.cdsQry5.Open;
   dbgPagos.Selected.Clear;
   dbgPagos.Selected.Add('DOCID'#9'5'#9'T.Doc'#9#9);
   dbgPagos.Selected.Add('CPSERIE'#9'6'#9'Serie'#9#9);
   dbgPagos.Selected.Add('CPNODOC'#9'10'#9'Nro.Doc'#9#9);
   dbgPagos.Selected.Add('FPAGOID'#9'10'#9'Forma de Pago'#9#9);
   dbgPagos.Selected.Add('NROCHEQUE'#9'15'#9'#Cheque/TLB'#9#9);
   dbgPagos.Selected.Add('BANCOID'#9'5'#9'Banco'#9#9);
   dbgPagos.Selected.Add('BANCONOM'#9'20'#9'Nombre del Banco'#9#9);
   dbgPagos.Selected.Add('CCBCOID'#9'15'#9'Cta.Cte.Banco'#9#9);
   dbgPagos.Selected.Add('FECPAGO'#9'10'#9'Fecha de Pago'#9#9);
   dbgPagos.Selected.Add('GIRADOA'#9'20'#9'Girado A'#9#9);
   dbgPagos.Selected.Add('GLOSA'#9'100'#9'Glosa'#9#9);
   dbgPagos.ApplySelected;
End;

Procedure TFConsultaCXP.dbgRegCxPDblClick(Sender: TObject);
Var
   xCiaId, xClAuxId, xProv, xODCId, xDocid, xCPSerie, xCPNoDoc: String;
Begin
   DMLOG.cdsQry5.EmptyDataSet;
// Busca Pagos con Cheque
   xSQL := '   Select CAJA303.CIAID, CAJA303.ECANOMM, CAJA303.TDIARID, CAJA303.ECNOCOMP, '
      + '             CAJA302.FPAGOID, CAJA302.ECNOCHQ, CAJA302.BANCOID, TGE105.BANCONOM, CAJA302.CCBCOID, '
      + '             CAJA302.ECGIRA, CAJA302.ECGLOSA, CAJA302.ECFCOMP, CAJA302.ECFEMICH, '
      + '             CAJA303.DOCID2, CAJA303.CPSERIE, CAJA303.CPNODOC '
      + '        from CAJA303, CAJA302, TGE105 '
      + '       where CAJA303.CIAID=' + quotedstr(DMLOG.cdsQry4.FieldByName('CIAID').AsString)
      + '         and CAJA303.CPANOMM=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPANOMES').AsString)
      + '         and CAJA303.TDIARID2=' + quotedstr(DMLOG.cdsQry4.FieldByName('TDIARID').AsString)
      + '         and CAJA303.CPNOREG=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPNOREG').AsString)
      + '         and CAJA303.CLAUXID=' + quotedstr(xClAuxId)
      + '         and CAJA303.PROV=' + quotedstr(xProv)
      + '         and CAJA303.DOCID2=' + quotedstr(DMLOG.cdsQry4.FieldByName('DOCID').AsString)
      + '         and CAJA303.CPSERIE=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPSERIE').AsString)
      + '         and CAJA303.CPNODOC=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPNODOC').AsString)
      + '         and CAJA302.CIAID=CAJA303.CIAID and CAJA302.ECANOMM=CAJA303.ECANOMM '
      + '            and CAJA302.TDIARID=CAJA303.TDIARID and CAJA302.ECNOCOMP=CAJA303.ECNOCOMP '
      + '            and CAJA302.ECESTADO=''C'' '
      + '         and TGE105.BANCOID=CAJA302.BANCOID';
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;
   If DMLOG.cdsQry6.RecordCount > 0 Then
   Begin
      While Not DMLOG.cdsQry6.EOF Do
      Begin
         DMLOG.cdsQry5.Append;
         DMLOG.cdsQry5.FieldByName('DOCID').AsString := DMLOG.cdsQry6.FieldByName('DOCID2').AsString;
         DMLOG.cdsQry5.FieldByName('CPSERIE').AsString := DMLOG.cdsQry6.FieldByName('CPSERIE').AsString;
         DMLOG.cdsQry5.FieldByName('CPNODOC').AsString := DMLOG.cdsQry6.FieldByName('CPNODOC').AsString;
         DMLOG.cdsQry5.FieldByName('FPAGOID').AsString := DMLOG.cdsQry6.FieldByName('FPAGOID').AsString;
         DMLOG.cdsQry5.FieldByName('NROCHEQUE').AsString := DMLOG.cdsQry6.FieldByName('ECNOCHQ').AsString;
         DMLOG.cdsQry5.FieldByName('BANCOID').AsString := DMLOG.cdsQry6.FieldByName('BANCOID').AsString;
         DMLOG.cdsQry5.FieldByName('BANCONOM').AsString := DMLOG.cdsQry6.FieldByName('BANCONOM').AsString;
         DMLOG.cdsQry5.FieldByName('CCBCOID').AsString := DMLOG.cdsQry6.FieldByName('CCBCOID').AsString;
         DMLOG.cdsQry5.FieldByName('FECPAGO').AsDateTime := DMLOG.cdsQry6.FieldByName('ECFEMICH').AsDateTime;
         DMLOG.cdsQry5.FieldByName('GIRADOA').AsString := DMLOG.cdsQry6.FieldByName('ECGIRA').AsString;
         DMLOG.cdsQry5.FieldByName('GLOSA').AsString := DMLOG.cdsQry6.FieldByName('GLOSA').AsString;
         DMLOG.cdsQry5.Post;
         DMLOG.cdsQry6.Next;
      End;
   End;

// Busca en TeleBanco
   xSQL := '   Select CXP_ORD_PAG_DET.NUMERO, CXP_ORD_PAG_CAB.BANCOID, CXP_ORD_PAG_CAB.CCBCOID, '
      + '             CXP_ORD_PAG_CAB.FECHA, CXP_ORD_PAG_CAB.OBSERVA, TGE105.BANCONOM, '
      + '             CXP_ORD_PAG_DET.DOCID, CXP_ORD_PAG_DET.CPSERIE, CXP_ORD_PAG_DET.CPNODOC '
      + '     from CXP_ORD_PAG_DET, CXP_ORD_PAG_CAB, TGE105 '
      + '    where CXP_ORD_PAG_DET.CIAID=' + quotedstr(DMLOG.cdsQry4.FieldByName('CIAID').AsString)
      + '      and CXP_ORD_PAG_DET.DOCID=' + quotedstr(DMLOG.cdsQry4.FieldByName('DOCID').AsString)
      + '      and CXP_ORD_PAG_DET.CPSERIE=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPSERIE').AsString)
      + '      and CXP_ORD_PAG_DET.CPNODOC=' + quotedstr(DMLOG.cdsQry4.FieldByName('CPNODOC').AsString)
      + '      and CXP_ORD_PAG_CAB.CIAID = CXP_ORD_PAG_DET.CIAID '
      + '      and CXP_ORD_PAG_CAB.NUMERO = CXP_ORD_PAG_DET.NUMERO '
      + '      and CXP_ORD_PAG_CAB.ESTADO=''C'' '
      + '      and TGE105.BANCOID=CXP_ORD_PAG_CAB.BANCOID';
   DMLOG.cdsQry6.Close;
   DMLOG.cdsQry6.DataRequest(xSQL);
   DMLOG.cdsQry6.Open;
   If DMLOG.cdsQry6.RecordCount > 0 Then
   Begin
      While Not DMLOG.cdsQry6.EOF Do
      Begin
         DMLOG.cdsQry5.Append;
         DMLOG.cdsQry5.FieldByName('DOCID').AsString := DMLOG.cdsQry6.FieldByName('DOCID').AsString;
         DMLOG.cdsQry5.FieldByName('CPSERIE').AsString := DMLOG.cdsQry6.FieldByName('CPSERIE').AsString;
         DMLOG.cdsQry5.FieldByName('CPNODOC').AsString := DMLOG.cdsQry6.FieldByName('CPNODOC').AsString;
         DMLOG.cdsQry5.FieldByName('FPAGOID').AsString := 'TLB';
         DMLOG.cdsQry5.FieldByName('NROCHEQUE').AsString := DMLOG.cdsQry6.FieldByName('NUMERO').AsString;
         DMLOG.cdsQry5.FieldByName('BANCOID').AsString := DMLOG.cdsQry6.FieldByName('BANCOID').AsString;
         DMLOG.cdsQry5.FieldByName('BANCONOM').AsString := DMLOG.cdsQry6.FieldByName('BANCONOM').AsString;
         DMLOG.cdsQry5.FieldByName('CCBCOID').AsString := DMLOG.cdsQry6.FieldByName('CCBCOID').AsString;
         DMLOG.cdsQry5.FieldByName('FECPAGO').AsDateTime := DMLOG.cdsQry6.FieldByName('FECHA').AsDateTime;
         DMLOG.cdsQry5.FieldByName('GIRADOA').AsString := 'PAGADO POR TELEBANCO';
         DMLOG.cdsQry5.FieldByName('GLOSA').AsString := DMLOG.cdsQry6.FieldByName('OBSERVA').AsString;
         DMLOG.cdsQry5.Post;
         DMLOG.cdsQry6.Next;
      End;
   End;
End;

Procedure TFConsultaCXP.FormShow(Sender: TObject);
Begin
   pcConsultaSeguimOC.ActivePageIndex := 0;
   bbtnConsultar.Click;
End;

Procedure TFConsultaCXP.dbgSolicOPagoTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   DMLOG.cdsQry3.IndexFieldNames := AFieldName;
End;

Procedure TFConsultaCXP.dbgRegCxPCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If (Not Highlight) Then
   Begin
      If DMLOG.cdsQry4.FieldByName('ENCONTRADO').AsString = 'S' Then
         ABrush.Color := clYellow
      Else
         ABrush.Color := clWhite;
   End;
End;

Procedure TFConsultaCXP.bbtnTodasLasProvClick(Sender: TObject);
Begin
   xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, DOCID, CPSERIE, CPNODOC, CPFRECEP, '
      + '          CPFEMIS, CPFVCMTO, TMONID, CPESTADO, CPMTOORI, CPPAGORI, CPSALORI, CPUSER, CPFREG, PROVDES '
      + '     from CXP301 '
      + '    where CLAUXID=' + quotedstr(xClAuxId)
      + '      and PROV=' + quotedstr(xProv)
      + '      and CPESTADO in (''C'',''P'')';
   DMLOG.cdsQry4.Close;
   DMLOG.cdsQry4.DataRequest(xSQL);
   DMLOG.cdsQry4.Open;
   If DMLOG.cdsQry4.RecordCount > 0 Then
   Begin
      xTieneProvis := False;
      If DMLOG.cdsQry4.Locate('DOCID;CPSERIE;CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('DOCID').AsString,
         DMLOG.cdsQry3.FieldByName('CPSERIE').AsString,
            DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
         xTieneProvis := True
      Else
         If DMLOG.cdsQry4.Locate('CPSERIE;CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('CPSERIE').AsString,
            DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
            xTieneProvis := True
         Else
            If DMLOG.cdsQry4.Locate('CPNODOC', VarArrayOf([DMLOG.cdsQry3.FieldByName('CPNODOC').AsString]), []) Then
               xTieneProvis := True;
   End;
End;

Procedure TFConsultaCXP.dbgRegCxPTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   DMLOG.cdsQry4.IndexFieldNames := AFieldName;
End;

Procedure TFConsultaCXP.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMLOG.cdsQry4.IndexFieldNames := '';
End;

End.

