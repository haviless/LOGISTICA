Unit LOG232;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Wwkeycb, MsgDlgs;

Type
   TFListaRequermientos = Class(TForm)
      pnlArtPend: TPanel;
      pnlDetRqs: TPanel;
      Panel2: TPanel;
      bbtnCerrar: TBitBtn;
      bbtnAceptar: TBitBtn;
      pnlTitulo5: TPanel;
      dbgArtPend: TwwDBGrid;
      dbgRqsArtX: TwwDBGrid;
      pnlOrden: TPanel;
      lblBusca: TLabel;
      Bevel2: TBevel;
      isBusca: TwwIncrementalSearch;
      btnSalir: TBitBtn;
      Procedure bbtnAceptarClick(Sender: TObject);
      Procedure bbtnCerrarClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgArtPendEnter(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure dbgArtPendTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
      Procedure fg_AsignaLookup;
   Public
    { Public declarations }
   End;

Var
   FListaRequermientos: TFListaRequermientos;

Implementation

Uses LOGDM1;

{$R *.DFM}

Procedure TFListaRequermientos.bbtnAceptarClick(Sender: TObject);
Begin
   If dbgArtPend.DataSource.DataSet.RecordCount = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' No hay Requerimientos por Atender ');
      ModalResult := mrCancel;
      Exit;
   End;
   If dbgRqsArtX.DataSource.DataSet.RecordCount = 0 Then
   Begin
      ErrorMsg('Adquisiciones', ' No hay Items a Transferir en este Requerimiento ');
      Exit;
   End;
   ModalResult := mrOK;
End;

Procedure TFListaRequermientos.bbtnCerrarClick(Sender: TObject);
Begin
   ModalResult := mrCancel;
End;

Procedure TFListaRequermientos.FormActivate(Sender: TObject);
Begin
   pnlOrden.Visible := False;
   isBusca.Text := '';
   dbgArtPend.SetFocus;
   fg_AsignaLookup;
End;

Procedure TFListaRequermientos.dbgArtPendEnter(Sender: TObject);
Begin
   DMLOG.cdsArtPendXTot.IndexFieldNames := '';
   pnlOrden.Visible := False;
End;

Procedure TFListaRequermientos.btnSalirClick(Sender: TObject);
Begin
   pnlOrden.Visible := False;
End;

Procedure TFListaRequermientos.dbgArtPendTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
   lblBusca.Caption := 'XX';
   If AfieldName = 'URQID' Then
   Begin
      DMLOG.cdsArtPendXTot.IndexFieldNames := 'URQID';
      lblBusca.Caption := 'Busca por Requerimiento:';
      isBusca.SearchField := 'URQID';
      pnlOrden.Visible := True;
   End
   Else
      If AfieldName = 'URQSOLICDES' Then
      Begin
         DMLOG.cdsArtPendXTot.IndexFieldNames := 'URQSOLICDES';
         lblBusca.Caption := 'Busca por CC Destino:';
         isBusca.SearchField := 'URQSOLICDES';
         pnlOrden.Visible := True;
      End
      Else
         If AfieldName = 'URQSOLIC' Then
         Begin
            DMLOG.cdsArtPendXTot.IndexFieldNames := 'URQSOLIC';
            lblBusca.Caption := 'Busca por Código de CC Destino:';
            isBusca.SearchField := 'URQSOLIC';
            pnlOrden.Visible := True;
         End
         Else
            If AfieldName = 'URQUSR' Then
            Begin
               DMLOG.cdsArtPendXTot.IndexFieldNames := 'URQUSR';
               lblBusca.Caption := 'Busca por Usuario:';
               isBusca.SearchField := 'URQUSR';
               pnlOrden.Visible := True;
            End
            Else
               If AfieldName = 'URQANOMM' Then
               Begin
                  DMLOG.cdsArtPendXTot.IndexFieldNames := 'URQANOMM';
                  lblBusca.Caption := 'Busca por Periodo:';
                  isBusca.SearchField := 'URQANOMM';
                  pnlOrden.Visible := True;
               End
               Else
                  If AfieldName = 'CCOSID' Then
                  Begin
                     DMLOG.cdsArtPendXTot.IndexFieldNames := 'CCOSID';
                     lblBusca.Caption := 'Busca por Código de CC Origen:';
                     isBusca.SearchField := 'CCOSID';
                     pnlOrden.Visible := True;
                  End;
End;

Procedure TFListaRequermientos.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
End;

Procedure TFListaRequermientos.fg_AsignaLookup;
Begin
   dbgArtPend.Selected.Clear;
   dbgArtPend.Selected.Add('CIAID'#9'4'#9'CiaID'#9'F');
   dbgArtPend.Selected.Add('URQID'#9'8'#9'Nº Req'#9'F');
   dbgArtPend.Selected.Add('TIPOADQ'#9'8'#9'Tipo~Req'#9'F');
   dbgArtPend.Selected.Add('CCOSID'#9'8'#9'Cod CC~Registro'#9'F');
   dbgArtPend.Selected.Add('URQEST'#9'8'#9'Estado'#9'F');
   dbgArtPend.Selected.Add('URQSOLIC'#9'8'#9'Cod CC~Destino'#9'F');
   dbgArtPend.Selected.Add('URQSOLICDES'#9'20'#9'Centro de Costo~Destino'#9'F');
   dbgArtPend.Selected.Add('URQOBS'#9'20'#9'Observación'#9'F');
   dbgArtPend.Selected.Add('URQUSR'#9'8'#9'Usuario~Registro'#9'F');
   dbgArtPend.Selected.Add('URQFREG'#9'8'#9'Fecha~Registro'#9'F');
   dbgArtPend.Selected.Add('URQACEPUSR'#9'8'#9'Usuario~Acepta'#9'F');
   dbgArtPend.Selected.Add('URQACEPFREG'#9'8'#9'Fecha~Acepta'#9'F');
   dbgArtPend.Selected.Add('URQANOMM'#9'8'#9'Periodo'#9'F');
   dbgArtPend.RedrawGrid;

   dbgRqsArtX.Selected.Clear;
   dbgRqsArtX.Selected.Add('CIAID'#9'4'#9'CiaID'#9'F');
   dbgRqsArtX.Selected.Add('URQID'#9'8'#9'Nº Req'#9'F');
   dbgRqsArtX.Selected.Add('DURQID'#9'4'#9'Id'#9'F');
   dbgRqsArtX.Selected.Add('ARTID'#9'8'#9'Código~Artículo'#9'F');
   dbgRqsArtX.Selected.Add('DURQOBS'#9'20'#9'Descripción'#9'F');
   dbgRqsArtX.Selected.Add('UNMIDG'#9'6'#9'Unid~Medida'#9'F');
   dbgRqsArtX.Selected.Add('DURQCNSG'#9'8'#9'Cantidad'#9'F');
   dbgRqsArtX.Selected.Add('SFAMID'#9'4'#9'Cod~Fam'#9'F');
   dbgRqsArtX.Selected.Add('SFAMDES'#9'20'#9'Descripción~Familia'#9'F');
   dbgRqsArtX.Selected.Add('DURQOBSUSR'#9'20'#9'Observación~Usuario'#9'F');
   dbgRqsArtX.Selected.Add('URQUSR'#9'10'#9'Usuario'#9'F');
   dbgRqsArtX.RedrawGrid;
End;

End.

