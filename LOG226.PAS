unit LOG226;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Buttons, ExtCtrls, Mask, wwdbedit, Wwdbdlg,db,
  DBCtrls;

type
  TFNegociacion = class(TForm)
    Panel1: TPanel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    dblcCIA: TwwDBLookupCombo;
    edtCIA: TEdit;
    lblCia: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblProv: TLabel;
    edtProv: TwwDBEdit;
    lblGrArtID: TLabel;
    dblcGrpArti: TwwDBLookupCombo;
    lblFAM: TLabel;
    dblcFAM: TwwDBLookupCombo;
    dbeFAM: TwwDBEdit;
    dbeGrpArti: TwwDBEdit;
    lblSUBFAM: TLabel;
    dblcSUBFAM: TwwDBLookupCombo;
    dbeSFAM: TwwDBEdit;
    dbeGrupo2: TwwDBEdit;
    Label1: TLabel;
    lblArti: TLabel;
    dbcldArti: TwwDBLookupComboDlg;
    dbeArti: TwwDBEdit;
    Label2: TLabel;
    dbeCantidad: TwwDBEdit;
    Label3: TLabel;
    dbeRegistro: TwwDBEdit;
    lblTMon: TLabel;
    dblcTMoneda: TwwDBLookupCombo;
    edtTMoneda: TEdit;
    dbePComCIGVOri: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    dbePCOSUnVent: TwwDBEdit;
    dbeDesc1p: TwwDBEdit;
    dbeDesc2p: TwwDBEdit;
    dbeDesc3p: TwwDBEdit;
    dbeDesc4p: TwwDBEdit;
    dbeDesc5p: TwwDBEdit;
    dbePCosNeto: TwwDBEdit;
    dbeMargCosto: TwwDBEdit;
    dbeDesc1e: TwwDBEdit;
    dbeDesc2e: TwwDBEdit;
    dbePVenta: TwwDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbeTCambio: TwwDBEdit;
    dbePComSIGVORI: TwwDBEdit;
    dbeRelacion: TwwDBEdit;
    Label7: TLabel;
    dbeDesc3e: TwwDBEdit;
    procedure NotExists(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcGrpArtiExit(Sender: TObject);
    procedure dblcFAMExit(Sender: TObject);
    procedure dblcSUBFAMExit(Sender: TObject);
    procedure dblcdProvExit(Sender: TObject);
    procedure dblcTMonedaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure dbePComCIGVOriExit(Sender: TObject);
    procedure dbePComSIGVORIExit(Sender: TObject);
    procedure Calcula(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcldArtiExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNegociacion: TFNegociacion;
  fdesc, fdesc1 : real;
  sSQL : String;

implementation
 uses LogDM1, oaAD2000;
{$R *.DFM}

procedure TFNegociacion.NotExists(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFNegociacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFNegociacion.dblcCIAExit(Sender: TObject);
begin
  edtCIA.text := DM1.DisplayDescrip('prvSQL','TGE101','CIADES','CIAID='+quotedStr(dblcCIA.text),'CIADES');
end;

procedure TFNegociacion.dblcGrpArtiExit(Sender: TObject);
var
	sSQL : string;
begin
{  If (Length(dblcGrpArti.text) <= 0) and (DM1.cdsGArti.RecordCount > 0) Then
  begin
  	ErrorMsg( 'Error','Debe de escoger un '+#13+ 'Grupo o Linea');
    dblcGrpArti.SetFocus;
  end;
	sSQL := 'Select * From TGE169 where '+
        ' TGE169.GRARID='+QuotedStr(dblcGrpArti.text);
  DM1.cdsFAM.Close;
  DM1.cdsFAM.DataRequest(sSQL);
  DM1.cdsFAM.Open;}

  if dblcGrpArti.Text <> '' then
  begin
  	sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND CIAID='+QuotedStr(dblcCIA.text);
  	dbeGrpArti.text:= DM1.DisplayDescrip('prvTGE','TGE131','GRARDES',sSQL,'GRARDES');
  end;

end;

procedure TFNegociacion.dblcFAMExit(Sender: TObject);
var sSQL:string;
begin
{  If (dblcGrpArti.text = '') then
  begin
  	DM1.cdsFAM.Close;
  	ErrorMsg( 'Error','Debe de escoger un '+#13+ 'Grupo o Línea');
    dblcGrpArti.SetFocus;
    exit;
  end;
  sSQL := 'Select * From TGE170 where '+
          ' TGE170.GRARID='+QuotedStr(dblcGrpArti.text)+
//          ' AND TGE170.TINID='+QuotedStr(dblcTINID.text)+
          ' AND TGE170.FAMID='+QuotedStr(dblcFAM.text);
  DM1.cdsSUBFAM.Close;
  DM1.cdsSUBFAM.DataRequest(sSQL);
  DM1.cdsSUBFAM.Open;}
  if dblcFAM.Text <> '' then
  begin
    sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND FAMID='+quotedstr(dblcFAM.text);
   	dbeFAM.text    := DM1.DisplayDescrip('prvTGE','TGE169','FAMDES',sSQL,'FAMDES');
  end;
end;

procedure TFNegociacion.dblcSUBFAMExit(Sender: TObject);
var sSQL:string;
begin
  {if (dblcGrpArti.text = '') or (dblcFAM.text = '') then
  begin
  	DM1.cdsSUBFAM.Close;
    ErrorMsg( 'Error','Debe de escoger un '+#13+ 'Grupo o Linea y '+#13+'una Familia');
    dblcGrpArti.SetFocus;
    exit;
  end;}
  sSQL:='GRARID='+quotedstr(dblcGrpArti.text)+' AND FAMID='+quotedstr(dblcFAM.text)+' AND SFAMID='+quotedstr(dblcSUBFAM.text);
  dbeSFAM.text   := DM1.DisplayDescrip('prvTGE','TGE170','SFAMDES',sSQL,'SFAMDES');
end;

procedure TFNegociacion.dblcdProvExit(Sender: TObject);
begin
  if dm1.wAnchoProv > 0 then
  	DM1.cdsNegociacion.FieldByName('PROV').AsString:=DM1.strZero(dblcdProv.text,DM1.wAnchoProv);
  edtProv.Text:=DM1.DisplayDescrip('prvTGE','TGE201','PROVDES','PROV='+QuotedStr(DM1.cdsNegociacion.FieldByName('PROV').AsString),'PROVDES');
  //if length(edtProv.Text)=0 then
  //begin
    //dblcdProv.SetFocus;
    //Raise Exception.Create('Proveedor No existe');
  //end;
end;

procedure TFNegociacion.dblcTMonedaExit(Sender: TObject);
begin
  edtTMoneda.Text := DM1.DisplayDescrip('prvSQL','TGE103','TMONDES','TMONID='+quotedStr(dblcTMoneda.text),'TMONDES');
end;

procedure TFNegociacion.FormActivate(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	if DM1.wModo='M' then
	begin
		DM1.cdsNegociacion.Edit;
	end;
	dblcCIAExit(nil);
	dblcGrpArtiExit(Nil);
	dblcFAMExit(Nil);
	dblcSUBFAMExit(Nil);
	dblcTMonedaExit(Nil);
	dblcdProvExit(Nil);
	dbcldArtiExit(Nil);

	TNumericField(DM1.cdsNegociacion.FieldByName('ARTCNT')).DisplayFormat  :='###,###,##0.00';
	TNumericField(DM1.cdsNegociacion.FieldByName('ARTCNT')).EditFormat  :='########0.00';

	TNumericField(DM1.cdsNegociacion.FieldByName('RELACION')).DisplayFormat  :='########0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('RELACION')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PCOSUNVENT')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PCOSUNVENT')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC1P')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC1P')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC2P')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC2P')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC3P')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC3P')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC4P')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC4P')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC5P')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC5P')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PCOSNETO')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PCOSNETO')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('MARGCOSTO')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('MARGCOSTO')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC1E')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC1E')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC2E')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC2E')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('DESC3E')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('DESC3E')).EditFormat  :='########0.0000';

	TNumericField(DM1.cdsNegociacion.FieldByName('PVENTA')).DisplayFormat  :='###,###,##0.0000';
	TNumericField(DM1.cdsNegociacion.FieldByName('PVENTA')).EditFormat  :='########0.0000';

	Screen.Cursor:=crDefault;

	if DM1.cdsNegociacion.FieldByName('CCNOREG').AsString = '99999999' then
	begin
		//DESABILITAR LOS CONTROLES
	end;
end;

procedure TFNegociacion.Z2bbtnCancelClick(Sender: TObject);
begin
	DM1.cdsNegociacion.CancelUpdates;
	Close;
end;

procedure TFNegociacion.Z2bbtnOKClick(Sender: TObject);
begin
  if length(edtProv.Text)=0 then
  begin
    //dblcdProv.SetFocus;
    Raise Exception.Create('Proveedor No existe');
  end;

  if length(edtTMoneda.Text)=0 then
  begin
    //dblcdProv.SetFocus;
    Raise Exception.Create('Tipo de Moneda no Valida');
  end;

	Screen.Cursor:=crHourGlass;
	DM1.cdsNegociacion.DataRequest('SELECT * FROM LOG327');
	DM1.cdsNegociacion.FieldByName('FREG').AsDateTime:=Date;
	DM1.cdsNegociacion.FieldByName('HREG').AsDateTime:=Time;
	DM1.AplicaDatos(DM1.cdsNegociacion,'NEGOCIACION');
	Screen.Cursor:=crDefault;	
  Close;
end;

procedure TFNegociacion.dbePComCIGVOriExit(Sender: TObject);
var sIGV:string;
    fIGV:real;
begin
  if DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat=0 then
  begin
    dbeTCambio.setfocus;
    Raise Exception.Create(' Ingrese tipo de Cambio ');
  end;

	sIGV:=DM1.DisplayDescrip('prvTGE','TGE128','TASA','TIPDET=''I1''','TASA');
  if sIGV <> '' then
     fIGV:=strToFloat(sIGV)/100;

  fdesc:=1-((DM1.cdsNegociacion.FieldByName('DESC1P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC2P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC3P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC4P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC5P').AsFloat)/100);

  if (NOT (DM1.cdsNegociacion.FieldByName('PComCIGVORI').IsNull) OR (DM1.cdsNegociacion.FieldByName('PComCIGVORI').AsFloat<>0))  AND
     ((DM1.cdsNegociacion.FieldByName('PComSIGVORI').IsNull) OR (DM1.cdsNegociacion.FieldByName('PComSIGVORI').AsFloat=0))
  then
  begin
		DM1.cdsNegociacion.FieldByName('PComSIGVORI').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PComCIGVORI').AsFloat/(1+fIGV),15,4);

    if DM1.cdsNegociacion.FieldByName('TMONID').AsString=DM1.wTMonLoc then  // SI ES SOLES
    begin
			DM1.cdsNegociacion.FieldByName('PCOMCIGVLOC').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMSIGVLOC').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMCIGVEXT').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat/(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
			DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat/(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
		end
		else
		begin
			DM1.cdsNegociacion.FieldByName('PCOMCIGVEXT').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMCIGVLOC').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat*(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
			DM1.cdsNegociacion.FieldByName('PCOMSIGVLOC').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat*(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
		end;
		DM1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat :=FRound(DM1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat*DM1.cdsNegociacion.FieldByName('RELACION').AsFloat,15,4);
		DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat   :=FRound(DM1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat * fdesc,15,4);
  end;
end;

procedure TFNegociacion.dbePComSIGVORIExit(Sender: TObject);
var sIGV:string;
    fIGV:real;
begin
  if DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat=0 then
  begin
    dbeTCambio.setfocus;
    Raise Exception.Create(' Ingrese tipo de Cambio ');
  end;

  sIGV:=DM1.DisplayDescrip('prvTGE','TGE128','TASA','TIPDET=''I1''','TASA');
  if sIGV <> '' then
     fIGV:=strToFloat(sIGV)/100;

  fdesc:=1+((DM1.cdsNegociacion.FieldByName('DESC1P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC2P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC3P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC4P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC5P').AsFloat)/100);

  if (NOT (DM1.cdsNegociacion.FieldByName('PComSIGVORI').IsNull) OR (DM1.cdsNegociacion.FieldByName('PComSIGVORI').AsFloat<>0)) AND
     ((DM1.cdsNegociacion.FieldByName('PComCIGVORI').IsNull) OR (DM1.cdsNegociacion.FieldByName('PComCIGVORI').AsFloat=0))  then
  begin
       DM1.cdsNegociacion.FieldByName('PComCIGVORI').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PComSIGVORI').AsFloat*(1+fIGV),15,4);

    if DM1.cdsNegociacion.FieldByName('TMONID').AsString=DM1.wTMonLoc then  // SI ES SOLES
		begin
			DM1.cdsNegociacion.FieldByName('PCOMSIGVLOC').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat,15,4);
      DM1.cdsNegociacion.FieldByName('PCOMCIGVLOC').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat,15,4);
      DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat/(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
			DM1.cdsNegociacion.FieldByName('PCOMCIGVEXT').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat/(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
		end
		else
		begin
			DM1.cdsNegociacion.FieldByName('PCOMSIGVEXT').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMCIGVEXT').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat,15,4);
			DM1.cdsNegociacion.FieldByName('PCOMSIGVLOC').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat*(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
			DM1.cdsNegociacion.FieldByName('PCOMCIGVLOC').AsFloat:=FRound(dm1.cdsNegociacion.FieldByName('PCOMCIGVORI').AsFloat*(DM1.cdsNegociacion.FieldByName('TCAMBIO').AsFloat),15,4);
		end;
		DM1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat :=FRound(dm1.cdsNegociacion.FieldByName('PCOMSIGVORI').AsFloat*DM1.cdsNegociacion.FieldByName('RELACION').AsFloat,15,4);
    DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat   :=FRound(dm1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat/ fdesc,15,4);
  end;
end;

procedure TFNegociacion.Calcula(Sender: TObject);
begin
  {fdesc:=1-((DM1.cdsNegociacion.FieldByName('DESC1P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC2P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC3P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC4P').AsFloat+
             DM1.cdsNegociacion.FieldByName('DESC5P').AsFloat)/100);}

// DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat:=DM1.FRound(DM1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat * fdesc,15,4);

 DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat:=FRound(DM1.cdsNegociacion.FieldByName('PCOSUNVENT').AsFloat *
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC1P').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC2P').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC3P').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC4P').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC5P').AsFloat/100)),15,4);



 DM1.cdsNegociacion.FieldByName('PVENTA').AsFloat  :=
 FRound(DM1.cdsNegociacion.FieldByName('PCOSNETO').AsFloat*(1-(DM1.cdsNegociacion.FieldByName('DESC3E').AsFloat/100))/((1-(DM1.cdsNegociacion.FieldByName('MARGCOSTO').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC1E').AsFloat/100))*
                                                     (1-(DM1.cdsNegociacion.FieldByName('DESC2E').AsFloat/100))),15,4);

end;

procedure TFNegociacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.cdsNegociacion.CancelUpdates;
end;

procedure TFNegociacion.dbcldArtiExit(Sender: TObject);
begin
	sSQL:='ARTID='+ quotedStr(dbcldArti.text);
	dbeArti.text := Trim(DM1.displayDescrip('prvSQL', 'TGE205', 'ARTDES', sSQL, 'ARTDES'));
end;

end.
