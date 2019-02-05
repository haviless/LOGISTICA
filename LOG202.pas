Unit LOG202;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, db;

Type
   TFSolCot = Class(TForm)
      pnlReqs: TPanel;
      dbgSC: TwwDBGrid;
      btnNuevo: TwwIButton;
      lblTitle: TLabel;
      bvl2: TBevel;
      Procedure btnNuevoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dbgSCKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgSCDblClick(Sender: TObject);
      Procedure FormResize(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FSolCot: TFSolCot;

Implementation

Uses LOGDM1, LOG203, oaAD3000;

{$R *.DFM}

Procedure TFSolCot.btnNuevoClick(Sender: TObject);
Begin
   If DMLOG.cdsSolCot.State In [dsInsert, dsEdit] Then DMLOG.cdsSolCot.Cancel;

   DMLOG.cdsSolCot.Insert;

   DMLOG.cdsSolCot.FieldByName('SCCEST').AsString := 'INICIAL';

   FRegSolCot.dblcCIA.Enabled := True;
   FRegSolCot.dbeNumSol.Enabled := True;
   FRegSolCot.ShowModal;
End;

Procedure TFSolCot.FormCreate(Sender: TObject);
Begin
   Left := 0;
   Top := 0;
   FormResize(Nil);
   If Not DMLOG.cdsSolCot.Active Then
   Begin
      DMLOG.cdsSolCot.Close;
      DMLOG.cdsSolCot.Open;
   End;

   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsDSolCot.DataRequest('Select * from LOG303 order by DSCCID, ARTID, SCCID,CIAID');
   DMLOG.cdsDSolCot.MasterSource := DMLOG.dsSolCot;
   DMLOG.cdsDSolCot.MasterFields := 'CIAID;SCCID';
   DMLOG.cdsDSolCot.IndexFieldNames := 'CIAID;SCCID';
   DMLOG.cdsDSolCot.Open;
End;

Procedure TFSolCot.dbgSCKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = $4D) And (ssCtrl In Shift) Then
   Begin
      dbgSCDblClick(Nil);
   End;
End;

Procedure TFSolCot.dbgSCDblClick(Sender: TObject);
Begin
   DMLOG.cdsDSolCot.Close;
   DMLOG.cdsSolCot.Edit;
   DMLOG.cdsDSolCot.Open;
   FRegSolCot.dblcCIA.Enabled := False;
   FRegSolCot.dbeNumSol.Enabled := False;
   FRegSolCot.ShowModal;
End;

Procedure TFSolCot.FormResize(Sender: TObject);
Begin
   With ClientRect Do
   Begin
      dbgSC.Left := Left + 10;
      dbgSC.Top := Top + lblTitle.Top + lblTitle.Height + 20;
      dbgSC.Width := (dbgSC.Left + Right) - 35;
      dbgSC.Height := Bottom - 75;
   End;
End;

Procedure TFSolCot.FormShow(Sender: TObject);
Begin
   DMLOG.AccesosUsuarios(DMLOG.wModulo, DMLOG.wUsuario, '2', Screen.ActiveForm.Name);
End;

End.

