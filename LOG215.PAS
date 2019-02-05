unit LOG215;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, db, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, dbclient, wwclient, Wwdotdot, Wwdbcomb;

type
  TFRqsAutoGen = class(TForm)
    pnlCabecera: TPanel;
    dblcCIA: TwwDBLookupCombo;
    lblCIA: TLabel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnBorrar: TBitBtn;
    dbeNumRqs: TwwDBEdit;
    lblNSolCot: TLabel;
    dbeSolic: TwwDBEdit;
    lblSolicitante: TLabel;
    Label1: TLabel;
    dbeCCostos: TwwDBEdit;
    dblcdCCos: TwwDBLookupComboDlg;
    lblPrioridad: TLabel;
    dbdtpFReqs: TwwDBDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbdtpFAnten: TwwDBDateTimePicker;
    lblAutorizado: TLabel;
    dbeAtorizado: TwwDBEdit;
    dbeAprobado: TwwDBEdit;
    lblAprobado: TLabel;
    dbmObs: TDBMemo;
    lblObs: TLabel;
    pnlDetalleG: TPanel;
    stxTitulo1: TStaticText;
    dbgDReqs: TwwDBGrid;
    dbeCIA: TwwDBEdit;
    pnlEstado: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    edtInsTec: TwwDBEdit;
    Label7: TLabel;
    dblcTRqs: TwwDBLookupCombo;
    Label8: TLabel;
    dbeTRqs: TwwDBEdit;
    pnlBotones: TPanel;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    btxtEstado: TDBText;
    dblcPRIO: TwwDBLookupCombo;
    Label9: TLabel;
    dblcLOC: TwwDBLookupCombo;
    dbeLOC: TwwDBEdit;
    Label10: TLabel;
    dbeALM: TwwDBEdit;
    dblcALM: TwwDBLookupCombo;
    dblcObra: TwwDBLookupCombo;
    dbeObra: TwwDBEdit;
    lblObra: TLabel;
    dbePrior: TwwDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnBorrarClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure Z2bbtnAceptaClick(Sender: TObject);
    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{27/07/2000 se quito el control
    procedure dblcUMedChange(Sender: TObject);}
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbeNumRqsExit(Sender: TObject);
    procedure dblcCIAChange(Sender: TObject);
    procedure dbdtpFReqsExit(Sender: TObject);
    procedure dblcLOCChange(Sender: TObject);
    procedure dblcALMChange(Sender: TObject);
    procedure dblcPRIOChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure dcCIA;
    procedure dcALM;
    procedure dcLOC;
    procedure dcNUM;

    procedure  AsigDat;
    procedure OnOffDetalle ( Value : Boolean );
    procedure OnOffCabecera( Value : Boolean );
    procedure btnDetalle;
    procedure lblEstado;
    procedure cSetFocus ( Sender: TObject ; const sMsg : String);
    function EHandlerError(Ex : Exception ) : Boolean;
//    function ValidaCantidad(VCantidad : string) : Bool;
  public
    { Public declarations }

  end;

var
  FRqsAutoGen: TFRqsAutoGen;
  vunmid : string;

implementation

uses LOGDM1, LOG213, oaAD3000;

{$R *.DFM}

procedure TFRqsAutoGen.FormActivate(Sender: TObject);
var
 xsql : string;
begin
  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DM1.cdsCCost.close;
  DM1.cdsCCost.datarequest(xsql);
  DM1.cdsCCost.Open;
  //**

 Left:=0;
 Top:=0;
end;

procedure TFRqsAutoGen.Z2bbtnOKClick(Sender: TObject);
begin
	if DM1.cdsReqs.State in [dsInsert,dsEdit] then
	begin
		AsigDat; // asignar los datos predeterminados
		DM1.cdsReqs.Post;
	end;

  OnOffCabecera(False); //Desactivar el panel de Cabecera
  OnOffDetalle(True);   //Activar el panel de detalle
  btnDetalle;
  pnlDetalleG.SetFocus;
end;

procedure TFRqsAutoGen.Z2bbtnBorrarClick(Sender: TObject);
begin
	DM1.cdsReqs.CancelUpdates;
	if DM1.wModo='A' then
	begin
		DM1.cdsReqs.Insert;
		FormCreate(nil);
		OnOffCabecera(True);
		OnOffDetalle(False);
		DM1.cdsDReqs.CancelUpdates;
	end;
end;

procedure TFRqsAutoGen.AsigDat;
var
D, M, Y : Word;
begin
   // --> Asignar datos de cabecera de requisición
   with DM1 do
   begin
      with cdsReqs do
      if State in [dsInsert, dsEdit] then
      begin
         DecodeDate(Now, Y, M, D);
         if (State in [dsInsert]) and (FieldbyName('RqsObs').IsNull ) then
            FieldbyName('RqsObs').AsString   := '   '; // colocar datos en blanco o algo
         if State in [dsInsert] then FieldbyName('RqsEst').AsString := 'INICIAL'; // inicial...

         if Length(dblcCia.Text)=0   then raise Exception.Create('Falta Registrar Compañía...');
         if Length(dblcLOC.Text)=0   then raise Exception.Create('Falta Registrar Localidad...');
         if Length(dblcALM.Text)=0   then raise Exception.Create('Falta Registrar Almacén...');
         if Length(dbeNumRqs.Text)=0 then raise Exception.Create('Falta Registrar No.Requisición...');
         if dbdtpFReqs.Date=0        then raise Exception.Create('Falta Registrar Fecha de Requisición...');
         if Length(dblcPRIO.Text)=0  then raise Exception.Create('Falta Registrar Prioridad...');
         if dbdtpFAnten.Date=0       then raise Exception.Create('Falta Registrar Fecha de Requisición...');
         if Length(dblcTRqs.Text)=0  then raise Exception.Create('Falta Registrar Tipo Requisición...');
         if dbdtpFReqs.Date>dbdtpFAnten.date then
            raise Exception.Create('La Fecha de Atención debe ser mayor'+#13+' a la Fecha de Requisición...');

         FieldbyName('RqsUser').AsString   := dm1.wUsuario;  // por el momento nada no se sabe nada del usuario
         FieldbyName('RqsAno').AsString    := IntToStr(Y);
         FieldbyName('RqsMM').AsString     := dm1.strzero(IntToStr(M),2);
         FieldbyName('RqsDD').AsString     := IntToStr(D);
         //FieldbyName('RqsTri').AsString    := '';
         //FieldbyName('RqsSem').AsString    := '';
         //FieldbyName('RqsSS').AsString     := '';
         FieldbyName('RqsANOMM').AsString  := IntToStr(Y)+dm1.strzero(IntToStr(M),2);
         //FieldbyName('RqsAATri').AsString  := '';
         //FieldbyName('RqsAASem').AsString  := '';
         //FieldbyName('RqsAASS').AsString   := '';
         //FieldbyName('FlagVar').AsString   := '';
         FieldbyName('RqsFReg').AsDateTime := Date;
         FieldbyName('RqsHReg').AsDateTime := SysUtils.Time;
      end;
   end;
end;

procedure TFRqsAutoGen.Z2bbtnRegresaClick(Sender: TObject);
begin
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRqsAutoGen.Z2bbtnCanc2Click(Sender: TObject);
begin
  DM1.cdsDReqs.CancelUpdates;
  OnOffCabecera(True);
  OnOffDetalle(False);
end;

procedure TFRqsAutoGen.Z2bbtnAceptaClick(Sender: TObject);
begin
	if MessageDlg('¿ Esta Seguro ?', mtConfirmation, [mbYes,mbNo], 0)=mrNo  then
		Exit;

	DM1.cdsReqs.Edit;
	DM1.cdsReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
	DM1.cdsReqs.Post;

	while not DM1.cdsDReqs.Eof do
	begin
		DM1.cdsDReqs.Edit;
		DM1.cdsDReqs.FieldbyName('RQSEST').AsString := 'ACEPTADO';
		DM1.cdsDReqs.Post;
		DM1.cdsDReqs.Next;
	end;
	//dm1.ControlTran;
	DM1.ControlTran( 9, dm1.cdsReqs, 'REQS');
	DM1.ControlTran( 9, dm1.cdsDReqs, 'DREQS');
	//DM1.cdsReqs.ApplyUpdates(0);
  //DM1.cdsDReqs.ApplyUpdates(0);

  wNReq   := dbeNumRqs.Text;
  btnDetalle;
  wAcepto := True;
end;

procedure TFRqsAutoGen.Z2bbtnRegCancClick(Sender: TObject);
begin
 if DM1.cdsDReqs.State in [dsInsert,dsEdit] then
    DM1.cdsDReqs.Cancel;

 OnOffDetalle(True); // activar detalle
 btnDetalle;
end;

procedure TFRqsAutoGen.OnOffCabecera(Value: Boolean);
begin
  // ----------------------  activar cabecera de requisición -------------------
  pnlCabecera.Enabled   := Value;
  Z2bbtnBorrar.Enabled  := Value;
  Z2bbtnOK.Enabled 	   := Value;
end;

procedure TFRqsAutoGen.OnOffDetalle(Value: Boolean);
begin
  //----------------  activar detalle de requisición ---------------
   if Value then
     stxTitulo1.Color := clHighlight
   else
     stxTitulo1.Color := clGray;

   pnlBotones.Enabled   := Value;
   pnlDetalleG.Enabled  := Value;
   Z2bbtnRegresa.Enabled:= Value;
   Z2bbtnCanc2.Enabled 	:= Value;
   Z2bbtnAcepta.Enabled := Value;
end;

procedure TFRqsAutoGen.btnDetalle;
var
  bDummy1, bDummy2 : Boolean;
begin
  bDummy1:=((DM1.cdsDReqs.ChangeCount>0) or (DM1.cdsReqs.ChangeCount>0) or
            ( DM1.cdsDReqs.Modified    ) or (DM1.cdsReqs.Modified     ) );

  Z2bbtnAcepta.Enabled := bDummy1;
  Z2bbtnCanc2.Enabled  := bDummy1;
  Z2bbtnRegresa.Enabled:= bDummy1;
end;

procedure TFRqsAutoGen.lblEstado;
begin
end;

procedure TFRqsAutoGen.FormShow(Sender: TObject);
begin
 FormCreate(nil);
end;

procedure TFRqsAutoGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DM1.cdsReqs.State in [dsEdit, dsInsert] then
      DM1.cdsReqs.Cancel;

   if DM1.cdsDReqs.State in [dsEdit, dsInsert] then
      DM1.cdsDReqs.Cancel;

   if DM1.cdsReqs.ChangeCount >0 then
      DM1.cdsReqs.CancelUpdates;

   if DM1.cdsDReqs.ChangeCount >0 then
      DM1.cdsDReqs.CancelUpdates;

//   btnDetalle;
end;

procedure TFRqsAutoGen.cSetFocus(Sender: TObject; const sMsg: String);
begin
 if TCustomEdit(Sender).Text='' then
 begin
   ErrorMsg('Error',sMsg);
   TCustomEdit(Sender).SetFocus;
 end;
end;

function TFRqsAutoGen.EHandlerError(Ex : Exception ) : Boolean;
var
 a, b   : Integer;
 s1, s2	: string;
begin
    Result :=  true;
    if Ex.Message = 'Key violation.' then
    begin
       ErrorMsg( 'Error','No pueden existir registros duplicados.. ');
    end
    else begin
      a:=pos('must have a value',Ex.Message);
      s1:='';
      s2:='';
      if a>0 then
      begin
         s1:=Ex.Message;
         b := pos('''',s1);
         while s1[b+1]<>'''' do
         begin
            inc(b);
            s2 := s2+s1[b];
         end;
         ErrorMsg( 'Error','El campo '+s2+' es obligatorio...  ');
      end
      else Result :=  false;
    end;
end;

procedure TFRqsAutoGen.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRqsAutoGen.dbeNumRqsExit(Sender: TObject);
var
  iVal, iCod : Integer;
  sCIAID, sLOCID, sALMID, sRQSID : String;
begin

  if DM1.wModo<>'A' then Exit;

  Val(dbeNumRqs.Text, iVal, iCod);

  if iCod=0 then
  begin
    sCIAID := dblcCIA.Text;
    sLOCID := dblcLOC.Text;
    sALMID := dblcALM.Text;
    sRQSID := dbeNumRqs.Text;

    if DM1.IsExistRqs( sCIAID, sLOCID, sALMID, sRQSID ) then
    begin
      ErrorMsg('Error','Ya existe una requisión con '+#13+
               'el mismo número ... '+DM1.cdsReqs.FieldByName('RQSID').AsString);
      dcNUM;
      dbeNumRqs.SetFocus;
    end;
  end
  else
    dcNUM;
end;

procedure TFRqsAutoGen.dcCIA;
var
  sCIA : String;
begin
  DM1.cdsCIA.First;
  sCIA := trim(DM1.cdsCIA.FieldByName('CIAid').AsString);
  if DM1.cdsReqs.State in [dsInsert] then
    DM1.cdsReqs.FieldByName('CIAID').AsString := sCIA
  else
    dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DM1.cdsCIA.RecordCount > 1;
end;

procedure TFRqsAutoGen.dblcCIAChange(Sender: TObject);
begin
 with DM1 do
 begin
   dbeCIA.Text     := cdsCIA.FieldByName('CIADES').AsString;

   cdsLOC.Filtered := False;
   cdsLOC.Filter   := 'CIAID='''+dblcCIA.Text+'''';
   cdsLOC.Filtered := True;

   cdsALM.Filtered := False;
   cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
   cdsALM.Filtered := True;
 end;
 dcLOC;
 dcALM;
 dcNUM;
end;

procedure TFRqsAutoGen.dbdtpFReqsExit(Sender: TObject);
begin
  if dbdtpFReqs.Text='' then
   dbdtpFReqs.Field.AsDateTime:= Date;
end;

procedure TFRqsAutoGen.dblcLOCChange(Sender: TObject);
begin
 with DM1 do
 begin
  dbeLOC.Text := DM1.cdsLOC.FieldByName('LOCDES').AsString;
  cdsALM.Filtered := False;
  cdsALM.Filter   := 'CIAID='''+dblcCIA.Text+''' AND LOCID='''+dblcLOC.Text+'''';
  cdsALM.Filtered := True;
 end;
 dcALM;
 dcNUM;
end;

procedure TFRqsAutoGen.dblcALMChange(Sender: TObject);
begin
  dbeALM.Text := DM1.cdsALM.FieldByName('ALMDES').AsString;
  dcNUM;
end;

procedure TFRqsAutoGen.dcALM;
var
  sALM : String;
begin
  DM1.cdsALM.First;
  sALM := trim(DM1.cdsALM.FieldByName('ALMID').AsString);
  if DM1.cdsReqs.State in [dsInsert] then
    DM1.cdsReqs.FieldByName('ALMID').AsString := sALM
  else
    dblcALM.Text := sALM;
end;

procedure TFRqsAutoGen.dcLOC;
var
  sLOC : String;
begin
  DM1.cdsLOC.First;
  sLOC := trim(DM1.cdsLOC.FieldByName('LOCID').AsString);
  if DM1.cdsReqs.State in [dsInsert] then
    DM1.cdsReqs.FieldByName('LOCID').AsString := sLOC
  else
    dblcLOC.Text := sLOC;
end;

procedure TFRqsAutoGen.dcNUM;
begin
  with DM1 do
  begin
    if cdsReqs.State in [dsInsert] then
    begin
       dbeNumRqs.Text := StrZero(MaxReqs(dblcCIA.Text,dblcLOC.Text,dblcALM.Text),8);
       cdsReqs.FieldByName('RQSID').AsString := dbeNumRqs.Text;
    end;
  end;
end;

procedure TFRqsAutoGen.dblcPRIOChange(Sender: TObject);
var
 ssql : string;
begin
   ssql := 'PRIOID=' + QuotedStr(dblcPRIO.Text);
  dbePrior.Text := dm1.DisplayDescrip('prvPRIO','TGE155','*',ssql,'PRIODES');
end;

procedure TFRqsAutoGen.FormCreate(Sender: TObject);
begin
   dblcdCCos.OnNotInList := dblcNotInList;
//   dbcldArti.OnNotInList := dblcNotInList;

   dcCIA;
   dcALM;
   dcLOC;
   dcNUM;
   DM1.cdsReqs.fieldbyname('RQSFREQ').AsDateTime:=date;
   DM1.cdsReqs.fieldbyname('PRIOID').AsString:='M';
   if SRV_D = 'ORACLE' then
    DM1.cdsReqs.fieldbyname('PRIOID').AsString:='N';
   
   DM1.cdsReqs.fieldbyname('RQSFATE').AsDateTime:=date;

   OnOffCabecera(True); //Activar la cabecera
   OnOffDetalle(False); //Desactivar el panel de detalle
   if DM1.wModo<>'A' then btnDetalle;

end;

end.
