unit LOG206;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ExtCtrls, db;

type
  TFProformas = class(TForm)
    pnlReqs: TPanel;
    dbgProforma: TwwDBGrid;
    Z2btnNuevo: TwwIButton;
    bvl1: TBevel;
    lblTitle: TLabel;
    procedure Z2btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgProformaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProformaDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProformas: TFProformas;

implementation

uses LOGDM1, LOG207, oaAD3000;

{$R *.DFM}

procedure TFProformas.Z2btnNuevoClick(Sender: TObject);
begin
 if DM1.cdsProforma.State in [dsInsert,dsEdit] then
    DM1.cdsProforma.Cancel;

 DM1.cdsProforma.Insert;
 FRegProf.ShowModal;
end;

procedure TFProformas.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top  := 0;
  with ClientRect do
  begin
  dbgProforma.Left   := Left+10;
  dbgProforma.Top    := Top+lblTitle.Top+lblTitle.Height+20;
  bvl1.Left          := Left+10;
  bvl1.Top	     := Top+lblTitle.Top+lblTitle.Height+5;
  dbgProforma.Width  := (dbgProforma.Left+Right)-35;
  dbgProforma.Height := Bottom-75;
  end;

  DM1.cdsDProforma.Close                              ;
  DM1.cdsDProforma.MasterSource := DM1.dsProforma     ;
  DM1.cdsDProforma.MasterFields := 'CIAID;PROFID'     ;
  DM1.cdsDProforma.IndexFieldNames  := 'CIAID;PROFID' ;
  DM1.cdsDProforma.Open;

end;

procedure TFProformas.dbgProformaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=$4D) and (ssCtrl in Shift) then
  begin
    dbgProformaDblClick(nil);
  end;

{if (Key=VK_DELETE) and (ssCtrl in Shift)  then
 begin
    DM1.cdsProforma.Delete;
    FRegReqs.ShowModal;
 end;}
end;

procedure TFProformas.dbgProformaDblClick(Sender: TObject);
begin
  DM1.cdsDProforma.Close;
  DM1.cdsDProforma.Open;
  DM1.cdsProforma.Edit;
  FRegProf.dblcCIA.Enabled         := False;
  FRegProf.dedNProforma.Enabled    := False;
  FRegProf.ShowModal;
end;

procedure TFProformas.FormResize(Sender: TObject);
begin
  FormCreate(nil);
end;

end.
