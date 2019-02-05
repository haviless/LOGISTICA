unit LOG009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, wwdblook, Buttons, ComCtrls, MsgDlgs;

type
  TFTransfReq = class(TForm)
    Panel1: TPanel;
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    Panel2: TPanel;
    lblArticulo: TLabel;
    pbProceso: TProgressBar;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    Anime: TAnimate;
    lblfecha: TLabel;
    lblHora: TLabel;
    Timer1: TTimer;
    Bevel1: TBevel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransfReq: TFTransfReq;
  sSQL : String;

implementation

uses LOGDM1, oaAD3000;

{$R *.DFM}

procedure TFTransfReq.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFTransfReq.Z2bbtnRegCancClick(Sender: TObject);
begin
  Close;
end;

procedure TFTransfReq.Z2bbtnRegOkClick(Sender: TObject);
var
  xCia, xLoc, xCco, xUrq : String;
  sFecha : String;
  xConta : Integer;
begin
  Screen.Cursor:=crHourGlass;
  Anime.Active:=True;
  lblArticulo.Caption:='';
  xConta:=0;
  DMLOG.cdsPedUsu.Close;
  DMLOG.cdsPedUsu.DataRequest( 'SELECT * FROM LOG306 WHERE CIAID=''XX''');
  DMLOG.cdsPedUsu.Open;

  DMLOG.cdsDPedUsu.Close;
  DMLOG.cdsDPedUsu.DataRequest('SELECT * FROM LOG307 WHERE CIAID=''XX''');
  DMLOG.cdsDPedUsu.Open;

  DMLOG.cdsRequCab.Close;
  //DMLOG.cdsRequCab.DataRequest( 'SELECT * FROM LOG306 WHERE CIAID=''XX''');
  DMLOG.cdsRequCab.Open;
  DMLOG.cdsRequDet.Close;
  //DMLOG.cdsRequDet.DataRequest('SELECT * FROM LOG307 WHERE CIAID=''XX''');
  DMLOG.cdsRequDet.Open;

  DMLOG.cdsRequCab.Filter:= '';
  DMLOG.cdsRequCab.Filter:= 'FLAGVAR=''0''';
  // (FLAGVAR IS NULL OR FLAGVAR='0' OR FLAGVAR='')  
  //DMLOG.cdsRequCab.Filter:= 'CIAID='+''''+dblcCIA.Text+''' AND FLAGVAR=''0''';
  DMLOG.cdsRequCab.Filtered:=true;

	pbProceso.Position := 1;
	pbProceso.Visible  := True;
	pbProceso.Max      := DMLOG.cdsRequCab.RecordCount;

  if DMLOG.cdsRequCab.RecordCount = 0 then
  begin
    Screen.Cursor:=crDefault;
    Anime.Active:=False;
    Information('Adquisiciones', 'No Existe Información a Transferir .....!!! ');
	  pbProceso.Visible := False;
    Exit;
  end;
  DMLOG.cdsRequCab.First;
  while not DMLOG.cdsRequCab.Eof do
  begin
    Application.ProcessMessages;
		pbProceso.Position := pbProceso.Position + 1;

    xCia:=DMLOG.cdsRequCab.FieldByName('CIAID').AsString;
    xLoc:=DMLOG.cdsRequCab.FieldByName('LOCID').AsString;
    xCco:=DMLOG.cdsRequCab.FieldByName('CCOSID').AsString;
    xUrq:=DMLOG.cdsRequCab.FieldByName('URQIDINT').AsString;

	  sSQL:= 'CIAID='''+xCia+''' AND LOCID='''+xLoc+''' AND CCOSID='''+xCco+''' AND URQID='''+xUrq+'''';
    if length(DMLOG.DisplayDescrip('prvTGE','LOG306','CCOSID',sSQL,'CCOSID')) = 0 then
    begin
      xConta:=xConta+1;
      DMLOG.cdsPedUsu.Insert;
      DMLOG.cdsPedUsu.FieldByName('CIAID').AsString       := xCia;
      DMLOG.cdsPedUsu.FieldByName('LOCID').AsString       := xLoc;
      DMLOG.cdsPedUsu.FieldByName('CCOSID').AsString      := xCco;
      DMLOG.cdsPedUsu.FieldByName('URQID').AsString       := xUrq;
      DMLOG.cdsPedUsu.FieldByName('URQEST').AsString      := 'ACEPTADO';
      DMLOG.cdsPedUsu.FieldByName('URQESTUSR').AsString   := 'JEFE DE AREA';
      DMLOG.cdsPedUsu.FieldByName('URQSOLIC').AsString    := DMLOG.cdsRequCab.FieldByName('CCOSID').AsString;
      DMLOG.cdsPedUsu.FieldByName('TIPOADQ').AsString     := DMLOG.cdsRequCab.FieldByName('TIPOADQ').AsString;
      DMLOG.cdsPedUsu.FieldByName('TINID').AsString       := DMLOG.cdsRequCab.FieldByName('TINID').AsString;
      DMLOG.cdsPedUsu.FieldByName('ALMID').AsString       := DMLOG.cdsRequCab.FieldByName('ALMID').AsString;
      DMLOG.cdsPedUsu.FieldByName('TINID').AsString       := DMLOG.cdsRequCab.FieldByName('TINID').AsString;
      if Length(Trim(DMLOG.cdsRequCab.FieldByName('URQOBS').AsString)) > 0 then
        DMLOG.cdsPedUsu.FieldByName('URQOBS').AsString    := DMLOG.cdsRequCab.FieldByName('URQOBS').AsString
      else
        DMLOG.cdsPedUsu.FieldByName('URQOBS').AsString    := '.';
      DMLOG.cdsPedUsu.FieldByName('URQUSR').AsString      := DMLOG.cdsRequCab.FieldByName('URQUSR').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQFREG').AsString     := DMLOG.cdsRequCab.FieldByName('URQFREG').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQHREG').AsDateTime   := DMLOG.cdsRequCab.FieldByName('URQFREG').AsDateTime + DMLOG.cdsRequCab.FieldByName('URQHREG').AsDateTime;
      DMLOG.cdsPedUsu.FieldByName('URQACEPUSR').AsString  := DMLOG.cdsRequCab.FieldByName('URQACEPUSR').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQACEPFREG').AsString := DMLOG.cdsRequCab.FieldByName('URQACEPFREG').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQACEPHREG').AsString := DMLOG.cdsRequCab.FieldByName('URQACEPHREG').AsString;
      DMLOG.cdsPedUsu.FieldByName('PRIOID').AsString      := DMLOG.cdsRequCab.FieldByName('PRIOID').AsString;
      DMLOG.cdsPedUsu.FieldByName('CCOSDES').AsString     := DMLOG.DisplayDescrip('prvTGE','TGE203','CCOSDES','CCOSID='''+xCco+'''','CCOSDES');
      DMLOG.cdsPedUsu.FieldByName('URQSOLICDES').AsString := DMLOG.cdsPedUsu.FieldByName('CCOSDES').AsString;
      DMLOG.cdsPedUsu.FieldByName('CIAIDSOLIC').AsString  := DMLOG.cdsPedUsu.FieldByName('CIAID').AsString;
      DMLOG.cdsPedUsu.FieldByName('LOCIDSOLIC').AsString  := DMLOG.cdsPedUsu.FieldByName('LOCID').AsString;
      sSQL:='CIAID='''+xCia+''' AND TINID='''+DMLOG.cdsPedUsu.FieldByName('TINID').AsString+'''';
      DMLOG.cdsPedUsu.FieldByName('TINDES').AsString      := DMLOG.DisplayDescrip('prvTGE','TGE152','TINDES',sSQL,'TINDES');
      DMLOG.cdsPedUsu.FieldByName('URQANUUSR').AsString   := DMLOG.cdsRequCab.FieldByName('URQANUUSR').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQANUFREG').AsString  := DMLOG.cdsRequCab.FieldByName('URQANUFREG').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQANUHREG').AsString  := DMLOG.cdsRequCab.FieldByName('URQANUHREG').AsString;
      DMLOG.cdsPedUsu.FieldByName('URQNOBRA').AsString    := DMLOG.cdsRequCab.FieldByName('URQNOBRA').AsString;
      DMLOG.cdsPedUsu.FieldByName('TRANSF').AsString      := 'S';
      DMLOG.cdsPedUsu.FieldByName('HORA').AsDateTime      := Date+Time;
		  sFecha := formatdatetime(DMLOG.wFormatFecha, DMLOG.cdsPedUsu.FieldByName('URQFREG').AsDateTime);
		  sSQL := 'SELECT * FROM TGE114 WHERE FECHA='+quotedstr(sFecha);
		  DMLOG.FiltraCDS(DMLOG.cdsPeriodo, sSQL);
      DMLOG.cdsPedUsu.FieldbyName('URQANO').AsString      := DMLOG.cdsPeriodo.fieldbyName('FECANO').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQMM').AsString       := DMLOG.cdsPeriodo.fieldbyName('FECMES').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQDD').AsString       := DMLOG.cdsPeriodo.fieldbyName('FECDIA').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQTRI').AsString      := DMLOG.cdsPeriodo.fieldbyName('FECTRIM').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQSEM').AsString      := DMLOG.cdsPeriodo.fieldbyName('FECSEM').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQSS').AsString       := DMLOG.cdsPeriodo.fieldbyName('FECSS').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQAATRI').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECAATRI').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQAASEM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECAASEM').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQAASS').AsString     := DMLOG.cdsPeriodo.fieldbyName('FECAASS').asString;
      DMLOG.cdsPedUsu.FieldbyName('URQANOMM').AsString    := DMLOG.cdsPeriodo.fieldbyName('FECANO').asString+DMLOG.cdsPeriodo.fieldbyName('FECMES').asString;

	    DMLOG.cdsPost(DMLOG.cdsPedUsu);
      DMLOG.cdsPedUsu.Post;

      DMLOG.cdsRequDet.Filter:='';
      DMLOG.cdsRequDet.Filter:='CIAID='+''''+xCia+''' AND LOCID='''+xLoc+''' AND CCOSID='''+xCco+''' AND URQIDINT='''+xUrq+'''';
      DMLOG.cdsRequDet.Filtered:=true;
      DMLOG.cdsRequDet.First;

      while not DMLOG.cdsRequDet.Eof do
      begin
        DMLOG.cdsDPedUsu.Insert;
        DMLOG.cdsDPedUsu.FieldByName('CIAID').AsString       := xCia;
        DMLOG.cdsDPedUsu.FieldByName('LOCID').AsString       := xLoc;
        DMLOG.cdsDPedUsu.FieldByName('CCOSID').AsString      := xCco;
        DMLOG.cdsDPedUsu.FieldByName('URQID').AsString       := xUrq;
        DMLOG.cdsDPedUsu.FieldByName('DURQID').AsString      := DMLOG.cdsRequDet.FieldByName('DURQID').AsString;
        DMLOG.cdsDPedUsu.FieldByName('DURQEST').AsString     := 'ACEPTADO';
        DMLOG.cdsDPedUsu.FieldByName('TINID').AsString       := DMLOG.cdsRequDet.FieldByName('TINID').AsString;
        DMLOG.cdsDPedUsu.FieldByName('GRARID').AsString      := DMLOG.cdsRequDet.FieldByName('GRARID').AsString;
        DMLOG.cdsDPedUsu.FieldByName('FAMID').AsString       := DMLOG.cdsRequDet.FieldByName('FAMID').AsString;
        DMLOG.cdsDPedUsu.FieldByName('SFAMID').AsString      := DMLOG.cdsRequDet.FieldByName('SFAMID').AsString;

        sSQL:='GRARID='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('GRARID').AsString)+
              ' AND TINID ='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('TINID').AsString)+
              ' AND FAMID ='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('FAMID').AsString)+
              ' AND SFAMID='+quotedstr(DMLOG.cdsDPedUsu.FieldByName('SFAMID').AsString);
        DMLOG.cdsDPedUsu.FieldByName('SFAMDES').AsString     := DMLOG.DisplayDescrip('prvTGE','TGE170','SFAMDES',sSQL,'SFAMDES');

        DMLOG.cdsDPedUsu.FieldByName('ARTID').AsString       := DMLOG.cdsRequDet.FieldByName('ARTID').AsString;
        DMLOG.cdsDPedUsu.FieldByName('DURQCNSG').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQCNSG').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('DURQCNSU').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQCNSU').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('DURQCNAG').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQCNAG').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('DURQCNAU').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQCNAU').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('DURQFREG').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQFREG').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('DURQHREG').AsFloat     := DMLOG.cdsRequDet.FieldByName('DURQHREG').AsFloat;
        DMLOG.cdsDPedUsu.FieldByName('FLAGUM').AsString      := DMLOG.cdsRequDet.FieldByName('FLAGUM').AsString;
        DMLOG.cdsDPedUsu.FieldByName('UNMIDG').AsString      := DMLOG.cdsRequDet.FieldByName('UNMIDG').AsString;
        DMLOG.cdsDPedUsu.FieldByName('UNMIDU').AsString      := DMLOG.cdsRequDet.FieldByName('UNMIDU').AsString;
        DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').AsString     := DMLOG.cdsRequDet.FieldByName('TIPOADQ').AsString;
        if Length(Trim(DMLOG.cdsRequDet.FieldByName('DURQOBS').AsString)) > 0 then
          DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString   := DMLOG.cdsRequDet.FieldByName('DURQOBS').AsString
        else
          DMLOG.cdsDPedUsu.FieldByName('DURQOBS').AsString   := '.';

        if DMLOG.cdsDPedUsu.FieldByName('TIPOADQ').AsString = 'C' then
        begin
          if Length(Trim(DMLOG.cdsRequDet.FieldByName('DURQOBSUSR').AsString)) > 0 then
            DMLOG.cdsDPedUsu.FieldByName('DURQOBSUSR').AsString:= DMLOG.cdsRequDet.FieldByName('DURQOBSUSR').AsString
          else
            DMLOG.cdsDPedUsu.FieldByName('DURQOBSUSR').AsString:= '.';
        end
        else
          DMLOG.cdsDPedUsu.FieldByName('DURQOBSUSR').AsString:= '.';
        DMLOG.cdsDPedUsu.FieldByName('TRANSF').AsString      := 'S';
	      DMLOG.cdsPost(DMLOG.cdsDPedUsu);
        DMLOG.cdsDPedUsu.Post;
        DMLOG.cdsRequDet.Next;
      end;

      DMLOG.cdsRequCab.Edit;
      DMLOG.cdsRequCab.FieldByName('FLAGVAR').AsString:='1';
      DMLOG.cdsRequCab.Post;

      DMLOG.cdsRequCab.ApplyUpdates(0);

	    DMLOG.ControlTran( 9, DMLOG.cdsPedUsu,'PEDUSU');
	    DMLOG.ControlTran( 9, DMLOG.cdsDPedUsu,'DPEDUSU');
    end
    else
    begin
      if Length(Trim(lblArticulo.Caption)) = 0 then
        lblArticulo.Caption:=' Cia.  Loc. C.Costo   Nº Req.'+#13;
      lblArticulo.Caption:=lblArticulo.Caption+#13+'  '+xCia+'   '+xLoc+'    '+xCco+'     '+xUrq;
      DMLOG.cdsRequCab.Next;
    end;
  end;

  if Length(Trim(lblArticulo.Caption)) > 0 then
  begin
    Memo1.Clear;
	  Memo1.Lines.Add(lblArticulo.Caption);
	  Memo1.Lines.SaveToFile('C:\No_Transf.Txt');
    Information('Adquisiciones', 'Se Genero un Archivo C:\No_Transf.Txt de los Requerimientos No Transferidos');
  end;
  if xConta > 0 then
  begin
    Information('Adquisiciones', 'Se Transfirio  '+InttoStr(xConta)+'  Requerimientos');
  end;
  Anime.Active:=False;
  Screen.Cursor:=crDefault;
	pbProceso.Visible := False;
end;


procedure TFTransfReq.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TFTransfReq.Timer1Timer(Sender: TObject);
begin
  lblHora.Caption:=TimetoStr(Time);
end;

procedure TFTransfReq.FormShow(Sender: TObject);
begin
   lblfecha.Caption:=DatetoStr(DateS);
   lblHora.Caption:=TimetoStr(Time);
   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
end;

procedure TFTransfReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //FVariables.w_AD_Registro := False;
   //FVariables.w_Num_Formas  := FVariables.w_Num_Formas-1;
   Action := CAFree;
end;

end.
