unit LOG211;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, db;

type
  TFArticulo = class(TForm)
    pnlReqs: TPanel;
    dbgMA: TwwDBGrid;
    Z2btnNuevo: TwwIButton;
    lblTitle: TLabel;
    bvl2: TBevel;
    procedure Z2btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgMAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMADblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArticulo: TFArticulo;

implementation

uses LOGDM1, LOG212;

{$R *.DFM}

procedure TFArticulo.Z2btnNuevoClick(Sender: TObject);
begin
 if DM1.cdsArti.State in [dsInsert,dsEdit] then DM1.cdsArti.Cancel;
  DM1.cdsArti.Insert;

  FRegArti.dblcCIA.Enabled    := True;
  FRegArti.dbeCodArti.Enabled := True;

  FRegArti.ShowModal;
end;

procedure TFArticulo.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top  := 0;
  FormResize(nil);

  with DM1 do
  begin
    cdsArti.Open;
    cdsQARTI.Close;
    cdsQARTI.MasterFields   := 'CIAID;ARTID';
    cdsQARTI.MasterSource   := dsArti;
    cdsQARTI.IndexFieldNames:= 'CIAID;ARTID';
    cdsQARTI.Open;
  end;

end;

procedure TFArticulo.dbgMAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift) then
  begin
    dbgMADblClick(nil);
  end;

{ if (Key=VK_DELETE) and (ssCtrl in Shift)  then
 begin
  DM1.cdsReqs.Delete;
  FRegReqs.ShowModal;
 end; }

end;

procedure TFArticulo.dbgMADblClick(Sender: TObject);
begin
  DM1.cdsArti.Edit;
  DM1.cdsEARTI.Close;
  DM1.cdsQARTI.Close;
  DM1.cdsEARTI.Open;
  DM1.cdsQARTI.Open;

  FRegArti.dblcCIA.Enabled    := False;
  FRegArti.dbeCodArti.Enabled := False;
  FRegArti.ShowModal;
end;

procedure TFArticulo.FormResize(Sender: TObject);
begin
  with ClientRect do
  begin
     dbgMA.Left   := Left+10;
     dbgMA.Top    := Top+lblTitle.Top+lblTitle.Height+20;
     dbgMA.Width  := (dbgMA.Left+Right)-35;
     dbgMA.Height:= Bottom-75;
  end;
end;

end.
