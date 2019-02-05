unit LOG503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdblook, Wwdotdot, Mask, wwdbedit, Wwdbdlg, wwdbdatetimepicker,
  StdCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, Wwkeycb, DB,
  Wwdbcomb, wwSpeedButton, wwDBNavigator, wwidlg, wwclient, GridControl;

type
  TFProvision = class(TForm)
    pnlCabecera: TPanel;
    pnlDetalle: TPanel;
    dbgDetCxP: TwwDBGrid;
    pnlCab1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    lblProv: TLabel;
    dblcdProv: TwwDBLookupComboDlg;
    lblProvRuc: TLabel;
    dblcdProvRuc: TwwDBLookupComboDlg;
    lblProvNom: TLabel;
    edtProv: TEdit;
    pnlCab2: TPanel;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    lblSerie: TLabel;
    lblNoDoc: TLabel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblAnoMes: TLabel;
    lblNoReg: TLabel;
    pnlCab3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    dtpFVcmto: TwwDBDateTimePicker;
    Label11: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Label12: TLabel;
    dbeTCambio: TwwDBEdit;
    lblOCompra: TLabel;
    dbeOCompra: TwwDBEdit;
    Label14: TLabel;
    dtpFRecep: TwwDBDateTimePicker;
    Label1: TLabel;
    dbeLote: TwwDBEdit;
    bbtnOK: TBitBtn;
    bbtnBorra: TBitBtn;
    pnlRegistro: TPanel;
    dblcTipReg: TwwDBLookupCombo;
    dblcdCnpEgr: TwwDBLookupComboDlg;
    dblcdCCosto: TwwDBLookupComboDlg;
    lblTipReg: TLabel;
    lblCnpEgr: TLabel;
    lblCCosto: TLabel;
    edtTipReg: TEdit;
    edtCCosto: TEdit;
    dbeImporte: TwwDBEdit;
    dbeDH: TwwDBEdit;
    lblDH: TLabel;
    lblImporte: TLabel;
    bbtnRegOk: TBitBtn;
    bbtnRegCanc: TBitBtn;
    lblGlosa: TLabel;
    lblCuenta: TLabel;
    dbeCuenta: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    edtSerie: TwwDBEdit;
    edtNoDoc: TwwDBEdit;
    meAnoMM: TwwDBEdit;
    meNoReg: TwwDBEdit;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    Label4: TLabel;
    pnlPie: TPanel;
    bbtnCalc: TBitBtn;
    pnlEstado: TPanel;
    lblAnula: TLabel;
    lblActivo: TLabel;
    lblContab: TLabel;
    lblAcepta: TLabel;
    Label3: TLabel;
    bbtnRegresa: TBitBtn;
    bbtnCancela: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnAcepta: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnContab: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    dtpFEmis: TwwDBDateTimePicker;
    dblcTDoc: TwwDBLookupCombo;
    dblcClAux: TwwDBLookupCombo;
    Label6: TLabel;
    pnlImpuesto: TPanel;
    bbtnGenReg: TBitBtn;
    dblcImpuesto: TwwDBLookupCombo;
    Label5: TLabel;
    edtImpuesto: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCalcClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    function DisplayDescrip(PTable,PDescrip,PKey,PVal:String):string;
  private
    { Private declarations }
  public
    xFiltroTDiar : string;
    { Public declarations }
    procedure FiltraCanje;
    procedure EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);

  end;

var
  FProvision: TFProvision;
  xSQL : string;
  xNuevoProv,xNuevaProv,xRegresa : Boolean;
  xTAutoNum, xTAno, xTMes : String;
  xxTCambio : Real;
  xCia  : String;
  xTDi  : String;
  xAMe  : String;
  xNRe  : String;
  xCrea : Boolean;
  xTemTReg  : String;
  xTemCpto  : String;
  xTemCta   : String;
  xTemDH    : String;
  xFlagGr   : Boolean;
  xConta    : String;

implementation

uses LOGDM1, oaAD3100 ;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFProvision.FormActivate(Sender: TObject);
var
  xsql, xWhere : String;
begin
   xCrea := True;
  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DMLOG.cdsCCost.close;
  DMLOG.cdsCCost.datarequest(xsql);
  DMLOG.cdsCCost.Open;
  //**

   DMLOG.AccesosUsuarios( DMLOG.wModulo,DMLOG.wUsuario,'2',Screen.ActiveForm.Name );
   xFlagGr          := False;
   dblcImpuesto.Text:= '';
   edtImpuesto.Text := '';
   DMLOG.cdsMovCxP.Edit;
   edtCia.Text    :=DisplayDescrip('TGE101','CIADES','CIAID',dblcCia.Text);
   edtProv.text   :=DisplayDescrip('TGE201','PROVDES','PROV',dblcdProv.Text);

   xWhere := 'DocId='+''''+dblcTDoc.Text+''''+' and DOC_FREG='+''''+'P'+'''';
   edtTDoc.Text   :=DMLOG.BuscaQry('PrvTGE','TGE110','*',xWhere,'DocDes');

   xConta  := DMLOG.cdsQry.fieldbyname('DOCCONTA').AsString;
   edtTDiario.Text:=DisplayDescrip('TGE104','TDIARDES','TDIARID',dblcTDiario.Text);
   xWhere := 'TMonId='+''''+dblcTMon.Text+''''+' and (TMon_Loc='+''''+'L'+''''+' or TMon_Loc='+''''+'E'+''''+')';
   edtTMon.Text:=DMLOG.BuscaQry('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');

   If DMLOG.cdsMovCxP.FieldByName('CPEstado').AsString='I' then
      EstadoDeForma(0,DMLOG.cdsMovCxP.FieldByName('CPEstado').Value,' ' )
   else
      EstadoDeForma(1,DMLOG.cdsMovCxP.FieldByName('CPEstado').Value,DMLOG.cdsMovCxP.FieldByName('CP_Conta').Value );

   FiltraCanje;

   xCrea     := False;
   xNuevoprov:= False;
end;

procedure TFProvision.FiltraCanje;
var
   xFiltro : String ;
   xSQL    : String ;
begin
   xFiltro := 'CIAID = ' +''''+dblcCia.Text    +''''+' and ' +
              'TDIARID=' +''''+dblcTdiario.Text+''''+' and ' +
              'DCPANOMM='+''''+meAnoMM.Text    +''''+' and ' +
              'CPNOREG=' +''''+meNoReg.Text    +'''' ;

   xSQL := ' SELECT CXP302.*,A.TREGDES LKTREG , B.CCOSDES LKCCOSTO       ' +
           '  FROM CXP302                                                ' +
           '  LEFT JOIN TGE113 A ON ( CXP302.TREGID = A.TREGID )         ' +
           '  LEFT JOIN TGE203 B ON ( CXP302.CCOSID = B.CCOSID )  WHERE  ' ;
   DMLOG.Filtracds( DMLOG.cdsDetCxP,  xSQL + xFiltro );
end;

procedure TFProvision.EstadoDeForma(xxModo:Integer; xMovEstado,xMovConta:String);
begin
   DMLOG.wModo := 'C' ;
   pnlCab1.Enabled      := False;
   pnlCab2.Enabled      := False;
   pnlCab3.Enabled      := False;
   bbtnOK.Enabled       := False;
   bbtnBorra.Enabled    := False;
   dblcCia.Enabled      := True;
   edtProv.Enabled      := False;
   dblcClAux.Enabled    := False;

   pnlDetalle.Enabled   := False;
   dbgDetCxP.ReadOnly   := True;
   pnlRegistro.Visible  := False;

   pnlPie.Refresh;
   pnlPie.Enabled       := False;
   pnlImpuesto.Enabled  := False;
   bbtnRegresa.Enabled  := False;
   bbtnCancela.Enabled  := False;
   Z2bbtnGraba.Enabled  := False;
   Z2bbtnAcepta.Enabled := False;
   Z2bbtnAnula.Enabled  := False;
   Z2bbtnContab.Enabled := False;
   Z2bbtnNuevo.Enabled  := False;

   lblActivo.Visible    := False;
   lblAcepta.Visible    := False;
   lblAnula.Visible     := False;
   lblContab.Visible    := False;

   if xxModo=0 then // cuando va hacia la cabecera
      begin
         If (xMovEstado=' ') or (xMovEstado='') then
            begin
               pnlCab1.Enabled    := True;
               pnlCab2.Enabled    := True;
               pnlCab3.Enabled    := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;

               lblActivo.Visible  := False;

               dblcCia.SetFocus;
            end
         else begin
            If (xMovEstado='I') or (xMovEstado='T') then begin
               pnlCab3.Enabled    := True;
               bbtnOK.Enabled     := True;
               bbtnBorra.Enabled  := True;

               lblActivo.Visible  := True;

               dtpFEmis.SetFocus;
            end
         end
      end
   else
   begin // cuando el foco esta en el Detalle

      If xMovConta='S' then
         begin
            pnlDetalle.Enabled   := True;
            lblContab.Visible    := True;
            pnlPie.Enabled       := True;
         end
      else begin
         If xMovEstado='T' then // temporal grabado desde cabecera
         begin
            pnlDetalle.Enabled   := True;
            dbgDetCxP.ReadOnly   := False;

            pnlPie.Enabled       := True;
            pnlImpuesto.Enabled  := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            lblActivo.Visible    := True;
         end;
         If xMovEstado='I' then // si ya esta grabado
         begin
            pnlDetalle.Enabled   := True;
            dbgDetCxP.ReadOnly   := False;

            pnlPie.Enabled       := True;
            pnlImpuesto.Enabled  := True;
            bbtnRegresa.Enabled  := True;
            bbtnCancela.Enabled  := True;
            Z2bbtnGraba.Enabled  := True;
            Z2bbtnAcepta.Enabled := True;
            Z2bbtnAnula.Enabled  := True;

            lblActivo.Visible    := True;
         end;
         If (xMovEstado='P') or (xMovEstado='C') then
         begin
            pnlDetalle.Enabled   := True;

            pnlPie.Enabled       := True;
            if xConta<>'N' then Z2bbtnContab.Enabled:=True;

            lblAcepta.Visible    := True;
         end;
         if xMovEstado='A' then // anulado
         begin
            pnlDetalle.Enabled   := True;
            pnlPie.Enabled       := True;
            lblAnula.Visible     := True;
         end;
      end;

      if DMLOG.wModo='A' then begin
         Z2bbtnNuevo.Enabled  := True;
      end;

   end ;

   if DMLOG.wModo='C' then begin // Si Entra Solo Para Consulta
      pnlCab1.Enabled      := False;
      pnlCab2.Enabled      := False;
      pnlCab3.Enabled      := False;
      bbtnOK.Enabled       := False;
      bbtnBorra.Enabled    := False;

      pnlDetalle.Enabled   := True ;
      dbgDetCxP.ReadOnly   := True;

      pnlPie.Enabled       := TRue;
      Z2bbtnNuevo.Enabled  := True ;
      pnlPie.Refresh;
   end;
end;


procedure TFProvision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMLOG.cdsDetCxP.CancelUpdates;

   dblcCia.Enabled  := True;
   dblcCia.TabOrder     := 0;
   dblcdprov.TabOrder   := 1;
   dblcdProvRuc.TabOrder:= 2;
   edtProv.Enabled   := False;
   dblcClAux.Enabled := False;

   lblActivo.Visible := False;
   lblAcepta.Visible := False;
   lblAnula.Visible  := False;
   lblContab.Visible := False;
   Close;
end;

procedure TFProvision.bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFProvision.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFProvision.FormCreate(Sender: TObject);
begin
   If DMLOG.wAdmin='G' then
   begin
      DMLOG.wObjetoDesPr := Caption ;
   end;
end;

procedure TFProvision.Z2bbtnNuevoClick(Sender: TObject);
begin
   Close ;
end;

function TFProvision.DisplayDescrip(PTable, PDescrip, PKey,
  PVal: String): string;
var
   xSQL: String;
begin
   xSQL:='select * from '+PTable+' ';
   xSQL:= xSQL + 'where '+ PKey +'='+''''+ PVal +'''';
   xSQL := UpperCase( xSQL );
   DMLOG.cdsQry.Close;
   DMLOG.cdsQry.ProviderName:='prvLOG';
   DMLOG.cdsQry.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   DMLOG.cdsQry.Open;
   result:=DMLOG.cdsQry.FieldByName(PDescrip).AsString;
//   cdsULTTGE.Close;
end;

end.
