unit LOG229;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdblook, Wwdbdlg, ExtCtrls, MsgDlgs;

type
  TFActPCompra = class(TForm)
    dblcdArti: TwwDBLookupComboDlg;
    edtArti: TEdit;
    dbePUnit: TEdit;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    lblArtPCompra: TLabel;
    lblPCompra: TLabel;
    Timer1: TTimer;
    procedure dblcdArtiExit(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FActPCompra: TFActPCompra;
  xAccesoBotones : Boolean;

implementation

uses LOGDM1;

{$R *.DFM}

procedure TFActPCompra.dblcdArtiExit(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
	if Length(Trim(dblcdArti.Text)) <> DMLOG.wAnchoArt then
  	dblcdArti.Text:= DMLOG.StrZero(dblcdArti.Text,DMLOG.wAnchoArt);
	DMLOG.cdsSobrino.SetKey;
	DMLOG.cdsSobrino.FieldByname('ARTID').AsString  := dblcdArti.Text;
	if not DMLOG.cdsSobrino.GotoKey then
	begin
    ErrorMsg('Adquisiciones', 'No Existe Articulo');
  	edtArti.Text := '';
  	dbePUnit.Text:= '0';
    Screen.Cursor:=crDefault;
    dblcdArti.SetFocus;
		Exit;
	end;
  edtArti.Text := DMLOG.cdsSobrino.fieldbyname('ARTDES').AsString;
  dbePUnit.Text:= Floattostr(DMLOG.cdsSobrino.fieldbyname('ARTPCG').AsFloat);
  Screen.Cursor:=crDefault;
end;

procedure TFActPCompra.Z2bbtnRegOkClick(Sender: TObject);
begin
  if not Question('Adquisiciones','Esta Seguro de Ingresar el Precio de Costo'+#13+#13+
  												'Desea Continuar') then
  	Exit;
	Screen.Cursor:=crHourGlass;
	xSQL:='UPDATE TGE205 SET '+
  			'ARTPCG='+dbePUnit.Text+' '+
        'WHERE ARTID='+QuotedStr(dblcdArti.Text);
  Try
		DMLOG.DCOM1.AppServer.EjecutaSQL(xSQL);
  Except
    ErrorMsg('Adquisiciones', 'Error al Actualizar el Precio Costo');
  end;
	Screen.Cursor:=crDefault;
  dbePUnit.clear;
  edtArti.Clear;
  dblcdArti.text:='';
  dblcdArti.SetFocus;
end;

procedure TFActPCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFActPCompra.Timer1Timer(Sender: TObject);
begin
   //FVariables.w_NombreForma := 'FActPCompra';
   if (DMLOG.wAdmin='G') or (DMLOG.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMLOG.AccesosUsuariosR( DMLOG.wModulo,DMLOG.wUsuario,'2',FActPCompra);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.

