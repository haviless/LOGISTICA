unit LOG220;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, ExtCtrls, wwdblook, db;

type
  TFAsigOC2Rqs = class(TForm)
    pnlBarra: TPanel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnGrabar: TBitBtn;
    Z2bbtnCancelar: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    Z2bbtnImprimir: TBitBtn;
    dbgDRQS: TwwDBGrid;
    dbgDOC: TwwDBGrid;
    pnlCalculo: TPanel;
    rbAsigFifo: TRadioButton;
    rbAsigProm: TRadioButton;
    rbManual: TRadioButton;
    pnlAsignacion: TPanel;
    z2bbtnOkAsig: TBitBtn;
    z2bbtnAsigCanc: TBitBtn;
    edtUMed: TEdit;
    edtArt: TEdit;
    memDetalle: TMemo;
    edtCantPed: TEdit;
    edtCantAte: TEdit;
    stxTitulo: TStaticText;
    edtSol: TEdit;
    edtDSol: TEdit;
    edtReq: TEdit;
    edtDReq: TEdit;
    procedure UpdateFooter(Sender: TObject);
    procedure ChangeCalc(sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnCancelarClick(Sender: TObject);
    procedure dbgDRQSDblClick(Sender: TObject);
    procedure dbgDOCRowChanged(Sender: TObject);
    procedure z2bbtnOkAsigClick(Sender: TObject);
    procedure z2bbtnAsigCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsigOC2Rqs: TFAsigOC2Rqs;

implementation

uses LOGDM1;

{$R *.DFM}

procedure TFAsigOC2Rqs.Z2bbtnOKClick(Sender: TObject);
begin
  modalResult := mrOK;
end;

procedure TFAsigOC2Rqs.Z2bbtnCancelarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TFAsigOC2Rqs.dbgDRQSDblClick(Sender: TObject);
begin
  edtSol.text     := DMLOG.cdsFAsig.fieldbyName('SCCID ').asString;
  edtDSol.text    := DMLOG.cdsFAsig.fieldbyName('DSCCID').asString;
  edtReq.text     := DMLOG.cdsFAsig.fieldbyName('RQSID ').asString;
  edtDReq.text    := DMLOG.cdsFAsig.fieldbyName('DRQSID').asString;
  edtUMed.text    := DMLOG.cdsFAsig.fieldbyName('UNMID').asString;
  edtArt.text     := DMLOG.cdsFAsig.fieldbyName('ARTID').asString;
  memDetalle.text := DMLOG.cdsFAsig.fieldbyName('DODCOBS').asString;
  edtCantPed.text := DMLOG.cdsFAsig.fieldbyName('CANTSOL').asString;
  edtCantAte.text := DMLOG.cdsFAsig.fieldbyName('CANTATE').asString;
  pnlAsignacion.Enabled := false;
  pnlAsignacion.visible := true;

end;

procedure TFAsigOC2Rqs.dbgDOCRowChanged(Sender: TObject);
begin
  UpdateFooter(sender);
  ChangeCalc(sender);

end;

procedure TFAsigOC2Rqs.ChangeCalc(sender: TObject);
var
	nTotPed, nCantAte, nTemp : integer;
	nDelta : double;
begin
  nTotPed := DMLOG.cdsDOrdComp.fieldbyname('DODCCNT').asInteger;
  DMLOG.cdsFAsig.First;

  if rbManual.checked then
  begin
  	Exit
  end;

  if rbAsigFifo.checked then
  begin
    while not DMLOG.cdsFAsig.eof do
    begin
      DMLOG.cdsFAsig.Edit;
      if nTotPed > 0 then
      begin
        nCantAte := DMLOG.cdsFAsig.fieldbyName('CANTSOL').asInteger;
        if nTotPed > nCantAte then
          DMLOG.cdsFAsig.FieldByName('CANTATE').asInteger := nCantAte
        else
          DMLOG.cdsFAsig.FieldByName('CANTATE').asInteger := nTotPed;
        nTotPed := nTotPed - nCantAte;
      end
      else
        DMLOG.cdsFAsig.FieldByName('CANTATE').asInteger := 0;
      DMLOG.cdsFAsig.post;
      DMLOG.cdsFAsig.next;
    end;
  end; //rbAsigFifo

  if rbAsigProm.Checked then
  begin
    nTemp := 0;
    while not DMLOG.cdsFAsig.eof do
    begin
      nTemp := nTemp + DMLOG.cdsFAsig.fieldbyName('CANTSOL').asInteger;
      DMLOG.cdsFAsig.next;
    end;
    nDelta := nTotPed/nTemp;
    if nDelta > 1 then
      nDelta := 1;
    DMLOG.cdsFAsig.first;
    while not DMLOG.cdsFAsig.eof do
    begin
      DMLOG.cdsFAsig.Edit;
      nCantAte := trunc(DMLOG.cdsFAsig.fieldbyName('CANTSOL').asInteger * nDelta + 0.5);
      if nTotPed-nCantAte > 0 then
        DMLOG.cdsFAsig.FieldByName('CANTATE').asInteger := nCantAte
      else
        DMLOG.cdsFAsig.FieldByName('CANTATE').asInteger := nTotPed;
      nTotPed := nTotPed - nCantAte;
      DMLOG.cdsFAsig.post;
      DMLOG.cdsFAsig.next;
    end;
  end; //rbAsigProm
  UpdateFooter(Sender);
end;

procedure TFAsigOC2Rqs.UpdateFooter(Sender: TObject);
var
	bkmActual : Tbookmark;
  nCantSol, nCantAte : double;
begin
  DMLOG.cdsFAsig.disablecontrols;
  bkmActual := DMLOG.cdsFAsig.GetBookmark;
  DMLOG.cdsFAsig.first;

  nCantSol := 0.0;
  nCantAte := 0.0;
  while not DMLOG.cdsFAsig.eof do
  begin
    nCantSol := nCantSol + DMLOG.cdsFAsig.fieldbyname('CANTSOL').asInteger;
    nCantAte := nCantAte + DMLOG.cdsFAsig.fieldbyname('CANTATE').asInteger;
    DMLOG.cdsFAsig.next;
  end;
  dbgDRQS.ColumnByName('CANTSOL').FooterValue := FloatToStr(nCantSol);
  dbgDRQS.ColumnByName('CANTATE').FooterValue := FloatToStr(nCantSol);

  DMLOG.cdsFAsig.GotoBookmark(bkmActual);
  DMLOG.cdsFAsig.FreeBookmark(bkmActual);
  DMLOG.cdsFAsig.enablecontrols;
end;

procedure TFAsigOC2Rqs.z2bbtnOkAsigClick(Sender: TObject);
var bkmActual : TBookmark;
begin
  inherited;
  bkmActual := DMLOG.cdsFAsig.GetBookmark;
  DMLOG.cdsFAsig.Edit;
  DMLOG.cdsFAsig.fieldbyName('CANTATE').asString := edtCantAte.text;
  DMLOG.cdsFAsig.First;
  while not DMLOG.cdsFAsig.eof do
  begin
    DMLOG.cdsFAsig.Next;
  end;
  DMLOG.cdsFAsig.GotoBookmark(bkmActual);
  DMLOG.cdsFAsig.Next;
  DMLOG.cdsFAsig.FreeBookmark(bkmActual);
  dbgDRQS.OnDblClick(nil);
end;

procedure TFAsigOC2Rqs.z2bbtnAsigCancClick(Sender: TObject);
begin
  pnlAsignacion.Enabled := true;
  pnlAsignacion.visible := false;
end;

procedure TFAsigOC2Rqs.FormShow(Sender: TObject);
begin
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

end.
