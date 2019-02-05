unit LOG218;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons;

type
  TFEvalProfSerAct = class(TForm)
    Panel1: TPanel;
    dbgSolCot: TwwDBGrid;
    Z2bbtnOkSuma: TBitBtn;
    Z2bbtnOkPrint: TBitBtn;
    dbgProSolCot: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEvalProfSerAct: TFEvalProfSerAct;

implementation

uses LOGDM1, oaAD3000;

{$R *.DFM}

procedure TFEvalProfSerAct.FormCreate(Sender: TObject);
var
	xSql : String;
begin
	dm1.cdsSolCot.Close;
  xSql:='';
	if   CualFormSerAct = 'SER' then
  begin
		Caption:='Evaluación de Proforma Para Servicio';
  	xSql:='SELECT * FROM LOG302 WHERE TIPOADQ = ''S''';
    dm1.cdsSolCot.DataRequest(xSql);
  end;
  if   CualFormSerAct = 'ACT' then
  begin
		Caption:='Evaluación de Proforma Para Activo Fijo';
  	xSql:='SELECT * FROM LOG302 WHERE TIPOADQ = ''A''';
    dm1.cdsSolCot.DataRequest(xSql);
  end;
    dm1.cdsSolCot.Open;
end;

end.
